// AUTHOR: wanggb@pcl.ac.cn
///////////////////////////////////////////////////////////////////////////////////////////////
class simple_preemptable_packet_test extends pcs_base_test;
 
   `uvm_component_utils(simple_preemptable_packet_test)
 

    function new(string name="simple_preemptable_packet_test" ,  uvm_component parent=null);
        super.new(name,parent);  
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_simple_preemptable_packet_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
  endfunction : end_of_elaboration    
    
   task run_phase(uvm_phase phase);
       phase.phase_done.set_drain_time(this, 50);
       #20ms;
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
  
endclass : simple_preemptable_packet_test

//////////////////////////////////////////////////////////////////////////////////////////////////
class simple_express_packet_test extends pcs_base_test;
 
   `uvm_component_utils(simple_express_packet_test)
 

    function new(string name="simple_express_packet_test" ,  uvm_component parent=null);
        super.new(name,parent);  
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_simple_express_packet_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
  endfunction : end_of_elaboration    
    
   task run_phase(uvm_phase phase);
       phase.phase_done.set_drain_time(this, 50);
       #20ms;
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
  
endclass : simple_express_packet_test

//////////////////////////////////////////////////////////////////////////////////////////////////
class simple_e_p_mix_packet_test extends pcs_base_test;
 
   `uvm_component_utils(simple_e_p_mix_packet_test)
 

    function new(string name="simple_e_p_mix_packet_test" ,  uvm_component parent=null);
        super.new(name,parent);  
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_simple_e_p_mix_packet_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
  endfunction : end_of_elaboration    
    
   task run_phase(uvm_phase phase);
       phase.phase_done.set_drain_time(this, 50);
       #20ms;
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
  
endclass : simple_e_p_mix_packet_test