class test_qci_bypass_multi_stream extends simple_qci_smoke_test;
 
   `uvm_component_utils(test_qci_bypass_multi_stream)
    mac_user_sequence mac_user_sequence_bypass;
    function new(string name="test_qci_bypass_multi_stream" ,  uvm_component parent=null);
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
		phb = 3;
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
		
		if ( !(mac_user_sequence0.randomize() with {
	                                              mac_user_sequence0.c_da_cnt==(port_stimulus_s[dmac].da_index);
							                      mac_user_sequence0.c_sa_cnt==(port_stimulus_s[dmac].sa_index);
							                      mac_user_sequence0.c_packet_len == 'd46;
							                      mac_user_sequence0.c_tpid == 'd46;
							                      mac_user_sequence0.c_preemptable==0;
							                      mac_user_sequence0.c_data_payload ==0;
							                      mac_user_sequence0.c_vlan == {3'd0,1'b0,vid};
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end		
		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[dmac].mac_rx_agent0.sequencer);
		
		if ( !(mac_user_sequence0.randomize() with {
	                                              mac_user_sequence0.c_da_cnt==(port_stimulus_s[dmac].da_index);
							                      mac_user_sequence0.c_sa_cnt==(port_stimulus_s[dmac].sa_index);
							                      mac_user_sequence0.c_packet_len == 'd46;
							                      mac_user_sequence0.c_tpid == 'd46;
							                      mac_user_sequence0.c_preemptable==0;
							                      mac_user_sequence0.c_data_payload ==0;
							                      mac_user_sequence0.c_vlan == {3'd1,1'b0,vid};
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end		
		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[dmac].mac_rx_agent0.sequencer);
		
		if ( !(mac_user_sequence0.randomize() with {
	                                              mac_user_sequence0.c_da_cnt==(port_stimulus_s[dmac].da_index);
							                      mac_user_sequence0.c_sa_cnt==(port_stimulus_s[dmac].sa_index);
							                      mac_user_sequence0.c_packet_len == 'd46;
							                      mac_user_sequence0.c_tpid == 'd46;
							                      mac_user_sequence0.c_preemptable==0;
							                      mac_user_sequence0.c_data_payload ==0;
							                      mac_user_sequence0.c_vlan == {3'd2,1'b0,vid};
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
	 
	 //pass packet
	 begin
	 for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
		@packet_trigger
		//stream0
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
		
		//stream1
		data_len=$urandom_range(1518,46);
		if ( !(mac_user_sequence0.randomize() with {
	                                              mac_user_sequence0.c_da_cnt==(port_stimulus_s[source_port].da_index);
							                      mac_user_sequence0.c_sa_cnt==(port_stimulus_s[source_port].sa_index);
							                      mac_user_sequence0.c_packet_len == data_len;
							                      mac_user_sequence0.c_tpid == bypass_etype;
							                      mac_user_sequence0.c_preemptable==0;
							                      mac_user_sequence0.c_data_payload ==0;
							                      mac_user_sequence0.c_vlan == {3'd0,1'b0,vid};
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end		
		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[source_port].mac_rx_agent0.sequencer);
		
		//stream2
		data_len=$urandom_range(1518,46);
		if ( !(mac_user_sequence0.randomize() with {
	                                              mac_user_sequence0.c_da_cnt==(port_stimulus_s[source_port].da_index);
							                      mac_user_sequence0.c_sa_cnt==(port_stimulus_s[source_port].sa_index);
							                      mac_user_sequence0.c_packet_len == data_len;
							                      mac_user_sequence0.c_tpid == bypass_etype;
							                      mac_user_sequence0.c_preemptable==0;
							                      mac_user_sequence0.c_data_payload ==0;
							                      mac_user_sequence0.c_vlan == {3'd1,1'b0,vid};
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end		
		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[source_port].mac_rx_agent0.sequencer);
		
		//stream3
		data_len=$urandom_range(1518,46);
		if ( !(mac_user_sequence0.randomize() with {
	                                              mac_user_sequence0.c_da_cnt==(port_stimulus_s[source_port].da_index);
							                      mac_user_sequence0.c_sa_cnt==(port_stimulus_s[source_port].sa_index);
							                      mac_user_sequence0.c_packet_len == data_len;
							                      mac_user_sequence0.c_tpid == bypass_etype;
							                      mac_user_sequence0.c_preemptable==0;
							                      mac_user_sequence0.c_data_payload ==0;
							                      mac_user_sequence0.c_vlan == {3'd2,1'b0,vid};
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end		
		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[source_port].mac_rx_agent0.sequencer);
		
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
 
virtual function set_port_stimulus_value();
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
  
port_stimulus_s[0].port_en = 1;
//port_stimulus_s[1].port_en = 1;
//port_stimulus_s[2].port_en = 1;
//port_stimulus_s[3].port_en = 1;
//port_stimulus_s[4].port_en = 1;
//port_stimulus_s[5].port_en = 1;
//port_stimulus_s[6].port_en = 1;
//port_stimulus_s[7].port_en = 1;
//port_stimulus_s[8].port_en = 1;
//port_stimulus_s[9].port_en = 1;
//port_stimulus_s[10].port_en = 1;

port_stimulus_s[source_port].sa_index = source_port;   
port_stimulus_s[dmac].sa_index = dmac; 
//port_stimulus_s[1].sa_index = 1;
//port_stimulus_s[2].sa_index = 2;  
//port_stimulus_s[3].sa_index = 3;
//port_stimulus_s[4].sa_index = 4;
//port_stimulus_s[5].sa_index = 5;
//port_stimulus_s[6].sa_index = 6;
//port_stimulus_s[7].sa_index = 7;
//port_stimulus_s[8].sa_index = 8;
//port_stimulus_s[9].sa_index = 9;
//port_stimulus_s[10].sa_index = 10;

port_stimulus_s[source_port].da_index =   dmac;//(19- 0);   
port_stimulus_s[dmac].da_index =   source_port;//(19- 0);   
//port_stimulus_s[1].da_index =   1;//(19- 1);
//port_stimulus_s[2].da_index =   4;//(19- 2);  
//port_stimulus_s[3].da_index =   3;//(19- 3);
//port_stimulus_s[4].da_index =   2;//(19- 4);
//port_stimulus_s[5].da_index =   5;//(19- 5);
//port_stimulus_s[6].da_index =   6;//(19- 6);
//port_stimulus_s[7].da_index =   7;//(19- 7);
//port_stimulus_s[8].da_index =   8;//(19- 8);
//port_stimulus_s[9].da_index =   9;//(19- 9);
//port_stimulus_s[10].da_index =   10;//(19- 9);

port_stimulus_s[source_port].packet_count = 100; 
port_stimulus_s[dmac].packet_count = 1; 
endfunction  
endclass 