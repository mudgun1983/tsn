class test_1cb_case2_3 extends test_1cb_case2;
 
   `uvm_component_utils(test_1cb_case2_3)

    function new(string name="test_1cb_case2_3" ,  uvm_component parent=null);
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
	    item_config0.tagged_size   = $urandom_range(2,3);//no VLAN or  one VLAN or two VLAN
		item_config0.selfdefine_tagged_size = 1; //with R-TAG
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
   
  virtual function void set_1cb_config();
     super.set_1cb_config();
    `CB_CONFIG_CONTENT[0].cb_valid       =1;
	`CB_CONFIG_CONTENT[0].rec_algorithm  =0;
    `CB_CONFIG_CONTENT[0].listener_agent =1;
    `CB_CONFIG_CONTENT[0].sq_en          =0;
    `CB_CONFIG_CONTENT[0].w_valid        =1;
    `CB_CONFIG_CONTENT[0].w_fp_oport     =dmac;
    `CB_CONFIG_CONTENT[0].p_valid        =1;
    `CB_CONFIG_CONTENT[0].p_fp_oport     =dmac1;
  endfunction
endclass 