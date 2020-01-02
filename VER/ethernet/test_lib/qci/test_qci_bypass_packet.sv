class test_qci_bypass_packet extends simple_qci_smoke_test;
 
   `uvm_component_utils(test_qci_bypass_packet)
    mac_user_sequence mac_user_sequence_bypass;
    function new(string name="test_qci_bypass_packet" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
		// auto_stop_en = 1;
		// test_port_index = 2;
		// source_port     = 0;
		// vid             = 'h500;
		// dmac            = 2;
		// ingress_flow_id         = 'd1023;
		// ingress_gate_id         = 'd511;
		// base_time       =64'd200000;  //200us
		// cycle_time      =64'd50000;
		// time_slot_time0 =32'd25000;
		// time_slot_time1 =32'd20000;
		// bypass_etype     =`BYPASS_ETYPE;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);     
    set_inst_override_by_type("*tsn_switch_model0*",  tsn_switch_expect_model::get_type(), tsn_switch_expect_model_qci::get_type() );
	
	mac_user_sequence_bypass = mac_user_sequence::type_id::create("mac_user_sequence_bypass", this);  
   endfunction : build_phase
  
task configure_phase( uvm_phase phase);
      super.configure_phase(phase);
endtask
  
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
  endfunction : end_of_elaboration    
    
   task run_phase(uvm_phase phase);
     bit[15:0] vlan = item_config0.e_mac_vlan[dmac];
     phase.raise_objection( this );
	 fork
	 basic_run_monitor(phase);
	 
	 begin
	 #140us;
	   //use for L2 MAC learn
       if ( !(mac_user_sequence0.randomize() with {
	                                              mac_user_sequence0.c_da_cnt==(port_stimulus_s[dmac].da_index);
							                      mac_user_sequence0.c_sa_cnt==(port_stimulus_s[dmac].sa_index);
							                      mac_user_sequence0.c_packet_len == 'd46;
							                      mac_user_sequence0.c_tpid == 'd46;
							                      mac_user_sequence0.c_preemptable==0;
							                      mac_user_sequence0.c_data_payload ==0;
							                      mac_user_sequence0.c_vlan == {phb,1'b0,vid};
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end		
		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[dmac].mac_rx_agent0.sequencer);
	 end	
		
	 //gen stimulus at source port
	 begin
	 #base_time;
	 #5us;
	 while(1)
	   begin
	    -> packet_trigger;
		#cycle_time;
	   end
	 end
	 
	 begin
	 #base_time;
	 #5us;
	 #time_slot_time0;
	 while(1)
	   begin
	    -> packet_trigger2;
		#cycle_time;
	   end
	 end
	 
	 //bypass packet
	  begin
	 for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
		@packet_trigger2
		data_len=$urandom_range(1518,46);
	    if ( !(mac_user_sequence_bypass.randomize() with {
	                                              mac_user_sequence_bypass.c_da_cnt==(port_stimulus_s[source_port].da_index);
							                      mac_user_sequence_bypass.c_sa_cnt==(port_stimulus_s[source_port].sa_index);
							                      mac_user_sequence_bypass.c_packet_len == data_len;
							                      mac_user_sequence_bypass.c_tpid == bypass_etype;
							                      mac_user_sequence_bypass.c_preemptable==0;
							                      mac_user_sequence_bypass.c_data_payload ==8'hff;
							                      mac_user_sequence_bypass.c_vlan == {phb,1'b0,vid};
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end
		mac_user_sequence_bypass.start(pcs_tx_rx_env0.mac_env0[source_port].mac_rx_agent0.sequencer);
        end		
	 end	 
	 
	 //pass packet
	 begin
	 for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
		@packet_trigger
		data_len=$urandom_range(1518,46);
	    if ( !(mac_user_sequence0.randomize() with {
	                                              mac_user_sequence0.c_da_cnt==(port_stimulus_s[source_port].da_index);
							                      mac_user_sequence0.c_sa_cnt==(port_stimulus_s[source_port].sa_index);
							                      mac_user_sequence0.c_packet_len == data_len;
							                      mac_user_sequence0.c_tpid ==data_len[15:0];
							                      mac_user_sequence0.c_preemptable==0;
							                      mac_user_sequence0.c_data_payload ==data_payload;
							                      mac_user_sequence0.c_vlan == {phb,1'b0,vid};
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end
		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[source_port].mac_rx_agent0.sequencer);
		data_payload++;
        end	
     #100us;	   
	 phase.drop_objection( this );		
	 end	 
	 join

   endtask:run_phase

 virtual function void report_phase(uvm_phase phase);
    bit test_fail;
	   
	   if(comp_success_count[test_port_index]==0)
		  test_fail=1;
	   else
	      $display("comp_success_count[%0d]=%0d",test_port_index,comp_success_count[test_port_index]);
	   
	   if(~test_fail)
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," PASS\n"}));	
		   $fclose(file_id);
		   `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
		   test_pass=1;
		 end
	   else
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," FAIL\n"}));	
		   $fclose(file_id);
		   `uvm_error(get_type_name(), "** UVM TEST FAIL **")
		   test_pass=0;
		 end
  endfunction
  
endclass 