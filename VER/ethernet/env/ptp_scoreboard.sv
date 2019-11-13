class ptp_scoreboard  extends scoreboard;

register_config reg_config;
ptp_item        ptp_trans;
bit[31:0] port_id ;
bit [7:0] data_tmp[];
int sequence_id = 0;
int last_message_type = 0;
int last_correctionField;
int last_OriginTimestamp;
int last_preciseOriginTimestamp;

string timestamp_file;
//typedef ptp_scoreboard #(port_id) this_t;
`uvm_component_utils_begin(ptp_scoreboard)
    `uvm_field_int          (port_id	        , UVM_ALL_ON)
`uvm_component_utils_end

//================================================//
//FUNCTION    : new
//================================================//
    function new (string name ="ptp_scoreboard",uvm_component parent);
        super.new(name,parent);
		ptp_trans = new();
		
		timestamp_file = {"timestamp_file_",file_name,".txt"};
        //comparer.policy = UVM_SHALLOW;//UVM_DEEP;UVM_DEFAULT_POLICY;
        write_exp_data_fd=$fopen(timestamp_file,"w+");                                               
        $fclose(write_exp_data_fd);
		
    endfunction

//================================================//
//FUNCTION    : build
//================================================//
    virtual function void build ();
        super.build();
		if( !uvm_config_db #( register_config )::get( this , "" , "register_config" ,reg_config ) ) begin
           `uvm_fatal(get_type_name(),"=============register_config==========");
		end
    endfunction

//================================================//
//TASK    : run
//================================================//
    virtual task run();
        super.run();
        fork
            get_exp_trans();
            get_col_trans();
            eth_frame_compare();
        join
    endtask: run

