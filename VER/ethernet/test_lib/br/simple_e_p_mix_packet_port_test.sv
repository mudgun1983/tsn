class simple_e_p_mix_packet_port_test extends simple_n_packet_port_test;
 
   `uvm_component_utils(simple_e_p_mix_packet_port_test)
 
    scenario_simple_e_p_mix_packet_port_test scenario_simple_e_p_mix_packet_port_test0;
    function new(string name="simple_e_p_mix_packet_port_test" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
		test_port_index = 4;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
       // uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            // "default_sequence",
	       		    	// scenario_simple_e_p_mix_packet_port_test::type_id::get());
//==================================scenario============================================    
            scenario_simple_e_p_mix_packet_port_test0 = scenario_simple_e_p_mix_packet_port_test::type_id::create("scenario_simple_e_p_mix_packet_port_test0", this);  
   endfunction : build_phase

task configure_phase( uvm_phase phase);
     super.configure_phase(phase);
endtask
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration    

  task run_phase(uvm_phase phase);
     phase.raise_objection( this );
	 fork
	 basic_run_monitor(phase);
	 
	 begin
	 #140us;
	 port_stimulus_s[2].port_en = 0;
	 scenario_simple_e_p_random_packet_port_test0.start(pcs_tx_rx_env0.virt_seqr);  // normal packet ,use for L2 learn
	 port_stimulus_s[2].port_en = 1;
	 port_stimulus_s[4].port_en = 0;
	 #60us;
	 scenario_simple_e_p_mix_packet_port_test0.start(pcs_tx_rx_env0.virt_seqr);
	 //port_stimulus_s[2].e_p_packet_en  = 2'b10;
	 //scenario_simple_e_p_random_packet_port_test0.start(pcs_tx_rx_env0.virt_seqr);
	 phase.drop_objection( this );
	 end
	 join
  //     phase.phase_done.set_drain_time(this, 50000);
  //     #10us;
  //     $stop;
  //     scenario_simple_e_p_random_packet_port_test0.start(pcs_tx_rx_env0.virt_seqr);
   endtask:run_phase

virtual function set_port_stimulus_value();
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
  
//port_stimulus_s[0].port_en = 1;
//port_stimulus_s[1].port_en = 1;
port_stimulus_s[2].port_en = 1;
//port_stimulus_s[3].port_en = 1;
port_stimulus_s[4].port_en = 1;
//port_stimulus_s[5].port_en = 1;
//port_stimulus_s[6].port_en = 1;
//port_stimulus_s[7].port_en = 1;
//port_stimulus_s[8].port_en = 1;
//port_stimulus_s[9].port_en = 1;
//port_stimulus_s[10].port_en = 1;

//port_stimulus_s[0].sa_index = 0;   
//port_stimulus_s[1].sa_index = 1;
port_stimulus_s[2].sa_index = 2;  
//port_stimulus_s[3].sa_index = 3;
port_stimulus_s[4].sa_index = 4;
//port_stimulus_s[5].sa_index = 5;
//port_stimulus_s[6].sa_index = 6;
//port_stimulus_s[7].sa_index = 7;
//port_stimulus_s[8].sa_index = 8;
//port_stimulus_s[9].sa_index = 9;
//port_stimulus_s[10].sa_index = 10;

//port_stimulus_s[0].da_index =   0;//(19- 0);   
//port_stimulus_s[1].da_index =   1;//(19- 1);
port_stimulus_s[2].da_index =   4;//(19- 2);  
//port_stimulus_s[3].da_index =   3;//(19- 3);
port_stimulus_s[4].da_index =   2;//(19- 4);
//port_stimulus_s[5].da_index =   5;//(19- 5);
//port_stimulus_s[6].da_index =   6;//(19- 6);
//port_stimulus_s[7].da_index =   7;//(19- 7);
//port_stimulus_s[8].da_index =   8;//(19- 8);
//port_stimulus_s[9].da_index =   9;//(19- 9);
//port_stimulus_s[10].da_index =   10;//(19- 9);

port_stimulus_s[0].e_p_packet_en  = 2'b01;
port_stimulus_s[1].e_p_packet_en  = 2'b01;
port_stimulus_s[2].e_p_packet_en  = 2'b01;
port_stimulus_s[3].e_p_packet_en  = 2'b01;
port_stimulus_s[4].e_p_packet_en  = 2'b01;
port_stimulus_s[5].e_p_packet_en  = 2'b01;
port_stimulus_s[6].e_p_packet_en  = 2'b01;
port_stimulus_s[7].e_p_packet_en  = 2'b01;
port_stimulus_s[8].e_p_packet_en  = 2'b01;
port_stimulus_s[9].e_p_packet_en  = 2'b01;
port_stimulus_s[10].e_p_packet_en = 2'b01;

port_stimulus_s[2].packet_count = 20; 
port_stimulus_s[4].packet_count = 1; 
endfunction 


virtual function set_item_config_value();
 item_config0.eth_item_payload=`ASSIGN_ALL_BYTE;
 item_config0.p_mac_vlan = {3'd0,1'b0,12'h500};
 item_config0.e_mac_vlan = {3'd0,1'b0,12'h500};
endfunction
endclass