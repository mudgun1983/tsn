class simple_1cb_smoke_test extends pcs_base_test;
 
   `uvm_component_utils(simple_1cb_smoke_test)
	cb_reg_seq cb_reg_seq0;
	mac_multi_tag_seq mac_multi_tag_seq0;

	bit [4:0] source_port;
	bit [4:0] source_port1;
	bit [11:0]vid;
	bit [11:0] default_vid;
	bit [47:0] dmac;
	bit [9:0]  ingress_flow_id;
	bit [8:0]  ingress_gate_id;
	int        data_len;

	bit [7:0]  data_payload[`MAX_PORT_NUM];
	bit [15:0] sequence_id[`MAX_PORT_NUM];
    bit [2:0]  phb;
	bit [8:0]  virtual_port;
	bit        rec_algorithm ;  //1'b0-match_alg; 1'b1-vector_alg. 
	bit        listener_agent;  //1'b0-listener agent不使能； 1'b1-listener agent使能。 
	bit        sq_en         ;  //1'b0-不需要添加序列号； 1'b1-需要添加序列号
	bit        w_valid       ;
	bit [4:0]  w_fp_oport    ;
	bit        p_valid       ;
	bit [4:0]  p_fp_oport    ;
	
	
	bit        init_finish;
	event      packet_trigger;
	event      packet_trigger2;
    function new(string name="simple_1cb_smoke_test" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
		auto_stop_en = 1;
		test_port_index = 1;
		source_port     = 2;
		vid             = 'h500;
		dmac            = 1;
		ingress_flow_id         = 'd1023;
		ingress_gate_id         = 'd511;
		phb             =3'd3;
		virtual_port    = 9'd511;	
		default_vid     = 0;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    set_1cb_config(); 
	//get cb register config 
	rec_algorithm   = `CB_CONFIG_CONTENT[0].rec_algorithm ;
	listener_agent  = `CB_CONFIG_CONTENT[0].listener_agent;		
	sq_en           = `CB_CONFIG_CONTENT[0].sq_en         ;    
	w_valid         = `CB_CONFIG_CONTENT[0].w_valid       ;  
	w_fp_oport      = `CB_CONFIG_CONTENT[0].w_fp_oport    ;  
	p_valid         = `CB_CONFIG_CONTENT[0].p_valid       ;  
	p_fp_oport      = `CB_CONFIG_CONTENT[0].p_fp_oport    ; 
	
    super.build_phase(phase);          			
    cb_reg_seq0    = cb_reg_seq::type_id::create("cb_reg_seq0", this);  
    mac_multi_tag_seq0=mac_multi_tag_seq::type_id::create("mac_multi_tag_seq0", this);  
   
    set_inst_override_by_type("*tsn_switch_model0*",  tsn_switch_expect_model::get_type(), tsn_switch_expect_model_1cb::get_type() );
	set_type_override_by_type(scoreboard::get_type(),scoreboard_p_e_out_of_order::get_type());  	
   endfunction : build_phase

  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
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
	   //use for L2 MAC learn
	 `ifndef DUMMY_DUT
	 dut_if0.init_finish(init_finish);
	 $display("init_finish=%0b",init_finish);
	 `else
	 `endif
       if ( !(mac_multi_tag_seq0.randomize() with {
	                                              mac_multi_tag_seq0.c_da_cnt==(port_stimulus_s[dmac].da_index);
							                      mac_multi_tag_seq0.c_sa_cnt==(port_stimulus_s[dmac].sa_index);
							                      mac_multi_tag_seq0.c_packet_len == 'd46;
							                      mac_multi_tag_seq0.c_tpid == 'd46;
							                      mac_multi_tag_seq0.c_preemptable==0;
							                      mac_multi_tag_seq0.c_data_payload ==0;
							                      mac_multi_tag_seq0.c_vlan == {phb,1'b0,vid};
												  
												  mac_multi_tag_seq0.c_selfdefine_tag_len ==4;
							                      mac_multi_tag_seq0.c_selfdefine_tag_data[0] == 0;
												  mac_multi_tag_seq0.c_selfdefine_tag_data[1] == 0;
												  mac_multi_tag_seq0.c_selfdefine_tag_data[2] == 0;
												  mac_multi_tag_seq0.c_selfdefine_tag_data[3] == 0;
												  mac_multi_tag_seq0.c_selfdefine_tpid == `CB_ETYPE;
	                                             } )) 
        begin
		 `uvm_error(get_type_name, "Randomize Failed!") 
		end		
		mac_multi_tag_seq0.start(pcs_tx_rx_env0.mac_env0[dmac].mac_rx_agent0.sequencer);
	 end
	 
	 begin
	 for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
	    item_config0.tagged_size   = $urandom_range(3,4);
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
		mac_multi_tag_seq0.start(pcs_tx_rx_env0.mac_env0[source_port].mac_rx_agent0.sequencer);
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

port_stimulus_s[source_port].port_en = 1;  
port_stimulus_s[dmac].port_en = 1;


port_stimulus_s[source_port].sa_index = source_port;   
port_stimulus_s[dmac].sa_index = dmac; 


port_stimulus_s[source_port].da_index =   dmac;//(19- 0);   
port_stimulus_s[dmac].da_index =   source_port;//(19- 0);   


port_stimulus_s[source_port].packet_count = 100; 
port_stimulus_s[dmac].packet_count = 1; 
endfunction 

virtual function set_item_config_value();
 item_config0.eth_item_payload=`ASSIGN_ALL_BYTE;
 item_config0.tagged_size   = 4;
