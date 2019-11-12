class ptp_slave_smoke_test extends pcs_base_test;
 
   `uvm_component_utils(ptp_slave_smoke_test)
 

    function new(string name="ptp_slave_smoke_test" ,  uvm_component parent=null);
        super.new(name,parent);  
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);      
    auto_stop_en = 0;	
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_ptp_rcv_smoke_test::type_id::get());
//==================================scenario============================================      

  //static config         
   endfunction : build_phase
   
   function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration 
   
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
		    	file_id=$fopen("global_test_log.txt","a+"); 
		    	$fwrite(file_id,$psprintf(" FATAL ERROR in scoreboard[%0d] \n",index));	
		    	$fclose(file_id);
				if(auto_stop_en)
				  `uvm_fatal(get_type_name(),$psprintf("FATAL ERROR ptp_scb0[%0d]",index));
		       end
		   join_none
		 end
		  wait fork ;
	   end
			   
	
	   begin
       phase.phase_done.set_drain_time(this, 50000);
       #20ms;
       $stop;      
	   end
	   
	join
   endtask:run_phase
   
virtual function set_port_stimulus_value();
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
  
// port_stimulus_s[0].port_en = 1;
// port_stimulus_s[1].port_en = 1;
// port_stimulus_s[2].port_en = 1;
// port_stimulus_s[3].port_en = 1;
// port_stimulus_s[4].port_en = 1;
// port_stimulus_s[5].port_en = 1;
// port_stimulus_s[6].port_en = 1;
// port_stimulus_s[7].port_en = 1;
// port_stimulus_s[8].port_en = 1;
// port_stimulus_s[9].port_en = 1;
// port_stimulus_s[10].port_en = 1;
// port_stimulus_s[11].port_en = 1;
// port_stimulus_s[12].port_en = 1;
// port_stimulus_s[13].port_en = 1;
// port_stimulus_s[14].port_en = 1;
// port_stimulus_s[15].port_en = 1;
// port_stimulus_s[16].port_en = 1;
// port_stimulus_s[17].port_en = 1;
// port_stimulus_s[18].port_en = 1;
// port_stimulus_s[19].port_en = 1;

//port_stimulus_s[0].packet_count = 1;  //0: forever
//port_stimulus_s[1].packet_count = 1;
//port_stimulus_s[2].packet_count = 1; //comment means no limit, it will generate packet forever
//port_stimulus_s[3].packet_count = 1;
//port_stimulus_s[4].packet_count = 1;
//port_stimulus_s[5].packet_count = 1;
//port_stimulus_s[6].packet_count = 1;
//port_stimulus_s[7].packet_count = 1;
//port_stimulus_s[8].packet_count = 1;
//port_stimulus_s[9].packet_count = 1;
//port_stimulus_s[10].packet_count = 1;
//port_stimulus_s[11].packet_count = 1;
//port_stimulus_s[12].packet_count = 1;
//port_stimulus_s[13].packet_count = 1;
//port_stimulus_s[14].packet_count = 1;
//port_stimulus_s[15].packet_count = 1;
//port_stimulus_s[16].packet_count = 1;
//port_stimulus_s[17].packet_count = 1;
//port_stimulus_s[18].packet_count = 1;
//port_stimulus_s[19].packet_count = 1;



// port_stimulus_s[0].da_index =   0;//(19- 0);   
// port_stimulus_s[1].da_index =   1;//(19- 1);
// port_stimulus_s[2].da_index =   `PTP_PEER_MULTI_DA;//(19- 2);  
// port_stimulus_s[3].da_index =   3;//(19- 3);
// port_stimulus_s[4].da_index =   4;//(19- 4);
// port_stimulus_s[5].da_index =   5;//(19- 5);
// port_stimulus_s[6].da_index =   `PTP_PEER_MULTI_DA;//6;//(19- 6);
// port_stimulus_s[7].da_index =   7;//(19- 7);
// port_stimulus_s[8].da_index =   8;//(19- 8);
// port_stimulus_s[9].da_index =   9;//(19- 9);
// port_stimulus_s[10].da_index = 10;//(19-10);
// port_stimulus_s[11].da_index = 11;//(19-11);
// port_stimulus_s[12].da_index = 12;//(19-12);
// port_stimulus_s[13].da_index = 13;//(19-13);
// port_stimulus_s[14].da_index = 14;//(19-14);
// port_stimulus_s[15].da_index = 15;//(19-15);
// port_stimulus_s[16].da_index = 16;//(19-16);
// port_stimulus_s[17].da_index = 17;//(19-17);
// port_stimulus_s[18].da_index = 18;//(19-18);
// port_stimulus_s[19].da_index = 19;//(19-19);
endfunction         

virtual function set_ptp_predefine_value();

  `PTP_CONFIG.table_size =1;
  //disable all the instance
  foreach(`PTP_CONFIG_CONTENT[key])
    `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 0;
  
  //modify the config	
  `PTP_CONFIG_CONTENT[0].descriptor_trans.inst_valid = 1;
  `PTP_CONFIG_CONTENT[0].descriptor_trans.inst_type = 1; //slave
  
  `PTP_CONFIG_CONTENT[0].ptp_trans.packet_type     =    ptp_item::Pdelay_Req;
  `PTP_CONFIG_CONTENT[0].ptp_trans.messageType     =    `Pdelay_Req;
  
  `PTP_CONFIG_CONTENT[0].eth_trans.destination_address = `PTP_PEER_MULTI_DA;
  `PTP_CONFIG_CONTENT[0].sys_trans.destination =  7;
  `PTP_CONFIG_CONTENT[0].sys_trans.sub_type	= `Pdelay_Req;
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
  `PHY_PORT_TABLE_CONTENT[0].table_key_t = 7;
  `PHY_PORT_TABLE_CONTENT[0].table_t = {2'd0,48'd0,48'd1,5'd2,1'b1,1'b0,5'd0};
  
  `RX_PTP_FORWARD_TABLE.table_size =4;
  `RX_PTP_FORWARD_TABLE.table_index = new[`RX_PTP_FORWARD_TABLE.table_size];
   for(int i=0;i<`RX_PTP_FORWARD_TABLE.table_size;i++)
    `RX_PTP_FORWARD_TABLE.table_index[i] = new(); 
	
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_key_t.message_type = `Pdelay_Req;
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_key_t.phy_port = 7;
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_t.fw_destination = 2'b10;

  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_key_t.message_type = `Sync;
  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_key_t.phy_port = 7;
  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_t.fw_destination = 2'b10;
  
  `RX_PTP_FORWARD_TABLE_CONTENT[2].table_key_t.message_type = `Follow_Up;
  `RX_PTP_FORWARD_TABLE_CONTENT[2].table_key_t.phy_port = 7;
  `RX_PTP_FORWARD_TABLE_CONTENT[2].table_t.fw_destination = 2'b10;
  
  `RX_PTP_FORWARD_TABLE_CONTENT[3].table_key_t.message_type = `Pdelay_Resp;
  `RX_PTP_FORWARD_TABLE_CONTENT[3].table_key_t.phy_port = 7;
  `RX_PTP_FORWARD_TABLE_CONTENT[3].table_t.fw_destination = 2'b10;
  
  `O_PHY_PORT_PRO_TABLE.table_size=1;
  `O_PHY_PORT_PRO_TABLE_CONTENT[0].table_key_t = 7;
  `O_PHY_PORT_PRO_TABLE_CONTENT[0].table_t = {112'd0,1'b1,5'd0};
endfunction  
   
endclass