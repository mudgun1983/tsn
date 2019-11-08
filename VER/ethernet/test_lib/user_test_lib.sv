// AUTHOR: wanggb@pcl.ac.cn
///////////////////////////////////////////////////////////////////////////////////////////////
//add a base register access test//
class basic_reg_test extends pcs_base_test;
 
   `uvm_component_utils(basic_reg_test)
    
	function new(string name="basic_reg_test" ,  uvm_component parent=null);
        super.new(name,parent);  
    endfunction : new
	
    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_basic_reg_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
   
endclass
  
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
       phase.phase_done.set_drain_time(this, 50000);
       #10us;
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
       phase.phase_done.set_drain_time(this, 50000);
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
       phase.phase_done.set_drain_time(this, 50000);
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

class simple_e_p_mix_random_test extends pcs_base_test;
 
   `uvm_component_utils(simple_e_p_mix_random_test)
 

    function new(string name="simple_e_p_mix_random_test" ,  uvm_component parent=null);
        super.new(name,parent);  
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_simple_e_p_mix_random_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
     
    
   task run_phase(uvm_phase phase);
       phase.phase_done.set_drain_time(this, 50000);
       #20ms;
       $stop;      
   endtask:run_phase
  
endclass 

class full_throughput_test extends pcs_base_test;
 
   `uvm_component_utils(full_throughput_test)
 

    function new(string name="full_throughput_test" ,  uvm_component parent=null);
        super.new(name,parent);  
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_full_throughput_test::type_id::get());
//==================================scenario============================================               
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
		        @this.pcs_tx_rx_env0.scb0[index].fatal_event;
		    	file_id=$fopen("global_test_log.txt","a+"); 
		    	$fwrite(file_id,$psprintf(" FATAL ERROR in scoreboard[%0d] \n",index));	
		    	$fclose(file_id);
				`uvm_fatal(get_type_name(),$psprintf(" FATAL ERROR in scoreboard[%0d] \n",index));
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
  
endclass 

class full_throughput_switch_test extends pcs_base_test;
 
   `uvm_component_utils(full_throughput_switch_test)
 

    function new(string name="full_throughput_switch_test" ,  uvm_component parent=null);
        super.new(name,parent);  
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_full_throughput_switch_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
   
   function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
  endfunction : end_of_elaboration 
   
endclass


class ptp_smoke_test extends pcs_base_test;
 
   `uvm_component_utils(ptp_smoke_test)
 

    function new(string name="ptp_smoke_test" ,  uvm_component parent=null);
        super.new(name,parent);  
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);      
    auto_stop_en = 1;	
//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_ptp_smoke_test::type_id::get());
//==================================scenario============================================               
   endfunction : build_phase
   
   function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
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
endclass