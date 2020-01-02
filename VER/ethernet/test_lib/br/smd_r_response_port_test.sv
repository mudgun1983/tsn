class smd_r_response_port_test extends simple_n_packet_port_test;
 
   `uvm_component_utils(smd_r_response_port_test)
    int test_port_index;
    mac_user_sequence mac_user_sequence0;
	
    function new(string name="smd_r_response_port_test" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
		test_port_index = 4;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
    
   mac_user_sequence0=mac_user_sequence::type_id::create("mac_user_sequence0", this);          
   endfunction : build_phase
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration    
    
  task run_phase(uvm_phase phase);
     phase.raise_objection( this );
	 fork
	 basic_run_monitor(phase);
	 
	 begin
	 #100us;
      if ( !(mac_user_sequence0.randomize() with {mac_user_sequence0.c_packet_len == 'd46;
							                      mac_user_sequence0.c_tpid == 'd46;
							                      mac_user_sequence0.c_preemptable==1;
							                      mac_user_sequence0.c_start_or_frag==1; //1:start
							                      mac_user_sequence0.c_last_frag == 0;   //not last frag
							                      mac_user_sequence0.c_smd==8'h07;//SMD_V
							                      mac_user_sequence0.c_xor_value == 32'hffffffff;//32'h0000ffff;
	                                              
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end
		foreach(port_stimulus_s[key])
		   begin 
		    if(port_stimulus_s[key].port_en)
	          mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[key].mac_rx_agent0.sequencer);
		   end
	 #100us;	   
	 phase.drop_objection( this );
	 end
	 join
  //     phase.phase_done.set_drain_time(this, 50000);
  //     #10us;
  //     $stop;
  //     scenario_simple_e_p_random_packet_port_test0.start(pcs_tx_rx_env0.virt_seqr);
   endtask:run_phase

 virtual function void report_phase(uvm_phase phase);
    bit test_fail;
     // foreach(port_stimulus_s[key])
	   // begin
	     // if(port_stimulus_s[key].port_en)
		   // begin
		    // if(comp_success_count[key]==0)
		     // test_fail=1;
			// else
			 // $display("comp_success_count[%0d]=%0d",key,comp_success_count[key]);
		   // end
	   // end
	   
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

virtual function void set_topology_config();
    topology_config0.compare_enable = 0;
  endfunction
  
virtual function set_port_stimulus_value();
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
  
 port_stimulus_s[0].port_en = 1;
 port_stimulus_s[1].port_en = 1;
 port_stimulus_s[2].port_en = 1;
 port_stimulus_s[3].port_en = 1;
 port_stimulus_s[4].port_en = 1;
 port_stimulus_s[5].port_en = 1;
 port_stimulus_s[6].port_en = 1;
 port_stimulus_s[7].port_en = 1;
 port_stimulus_s[8].port_en = 1;
 port_stimulus_s[9].port_en = 1;
 port_stimulus_s[10].port_en = 1;


port_stimulus_s[2].sa_index = 2;  
port_stimulus_s[3].sa_index = 3;
port_stimulus_s[4].sa_index = 4;


port_stimulus_s[2].da_index =   4;//(19- 2);  
port_stimulus_s[4].da_index =   2;//(19- 4);


port_stimulus_s[0].e_p_packet_en  = 2'b10; //b0: send e packet; b1:send p packet
port_stimulus_s[1].e_p_packet_en  = 2'b10;
port_stimulus_s[2].e_p_packet_en  = 2'b10;
port_stimulus_s[3].e_p_packet_en  = 2'b10;
port_stimulus_s[4].e_p_packet_en  = 2'b10;
port_stimulus_s[5].e_p_packet_en  = 2'b10;
port_stimulus_s[6].e_p_packet_en  = 2'b10;
port_stimulus_s[7].e_p_packet_en  = 2'b10;
port_stimulus_s[8].e_p_packet_en  = 2'b10;
port_stimulus_s[9].e_p_packet_en  = 2'b10;
port_stimulus_s[10].e_p_packet_en = 2'b10;

port_stimulus_s[2].packet_count = 20; 
port_stimulus_s[4].packet_count = 1; 
endfunction 

virtual function set_item_config_value();
 item_config0.eth_item_payload=`ASSIGN_ALL_BYTE;
 item_config0.p_mac_vlan[2] = {3'd0,1'b0,12'h500};  //p packet to e mac and merge together
 item_config0.e_mac_vlan[2] = {3'd2,1'b0,12'h500};  //n packet to p mac and to be cut to frag
 item_config0.p_mac_vlan[4] = {3'd0,1'b0,12'h500};  //p packet to e mac and merge together
 item_config0.e_mac_vlan[4] = {3'd2,1'b0,12'h500};  //n packet to p mac and to be cut to frag
endfunction  
endclass 