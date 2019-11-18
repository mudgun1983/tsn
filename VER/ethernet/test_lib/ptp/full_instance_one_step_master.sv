class  full_instance_one_step_master extends ptp_smoke_test;
 
   `uvm_component_utils(full_instance_one_step_master)
    
	ptp_reg_seq                  ptp_reg_seq0;
    phy_port_table_reg_seq       phy_port_table_reg_seq0;
    rx_ptp_forward_table_reg_seq rx_ptp_forward_table_reg_seq0;
    o_phy_port_pro_table_reg_seq o_phy_port_pro_table_reg_seq0;

    bit [15:0] comp_fail_flag;
    function new(string name="full_instance_one_step_master" ,  uvm_component parent=null);
        super.new(name,parent);
        test_port_index= 5'd7;		
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
       #5ms;
	   //#100us;
	   for(int i=0;i<9;i++)
		 begin
		   automatic int index;
           index = i;
		    if(comp_success_count[index]==0)
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

  `PTP_CONFIG.table_size =32;
  //enable all the instance
  foreach(`PTP_CONFIG_CONTENT[key])
    `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  
  //modify the config	
  foreach(`PTP_CONFIG_CONTENT[key]) begin
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_type = 0; //master
  `PTP_CONFIG_CONTENT[key].descriptor_trans.two_step = 0; //1： two step  0: one step
  
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