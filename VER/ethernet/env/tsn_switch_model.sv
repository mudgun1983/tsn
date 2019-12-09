class classify_pack_t extends uvm_object;
  typedef enum bit[7:0]{
    IDLE = 8'h0,
	SMD_S_STATE,
	SMD_C_STATE,
	ASSEMBLE,
	ERROR
  } state_e;
  
  bit [7:0] frame_data_merge[$];
  //check for preemptable packet//
  int rxFrameCnt;
  int cFrameCnt;
  int rxFragCnt;
  int nxFragCnt;
  int smd_flag;//=0;
  state_e   state_t; 
  
  function new( string name = "" );
    super.new( name );
  endfunction

 endclass

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
  
 
  eth_frame	eth_frame_trans_merge	;
  crc_cal  crc_cal = new();
  

  bit merge_finish;
  bit merge_finish_array[];
  //bit [1:0] error_packet; //error-code: 00: no error
  //bit [7:0] frame_data_merge[$];
  
  int write_data_fd        ;
  string inst_name;
  eth_frame eth_frame_exp_tr_array[];

  classify_pack_t classify_pack_s[];
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
/*		
		frame_data_merge_s= new[topology_config0.mac_number];
		rxFrameCnt        = new[topology_config0.mac_number];
		cFrameCnt         = new[topology_config0.mac_number];
		rxFragCnt         = new[topology_config0.mac_number];
		nxFragCnt         = new[topology_config0.mac_number];
		smd_flag          = new[topology_config0.mac_number];
		smd_kind             = new[topology_config0.mac_number];
		frag_kind            = new[topology_config0.mac_number];
		sfd               = new[topology_config0.mac_number];
		smd               = new[topology_config0.mac_number];
		frag              = new[topology_config0.mac_number];
*/
        classify_pack_s=new[topology_config0.mac_number];
        foreach(classify_pack_s[key])		
		   classify_pack_s[key]=new();
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
		      	classify_merge(
				               .eth_frame_exp_tr(eth_frame_exp_tr),
							   .classify_pack_s (classify_pack_s[0]),
							   .index           (0),
							   .merge_finish_o  (merge_finish) );
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
		      	classify_merge(.eth_frame_exp_tr(eth_frame_exp_tr_array[index]),
							   .classify_pack_s (classify_pack_s[index]),
							   .index           (index),
							   .merge_finish_o  (merge_finish) );
		      	//if(merge_finish)
		      	item_collected_port[index].write(eth_frame_exp_tr_array[index]);
		      	end
		   join_none
		   end
		   wait fork;
    endtask	
	
	task classify_merge(ref eth_frame eth_frame_exp_tr, ref classify_pack_t classify_pack_s,input int index,output bit merge_finish_o );

        bit       express_packet; //1:express 0:preemt
        bit       frag_packet;    //1:start of preempt 0:frag of preempt
		bit       preempt_start;
		bit       merge_en = 0;
		bit [7:0] data_payload[];
		bit [31:0] temp_crc32;
		bit [31:0] local_crc32;
        smd_e     smd_kind;
        frag_e    frag_kind;
        bit [7:0] sfd;
        bit [7:0] smd;
        bit [7:0] frag;
		
		
		sfd = eth_frame_exp_tr.preamble.sfd;
		smd = eth_frame_exp_tr.preamble.smd;
		frag = eth_frame_exp_tr.preamble.frag_cnt;
		
		case(smd)
		 8'hE6: smd_kind =  SMD_S0       ;
		 8'h4C: smd_kind =  SMD_S1       ;
		 8'h7F: smd_kind =  SMD_S2       ;
		 8'hB3: smd_kind =  SMD_S3       ;
		 8'h61: smd_kind =  SMD_C0       ;
		 8'h52: smd_kind =  SMD_C1       ;
		 8'h9E: smd_kind =  SMD_C2       ;
		 8'h2A: smd_kind =  SMD_C3       ;
		default:smd_kind =  SMD_ERROR    ;
		endcase
		
		case(frag)
		 8'hE6: frag_kind =  FRAG_CNT_0        ;
		 8'h4C: frag_kind =  FRAG_CNT_1        ;
		 8'h7F: frag_kind =  FRAG_CNT_2        ;
		 8'hB3: frag_kind =  FRAG_CNT_3        ;
		default:frag_kind =  FRAG_CNT_ERROR    ;
		endcase
		
		if(sfd==8'hd5)
		  begin
		    express_packet = 1;
			frag_packet = 0;
			merge_finish_o = 1;
		  end
		else
		  //if(smd_kind == SMD_S0 || smd_kind == SMD_S1 || smd_kind == SMD_S2 || smd_kind == SMD_S3)
		  begin
		    express_packet = 0;
			merge_finish_o = 0;
			if(smd_kind == SMD_C0 || smd_kind == SMD_C1 ||smd_kind == SMD_C2 ||smd_kind == SMD_C3)
			frag_packet = 1;
			else
			frag_packet = 0;
		  end
			 
		if(express_packet ==1)
		 begin
		   eth_frame_exp_tr.preemptable=0;
		   //return;
		 end
		else 
		   begin
		     check_preemtable_packet_valid(
			 .smd_kind  (smd_kind ),
			 .frag_kind (frag_kind),
			 .index     (index    ),
			 .smd       (smd      ),
			 .frag      (frag     ),
			 .rxFrameCnt(classify_pack_s.rxFrameCnt),
			 .nxFragCnt (classify_pack_s.nxFragCnt ),
			 .state_t   (classify_pack_s.state_t   ),
			 .smd_flag  (classify_pack_s.smd_flag  )
			 );
		     merge_en = 1;    
             eth_frame_exp_tr.preemptable =1;			 
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
			     classify_pack_s.frame_data_merge.push_back(data_payload[i]);			     
			   end
	
			//cal the crc
			data_payload = classify_pack_s.frame_data_merge;
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
			 //eth_frame_exp_tr.preemptable =1;
			 //file IO
                // write_data_fd=$fopen({"merge_frame_",file_name,".txt"},"a+"); 	
                // foreach(frame_data_merge[key])
                // $fwrite(write_data_fd,$psprintf("frame_data_merge[%0d]=%2h\n",key,frame_data_merge[key]));			  
                // $fclose(write_data_fd);		
			 
			    // write_data_fd=$fopen({"merge_frame_",file_name,".txt"},"a+"); 	
                // $fwrite(write_data_fd,$psprintf("frame_data_merge finish\n"));			  
                // $fclose(write_data_fd);
					
			 data_payload.delete();	
			 if(eth_frame_exp_tr.preemptable==1)
             classify_pack_s.frame_data_merge.delete();			 
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

virtual function check_preemtable_packet_valid(input smd_e   smd_kind  ,
                                               input frag_e  frag_kind ,
											   input int     index     ,
                                               input bit [7:0] smd,
                                               input bit [7:0] frag,
                                               ref   int     rxFrameCnt,
											   ref   int     nxFragCnt ,
											   ref   classify_pack_t::state_e state_t   ,
											   ref   int     smd_flag  
											   );
			int cFrameCnt;
            int rxFragCnt;			
			  case(state_t)
 classify_pack_t::IDLE:begin
                          if(smd_kind == SMD_S0 || smd_kind == SMD_S1 || smd_kind == SMD_S2 || smd_kind == SMD_S3)
				              begin
							    state_t = classify_pack_t::SMD_S_STATE;
							    //merge_en =1;
								rxFrameCnt=SMDS_ENCODE(smd);
							  end
						  else 
                              state_t = classify_pack_t::IDLE;
					     end
classify_pack_t::SMD_S_STATE:begin
			              smd_flag=1;
			              if(smd_kind == SMD_S0 || smd_kind == SMD_S1 || smd_kind == SMD_S2 || smd_kind == SMD_S3)
						    begin
							  state_t = classify_pack_t::SMD_S_STATE;
							  rxFrameCnt=SMDS_ENCODE(smd);
							  nxFragCnt =0;
							end
					      else if(smd_kind == SMD_C0 || smd_kind == SMD_C1 ||smd_kind == SMD_C2 ||smd_kind == SMD_C3)
						           begin
								    state_t = classify_pack_t::SMD_S_STATE;
									cFrameCnt = SMDC_ENCODE(smd);
									  
									 if(cFrameCnt!=rxFrameCnt)
						               begin
							            `uvm_fatal(get_type_name(),$psprintf("FATAL,cFrameCnt!=rxFrameCnt ,cFrameCnt=%0d ,rxFrameCnt=%0d ,port_id=%0d,time=%0t\n",cFrameCnt,rxFrameCnt,index,$time));
							             state_t = classify_pack_t::ERROR;
							           end
						             else if(frag_kind==FRAG_CNT_0 || frag_kind==FRAG_CNT_1 || frag_kind==FRAG_CNT_2 || frag_kind==FRAG_CNT_3)
						                    begin
											 rxFragCnt = FRAG_ENCODE(frag);
											 if(rxFragCnt != nxFragCnt%4)
							                  begin
							                   `uvm_fatal(get_type_name(),$psprintf("FATAL,rxFragCnt!=nxFragCnt ,rxFragCnt=%0d ,nxFragCnt=%0d,port_id=%0d time=%0t\n",rxFragCnt,nxFragCnt,index,$time));
							                    state_t = classify_pack_t::ERROR;
							                  end
											 else 
											  begin
							                   nxFragCnt++;								       
								               state_t= classify_pack_t::SMD_S_STATE;
											  end
							                end									      										    
								   end
							   else
							       state_t = classify_pack_t::ERROR;
						 end
classify_pack_t::ERROR:begin
                     `uvm_fatal(get_type_name(),$psprintf("FATAL,SMD DECODE classify_pack_t::ERROR SMD=%0h,port_id=%0d time=%0t\n",smd,index,$time));
					  state_t= classify_pack_t::IDLE;
					  smd_flag=0;
			       end			 
			      default:state_t= classify_pack_t::IDLE;
			  endcase			
            `uvm_info(get_type_name(),{$psprintf("SMD=%0h %s,FRAG=%0h %s, STATE=%0s,port_id=%0d time=%0t",smd,smd_kind,frag,frag_kind,state_t,index,$time)},UVM_LOW);			
endfunction

endclass
