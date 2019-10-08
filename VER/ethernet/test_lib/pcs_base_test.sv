// AUTHOR: wanggb@pcl.ac.cn

class pcs_base_test extends uvm_test;
 
   `uvm_component_utils(pcs_base_test)
 
    uvm_table_printer          printer;  

    pcs_tx_rx_env pcs_tx_rx_env0;
    
    integer file_id;
    event tc_finish;
    event tc_fail;

    
    function new(string name="pcs_base_test" ,  uvm_component parent=null);
        super.new(name,parent);
//       env_ec         = env_static_config::type_id::create("env_ec", this); 
//       set_config_object("*","static_cfg",env_ec,0);     
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
       printer = new();
       printer.knobs.depth = 6;
            
       pcs_tx_rx_env0 = pcs_tx_rx_env::type_id::create("pcs_tx_rx_env0", this); 
 
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_reg_test::type_id::get());
//==================================scenario============================================         

//==================================rgm=================================================
       //set_config_string("aps_tb0.rgm_model_tb0.rgm_seqr","default_sequence","rgm_adapter_seq");
       set_config_int("pcs_tx_rx_env.cpu_agent0.sequencer","count",0);
       //set_config_int("aps_tb0.rgm_model_tb0.rgm_seqr","count",0);
//====================================================================================== 

//===========//
//           //
//=== RX ====//
//           //
//===========//
//================================pcs_seq===================================================
        uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.*.pcs_active_agent0.pcs_sequencer0.run_phase", 
			       "default_sequence",
				pcs_base_seq::type_id::get());
				set_config_int("pcs_tx_rx_env0.*.pcs_active_agent0.pcs_sequencer0","count",0); 
//================================pcs_seq===================================================    

//================================mac_seq===================================================
        // uvm_config_db#(uvm_object_wrapper)::set(this,"*mac_env0.mac_rx_agent0.sequencer.run_phase", 
			        // "default_sequence",
				 // mac_user_sequence::type_id::get());
				 // set_config_int("*mac_env0.mac_rx_agent0.sequencer","count",0);
//================================pcs_seq=================================================== 
       
//================================ set_type_override =======================================
      set_type_override_by_type(pcs_base_monitor::get_type(),pcs_monitor::get_type());         
      set_type_override_by_type(mac_rx_base_driver::get_type(),gmii_rx_driver::get_type());   
      set_type_override_by_type(mac_rx_base_monitor::get_type(),gmii_rx_monitor::get_type());  
      set_type_override_by_type(mac_tx_base_monitor::get_type(),gmii_tx_monitor::get_type());  
//================================ set_type_override =======================================
       
   endfunction : build_phase
  
  function void connect();

  endfunction
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration    
    
   task run_phase(uvm_phase phase);
         
        //==========================cov change identify============//
//        while(1)
//          begin
//          $display("test @time=%0t\n",$time);
//          #10ns;
//          end
       phase.phase_done.set_drain_time(this, 50);
       #1ms;
       $stop;
       
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

class eth_base_test extends pcs_base_test;
 
   `uvm_component_utils(eth_base_test)

    function new(string name="eth_base_test" ,  uvm_component parent=null);
        super.new(name,parent);
//       env_ec         = env_static_config::type_id::create("env_ec", this); 
//       set_config_object("*","static_cfg",env_ec,0);     
     endfunction : new

   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);  
    
    //==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_eth_test::type_id::get());
    //==================================scenario============================================ 

    set_type_override_by_type(mac_rx_base_driver::get_type(),xgmii64_rx_driver::get_type()); 
   endfunction
          
endclass