class tsn_switch_monitor_model extends tsn_switch_model ;


bit  is_ptp[];	
`uvm_component_utils_begin(tsn_switch_monitor_model) 
   `uvm_component_utils_end

								//            02: not express nor preempt packet
//================================================//
//FUNCTION    : new
//================================================//
    function new (string name ="tsn_switch_monitor_model",uvm_component parent);
        super.new(name,parent);
    endfunction
	
//================================================//
//FUNCTION    : build
//================================================//
    virtual function void build ();
        super.build();
		
        is_ptp	= 	new[topology_config0.mac_number];

    endfunction : build

//================================================//
//TASK    : get_trans
//================================================//
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
		      	//classify_merge(eth_frame_exp_tr_array[index],merge_finish_array[index]);
				classify_merge(.eth_frame_exp_tr(eth_frame_exp_tr_array[index]),
							   .classify_pack_s (classify_pack_s[index]),
							   .index           (index),
							   .merge_finish_o  (merge_finish_array[index]) );
				
				//if(eth_frame_exp_tr_array[index].tagged_data[1].tpid==`PTP_ETYPE)
				if(eth_frame_exp_tr_array[index].tagged_data[eth_frame_exp_tr_array[index].tag_cnt].tpid==`PTP_ETYPE)
				  is_ptp[index] =1;
				else
				  is_ptp[index] =0;
		      	if(merge_finish_array[index])
				if(is_ptp[index])
				ptp_item_collected_port[index].write(eth_frame_exp_tr_array[index]);
				else if(merge_finish_array[index])	
		      	       item_collected_port[index].write(eth_frame_exp_tr_array[index]);
		      	end
		   join_none
		   end
		   wait fork;
    endtask		
endclass