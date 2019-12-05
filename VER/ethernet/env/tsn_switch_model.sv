class tsn_switch_model  extends uvm_component;
    uvm_blocking_get_port#(eth_frame)              get_port_dbg;
    uvm_analysis_port #(eth_frame)                 item_collected_port_dbg;
	
    uvm_blocking_get_port#(eth_frame)              get_port[];
    uvm_analysis_port #(eth_frame)                 item_collected_port[];
    uvm_analysis_port #(eth_frame)                 ptp_item_collected_port[];

string file_name;
	
`uvm_component_utils(tsn_switch_model)

//attribute    
topology_config       topology_config0;

typedef enum bit[7:0]{
    SMD_S0    = 8'hE6,
    SMD_S1    = 8'h4C,
    SMD_S2    = 8'h7F,
    SMD_S3    = 8'hB3,
	SMD_C0    = 8'h61,
    SMD_C1    = 8'h52,
    SMD_C2    = 8'h9E,
    SMD_C3    = 8'h2A,
	SMD_ERROR = 8'hFF
  } smd_e;

typedef enum bit[7:0]{
    FRAG_CNT_0     = 8'hE6,
    FRAG_CNT_1     = 8'h4C,
    FRAG_CNT_2     = 8'h7F,
    FRAG_CNT_3     = 8'hB3,
	FRAG_CNT_ERROR = 8'hFF
  } frag_e;

typedef enum bit[7:0]{
    IDLE = 8'h0,
	SMD_S_STATE,
	SMD_C_STATE,
	ASSEMBLE,
	ERROR
  } state_e;
  
  
  local smd_e     smd_last;
  local frag_e    frag_last;
  local state_e   state_t;
  
  eth_frame	eth_frame_trans_merge	;
  crc_cal  crc_cal = new();
  
  bit express_packet; //1:express 0:preemt
  bit frag_packet;    //1:start of preempt 0:frag of preempt
  bit merge_finish;
  bit merge_finish_array[];
  bit [1:0] error_packet; //error-code: 00: no error
  bit [7:0] frame_data_merge[$];
  
  int write_data_fd        ;
  string inst_name;
  eth_frame eth_frame_exp_tr_array[];
  
  //check for preemptable packet//
  int rxFrameCnt;
  int cFrameCnt;
  int rxFragCnt;
  int nxFragCnt;
  bit smd_flag=0;
  smd_e     smd_t;
  frag_e    frag_t;
  bit [7:0] sfd;
  bit [7:0] smd;
  bit [7:0] frag;
		                        //            01: frag code error
								//            02: not express nor preempt packet
//================================================//
//FUNCTION    : new
//================================================//
    function new (string name ="tsn_switch_model",uvm_component parent);
        super.new(name,parent);
		file_name = get_name();
		write_data_fd=$fopen({"merge_frame_",file_name,".txt"},"w+");                                               
        $fclose(write_data_fd);
    endfunction

//================================================//
//FUNCTION    : build
//================================================//
    virtual function void build ();
        super.build();
		
		if( !uvm_config_db #( topology_config )::get( this , "" , "topology_config" ,topology_config0 ) ) begin
           `uvm_fatal(get_type_name(),"=============topology_config==========");
		end
		
		get_port_dbg            = new("get_port_dbg",this);
		item_collected_port_dbg = new("item_collected_port",this);
		
		get_port    =  new[topology_config0.mac_number];
		for(int i=0;i<topology_config0.mac_number;i++)
		  begin
		    inst_name = $sformatf("%0d",i);//string'(i);
            get_port[i]    =  new({"get_port[",inst_name,"]"},this);
	      end
		  
		item_collected_port = new[topology_config0.mac_number];
		for(int i=0;i<topology_config0.mac_number;i++)
		  begin
		    inst_name = $sformatf("%0d",i);//string'(i);
            item_collected_port[i]    =  new({"item_collected_port[",inst_name,"]"},this);
	      end
		
		ptp_item_collected_port = new[topology_config0.mac_number];
		for(int i=0;i<topology_config0.mac_number;i++)
		  begin
		    inst_name = $sformatf("%0d",i);//string'(i);
            ptp_item_collected_port[i]    =  new({"ptp_item_collected_port[",inst_name,"]"},this);
	      end
		  
        eth_frame_exp_tr_array	= new[topology_config0.mac_number];	
		merge_finish_array = new[topology_config0.mac_number];
    endfunction : build

