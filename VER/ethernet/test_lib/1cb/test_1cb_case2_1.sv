class test_1cb_case2_1 extends simple_1cb_smoke_test;
 
   `uvm_component_utils(test_1cb_case2_1)
    int dmac1;
	int test_port_index1;
    function new(string name="test_1cb_case2_1" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
		auto_stop_en = 1;
		source_port     = 2;
		source_port1    = 3;
		vid             = 'h500;
		dmac            = 1;
		dmac1           = 4;
		ingress_flow_id         = 'd1023;
		ingress_gate_id         = 'd511;
		phb             =3'd3;
		virtual_port    = 9'd511;		
		
		test_port_index = dmac;
		test_port_index1 = dmac1;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);   
   endfunction : build_phase

  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration  
  
task configure_phase( uvm_phase phase);
     phase.raise_objection( this );
	 #150us;
     cb_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 phase.drop_objection( this );
endtask

virtual task main_phase(uvm_phase phase);
     bit[15:0] vlan = item_config0.e_mac_vlan[dmac];
     phase.raise_objection( this );
	 
	 begin
	   
	 `ifndef DUMMY_DUT
	 dut_if0.init_finish(init_finish);
	 $display("init_finish=%0b",init_finish);
	 `else
	 `endif

	 for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
	    item_config0.tagged_size   = $urandom_range(1,3);//  one VLAN or two VLAN
		item_config0.selfdefine_tagged_size = 0; //without R-TAG
		data_len=$urandom_range(1518,46);
	    if ( !(mac_multi_tag_seq0.randomize() with {
	                                              mac_multi_tag_seq0.c_da_cnt==(port_stimulus_s[source_port].da_index);
							                      mac_multi_tag_seq0.c_sa_cnt==(port_stimulus_s[source_port].sa_index);
							                      mac_multi_tag_seq0.c_packet_len == data_len;
							                      mac_multi_tag_seq0.c_tpid == data_len[15:0];
							                      mac_multi_tag_seq0.c_preemptable==0;
							                      mac_multi_tag_seq0.c_data_payload ==data_payload[source_port];
							                      mac_multi_tag_seq0.c_vlan == {phb,1'b0,vid};
												  
												  mac_multi_tag_seq0.c_selfdefine_tag_len ==4;
							                      mac_multi_tag_seq0.c_selfdefine_tag_data[0] == sequence_id[source_port];
												  mac_multi_tag_seq0.c_selfdefine_tag_data[1] == {0};
												  mac_multi_tag_seq0.c_selfdefine_tag_data[2] == sequence_id[source_port][15:8];
												  mac_multi_tag_seq0.c_selfdefine_tag_data[3] == sequence_id[source_port][7:0];
												  mac_multi_tag_seq0.c_selfdefine_tpid == `CB_ETYPE;
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end	
        
        if(port_stimulus_s[source_port].port_en==1)		
		  mac_multi_tag_seq0.start(pcs_tx_rx_env0.mac_env0[source_port].mac_rx_agent0.sequencer);
		if(port_stimulus_s[source_port1].port_en==1)	
		  mac_multi_tag_seq0.start(pcs_tx_rx_env0.mac_env0[source_port1].mac_rx_agent0.sequencer);
		
		sequence_id[source_port]++;
		data_payload[source_port]++;
	 end
	 end
	 
	 #100us;	   
	 phase.drop_objection( this );		
endtask
  
    
   task run_phase(uvm_phase phase);
       super.run_phase(phase);
   endtask:run_phase

 virtual function void report_phase(uvm_phase phase);
    bit test_fail;
	   
	   if(comp_success_count[test_port_index]==0 || comp_success_count[test_port_index1]==0)
		  test_fail=1;
	   else
	      $display("comp_success_count[%0d]=%0d,comp_success_count[%0d]=%0d",test_port_index,comp_success_count[test_port_index],test_port_index1,comp_success_count[test_port_index1]);
	   
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

port_stimulus_s[source_port].port_en = 1;  
port_stimulus_s[source_port1].port_en = 0;  
port_stimulus_s[dmac].port_en = 1;


port_stimulus_s[source_port].sa_index = source_port;   
port_stimulus_s[source_port1].sa_index = source_port; 
port_stimulus_s[dmac].sa_index = dmac; 


port_stimulus_s[source_port].da_index =   dmac;//(19- 0);   
port_stimulus_s[source_port1].da_index =   dmac;//(19- 0);  
port_stimulus_s[dmac].da_index =   source_port;//(19- 0);   


port_stimulus_s[source_port].packet_count = 100; 
port_stimulus_s[source_port1].packet_count = 100; 
port_stimulus_s[dmac].packet_count = 1; 
endfunction 

virtual function set_item_config_value();
 item_config0.eth_item_payload=`ASSIGN_ALL_BYTE;//`ASSIGN_FIRST_BYTE;//
 item_config0.tagged_size   = 4;
endfunction
  
virtual function set_i_epp_predefine_value();
  super.set_i_epp_predefine_value(); 
endfunction  

  virtual function void set_topology_config();
    topology_config0.compare_enable = 0;
	topology_config0.compare_enable[test_port_index] = 1;
	topology_config0.compare_enable[test_port_index1] = 1;
  endfunction
  
  virtual function void set_1cb_config();
     super.set_1cb_config();
    `CB_CONFIG_CONTENT[0].cb_valid       =1;
	`CB_CONFIG_CONTENT[0].rec_algorithm  =0;
    `CB_CONFIG_CONTENT[0].listener_agent =0;
    `CB_CONFIG_CONTENT[0].sq_en          =1;
    `CB_CONFIG_CONTENT[0].w_valid        =1;
    `CB_CONFIG_CONTENT[0].w_fp_oport     =dmac;
    `CB_CONFIG_CONTENT[0].p_valid        =1;
    `CB_CONFIG_CONTENT[0].p_fp_oport     =dmac1;
  endfunction
endclass 