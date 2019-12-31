class full_instance_slave extends ptp_slave_smoke_test;
 
   `uvm_component_utils(full_instance_slave)
    bit [(`MAX_ENV_MAC_NUM-1):0] comp_fail_flag;
    function new(string name="full_instance_slave" ,  uvm_component parent=null);
        super.new(name,parent); 
        TIME_OUT_INTERVAL = 5ms;
        test_port_index	  = 5'd7;	
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);      
    auto_stop_en = 1;	
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_ptp_rcv_smoke_test::type_id::get());
//==================================scenario============================================      

  //static config         
   endfunction : build_phase

   
  task run_phase(uvm_phase phase);
    fork
	   begin
	    for(int i=0;i<topology_config0.mac_number;i++)
		 begin
		   automatic int index;
           index = i;
	       fork
	         while(1)
		       begin
		        @this.pcs_tx_rx_env0.ptp_scb0[index].fatal_event;
		    	file_id=$fopen(global_test_log,"a+"); 
		    	$fwrite(file_id,$psprintf(" FATAL ERROR in ptp_scoreboard[%0d] \n",index));	
		    	$fclose(file_id);
				if(auto_stop_en)
				  begin
				   file_id=$fopen(test_result_file,"a+"); 
		    	   $fwrite(file_id,$psprintf({get_type_name()," FATAL FAIL\n"}));	
		    	   $fclose(file_id);
				  `uvm_fatal(get_type_name(),$psprintf("FATAL ERROR ptp_scb0[%0d]",index));
				  end
		       end
		   join_none
		 end
		  wait fork ;
	   end
	   
       begin
	    for(int i=0;i<topology_config0.mac_number;i++)
		 begin
		   automatic int index;
           index = i;
	       fork
	         while(1)
		       begin
		        @this.pcs_tx_rx_env0.ptp_scb0[index].comp_success;
				comp_success_count[index]++;
		    	file_id=$fopen(global_test_log,"a+"); 
		    	$fwrite(file_id,$psprintf(" SUCCESS=%0d in ptp_scoreboard[%0d] \n",comp_success_count[index],index));	
		    	$fclose(file_id);
		       end
		   join_none
		 end
		  wait fork ;
	   end	   
	
	   begin
       phase.phase_done.set_drain_time(this, 50000);
       #TIME_OUT_INTERVAL;
	   for(int i=2;i<8;i++)
		 begin
		   automatic int index;
           index = i;
		    if(comp_success_count[index]==0)
			  comp_fail_flag[index] = 1;
		 end
		 
		if(comp_success_count[18]==0)
			  comp_fail_flag[18] = 1;
	   if(comp_fail_flag==0)
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," PASS\n"}));	
		   $fclose(file_id);
		 end
	   else
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," FAIL\n"}));	
		   $fclose(file_id);
		 end
       $finish;      
	   end
	   
	join
   endtask:run_phase
   
virtual function set_port_stimulus_value();
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
endfunction
  
virtual function set_ptp_predefine_value();

  `PTP_CONFIG.table_size =32;
  `PTP_CONFIG.slave_pid = test_port_index;
  //disable all the instance
  foreach(`PTP_CONFIG_CONTENT[key])
    `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  
  //modify the config	
  foreach(`PTP_CONFIG_CONTENT[key])begin
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_type = 1; //slave
  `PTP_CONFIG_CONTENT[key].descriptor_trans.two_step = 0; //only one step 
  
  `PTP_CONFIG_CONTENT[key].ptp_trans.packet_type     =    ptp_item::Pdelay_Req;
  `PTP_CONFIG_CONTENT[key].ptp_trans.messageType     =    `Pdelay_Req;
  
  `PTP_CONFIG_CONTENT[key].eth_trans.destination_address = `PTP_PEER_MULTI_DA;
  `PTP_CONFIG_CONTENT[key].eth_trans.source_address = key;
  `PTP_CONFIG_CONTENT[key].sys_trans.destination =  key;
  `PTP_CONFIG_CONTENT[key].sys_trans.sub_type	= `Pdelay_Req;
  end
  //re-pack to update the value
  foreach(`PTP_CONFIG_CONTENT[key])  
	   begin
	     `PTP_CONFIG_CONTENT[key].pack();
		 `PTP_CONFIG_CONTENT[key].desc_pack();
		 `PTP_CONFIG_CONTENT[key].packed_padding();
	   end
endfunction 

virtual function set_i_epp_predefine_value();
  `PHY_PORT_TABLE.table_size =1;
  `PHY_PORT_TABLE_CONTENT[0].table_key_t = test_port_index;
  `PHY_PORT_TABLE_CONTENT[0].table_t = {2'd0,48'd0,48'd1,5'd2,1'b1,1'b0,5'd0};
  
  `RX_PTP_FORWARD_TABLE.table_size =4;
  `RX_PTP_FORWARD_TABLE.table_index = new[`RX_PTP_FORWARD_TABLE.table_size];
   for(int i=0;i<`RX_PTP_FORWARD_TABLE.table_size;i++)
    `RX_PTP_FORWARD_TABLE.table_index[i] = new(); 
	
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_key_t.message_type = `Pdelay_Req;
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_key_t.phy_port = test_port_index;
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_t.fw_destination = 2'b10;

  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_key_t.message_type = `Sync;
  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_key_t.phy_port = test_port_index;
  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_t.fw_destination = 2'b10;
  
  `RX_PTP_FORWARD_TABLE_CONTENT[2].table_key_t.message_type = `Follow_Up;
  `RX_PTP_FORWARD_TABLE_CONTENT[2].table_key_t.phy_port = test_port_index;
  `RX_PTP_FORWARD_TABLE_CONTENT[2].table_t.fw_destination = 2'b10;
  
  `RX_PTP_FORWARD_TABLE_CONTENT[3].table_key_t.message_type = `Pdelay_Resp;
  `RX_PTP_FORWARD_TABLE_CONTENT[3].table_key_t.phy_port = test_port_index;
  `RX_PTP_FORWARD_TABLE_CONTENT[3].table_t.fw_destination = 2'b10;
  
  //----------------------------------------------------------------------------------------//
  `O_PHY_PORT_PRO_TABLE.table_size=`MAX_PORT_NUM+1;
  `O_PHY_PORT_PRO_TABLE.table_index = new[`O_PHY_PORT_PRO_TABLE.table_size];
  for(int i=0;i<`O_PHY_PORT_PRO_TABLE.table_size;i++)
    `O_PHY_PORT_PRO_TABLE.table_index[i] = new();

  foreach(`O_PHY_PORT_PRO_TABLE_CONTENT[key])begin	
  `O_PHY_PORT_PRO_TABLE_CONTENT[key].table_key_t = key;
  `O_PHY_PORT_PRO_TABLE_CONTENT[key].table_t = {111'd0,1'b1,1'b0,5'd0};
  end
  
  `O_PHY_PORT_PRO_TABLE_CONTENT[`MAX_PORT_NUM].table_key_t = 'd30;
  `O_PHY_PORT_PRO_TABLE_CONTENT[`MAX_PORT_NUM].table_t = {111'd0,1'b1,1'b0,5'd0};
endfunction  

virtual function set_port_ptp_instance_mapping();
  foreach(port_ptp_instance_mapping_table[key])
     port_ptp_instance_mapping_table[key] = key;
  
  port_ptp_instance_mapping_table[18] = 30; 
endfunction
   
endclass