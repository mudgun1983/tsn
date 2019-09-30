class tsn_switch_model extends uvm_component;

    uvm_blocking_get_port#(eth_frame)              get_port;
    uvm_analysis_port #(eth_frame)                 push_port;
	
`uvm_component_utils_begin(tsn_switch_model)
    `uvm_component_utils_end


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
	SMD_S0_STATE,
	SMD_S1_STATE,
	SMD_S2_STATE,
	SMD_S3_STATE,
	SMD_C0_STATE,
	SMD_C1_STATE,
	SMD_C2_STATE,
	SMD_C3_STATE,
	MERGE,
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
  bit [1:0] error_packet; //error-code: 00: no error
  bit [7:0] frame_data_merge[$];
  
  int write_data_fd        ;
		                        //            01: frag code error
								//            02: not express nor preempt packet
//================================================//
//FUNCTION    : new
//================================================//
    function new (string name ="tsn_switch_model",uvm_component parent);
        super.new(name,parent);
		write_data_fd=$fopen("merge_frame.txt","w+");                                               
        $fclose(write_data_fd);
    endfunction

//================================================//
//FUNCTION    : build
//================================================//
    virtual function void build ();
        string inst_name;
        super.build();
		
        get_port    =  new("get_port",this);
        push_port   =  new("push_port",this);
       
    endfunction : build

//================================================//
//TASK    : run
//================================================//
    virtual task run();
        super.run();
        fork
            get_trans();
           // push_trans();
        join
    endtask: run

////================================================//
////TASK    : get_exp_trans
////================================================//
    task get_trans();
	   while(1) begin
            eth_frame eth_frame_exp_tr;
            eth_frame_exp_tr =new();
            get_port.get(eth_frame_exp_tr);
			//classify and merge the packet
			classify_merge(eth_frame_exp_tr);
			if(merge_finish)
			  push_port.write(eth_frame_exp_tr);
			end
    endtask	
	
	task classify_merge(ref eth_frame eth_frame_exp_tr );

		bit [7:0] sfd;
		bit [7:0] smd;
		bit [7:0] frag;
		bit       preempt_start;
		bit       merge_en = 0;
		bit [7:0] data_payload[];
		bit [31:0] temp_crc32;
		smd_e     smd_t;
		frag_e    frag_t;
		
		
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
			merge_finish = 1;
		  end
		else
		  //if(smd_t == SMD_S0 || smd_t == SMD_S1 || smd_t == SMD_S2 || smd_t == SMD_S3)
		  begin
		    express_packet = 0;
			merge_finish = 0;
			if(smd_t == SMD_C0 || smd_t == SMD_C1 ||smd_t == SMD_C2 ||smd_t == SMD_C3)
			frag_packet = 1;
			else
			frag_packet = 0;
		  end
			 
		if(express_packet ==1)
		 return;
		else 
		   begin
		     merge_en = 1;
			 // case(state_t)
			       // IDLE: if(smd_t==SMD_S0)
				             // begin
							   // state_t = SMD_S0_STATE;
							   // merge_en =1;
							 // end
						 // else
						     // state_t = IDLE;
			// SMD_S0_STATE:if(smd_t)
			     // default:state= IDLE;
			 // endcase
		   end
		
    // extract the payload in frame_data 
	data_payload = eth_frame_exp_tr.frame_data;
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
    
    // start merge the payload	
        //		
        if(merge_en==1)		 
		   begin
		     foreach(data_payload[i])
		       begin
			     frame_data_merge.push_back(data_payload[i]);
			     //file IO
			        write_data_fd=$fopen("merge_frame.txt","a+"); 	
                    foreach(frame_data_merge[key])
                      $fwrite(write_data_fd,$psprintf("frame_data_merge[%0d]=%2h\n",key,frame_data_merge[key]));			  
                    $fclose(write_data_fd);
			   end
			 
			//cal the crc
			data_payload = frame_data_merge;
			temp_crc32 = crc_cal.do_crc32_se(data_payload,32'hffff_ffff)^ (32'hffff_ffff);
			if(temp_crc32 == eth_frame_exp_tr.fcs)
			  merge_finish = 1;
			else
			  merge_finish = 0;
		   end
		
		if(merge_finish)
		   begin
		     eth_frame_exp_tr.frame_data  = new[data_payload.size()+4](eth_frame_exp_tr.frame_data);
			 //file IO
			        write_data_fd=$fopen("merge_frame.txt","a+"); 	
                    $fwrite(write_data_fd,$psprintf("frame_data_merge finish\n"));			  
                    $fclose(write_data_fd);
		   end
	endtask
	
	
 
  
endclass