//================================================//
//TASK    : run
//================================================//
    virtual task run();
        super.run();
        fork
            get_trans_dbg();
			get_trans();
           // push_trans();
        join
    endtask: run

////================================================//
////TASK    : get_exp_trans
////================================================//
    task get_trans_dbg();
	         while(1) begin
                 eth_frame eth_frame_exp_tr;
                 eth_frame_exp_tr =new();
                 get_port_dbg.get(eth_frame_exp_tr);
		      	`uvm_info(get_type_name(),{$psprintf("get tran eth_frame_trans:\n"),eth_frame_exp_tr.sprint()},UVM_HIGH);
		      	//classify and merge the packet
		      	classify_merge(eth_frame_exp_tr,merge_finish);
		      	if(merge_finish)
		      	  begin
				  `uvm_info(get_type_name(),{$psprintf("merge_finish=%0d T=%0t",merge_finish,$time)},UVM_HIGH);
				  item_collected_port_dbg.write(eth_frame_exp_tr);
				  end
		      	end
    endtask
	
   virtual task get_trans();
	for(int i =0; i<topology_config0.mac_number;i++)
		  begin
		  automatic int index;
          index = i; 
		  fork
	         while(1) begin
                 //eth_frame eth_frame_exp_tr;
                 eth_frame_exp_tr_array[index] =new();
                 get_port[index].get(eth_frame_exp_tr_array[index]);
		      	`uvm_info(get_type_name(),{$psprintf("get tran eth_frame_trans:\n"),eth_frame_exp_tr_array[index].sprint()},UVM_HIGH);
		      	//classify and merge the packet
		      	classify_merge(eth_frame_exp_tr_array[index],merge_finish);
		      	//if(merge_finish)
		      	item_collected_port[index].write(eth_frame_exp_tr_array[index]);
		      	end
		   join_none
		   end
		   wait fork;
    endtask	
	
	task classify_merge(ref eth_frame eth_frame_exp_tr,output bit merge_finish_o );


		bit       preempt_start;
		bit       merge_en = 0;
		bit [7:0] data_payload[];
		bit [31:0] temp_crc32;
		bit [31:0] local_crc32;

		
		
		sfd = eth_frame_exp_tr.preamble.sfd;
		smd = eth_frame_exp_tr.preamble.smd;
		frag = eth_frame_exp_tr.preamble.frag_cnt;
		
		case(smd)
		 8'hE6: smd_t =  SMD_S0       ;
		 8'h4C: smd_t =  SMD_S1       ;
		 8'h7F: smd_t =  SMD_S2       ;
		 8'hB3: smd_t =  SMD_S3       ;
		 8'h61: smd_t =  SMD_C0       ;
		 8'h52: smd_t =  SMD_C1       ;
		 8'h9E: smd_t =  SMD_C2       ;
		 8'h2A: smd_t =  SMD_C3       ;
		default:smd_t =  SMD_ERROR    ;
		endcase
		
		case(frag)
		 8'hE6: frag_t =  FRAG_CNT_0        ;
		 8'h4C: frag_t =  FRAG_CNT_1        ;
		 8'h7F: frag_t =  FRAG_CNT_2        ;
		 8'hB3: frag_t =  FRAG_CNT_3        ;
		default:frag_t =  FRAG_CNT_ERROR    ;
		endcase
		
		if(sfd==8'hd5)
		  begin
		    express_packet = 1;
			frag_packet = 0;
			merge_finish_o = 1;
		  end
		else
		  //if(smd_t == SMD_S0 || smd_t == SMD_S1 || smd_t == SMD_S2 || smd_t == SMD_S3)
		  begin
		    express_packet = 0;
			merge_finish_o = 0;
			if(smd_t == SMD_C0 || smd_t == SMD_C1 ||smd_t == SMD_C2 ||smd_t == SMD_C3)
			frag_packet = 1;
			else
			frag_packet = 0;
		  end
			 
		if(express_packet ==1)
		 return;
		else 
		   begin
		     check_preemtable_packet_valid();
		     merge_en = 1;           
		   end
		
    // extract the payload in frame_data 
	data_payload = eth_frame_exp_tr.frame_data;
	//debug
	  foreach(data_payload[i])
	    begin
		  `uvm_info(get_type_name(),{$psprintf("origin data_payload[%0d]=%0h",i,data_payload[i])},UVM_HIGH);
		end
	
	if((~express_packet) && (frag_packet))
	  begin
       foreach(data_payload[i])
        data_payload[i] = data_payload[i+eth_frame_exp_tr.preamble.data_preamble.size()+1+1];  //SMD and FRAG CNT
	   
	   data_payload = new[data_payload.size()-eth_frame_exp_tr.preamble.data_preamble.size()-1-1-4](data_payload);
	  end
	else
	  begin
	   foreach(data_payload[i])
        data_payload[i] = data_payload[i+eth_frame_exp_tr.preamble.data_preamble.size()+1];
		
	   data_payload = new[data_payload.size()-eth_frame_exp_tr.preamble.data_preamble.size()-1-4](data_payload);
	  end
	// extract the payload in frame_data 
    
	//debug
	  foreach(data_payload[i])
	    begin
		  `uvm_info(get_type_name(),{$psprintf("origin data_payload[%0d]=%2h",i,data_payload[i])},UVM_HIGH);
		end
		
    // start merge the payload	
        //		
        if(merge_en==1)		 
		   begin
		     foreach(data_payload[i])
		       begin
			     frame_data_merge.push_back(data_payload[i]);			     
			   end
	
			//cal the crc
			data_payload = frame_data_merge;
			foreach(data_payload[i])
			begin
				`uvm_info(get_type_name(),{$psprintf("merge data_payload[%0d]=%2h",i,data_payload[i])},UVM_HIGH);		     
			end
			temp_crc32 = crc_cal.do_crc32_se(data_payload,32'hffff_ffff)^ (32'hffff_ffff);
			
			 `uvm_info(get_type_name(),{$psprintf("temp_crc32=%0h  eth_frame_exp_tr.fcs=%0h",temp_crc32,eth_frame_exp_tr.fcs)},UVM_HIGH);
			
			local_crc32[31:24] = temp_crc32[7:0]  ;
            local_crc32[23:16] = temp_crc32[15:8] ;
            local_crc32[15:8]  = temp_crc32[23:16];
            local_crc32[7:0]   = temp_crc32[31:24];
	         `uvm_info(get_type_name(),{$psprintf("local_crc32=%0h  eth_frame_exp_tr.fcs=%0h",local_crc32,eth_frame_exp_tr.fcs)},UVM_LOW);
			if(local_crc32 == eth_frame_exp_tr.fcs)
			  merge_finish_o = 1;
			else
			  merge_finish_o = 0;
		   end
		
		if(merge_finish_o)
		   begin
		     eth_frame_exp_tr.frame_data  = new[data_payload.size()](eth_frame_exp_tr.frame_data);
			 eth_frame_exp_tr.frame_data  = data_payload;
			 
			 //file IO
                // write_data_fd=$fopen({"merge_frame_",file_name,".txt"},"a+"); 	
                // foreach(frame_data_merge[key])
                // $fwrite(write_data_fd,$psprintf("frame_data_merge[%0d]=%2h\n",key,frame_data_merge[key]));			  
                // $fclose(write_data_fd);		
			 
			    // write_data_fd=$fopen({"merge_frame_",file_name,".txt"},"a+"); 	
                // $fwrite(write_data_fd,$psprintf("frame_data_merge finish\n"));			  
                // $fclose(write_data_fd);
					
			 data_payload.delete();	
             frame_data_merge.delete();			 
		   end
		`uvm_info(get_type_name(),{$psprintf("merge_finish_o=%0d T=%0t",merge_finish_o,$time)},UVM_HIGH);
	endtask
	
	
virtual function bit [1:0] SMDS_ENCODE(input [7:0]smd);
    case(smd)
	     8'hE6:SMDS_ENCODE=0;
		 8'h4C:SMDS_ENCODE=1;
		 8'h7F:SMDS_ENCODE=2;
		 8'hB3:SMDS_ENCODE=3;		 
	endcase
endfunction

virtual function bit [1:0] SMDC_ENCODE(input [7:0]smd);
    case(smd)
	     8'h61:SMDC_ENCODE=0;
		 8'h52:SMDC_ENCODE=1;
		 8'h9E:SMDC_ENCODE=2;
		 8'h2A:SMDC_ENCODE=3;		 
	endcase
endfunction

virtual function bit [1:0] FRAG_ENCODE(input [7:0]smd);
    case(smd)
	     8'hE6:FRAG_ENCODE=0;
		 8'h4C:FRAG_ENCODE=1;
		 8'h7F:FRAG_ENCODE=2;
		 8'hB3:FRAG_ENCODE=3;		 
	endcase
endfunction  

virtual function check_preemtable_packet_valid();
			  case(state_t)
			        IDLE:begin
                          if(smd_t == SMD_S0 || smd_t == SMD_S1 || smd_t == SMD_S2 || smd_t == SMD_S3)
				              begin
							    state_t = SMD_S_STATE;
							    //merge_en =1;
								rxFrameCnt=SMDS_ENCODE(smd);
							  end
						  else 
                              state_t = IDLE;
					     end
			 SMD_S_STATE:begin
			              smd_flag=1;
			              if(smd_t == SMD_S0 || smd_t == SMD_S1 || smd_t == SMD_S2 || smd_t == SMD_S3)
						    begin
							  state_t = SMD_S_STATE;
							  rxFrameCnt=SMDS_ENCODE(smd);
							  nxFragCnt =0;
							end
					      else if(smd_t == SMD_C0 || smd_t == SMD_C1 ||smd_t == SMD_C2 ||smd_t == SMD_C3)
						           begin
								    state_t = SMD_S_STATE;
									cFrameCnt = SMDC_ENCODE(smd);
									  
									 if(cFrameCnt!=rxFrameCnt)
						               begin
							            `uvm_fatal(get_type_name(),$psprintf("FATAL,cFrameCnt!=rxFrameCnt ,cFrameCnt=%0d ,rxFrameCnt=%0d time=%0t\n",cFrameCnt,rxFrameCnt,$time));
							             state_t = ERROR;
							           end
						             else if(frag_t==FRAG_CNT_0 || frag_t==FRAG_CNT_1 || frag_t==FRAG_CNT_2 || frag_t==FRAG_CNT_3)
						                    begin
											 rxFragCnt = FRAG_ENCODE(frag);
											 if(rxFragCnt != nxFragCnt)
							                  begin
							                   `uvm_fatal(get_type_name(),$psprintf("FATAL,rxFragCnt!=nxFragCnt ,rxFragCnt=%0d ,nxFragCnt=%0d time=%0t\n",rxFragCnt,nxFragCnt,$time));
							                    state_t = ERROR;
							                  end
											 else 
											  begin
							                   nxFragCnt++;								       
								               state_t= SMD_S_STATE;
											  end
							                end									      										    
								   end
							   else
							       state_t = ERROR;
						 end
			 ERROR:begin
                     `uvm_fatal(get_type_name(),$psprintf("FATAL,SMD DECODE ERROR SMD=%0h time=%0t\n",smd,$time));
					  state_t= IDLE;
					  smd_flag=0;
			       end			 
			      default:state_t= IDLE;
			  endcase			
            `uvm_info(get_type_name(),{$psprintf("SMD=%0h %s,FRAG=%0h %s, STATE=%0s time=%0t",smd,smd_t,frag,frag_t,state_t,$time)},UVM_LOW);			
endfunction

endclass