//================================================//
//TASK    : eth_frame_compare
//================================================//
    virtual task eth_frame_compare();
        int exp_queue_size;
		bit match;
        while(1)
          begin
          	eth_frame eth_frame_exp_tr;         
            eth_frame eth_frame_col_tr;
            eth_frame_exp_tr =new();
            eth_frame_col_tr =new();
            comp_state=EXP_POP;

          	@comp_event;   	
          	//============pop col frame=============//
			eth_frame_col_tr=eth_col_que.pop_front();
			`uvm_info(get_type_name(),{$psprintf("COMPARE START eth_frame_col_tr.destination_address=%0h\n",eth_frame_col_tr.destination_address)},UVM_LOW);
			//============unpack ptp frame=============//
			//eth_frame_col_tr.print();
			data_tmp = new[eth_frame_col_tr.tagged_data[1].data.size];
			foreach(eth_frame_col_tr.tagged_data[1].data[key])
				data_tmp[key]=eth_frame_col_tr.tagged_data[1].data[key];
			//data_tmp =eth_frame_col_tr.tagged_data[1].data ;
			//`uvm_info(get_type_name(),$psprintf("data_tmp size=%0d",data_tmp.size()),UVM_LOW);
	        ptp_trans.unpack_bytes(data_tmp);
			case(ptp_trans.packet_type)
			ptp_item::Sync,ptp_item::Follow_Up,ptp_item::Pdelay_Req:field_compare(eth_frame_col_tr,ptp_trans,match);
			//ptp_item::Pdelay_Resp:field_compare_2(eth_frame_col_tr,ptp_trans,match);
			default:field_compare_2(eth_frame_col_tr,ptp_trans,match);
			endcase

			if(~match)
			 begin
			 `uvm_info(get_type_name(),{$psprintf("COMPARE MISMATCH")},UVM_LOW);
			 -> fatal_event;
			 end
		  end
	endtask

    virtual function field_compare(eth_frame eth_frame_trans,ptp_item ptp_trans, output bit match);
	  int compare_index;
	  bit mismatch;
	  bit one_two_step;
	  
	  mismatch = 0;
	  match = 0;	  
	  
	  
	    foreach(`PTP_CONFIG_CONTENT[key])
		   begin
		     if (`PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid)
			   if(`PTP_CONFIG_CONTENT[key].sys_trans.destination == port_id)
			      begin
				   compare_index = key;
				   break;
				  end
		   end
	 
        one_two_step= `PTP_CONFIG_CONTENT[compare_index].descriptor_trans.two_step ;//0: one step; 1: two step
		
	    //ethernet compare
		 //+destination_address
		 //+source_address     
		if(eth_frame_trans.destination_address != `PTP_CONFIG_CONTENT[compare_index].eth_trans.destination_address)
		   mismatch = 1;
		
        if(eth_frame_trans.source_address != `PTP_CONFIG_CONTENT[compare_index].eth_trans.source_address)
		   mismatch = 1;

        if(eth_frame_trans.tagged_data[0].tpid != `PTP_CONFIG_CONTENT[compare_index].eth_trans.tagged_data[0].tpid)
		   mismatch = 1;	
        
        if(eth_frame_trans.tagged_data[1].tpid != `PTP_CONFIG_CONTENT[compare_index].eth_trans.tagged_data[1].tpid)
		   mismatch = 1;
        
		foreach(eth_frame_trans.tagged_data[0].data[key])
         begin
		   if(eth_frame_trans.tagged_data[0].data[key] != `PTP_CONFIG_CONTENT[compare_index].eth_trans.tagged_data[0].data[key])
		     mismatch = 1;		
		 end
		
		if(mismatch)  
		   begin
		     write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
             $fwrite(write_comp_data_fd,$psprintf("T=%0t\n%s\n%s\n",$time,`PTP_CONFIG_CONTENT[compare_index].eth_trans.sprint(),eth_frame_trans.sprint()));
             $fclose(write_comp_data_fd);
		   end
		   
		//ptp compare
		 //+transportSpecific    
		 //+messageType          
		 //+reserved0            
		 //+versionPTP           
		 //+messageLength        
		 //+domainNumber         
		 //+reserved1            
		 //+flagField            
		 //+correctionField      
		 //+reserved2            
		 //+sourcePortIdentity  
		 //+sequenceId           
		 //+controlField         
		 //+logMessageInterval   
		 write_comp_data_fd=$fopen(data_comp_result,"a+"); 
		 
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.transportSpecific   != ptp_trans.transportSpecific  )
		   begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect transportSpecific=%h\n  col transportSpecific=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.transportSpecific,ptp_trans.transportSpecific));
		   end
		   
		if(`PTP_CONFIG_CONTENT[compare_index].descriptor_trans.two_step==0) //one step
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.messageType         != ptp_trans.messageType        )
		   begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect messageType=%h\n  col messageType=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.messageType,ptp_trans.messageType));
		   end
		else //two step
		  if((ptp_trans.messageType == 0) && (`PTP_CONFIG_CONTENT[compare_index].ptp_trans.messageType         != ptp_trans.messageType))  //sync
		   begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect messageType=%h\n  col messageType=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.messageType,ptp_trans.messageType));
		   end
		  else
		    if((ptp_trans.messageType == 8) && (last_message_type !=0)        )  //follow up
		      begin
		       mismatch = 1;
			   $fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect messageType=%h\n  col messageType=%h\n",$time,
			                                                  last_message_type,ptp_trans.messageType));
		      end		      		   
		  
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.reserved0           != ptp_trans.reserved0          )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect reserved0=%h\n  col reserved0=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.reserved0,ptp_trans.reserved0));
    	 end
         
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.versionPTP          != ptp_trans.versionPTP         )
		 begin
		    mismatch = 1;
            $fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect versionPTP=%h\n  col versionPTP=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.versionPTP,ptp_trans.versionPTP));			
		 end
			
         if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.messageLength       != ptp_trans.messageLength      )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect messageLength=%h\n  col messageLength=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.messageLength,ptp_trans.messageLength));
					end
		 
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.domainNumber        != ptp_trans.domainNumber       )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect domainNumber=%h\n  col domainNumber=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.domainNumber,ptp_trans.domainNumber));
					end
		 
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.reserved1           != ptp_trans.reserved1          )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect reserved1=%h\n  col reserved1=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.reserved1,ptp_trans.reserved1));
					end
		 
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.flagField           != ptp_trans.flagField          )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect flagField=%h\n  col flagField=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.flagField,ptp_trans.flagField));
					end
		 
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.reserved2           != ptp_trans.reserved2          )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect reserved2=%h\n  col reserved2=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.reserved2,ptp_trans.reserved2));
					end
		 
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.sourcePortIdentity  != ptp_trans.sourcePortIdentity )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect sourcePortIdentity=%h\n  col sourcePortIdentity=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.sourcePortIdentity,ptp_trans.sourcePortIdentity));
					end
		   
		 if( (ptp_trans.sequenceId!=0) && (  ((ptp_trans.packet_type == ptp_item::Follow_Up)  &&(ptp_trans.sequenceId  !=sequence_id  ))
		                                   ||((ptp_trans.packet_type == ptp_item::Sync)       &&(ptp_trans.sequenceId  !=sequence_id+1))
										   ||((ptp_trans.packet_type == ptp_item::Pdelay_Req) &&(ptp_trans.sequenceId  !=sequence_id+1)))
		   )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect sequenceId=%h\n  col sequenceId=%h\n",$time,
			                                                    sequence_id,ptp_trans.sequenceId));
					end

		   
		 if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.controlField        != ptp_trans.controlField       )
		 begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect controlField=%h\n  col controlField=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.controlField,ptp_trans.controlField));
					end
		
		if(`PTP_CONFIG_CONTENT[compare_index].ptp_trans.logMessageInterval  != ptp_trans.logMessageInterval )
		   begin
		    mismatch = 1;
			$fwrite(write_comp_data_fd,$psprintf("T=%0t\n expect logMessageInterval=%h\n  col logMessageInterval=%h\n",$time,
			        `PTP_CONFIG_CONTENT[compare_index].ptp_trans.logMessageInterval,ptp_trans.logMessageInterval));
					end
		 
		 
		   
		 $fclose(write_comp_data_fd);
		
		 
		 //
		 if(one_two_step==0) //one step
		   sequence_id=ptp_trans.sequenceId;
		 else
		   if(ptp_trans.messageType == 0)
		    sequence_id=ptp_trans.sequenceId;
			
		 last_message_type = ptp_trans.messageType;
		 
		 
		 //FILE IO
		    write_comp_data_fd=$fopen(timestamp_file,"a+"); 
			//correctionField
			if(ptp_trans.messageType==0) //sync
              begin
			   $fwrite(write_exp_data_fd,$psprintf("T=%0t,sequenceId=%0d,RCV correctionField =%0h\n",$time,ptp_trans.sequenceId,ptp_trans.correctionField));
               if(ptp_trans.correctionField == 0)
			   //last_correctionField)			   
			      mismatch = 1; 
			   last_correctionField = ptp_trans.correctionField;
			  end
            
			//originTimestamp
			if(one_two_step==0) //one step
			  begin
			    $fwrite(write_exp_data_fd,$psprintf("T=%0t,sequenceId=%0d,RCV originTimestamp =%0h\n",$time,ptp_trans.sequenceId,ptp_trans.originTimestamp));	
				if(ptp_trans.originTimestamp == last_OriginTimestamp)			   
			      mismatch = 1; 
			    last_OriginTimestamp = ptp_trans.originTimestamp;
		      end
            else if(ptp_trans.messageType==8)//follow_up
			        begin
					  $fwrite(write_exp_data_fd,$psprintf("T=%0t,sequenceId=%0d,RCV preciseOriginTimestamp =%0h\n",$time,ptp_trans.sequenceId,ptp_trans.preciseOriginTimestamp)); 
					  if(ptp_trans.preciseOriginTimestamp == last_preciseOriginTimestamp)			   
			            mismatch = 1; 
			          last_preciseOriginTimestamp = ptp_trans.preciseOriginTimestamp;
					end			
            $fclose(write_exp_data_fd);
			
			write_comp_data_fd=$fopen(timestamp_file,"a+"); 
			if(mismatch)  
		     begin		                                                   
             $fwrite(write_comp_data_fd,$psprintf("T=%0t\n exp:\n%s\n  col:\n%s\n",$time,
			         `PTP_CONFIG_CONTENT[compare_index].ptp_trans.sprint(),ptp_trans.sprint()));
					end
			$fclose(write_exp_data_fd);		
			
			match = ~mismatch;
			if(match)
			-> comp_success;
    endfunction	
	
	virtual function field_compare_2(eth_frame eth_frame_trans,ptp_item ptp_trans, output bit match);
	   //pop expect packet
	    eth_frame eth_frame_exp_tr;
		ptp_item  ptp_exp_trans;
		ptp_exp_trans = new();
	    pop_exp(eth_frame_exp_tr);
		//unpack eth_frame_exp;
		unpack_ptp(eth_frame_exp_tr,ptp_exp_trans);
		if(ptp_trans.sequenceId == ptp_exp_trans.sequenceId)
		   begin
		   ->comp_start;	   
		   //compare ptp_exp_trans and ptp_col_trans
		   field_compare_2_imp(eth_frame_exp_tr,eth_frame_trans,ptp_exp_trans,ptp_trans,match);
		   end
		else
		   begin
		    `uvm_info(get_type_name(),{$psprintf("FATAL ERROR, sequenceId mismatch col sequenceId=%0d ,exp sequenceId=%0d time=%0t\n",ptp_trans.sequenceId,ptp_exp_trans.sequenceId,$time)},UVM_LOW);
			   ->fatal_event;
		   end
	endfunction 
	
	virtual function pop_exp(ref eth_frame eth_frame_exp_tr);
	        int exp_queue_size;			 
	        eth_frame eth_frame_exp_tr;
            eth_frame_exp_tr =new();
			
			exp_queue_size=eth_exp_que.size;
			if(exp_queue_size==0)
			  begin
			    `uvm_info(get_type_name(),{$psprintf("FATAL ERROR, exp_queue_size ==0 at beginning of compare time=%0t\n",$time)},UVM_LOW);
			    ->fatal_event;
			  end
			else
        	  eth_frame_exp_tr=eth_exp_que.pop_front();
	endfunction 
	
	virtual function unpack_ptp(eth_frame eth_frame_trans,ref ptp_item ptp_trans);
	  bit [7:0] data_tmp[];
	  data_tmp = new[eth_frame_trans.tagged_data[1].data.size];
	  foreach(eth_frame_trans.tagged_data[1].data[key])
	    data_tmp[key]=eth_frame_trans.tagged_data[1].data[key];
	   ptp_trans.unpack_bytes(data_tmp);
	endfunction 
	
    virtual function transform_pdelay_req(ref ptp_item ptp_trans);
	   ptp_trans.packet_type = ptp_item::Pdelay_Resp;
	   ptp_trans.messageType = `Pdelay_Resp;
	   ptp_trans.requestingPortIdentity = ptp_trans.sourcePortIdentity;
	   ptp_trans.sourcePortIdentity = {`PTP_CONFIG.src_mac,port_id};
	   
	endfunction 
	
	virtual function field_compare_2_imp(eth_frame eth_exp_frame_trans,eth_frame eth_col_frame_trans,
	                                     ptp_item ptp_exp_trans, ptp_item ptp_col_trans,output bit match);
	  int compare_index;
	  bit [255:0]mismatch;
	  bit one_two_step;
	  
	  mismatch = 0;
	  match = 0;	
	  one_two_step = `PTP_CONFIG.two_step;
		//transform the pdelay req to pdelay_resp
		   transform_pdelay_req(ptp_exp_trans);		
        //compare ethernet
       	if(eth_col_frame_trans.destination_address != eth_exp_frame_trans.destination_address)
		   mismatch[0] = 1;
		
        if(eth_col_frame_trans.source_address != `PTP_CONFIG.src_mac)
		   mismatch[1] = 1;

        if(eth_col_frame_trans.tagged_data[0].tpid != eth_exp_frame_trans.tagged_data[0].tpid)
		   mismatch[2] = 1;	
        
        if(eth_col_frame_trans.tagged_data[1].tpid != eth_exp_frame_trans.tagged_data[1].tpid)
		   mismatch[3] = 1;
        
		foreach(eth_col_frame_trans.tagged_data[0].data[key])
         begin
		   if(eth_col_frame_trans.tagged_data[0].data[key] != eth_exp_frame_trans.tagged_data[0].data[key])
		     mismatch[4] = 1;		
		 end
		
		if(|mismatch)  
		   begin
		     write_comp_data_fd=$fopen(data_comp_result,"a+");                                               
             $fwrite(write_comp_data_fd,$psprintf("T=%0t\n mismatch=%0b,exp\n%s\n col \n %s\n",$time,mismatch,eth_exp_frame_trans.sprint(),eth_col_frame_trans.sprint()));
             $fclose(write_comp_data_fd);
		   end	
		
		if(ptp_col_trans.messageType != ptp_exp_trans.messageType)
		    mismatch[5] = 1;	
		if(ptp_col_trans.requestingPortIdentity != ptp_exp_trans.requestingPortIdentity)
		    mismatch[6] = 1;
        if(ptp_col_trans.sourcePortIdentity != ptp_exp_trans.sourcePortIdentity)
		    mismatch[7] = 1;
		
		write_comp_data_fd=$fopen(timestamp_file,"a+"); 
			//correctionField
              begin
			   $fwrite(write_exp_data_fd,$psprintf("T=%0t,sequenceId=%0d,RCV correctionField =%0h\n",$time,ptp_col_trans.sequenceId,ptp_col_trans.correctionField));
               if(ptp_col_trans.correctionField == 0)
			   //last_correctionField)			   
			      mismatch[8] = 1; 
			   last_correctionField = ptp_col_trans.correctionField;
			  end
            
			//requestReceiptTimestamp
			  begin
			    $fwrite(write_exp_data_fd,$psprintf("T=%0t,sequenceId=%0d,RCV requestReceiptTimestamp =%0h\n",$time,ptp_col_trans.sequenceId,ptp_col_trans.requestReceiptTimestamp));	
				if(~one_two_step) begin// one step
				  if(ptp_col_trans.requestReceiptTimestamp!=0)
				   mismatch[9] = 1;
				   end
				else begin
				if(ptp_col_trans.requestReceiptTimestamp == last_OriginTimestamp)			   
			       mismatch[10] = 1; 
				end
			    last_OriginTimestamp = ptp_col_trans.requestReceiptTimestamp;
		      end		
            $fclose(write_exp_data_fd);
			
			write_comp_data_fd=$fopen(timestamp_file,"a+"); 
			if(|mismatch)  
		     begin		                                                   
             $fwrite(write_comp_data_fd,$psprintf("T=%0t\n mismatch=%0b exp:\n%s\n  col:\n%s\n",$time,mismatch,
			         ptp_exp_trans.sprint(),ptp_col_trans.sprint()));
					end
			$fclose(write_exp_data_fd);		
			
			match = ~(|mismatch);
			
			if(match)
			-> comp_success;
	endfunction
endclass