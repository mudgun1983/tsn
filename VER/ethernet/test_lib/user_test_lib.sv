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
 
    parameter TIME_OUT_INTERVAL=1ms; 
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
     
    
   // task run_phase(uvm_phase phase);
    // fork
	   // begin
	    // for(int i=0;i<topology_config0.mac_number;i++)
		 // begin
		   // automatic int index;
           // index = i;
	       // fork
	         // while(1)
		       // begin
		        // @this.pcs_tx_rx_env0.scb0[index].fatal_event;
		    	// file_id=$fopen(global_test_log,"a+"); 
		    	// $fwrite(file_id,$psprintf(" FATAL ERROR in scoreboard[%0d] \n",index));	
		    	// $fclose(file_id);
				// `uvm_fatal(get_type_name(),$psprintf(" FATAL ERROR in scoreboard[%0d] \n",index));
		       // end
		   // join_none
		 // end
		  // wait fork ;
	   // end
			   
	
	   // begin
       // phase.phase_done.set_drain_time(this, 50000);
       // #20ms;
       // $stop;      
	   // end
	   
	// join
   // endtask:run_phase
  
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
  
 virtual function set_port_stimulus_value();
   int dut_max_port;
   dut_max_port = `DUT_MAX_PORT-1;
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
 
// port_stimulus_s[0].port_en = 1;
// port_stimulus_s[1].port_en = 1;
port_stimulus_s[2].port_en = 1;
port_stimulus_s[3].port_en = 1;
port_stimulus_s[4].port_en = 1;
port_stimulus_s[5].port_en = 1;
port_stimulus_s[6].port_en = 1;
port_stimulus_s[7].port_en = 1;
port_stimulus_s[8].port_en = 1;
port_stimulus_s[9].port_en = 1;
port_stimulus_s[10].port_en = 1;
port_stimulus_s[11].port_en = 1;
port_stimulus_s[12].port_en = 1;
port_stimulus_s[13].port_en = 1;
port_stimulus_s[14].port_en = 1;
port_stimulus_s[15].port_en = 1;
port_stimulus_s[16].port_en = 1;
port_stimulus_s[17].port_en = 1;
port_stimulus_s[18].port_en = 1;
port_stimulus_s[19].port_en = 1;

port_stimulus_s[0].packet_count = 1;  //0: forever
port_stimulus_s[1].packet_count = 1;
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

port_stimulus_s[0].sa_index = 0;   
port_stimulus_s[1].sa_index = 1;
port_stimulus_s[2].sa_index = 2;  
port_stimulus_s[3].sa_index = 3;
port_stimulus_s[4].sa_index = 4;
port_stimulus_s[5].sa_index = 5;
port_stimulus_s[6].sa_index = 6;
port_stimulus_s[7].sa_index = 7;
port_stimulus_s[8].sa_index = 8;
port_stimulus_s[9].sa_index = 9;
port_stimulus_s[10].sa_index = 10;
port_stimulus_s[11].sa_index = 11;
port_stimulus_s[12].sa_index = 12;
port_stimulus_s[13].sa_index = 13;
port_stimulus_s[14].sa_index = 14;
port_stimulus_s[15].sa_index = 15;
port_stimulus_s[16].sa_index = 16;
port_stimulus_s[17].sa_index = 17;
port_stimulus_s[18].sa_index = 18;
port_stimulus_s[19].sa_index = 19;

port_stimulus_s[0].da_index =  (dut_max_port- 0);   
port_stimulus_s[1].da_index =  (dut_max_port- 1);
port_stimulus_s[2].da_index =  (dut_max_port- 2);  
port_stimulus_s[3].da_index =  (dut_max_port- 3);
port_stimulus_s[4].da_index =  (dut_max_port- 4);
port_stimulus_s[5].da_index =  (dut_max_port- 5);
port_stimulus_s[6].da_index =  (dut_max_port- 6);
port_stimulus_s[7].da_index =  (dut_max_port- 7);
port_stimulus_s[8].da_index =  (dut_max_port- 8);
port_stimulus_s[9].da_index =  (dut_max_port- 9);
port_stimulus_s[10].da_index = (dut_max_port-10);
port_stimulus_s[11].da_index = (dut_max_port-11);
port_stimulus_s[12].da_index = (dut_max_port-12);
port_stimulus_s[13].da_index = (dut_max_port-13);
port_stimulus_s[14].da_index = (dut_max_port-14);
port_stimulus_s[15].da_index = (dut_max_port-15);
port_stimulus_s[16].da_index = (dut_max_port-16);
port_stimulus_s[17].da_index = (dut_max_port-17);
port_stimulus_s[18].da_index = (dut_max_port-18);
port_stimulus_s[19].da_index = (dut_max_port-19);
endfunction       
endclass


class ptp_smoke_test extends pcs_base_test;
 
   `uvm_component_utils(ptp_smoke_test)
 
    parameter test_port_index= 5'd6;
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
	   if(comp_success_count[test_port_index]!=0)
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

  `PTP_CONFIG.table_size =1;
  //disable all the instance
  foreach(`PTP_CONFIG_CONTENT[key])
    `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 0;
  
  //modify the config	
  `PTP_CONFIG_CONTENT[0].descriptor_trans.inst_valid = 1;
  `PTP_CONFIG_CONTENT[0].descriptor_trans.inst_type = 0; //master
  `PTP_CONFIG_CONTENT[0].descriptor_trans.two_step = 1; //1： two step  0: one step
  
  `PTP_CONFIG_CONTENT[0].ptp_trans.packet_type     =    ptp_item::Sync;
  `PTP_CONFIG_CONTENT[0].ptp_trans.messageType     =    `Sync;
  
  `PTP_CONFIG_CONTENT[0].eth_trans.destination_address = `PTP_NON_PEER_MULTI_DA;
  `PTP_CONFIG_CONTENT[0].sys_trans.destination =  test_port_index;
  `PTP_CONFIG_CONTENT[0].sys_trans.sub_type	= `Sync;
  //re-pack to update the value
  foreach(`PTP_CONFIG_CONTENT[key])  
	   begin
	     `PTP_CONFIG_CONTENT[key].pack();
		 `PTP_CONFIG_CONTENT[key].desc_pack();
		 `PTP_CONFIG_CONTENT[key].packed_padding();
	   end
endfunction 
  
endclass