class  ptp_master_slave_base_test extends ptp_smoke_test;
  
   `uvm_component_utils(ptp_master_slave_base_test)
    virtual dut_if dut_if0;
	int     peek_value;
	int     peek_value_1;
	event   monitor_event0;
	int     monitor_event0_cnt;
	event   monitor_event1;
	int     monitor_event1_cnt;
	register_config sub_reg_config;
	ptp_reg_seq                  ptp_reg_seq0;
    phy_port_table_reg_seq       phy_port_table_reg_seq0;
    rx_ptp_forward_table_reg_seq rx_ptp_forward_table_reg_seq0;
    o_phy_port_pro_table_reg_seq o_phy_port_pro_table_reg_seq0;
    
	sub_ptp_reg_seq                  sub_ptp_reg_seq0;
    sub_phy_port_table_reg_seq       sub_phy_port_table_reg_seq0;
    sub_rx_ptp_forward_table_reg_seq sub_rx_ptp_forward_table_reg_seq0;
    sub_o_phy_port_pro_table_reg_seq sub_o_phy_port_pro_table_reg_seq0;
	
    bit [15:0] comp_fail_flag;
	bit        one_two_step;
	bit [4:0]  test_port_index_1;
    function new(string name="ptp_master_slave_base_test" ,  uvm_component parent=null);
        super.new(name,parent);
        test_port_index= 5'd6;
        test_port_index_1 =5'd7;		
		one_two_step = 1;
        sub_reg_config = new();
		TIME_OUT_INTERVAL = 1ms;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);      
    auto_stop_en = 1;	
	//invoke static config
	    set_sub_i_epp_predefine_value();
		set_sub_ptp_predefine_value();

//=================================get dut if connected with DUT================================
        if( !uvm_config_db #(virtual dut_if )::get( this , "" , "dut_vif" ,dut_if0 ) ) begin
           `uvm_fatal(get_type_name(),"=============dut_if==========");
		end
		
//=================================set register config==========================================
       uvm_config_db #(register_config)::set(this, "*", "sub_register_config",
       sub_reg_config);
	   
	   uvm_config_db #(register_config)::set(this, "*", "sub_register_config",
       sub_reg_config);
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
  
  sub_ptp_reg_seq0                      = sub_ptp_reg_seq                 ::type_id::create("sub_ptp_reg_seq0", this); 
  sub_phy_port_table_reg_seq0           = sub_phy_port_table_reg_seq      ::type_id::create("sub_phy_port_table_reg_seq0", this); 
  sub_rx_ptp_forward_table_reg_seq0     = sub_rx_ptp_forward_table_reg_seq::type_id::create("sub_rx_ptp_forward_table_reg_seq0", this); 
  sub_o_phy_port_pro_table_reg_seq0     = sub_o_phy_port_pro_table_reg_seq::type_id::create("sub_o_phy_port_pro_table_reg_seq0", this); 
   endfunction : build_phase

   task configure_phase( uvm_phase phase);
     phase.raise_objection( this );
     //program_control_registers_seq.start( m_sequencer );
	 fork 
	 begin
	 #10us;
	 ptp_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 phy_port_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 rx_ptp_forward_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 o_phy_port_pro_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 
	 sub_ptp_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 sub_phy_port_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 sub_rx_ptp_forward_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 sub_o_phy_port_pro_table_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 end
	 
	  begin
	  #1us;
	  `ifdef DUAL_DUT
	    //force dut_if0.sys_reset = 1;
		dut_if0.assert_sys_reset();
	  #50us;
	    //release dut_if0.sys_reset;
		dut_if0.de_assert_sys_reset();
	  `endif
	  end
	 join
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
	     while(1)begin
		 if(monitor_event0_cnt!=0)
		   begin
		     //$display("test00");
		     @monitor_event1;
		   end
		 //$display("test01");  
	     dut_if0.peek_ptp_slave_offset(peek_value);
		 if(peek_value!=0)
		  begin
		    -> monitor_event0;
			monitor_event0_cnt++;
		    file_id=$fopen(global_test_log,"a+"); 
		    $fwrite(file_id,$psprintf("T=%0t,PRE peek_ptp_slave_offset=%0h monitor_cnt=%0d\n",$time,peek_value,monitor_event0_cnt));	
		    $fclose(file_id);
		  end
         end		  
	   end
	   
	   begin
	    while(1)begin
	    @monitor_event0;
	    while(1)begin
		 //$display("test10");
		
		 // $display("test11");  
		 dut_if0.peek_ptp_slave_offset(peek_value_1);
		 if(peek_value_1==0)
		  begin
		    -> monitor_event1;
			monitor_event1_cnt++;
		    file_id=$fopen(global_test_log,"a+"); 
		    $fwrite(file_id,$psprintf("T=%0t,POST peek_ptp_slave_offset=%0h monitor_cnt=%0d\n",$time,peek_value_1,monitor_event1_cnt));	
		    $fclose(file_id);
			break;
		  end
	    end
		end
	   end
	   
	   begin
       phase.phase_done.set_drain_time(this, 50000);
       #TIME_OUT_INTERVAL;
	   //#100us;
	   for(int i=0;i<1;i++)
		 begin
		   automatic int index;
           index = i;
		    if(~(monitor_event1_cnt==1 && monitor_event0_cnt==1))
			  comp_fail_flag[index] = 1;
		 end
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
   
