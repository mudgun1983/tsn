class  full_instance_one_step_master extends ptp_smoke_test;
 
   `uvm_component_utils(full_instance_one_step_master)
    
	ptp_reg_seq                  ptp_reg_seq0;
    phy_port_table_reg_seq       phy_port_table_reg_seq0;
    rx_ptp_forward_table_reg_seq rx_ptp_forward_table_reg_seq0;
    o_phy_port_pro_table_reg_seq o_phy_port_pro_table_reg_seq0;

    bit [(`MAX_ENV_MAC_NUM-1):0] comp_fail_flag;
    function new(string name="full_instance_one_step_master" ,  uvm_component parent=null);
        super.new(name,parent);
        test_port_index= 5'd7;	
        TIME_OUT_INTERVAL = 5ms;		
		one_two_step=0;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);      
    auto_stop_en = 1;	
//==================================scenario============================================       
        uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			             "default_sequence",
	       		    	 scenario_reg_test::type_id::get());
//==================================scenario============================================      

  //static config         
  ptp_reg_seq0                      =ptp_reg_seq                 ::type_id::create("ptp_reg_seq0", this); 
  phy_port_table_reg_seq0           =phy_port_table_reg_seq      ::type_id::create("phy_port_table_reg_seq0", this); 
  rx_ptp_forward_table_reg_seq0     =rx_ptp_forward_table_reg_seq::type_id::create("rx_ptp_forward_table_reg_seq0", this); 
  o_phy_port_pro_table_reg_seq0     =o_phy_port_pro_table_reg_seq::type_id::create("o_phy_port_pro_table_reg_seq0", this); 
   endfunction : build_phase

   task configure_phase( uvm_phase phase);
     phase.raise_objection( this );
     //program_control_registers_seq.start( m_sequencer );
	 #10us;
	 ptp_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 phy_port_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 rx_ptp_forward_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 o_phy_port_pro_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 
     phase.drop_objection( this );
  endtask

  task run_phase(uvm_phase phase);
     phase.raise_objection( this );
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
		    	$fwrite(file_id,$psprintf(" FATAL ERROR in scoreboard[%0d] \n",index));	
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
		    	$fwrite(file_id,$psprintf(" SUCCESS=%0d in scoreboard[%0d] \n",comp_success_count[index],index));	
		    	$fclose(file_id);
		       end
		   join_none
		 end
		  wait fork ;
	   end
	   
	   begin
       phase.phase_done.set_drain_time(this, 50000);
       #TIME_OUT_INTERVAL;
	   //#100us;
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
		   $fwrite(file_id,$psprintf("FAIL CODE: comp_fail_flag=%0b \n",comp_fail_flag));	
		   $fclose(file_id);
		 end
       $finish;      
	   end
	   
	join
   endtask:run_phase
   
virtual function set_ptp_predefine_value();
  `PTP_CONFIG.table_size =32;
  `PTP_CONFIG.src_mac = 48'h8000_0000_0000;
  `PTP_CONFIG.two_step = 0;//1： two step  0: one step
  //enable all the instance
  foreach(`PTP_CONFIG_CONTENT[key])
    `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  
  //modify the config	
  foreach(`PTP_CONFIG_CONTENT[key]) begin
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_type = 0; //0:master
  `PTP_CONFIG_CONTENT[key].descriptor_trans.two_step = one_two_step; //1： two step  0: one step
  `PTP_CONFIG_CONTENT[key].descriptor_trans.send_period =2 ;// scale is 100us
  
  `PTP_CONFIG_CONTENT[key].ptp_trans.packet_type     =    ptp_item::Sync;
  `PTP_CONFIG_CONTENT[key].ptp_trans.messageType     =    `Sync;
  `PTP_CONFIG_CONTENT[key].ptp_trans.flagField[9]     =    one_two_step;
  
  `PTP_CONFIG_CONTENT[key].eth_trans.destination_address = `PTP_NON_PEER_MULTI_DA;
  `PTP_CONFIG_CONTENT[key].eth_trans.source_address = key;
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

virtual function set_i_epp_predefine_value();
//master_node
  `PHY_PORT_TABLE.table_size =`MAX_PORT_NUM+1;
  `PHY_PORT_TABLE.table_index = new[`PHY_PORT_TABLE.table_size];
  for(int i=0;i<`PHY_PORT_TABLE.table_size;i++)
    `PHY_PORT_TABLE.table_index[i] = new();
  foreach(`PHY_PORT_TABLE_CONTENT[key])begin
  `PHY_PORT_TABLE_CONTENT[key].table_key_t = key;
  `PHY_PORT_TABLE_CONTENT[key].table_t = {2'd0,48'd0,48'd1,key[4:0],1'b1,1'b0,5'd0};
  end
  
  `PHY_PORT_TABLE_CONTENT[`MAX_PORT_NUM].table_key_t = 'd30;
  `PHY_PORT_TABLE_CONTENT[`MAX_PORT_NUM].table_t = {2'd0,48'd0,48'd1,5'd30,1'b1,1'b0,5'd0};
  //----------------------------------------------------------------------------------------//
  `RX_PTP_FORWARD_TABLE.table_size =`MAX_PORT_NUM+1;
  `RX_PTP_FORWARD_TABLE.table_index = new[`RX_PTP_FORWARD_TABLE.table_size];
  for(int i=0;i<`RX_PTP_FORWARD_TABLE.table_size;i++)
    `RX_PTP_FORWARD_TABLE.table_index[i] = new();

  foreach(`RX_PTP_FORWARD_TABLE_CONTENT[key])begin
  `RX_PTP_FORWARD_TABLE_CONTENT[key].table_key_t.message_type = `Pdelay_Req;
  `RX_PTP_FORWARD_TABLE_CONTENT[key].table_key_t.phy_port = key;
  `RX_PTP_FORWARD_TABLE_CONTENT[key].table_t.fw_destination = 2'b10;
  end

  `RX_PTP_FORWARD_TABLE_CONTENT[`MAX_PORT_NUM].table_key_t.message_type = `Pdelay_Req;
  `RX_PTP_FORWARD_TABLE_CONTENT[`MAX_PORT_NUM].table_key_t.phy_port = 'd30;
  `RX_PTP_FORWARD_TABLE_CONTENT[`MAX_PORT_NUM].table_t.fw_destination = 2'b10;
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
