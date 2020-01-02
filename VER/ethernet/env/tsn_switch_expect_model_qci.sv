class tsn_switch_expect_model_qci extends tsn_switch_expect_model ;

//typedef tsn_switch_expect_model_qci #(file_name) this_t_2;
	
//`uvm_component_param_utils(this_t_2)
`uvm_component_utils_begin(tsn_switch_expect_model_qci) 
   `uvm_component_utils_end

int bypass;

    function new (string name ="tsn_switch_expect_model_qci",uvm_component parent);
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
				
				if(eth_frame_exp_tr_array[index].tagged_data[1].tpid==`PTP_ETYPE)
				  is_ptp[index] =1;
				else
				  is_ptp[index] =0;
				
                if(is_ptp[index])
				    ptp_item_collected_port[index].write(eth_frame_exp_tr_array[index]);
				else
                 begin			
                  if(merge_finish_array[index])				 
			    	begin
					 `uvm_info(get_type_name(),{$psprintf("input port=%0d,output port=%0d\n",index,index_o)},UVM_LOW);
					  check_etype(eth_frame_exp_tr_array[index],bypass);
					  if(bypass==0)begin
		      	      item_collected_port[index_o].write(eth_frame_exp_tr_array[index]);
					  end
					end
				 end
		      	end
		   join_none
		   end
		   wait fork;
    endtask	

    virtual task check_etype(eth_frame eth_frame_exp_tr,output int  bypass);
		int etype;
		bypass = 0;
		etype = eth_frame_exp_tr.tagged_data[eth_frame_exp_tr.tag_cnt].tpid;
		if(etype==`BYPASS_ETYPE)
		  bypass = 1;
    endtask	
endclass