virtual function set_ptp_predefine_value();
//master_node
  `PTP_CONFIG.table_size =2;
  `PTP_CONFIG.src_mac = 48'h8000_0000_0000;
  `PTP_CONFIG.two_step = one_two_step;//1： two step  0: one step
  //enable all the instance
  foreach(`PTP_CONFIG_CONTENT[key])
    `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  
  //modify the config	
  foreach(`PTP_CONFIG_CONTENT[key]) begin
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_type = 0; //0:master
  `PTP_CONFIG_CONTENT[key].descriptor_trans.two_step = one_two_step; //1： two step  0: one step
  
  `PTP_CONFIG_CONTENT[key].ptp_trans.packet_type     =    ptp_item::Sync;
  `PTP_CONFIG_CONTENT[key].ptp_trans.messageType     =    `Sync;
  `PTP_CONFIG_CONTENT[key].ptp_trans.flagField[9]     =    one_two_step;
  
  `PTP_CONFIG_CONTENT[key].eth_trans.destination_address = `PTP_NON_PEER_MULTI_DA;
  `PTP_CONFIG_CONTENT[key].sys_trans.destination =  test_port_index;
  `PTP_CONFIG_CONTENT[key].sys_trans.sub_type	= `Sync;
  end
  
  //for generate script
  `PTP_CONFIG_CONTENT[0].sys_trans.destination =  test_port_index;
  `PTP_CONFIG_CONTENT[1].sys_trans.destination =  test_port_index_1;
  //re-pack to update the value
  foreach(`PTP_CONFIG_CONTENT[key])  
	   begin
	     `PTP_CONFIG_CONTENT[key].pack();
		 `PTP_CONFIG_CONTENT[key].desc_pack();
		 `PTP_CONFIG_CONTENT[key].packed_padding();
	   end
endfunction 

virtual function set_sub_ptp_predefine_value();
//slave_node
  `SUB_PTP_CONFIG.table_size =1;
  `SUB_PTP_CONFIG.slave_pid = test_port_index;
  `SUB_PTP_CONFIG.two_step = one_two_step;//1： two step  0: one step
  //enable all the instance
  foreach(`SUB_PTP_CONFIG_CONTENT[key])
    `SUB_PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  
  //modify the config	
  foreach(`SUB_PTP_CONFIG_CONTENT[key]) begin
  `SUB_PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  `SUB_PTP_CONFIG_CONTENT[key].descriptor_trans.inst_type = 1; //1:slave
  `SUB_PTP_CONFIG_CONTENT[key].descriptor_trans.two_step = one_two_step; //1： two step  0: one step
  
  `SUB_PTP_CONFIG_CONTENT[key].ptp_trans.packet_type     =    ptp_item::Pdelay_Req;
  `SUB_PTP_CONFIG_CONTENT[key].ptp_trans.messageType     =    `Pdelay_Req;
  `SUB_PTP_CONFIG_CONTENT[key].ptp_trans.flagField[9]       =    one_two_step;
  `SUB_PTP_CONFIG_CONTENT[key].ptp_trans.flagField[8]       =    1;//1:slave,0:master
  `SUB_PTP_CONFIG_CONTENT[key].eth_trans.destination_address = `PTP_PEER_MULTI_DA;
  `SUB_PTP_CONFIG_CONTENT[key].sys_trans.destination =  test_port_index;
  `SUB_PTP_CONFIG_CONTENT[key].sys_trans.sub_type	= `Pdelay_Req;
  end
  
  //re-pack to update the value
  foreach(`SUB_PTP_CONFIG_CONTENT[key])  
	   begin
	     `SUB_PTP_CONFIG_CONTENT[key].pack();
		 `SUB_PTP_CONFIG_CONTENT[key].desc_pack();
		 `SUB_PTP_CONFIG_CONTENT[key].packed_padding();
	   end	
endfunction

virtual function set_i_epp_predefine_value();
//master_node
  `PHY_PORT_TABLE.table_size =2;
  `PHY_PORT_TABLE_CONTENT[0].table_key_t = test_port_index;
  `PHY_PORT_TABLE_CONTENT[0].table_t = {2'd0,48'd0,48'd1,test_port_index[4:0],1'b1,1'b0,5'd0};
  `PHY_PORT_TABLE_CONTENT[1].table_key_t = test_port_index_1;
  `PHY_PORT_TABLE_CONTENT[1].table_t = {2'd0,48'd0,48'd1,test_port_index_1[4:0],1'b1,1'b0,5'd0};
  
  `RX_PTP_FORWARD_TABLE.table_size =2;
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_key_t.message_type = `Pdelay_Req;
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_key_t.phy_port = test_port_index;
  `RX_PTP_FORWARD_TABLE_CONTENT[0].table_t.fw_destination = 2'b10;
  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_key_t.message_type = `Pdelay_Req;
  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_key_t.phy_port = test_port_index_1;
  `RX_PTP_FORWARD_TABLE_CONTENT[1].table_t.fw_destination = 2'b10;
  

  `O_PHY_PORT_PRO_TABLE.table_size=2;
  `O_PHY_PORT_PRO_TABLE.table_index = new[`O_PHY_PORT_PRO_TABLE.table_size];
  for(int i=0;i<`O_PHY_PORT_PRO_TABLE.table_size;i++)
    `O_PHY_PORT_PRO_TABLE.table_index[i] = new(); 
  `O_PHY_PORT_PRO_TABLE_CONTENT[0].table_key_t = test_port_index;
  `O_PHY_PORT_PRO_TABLE_CONTENT[0].table_t = {111'd0,1'b1,1'b0,5'd0};
  `O_PHY_PORT_PRO_TABLE_CONTENT[1].table_key_t = test_port_index_1;
  `O_PHY_PORT_PRO_TABLE_CONTENT[1].table_t = {111'd0,1'b1,1'b0,5'd0};
endfunction     

virtual function set_sub_i_epp_predefine_value();
//slave_node 
  `SUB_PHY_PORT_TABLE.table_size =1;
  `SUB_PHY_PORT_TABLE_CONTENT[0].table_key_t = test_port_index;
  `SUB_PHY_PORT_TABLE_CONTENT[0].table_t = {2'd0,48'd0,48'd1,test_port_index[4:0],1'b1,1'b0,5'd0};
  
  `SUB_RX_PTP_FORWARD_TABLE.table_size =5;
  `SUB_RX_PTP_FORWARD_TABLE.table_index = new[`SUB_RX_PTP_FORWARD_TABLE.table_size];
   for(int i=0;i<`SUB_RX_PTP_FORWARD_TABLE.table_size;i++)
    `SUB_RX_PTP_FORWARD_TABLE.table_index[i] = new(); 
	
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[0].table_key_t.message_type = `Pdelay_Req;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[0].table_key_t.phy_port = test_port_index;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[0].table_t.fw_destination = 2'b10;

  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[1].table_key_t.message_type = `Sync;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[1].table_key_t.phy_port = test_port_index;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[1].table_t.fw_destination = 2'b10;
  
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[2].table_key_t.message_type = `Follow_Up;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[2].table_key_t.phy_port = test_port_index;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[2].table_t.fw_destination = 2'b10;
  
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[3].table_key_t.message_type = `Pdelay_Resp;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[3].table_key_t.phy_port = test_port_index;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[3].table_t.fw_destination = 2'b10;
  
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[4].table_key_t.message_type = `Pdelay_Resp_Follow_Up;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[4].table_key_t.phy_port = test_port_index;
  `SUB_RX_PTP_FORWARD_TABLE_CONTENT[4].table_t.fw_destination = 2'b10;
  
  `SUB_O_PHY_PORT_PRO_TABLE.table_size=1;
  `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[0].table_key_t = test_port_index;
  `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[0].table_t = {111'd0,1'b1,1'b0,5'd0}; 
endfunction
endclass