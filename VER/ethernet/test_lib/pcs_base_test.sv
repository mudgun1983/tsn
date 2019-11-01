// AUTHOR: wanggb@pcl.ac.cn

class pcs_base_test extends uvm_test;
 
   `uvm_component_utils(pcs_base_test)
 
    uvm_table_printer          printer;  

    pcs_tx_rx_env pcs_tx_rx_env0;
    register_config register_config0;
	topology_config topology_config0;
	cpu_config      cpu_config0;
    integer file_id;
    event tc_finish;
    event tc_fail;

    
    function new(string name="pcs_base_test" ,  uvm_component parent=null);
        super.new(name,parent);
//       env_ec         = env_static_config::type_id::create("env_ec", this); 
//       set_config_object("*","static_cfg",env_ec,0);     
         register_config0 = new();
		 set_port_stimulus_value();	// define in the global_define.sv
		 file_id=$fopen("global_test_log.txt","w+");                                               
         $fclose(file_id);
		
     endfunction : new
  
  virtual function void set_topology_config();
    topology_config0 =new();
  endfunction
  
  virtual function void set_cpu_config();
    cpu_config0 =new();
	cpu_config0.hold_cycles=15;
	cpu_config0.idle_cycles=10;
  endfunction
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
       printer = new();
       printer.knobs.depth = 6;
//=================================set cpu agent config==========================================	
	   set_cpu_config();
       uvm_config_db #(cpu_config)::set(this, "*", "cpu_config",
       cpu_config0);   
	   
//=================================set top config==========================================
       set_topology_config();
       uvm_config_db #(topology_config)::set(this, "*", "topology_config",
       topology_config0);
	   
       pcs_tx_rx_env0 = pcs_tx_rx_env::type_id::create("pcs_tx_rx_env0", this); 

//=================================set register config==========================================

       uvm_config_db #(register_config)::set(this, "*", "register_config",
       register_config0);

//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_reg_test::type_id::get());
//==================================scenario============================================         

//==================================rgm=================================================
//       set_config_int("pcs_tx_rx_env.cpu_agent0.sequencer","count",0);
//	    uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.cpu_agent0.sequencer.run_phase", 
//			        "default_sequence",
//				 reg_test_seq::type_id::get());
//====================================================================================== 

//===========//
//           //
//=== RX ====//
//           //
//===========//
//================================pcs_seq===================================================
        // uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.*.pcs_active_agent0.pcs_sequencer0.run_phase", 
			       // "default_sequence",
				// pcs_base_seq::type_id::get());
				// set_config_int("pcs_tx_rx_env0.*.pcs_active_agent0.pcs_sequencer0","count",0); 
//================================pcs_seq===================================================    

//================================mac_seq===================================================
        // uvm_config_db#(uvm_object_wrapper)::set(this,"*mac_env0.mac_rx_agent0.sequencer.run_phase", 
			        // "default_sequence",
				 // mac_user_sequence::type_id::get());
				 // set_config_int("*mac_env0.mac_rx_agent0.sequencer","count",0);
//================================pcs_seq=================================================== 
       
//================================ set_type_override =======================================
      //set_type_override_by_type(pcs_base_monitor::get_type(),pcs_monitor::get_type());         
      set_type_override_by_type(mac_rx_base_driver::get_type(),gmii_rx_driver::get_type());   
      set_type_override_by_type(mac_rx_base_monitor::get_type(),gmii_rx_monitor::get_type());  
      set_type_override_by_type(mac_tx_base_monitor::get_type(),gmii_tx_monitor::get_type());  
	  set_inst_override_by_type("*mac_env0[0]*mac_rx_agent0*", mac_rx_base_driver::get_type(), xgmii64_rx_driver::get_type() );
	  set_inst_override_by_type("*mac_env0[0]*mac_rx_agent0*", mac_rx_base_monitor::get_type(), xgmii64_rx_monitor::get_type() );
	  set_inst_override_by_type("*mac_env0[0]*mac_tx_agent0*", mac_tx_base_driver::get_type(), xgmii64_tx_driver::get_type() );
	  set_inst_override_by_type("*mac_env0[0]*mac_tx_agent0*", mac_tx_base_monitor::get_type(), xgmii64_tx_monitor::get_type() );
	  set_inst_override_by_type("*mac_env0[1]*mac_rx_agent0*", mac_rx_base_driver::get_type(), xgmii64_rx_driver::get_type() );
	  set_inst_override_by_type("*mac_env0[1]*mac_rx_agent0*", mac_rx_base_monitor::get_type(), xgmii64_rx_monitor::get_type() );
	  set_inst_override_by_type("*mac_env0[1]*mac_tx_agent0*", mac_tx_base_driver::get_type(), xgmii64_tx_driver::get_type() );
	  set_inst_override_by_type("*mac_env0[1]*mac_tx_agent0*", mac_tx_base_monitor::get_type(), xgmii64_tx_monitor::get_type() );
	  set_inst_override_by_type("*tsn_switch_model0*",  tsn_switch_model  #("expect")::get_type(), tsn_switch_expect_model::get_type() );
//================================ set_type_override =======================================
       
   endfunction : build_phase
  
  function void connect();

  endfunction
   
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
		        @this.pcs_tx_rx_env0.scb0[index].fatal_event;
		    	file_id=$fopen("global_test_log.txt","a+"); 
		    	$fwrite(file_id,$psprintf(" FATAL ERROR in scoreboard[%0d] \n",index));	
		    	$fclose(file_id);
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

  function void report_phase(uvm_phase phase);
    if(1) begin
      `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
    end
    else begin
      `uvm_error(get_type_name(), "** UVM TEST FAIL **")
    end
  endfunction

                 
endclass : pcs_base_test

