class  full_instance_two_step_master extends full_instance_one_step_master;
 
   `uvm_component_utils(full_instance_two_step_master)
    

    function new(string name="full_instance_two_step_master" ,  uvm_component parent=null);
        super.new(name,parent);
        test_port_index= 5'd7;		
     endfunction : new
  
    
virtual function set_ptp_predefine_value();

  `PTP_CONFIG.table_size =32;
  //enable all the instance
  foreach(`PTP_CONFIG_CONTENT[key])
    `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  
  //modify the config	
  foreach(`PTP_CONFIG_CONTENT[key]) begin
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_type = 0; //master
  `PTP_CONFIG_CONTENT[key].descriptor_trans.two_step = 1; //1： two step  0: one step
  
  `PTP_CONFIG_CONTENT[key].ptp_trans.packet_type     =    ptp_item::Sync;
  `PTP_CONFIG_CONTENT[key].ptp_trans.messageType     =    `Sync;
  
  `PTP_CONFIG_CONTENT[key].eth_trans.destination_address = `PTP_NON_PEER_MULTI_DA;
  `PTP_CONFIG_CONTENT[key].sys_trans.destination =  key;
  `PTP_CONFIG_CONTENT[key].sys_trans.sub_type	= `Sync;
  end
  
  //re-pack to update the value
  foreach(`PTP_CONFIG_CONTENT[key])  
	   begin
	     `PTP_CONFIG_CONTENT[key].pack();
		 `PTP_CONFIG_CONTENT[key].desc_pack();
		 `PTP_CONFIG_CONTENT[key].packed_padding();
	   end
endfunction 
   
endclass