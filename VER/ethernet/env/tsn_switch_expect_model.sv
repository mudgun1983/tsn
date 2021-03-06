class tsn_switch_expect_model extends tsn_switch_model ;

//typedef tsn_switch_expect_model #(file_name) this_t_2;
	
//`uvm_component_param_utils(this_t_2)
`uvm_component_utils_begin(tsn_switch_expect_model) 
   `uvm_component_utils_end

 parameter HASH_SIZE = 2**12;

  int l2_table[];
  semaphore sem;
  int hash_key[];
  bit  is_ptp[];
  
    function new (string name ="tsn_switch_expect_model",uvm_component parent);
        super.new(name,parent);
		sem = new(1);
    endfunction
	
//================================================//
//FUNCTION    : build
//================================================//
    virtual function void build ();
        super.build();
		
		hash_key = new[topology_config0.mac_number];
		l2_table = new[HASH_SIZE];
		is_ptp	= 	new[topology_config0.mac_number];
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
				
				//if(eth_frame_exp_tr_array[index].tagged_data[1].tpid==`PTP_ETYPE)
				if(eth_frame_exp_tr_array[index].tagged_data[eth_frame_exp_tr_array[index].tag_cnt].tpid==`PTP_ETYPE)
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
		      	      item_collected_port[index_o].write(eth_frame_exp_tr_array[index]);
					end
				 end
		      	end
		   join_none
		   end
		   wait fork;
    endtask	
	
	
	 virtual task hash_cal_store_l2_table(eth_frame eth_frame_exp_tr,input int index);
	  bit[47:0] sa;
	  bit[11:0] vlan;
	  
	  sa = eth_frame_exp_tr.source_address;
	  if(eth_frame_exp_tr.tag_cnt==0)
	  vlan = 0;
	  else
	  vlan = {eth_frame_exp_tr.tagged_data[0].data[1][3:0],eth_frame_exp_tr.tagged_data[0].data[0]};
	  hash_key[index] = do_crc12({sa,vlan},12'hfff);
	  `uvm_info(get_type_name(),{$psprintf("sa=%0h,vlan=%0h,hash_key_i[%0d]=%0h\n",sa,vlan,index,hash_key[index])},UVM_LOW);
	  sem.get(1);
	  l2_table[hash_key[index]]=index;
	  sem.put(1);
	endtask
    
	virtual task hash_cal_read_l2_table(eth_frame eth_frame_exp_tr,input int index_i,output int index_o);
	  bit[47:0] da;
	  bit[11:0] vlan;
	  
	  da = eth_frame_exp_tr.destination_address;
	  if(eth_frame_exp_tr.tag_cnt==0)
	  vlan = 0;
	  else
	  vlan = {eth_frame_exp_tr.tagged_data[0].data[1][3:0],eth_frame_exp_tr.tagged_data[0].data[0]};;
	  hash_key[index_i] = do_crc12({da,vlan},12'hfff);
	  `uvm_info(get_type_name(),{$psprintf("da=%0h,vlan=%0h,hash_key_i[%0d]=%0h\n",da,vlan,index_i,hash_key[index_i])},UVM_LOW);
	  sem.get(1);
	  index_o= l2_table[hash_key[index_i]];
	  sem.put(1);
	endtask
	
endclass