endfunction
  
virtual function set_i_epp_predefine_value();

 `ING_FLOW_TABLE.table_size=4;
 `ING_FLOW_PRO_TABLE.table_index = new[`ING_FLOW_PRO_TABLE.table_size];
   foreach(`ING_FLOW_PRO_TABLE.table_index[key])
      `ING_FLOW_PRO_TABLE.table_index[key] = new();	  
  `ING_FLOW_TABLE_CONTENT[0].table_key_t={source_port[4:0],vid[11:0],dmac[47:0]};     //ivlan
  `ING_FLOW_TABLE_CONTENT[0].table_t={1'b1,4'b0,ingress_flow_id[9:0]};     //"1'b1-配置有效,保留,ingress flow_id
  `ING_FLOW_TABLE_CONTENT[1].table_key_t={source_port1[4:0],vid[11:0],dmac[47:0]};     //ivlan
  `ING_FLOW_TABLE_CONTENT[1].table_t={1'b1,4'b0,ingress_flow_id[9:0]};     //"1'b1-配置有效,保留,ingress flow_id
  `ING_FLOW_TABLE_CONTENT[2].table_key_t={source_port[4:0],default_vid[11:0],dmac[47:0]};     //ivlan
  `ING_FLOW_TABLE_CONTENT[2].table_t={1'b1,4'b0,ingress_flow_id[9:0]};     //"1'b1-配置有效,保留,ingress flow_id
  `ING_FLOW_TABLE_CONTENT[3].table_key_t={source_port1[4:0],default_vid[11:0],dmac[47:0]};     //ivlan
  `ING_FLOW_TABLE_CONTENT[3].table_t={1'b1,4'b0,ingress_flow_id[9:0]};     //"1'b1-配置有效,保留,ingress flow_id

  `FRER_REC_TABLE.table_size=1;
  `FRER_REC_TABLE.table_index = new[`FRER_REC_TABLE.table_size];
   foreach(`FRER_REC_TABLE.table_index[key])
      `FRER_REC_TABLE.table_index[key] = new();	  
  `FRER_REC_TABLE_CONTENT[0].table_key_t={ingress_flow_id};     // 
  `FRER_REC_TABLE_CONTENT[0].table_t={1'b1,5'b0,rec_algorithm,listener_agent,136'b0};     //[143]    :valid
                                                //[142:138]:rsv[4:0]
                                                //[137]    :rec_algorithm
                                                //[136]    :listener_agent
                                                //[135:0]  :sq0_valid,seq_id_0[15:0],…,sq7_valid,seq_id_7[15:0]


  `L2_MAC_TABLE.table_size=2;
  `L2_MAC_TABLE.table_index = new[`L2_MAC_TABLE.table_size];
   foreach(`L2_MAC_TABLE.table_index[key])
      `L2_MAC_TABLE.table_index[key] = new();	  
  `L2_MAC_TABLE_CONTENT[0].table_key_t={vid[11:0],dmac[47:0]};     //ivlan
  `L2_MAC_TABLE_CONTENT[0].table_t={1'b1,5'b0,1'b1,1'b0,1'b0,2'b10,virtual_port[8:0]};     //[19]   :valid
                                                                                   //[18:14]:rsv[4:0]
                                                                                   //[13]   :static
                                                                                   //[12]   :src_discard
                                                                                   //[11]   :dst_discard
                                                                                   //[10:9] :dst_type[1:0]
                                                                                   //[8 :0] :destination[8:0],
  
  `L2_MAC_TABLE_CONTENT[1].table_key_t={default_vid[11:0],dmac[47:0]};     //ivlan
  `L2_MAC_TABLE_CONTENT[1].table_t={1'b1,5'b0,1'b1,1'b0,1'b0,2'b10,virtual_port[8:0]};     //[19]   :valid
                                                                                   //[18:14]:rsv[4:0]
                                                                                   //[13]   :static
                                                                                   //[12]   :src_discard
                                                                                   //[11]   :dst_discard
                                                                                   //[10:9] :dst_type[1:0]
                                                                                   //[8 :0] :destination[8:0],
																				   
  `OUT_FP_TABLE.table_size=1;
  `OUT_FP_TABLE.table_index = new[`OUT_FP_TABLE.table_size];
   foreach(`OUT_FP_TABLE.table_index[key])
      `OUT_FP_TABLE.table_index[key] = new();	  
  `OUT_FP_TABLE_CONTENT[0].table_key_t={virtual_port[8:0]};     //ivlan
  `OUT_FP_TABLE_CONTENT[0].table_t={1'b1,6'b0,sq_en,w_valid,10'b0,w_fp_oport[4:0],16'b0,p_valid,10'b0,p_fp_oport[4:0],16'b0};     //[71]   :valid
                                                                                   //[70:65]:rsv
                                                                                   //[64]   :sq_en
                                                                                   //[63]   :w_valid
                                                                                   //[62:53]:rsv
                                                                                   //[52:48]:w_fp_oport[4:0]
                                                                                   //[47:32]:rsv[15:0]
                                                                                   //[31]   :p_valid
                                                                                   //[30:21]:rsv
                                                                                   //[20:16]:p_fp_oport[4:0]
                                                                                   //[15:0] :rsv[15:0]
  
endfunction  

  virtual function void set_topology_config();
    topology_config0.compare_enable = 0;
	topology_config0.compare_enable[test_port_index] = 1;
  endfunction
  
  virtual function void set_1cb_config();
    `CB_CONFIG.table_size=1;
    `CB_CONFIG.table_index = new[`CB_CONFIG.table_size];
     foreach(`CB_CONFIG.table_index[key])
      `CB_CONFIG.table_index[key] = new();
	  
	`CB_CONFIG_CONTENT[0].cb_valid       =1;
	`CB_CONFIG_CONTENT[0].rec_algorithm  =0;
    `CB_CONFIG_CONTENT[0].listener_agent =0;
    `CB_CONFIG_CONTENT[0].sq_en          =0;
    `CB_CONFIG_CONTENT[0].w_valid        =1;
    `CB_CONFIG_CONTENT[0].w_fp_oport     =dmac;
    `CB_CONFIG_CONTENT[0].p_valid        =0;
    `CB_CONFIG_CONTENT[0].p_fp_oport     =0;

  endfunction
endclass 