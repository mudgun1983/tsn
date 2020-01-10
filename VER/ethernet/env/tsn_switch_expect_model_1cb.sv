class tsn_switch_expect_model_1cb extends tsn_switch_expect_model ;

parameter SQR_BOARD_SIZE = 2**16;
bit [15:0] sequence_id[`MAX_PORT_NUM];
`uvm_component_utils_begin(tsn_switch_expect_model_1cb) 
   `uvm_component_utils_end

typedef struct 
{
  //key----
  bit [7:0] rsv0;
  bit [7:0] rsv1;
  bit [7:0] sqr_num0;
  bit [7:0] sqr_num1;
  //--------
} r_tag_t;

typedef struct 
{
  //key----
  bit  SequenceHistory[SQR_BOARD_SIZE];
  //--------
} sqr_board_t;

sqr_board_t sqr_board_s[`MAX_PORT_NUM];
r_tag_t r_tag_s[`MAX_PORT_NUM];
int bypass;

    function new (string name ="tsn_switch_expect_model_1cb",uvm_component parent);
        super.new(name,parent);
    endfunction
	
//================================================//
//FUNCTION    : build
//================================================//
    virtual function void build ();
        super.build();
    endfunction 	


    task get_trans();
	for(int i =0; i<topology_config0.mac_number;i++)
		  begin
		  automatic int index,index_o;
          index = i; 
		  fork
	         while(1) begin
                 //eth_frame eth_frame_exp_tr;
                 eth_frame_exp_tr_array[index] =new();
                 get_port[index].get(eth_frame_exp_tr_array[index]);
				 //hash cal and store l2 table
				 hash_cal_store_l2_table(eth_frame_exp_tr_array[index],index);
		      	`uvm_info(get_type_name(),{$psprintf("get tran eth_frame_trans:\n"),eth_frame_exp_tr_array[index].sprint()},UVM_HIGH);
		      	//classify and merge the packet
		      	//classify_merge(eth_frame_exp_tr_array[index],merge_finish_array[index]);
				classify_merge(.eth_frame_exp_tr(eth_frame_exp_tr_array[index]),
							   .classify_pack_s (classify_pack_s[index]),
							   .index           (index),
							   .merge_finish_o  (merge_finish_array[index]) );
		      	if(merge_finish_array[index])
				hash_cal_read_l2_table(eth_frame_exp_tr_array[index],index,index_o);
						
                if(merge_finish_array[index])				 
			    	begin
					 `uvm_info(get_type_name(),{$psprintf("input port=%0d,output port=%0d\n",index,index_o)},UVM_LOW);
					  packet_process(eth_frame_exp_tr_array[index],index_o);
					  /*check_etype(eth_frame_exp_tr_array[index],bypass);
					  if(bypass==0)begin
		      	      item_collected_port[index_o].write(eth_frame_exp_tr_array[index]);					  
					  end
					  */
					end				 
		      	end
		   join_none
		   end
		   wait fork;
    endtask	

    virtual task packet_process(eth_frame eth_frame_exp_tr,input int out_port);
	   int etype;	
       int cb_valid;
	   //debug
		`uvm_info(get_type_name(),{$psprintf("get tran eth_frame_trans:\n"),eth_frame_exp_tr.sprint()},UVM_HIGH);
	   etype = eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].tpid;
	   cb_valid = `CB_CONFIG_CONTENT[0].cb_valid;
	   
	   case(etype)
	   `BYPASS_ETYPE:begin `uvm_info(get_type_name(),{$psprintf("packet bypss,etype=%0h",etype)},UVM_LOW);
			                return;
			         end
	       `CB_ETYPE:begin
		                 if(cb_valid)
		                    cb_process(eth_frame_exp_tr,1);
					     else
						    write_item(eth_frame_exp_tr,out_port);
		             end
	    default:begin
		                 if(cb_valid)
		                    cb_process(eth_frame_exp_tr,0);
					     else
						    write_item(eth_frame_exp_tr,out_port);
		        end
		endcase
	endtask
	
   /* virtual task check_etype(ref eth_frame eth_frame_exp_tr,output int  bypass);
		int etype;
		int sqr_num;
		bypass = 0;
		etype = eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].tpid;
		if(etype==`BYPASS_ETYPE)
		  begin
		    bypass = 1;
			`uvm_info(get_type_name(),{$psprintf("packet bypss,etype=%0h",etype)},UVM_LOW);
			return;
		  end
		else if(etype==`CB_ETYPE)
		  begin
		    sqr_num = {eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[2],eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[3]};
		    cb_process(eth_frame_exp_tr,sqr_num);//modify the packet as config 
		  end
		  else
		   return;
    endtask*/	
	
	virtual task cb_process(eth_frame eth_frame_exp_tr,input bit r_tag_seen);
	    //check sqr_broad
		    int        sqr_num;
			bit        rec_algorithm ;  //1'b0-match_alg; 1'b1-vector_alg. 
	        bit        listener_agent;  //1'b0-listener agent不使能； 1'b1-listener agent使能。 
	        bit        sq_en         ;  //1'b0-不需要添加序列号； 1'b1-需要添加序列号
	        bit        w_valid       ;
	        bit [4:0]  w_fp_oport    ;
	        bit        p_valid       ;
	        bit [4:0]  p_fp_oport    ;
		    int        source_port   ;
			int        pre_modify_len;
			bit [15:0]  data_payload[];
            bit [15:0] tmp_tpid;
			bit        talker_agent_add_r_tag;
			
			talker_agent_add_r_tag = 0; 
			source_port = eth_frame_exp_tr.source_address;
			rec_algorithm   = `CB_CONFIG_CONTENT[0].rec_algorithm ;
	        listener_agent  = `CB_CONFIG_CONTENT[0].listener_agent;		
	        sq_en           = `CB_CONFIG_CONTENT[0].sq_en         ;    
	        w_valid         = `CB_CONFIG_CONTENT[0].w_valid       ;  
	        w_fp_oport      = `CB_CONFIG_CONTENT[0].w_fp_oport    ;  
	        p_valid         = `CB_CONFIG_CONTENT[0].p_valid       ;  
	        p_fp_oport      = `CB_CONFIG_CONTENT[0].p_fp_oport    ; 
	        
	        if(r_tag_seen)begin
			  sqr_num     =  {eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[2][7:0],eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[3][7:0]};
			  tmp_tpid    =  {eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[4][7:0],eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[5][7:0]};
			 end
			else
			 begin
			  tmp_tpid    =  eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].tpid;
			  sqr_num     =  sequence_id[source_port];
			 end
			 
		if(rec_algorithm  ==0) begin//match_alg
		//talker agent
		if(sq_en==1)
			    begin
				 //insert R-TAG
				 eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].tpid = `CB_ETYPE;
				 data_payload = new[eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data.size+6]; //4 bytes in R-TAG and 2 former tpid bytes
				 //r_tag_s[source_port].rsv0= sequence_id[source_port][7:0];
				 r_tag_s[source_port].sqr_num0= sequence_id[source_port][15:8];
				 r_tag_s[source_port].sqr_num1= sequence_id[source_port][7:0];
				 data_payload[0] = r_tag_s[source_port].rsv0;
				 data_payload[1] = r_tag_s[source_port].rsv1;
				 data_payload[2] = r_tag_s[source_port].sqr_num0;
				 data_payload[3] = r_tag_s[source_port].sqr_num1;
				 data_payload[4] = tmp_tpid[15:8];
				 data_payload[5] = tmp_tpid[7:0];
				 foreach(eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[key])
				   data_payload[key+6]=eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[key];
				 
                 eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data.delete();
				 eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data = data_payload;
				 eth_frame_exp_tr.frame_data.delete();
				 eth_frame_exp_tr.pack_bytes(eth_frame_exp_tr.frame_data);
				 delete_preamble(eth_frame_exp_tr);
				 eth_frame_exp_tr.fcs=eth_frame_exp_tr.do_crc32();
				 `uvm_info(get_type_name(),{$psprintf("get tran eth_frame_trans:\n"),eth_frame_exp_tr.sprint()},UVM_HIGH);
				 sequence_id[source_port]++;
				 talker_agent_add_r_tag = 1;
				end
		  
		  //SequenceRecovery and listener_agent
	      if(sqr_board_s[source_port].SequenceHistory[sqr_num]==1 &&(talker_agent_add_r_tag || r_tag_seen))
		    begin
		     sqr_board_s[source_port].SequenceHistory[sqr_num]=0;
			 `uvm_info(get_type_name(),{$psprintf("SequenceRecovery discard sqr_num=%0h",sqr_num)},UVM_LOW);
		     return;//SequenceRecovery discard the  duplicate frame with the same sqr_num in R-TAG;
		    end
		  else
		    begin
		      sqr_board_s[source_port].SequenceHistory[sqr_num]=1;
			  //modify the item
			  if(listener_agent==1 && r_tag_seen)
			  //delete the R-TAG  6bytes(actually, delete first 6 bytes,and repalce the tpid value)
			    begin
				  for (int i=0;i<eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data.size-6;i++)
				     eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[i]=eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data[i+6];
				  
                  pre_modify_len	 = 	 eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data.size ;
				  eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data=new[pre_modify_len-6](eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].data);
				  eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].tpid = tmp_tpid;
				  //re-cal the crc;
				  eth_frame_exp_tr.frame_data.delete();
				  eth_frame_exp_tr.pack_bytes(eth_frame_exp_tr.frame_data);
				  //debug
				  `uvm_info(get_type_name(),{$psprintf("get tran eth_frame_trans:\n"),eth_frame_exp_tr.sprint()},UVM_HIGH);
/* 				  foreach(eth_frame_exp_tr.frame_data[key])
				    $display("eth_frame_exp_tr.frame_data[%0d]=%0h",key,eth_frame_exp_tr.frame_data[key]); */
					
				  //delete the preamble
				  delete_preamble(eth_frame_exp_tr);
				  eth_frame_exp_tr.fcs=eth_frame_exp_tr.do_crc32();
				  `uvm_info(get_type_name(),{$psprintf("get tran eth_frame_trans:\n"),eth_frame_exp_tr.sprint()},UVM_HIGH);
				end
			  
			  
				
			  case({w_valid,p_valid})
			           2'b10:begin write_item(eth_frame_exp_tr,w_fp_oport); end
					   2'b01:begin write_item(eth_frame_exp_tr,p_fp_oport); end
					   2'b11:begin write_item(eth_frame_exp_tr,w_fp_oport);
					               write_item(eth_frame_exp_tr,p_fp_oport); end
					   2'b00:return;	   
			  endcase
		    end
		end
	endtask
	
	virtual task write_item(eth_frame eth_frame_exp_tr ,input int o_port);
	             item_collected_port[o_port].write(eth_frame_exp_tr);
	endtask
	
	virtual function delete_preamble (ref eth_frame eth_frame_exp_tr);
	 bit [7:0]  data_payload[];
	              data_payload = eth_frame_exp_tr.frame_data;
				  foreach(data_payload[i])
                     data_payload[i] = data_payload[i+7+1];		//the preamble.data_preamble.size is fixed to 7 while do pack
	              data_payload = new[data_payload.size()-7-1-4](data_payload);
				  eth_frame_exp_tr.frame_data  = new[data_payload.size()](eth_frame_exp_tr.frame_data);
			      eth_frame_exp_tr.frame_data  = data_payload;
	endfunction
	
endclass