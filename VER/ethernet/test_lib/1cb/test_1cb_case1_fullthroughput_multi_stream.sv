class test_1cb_case1_fullthroughput_multi_stream extends simple_1cb_smoke_test;
 
   `uvm_component_utils(test_1cb_case1_fullthroughput_multi_stream)
    mac_multi_tag_seq mac_multi_tag_seq1;
	mac_multi_tag_seq mac_multi_tag_seq_array[];
    function new(string name="test_1cb_case1_fullthroughput_multi_stream" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
		auto_stop_en = 1;
		test_port_index = 1;
		source_port     = 2;
		source_port1    = 3;
		vid             = 'h500;
		dmac            = 1;
		ingress_flow_id         = 'd1023;
		ingress_gate_id         = 'd511;
		phb             =3'd3;
		virtual_port    = 9'd511;		
		packet_count    = 'd100;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);   
	mac_multi_tag_seq1=mac_multi_tag_seq::type_id::create("mac_multi_tag_seq1", this);  
	mac_multi_tag_seq_array = new[`MAX_PORT_NUM];
	foreach(mac_multi_tag_seq_array[key])
	mac_multi_tag_seq_array[key] = new();
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
	 //use for L2 MAC learn
/*         if ( !(mac_multi_tag_seq0.randomize() with {
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
	 
	 begin */
	 for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
	    item_config0.tagged_size   = $urandom_range(2,4);
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
        
		//mac_multi_tag_seq1.randomize();
		foreach(mac_multi_tag_seq_array[key])
		  begin
            mac_multi_tag_seq_array[key].copy(mac_multi_tag_seq0);
			mac_multi_tag_seq_array[key].c_sa_cnt = key/2;
		  end
		`uvm_info(get_type_name(),{$psprintf("get tran eth_frame_trans:\n"),mac_multi_tag_seq1.sprint()},UVM_HIGH);
		
		fork
		begin:start_process
		for(int i =0; i<`MAX_PORT_NUM;i++)
		  begin
		    automatic int index;
            index = i; 
		    fork
			  if(port_stimulus_s[index].port_en)
			   begin
	             mac_multi_tag_seq_array[index].start(pcs_tx_rx_env0.mac_env0[index].mac_rx_agent0.sequencer);
                 //$display("port_stimulus_s[%0d].port_en=%0b T=%0t",index,port_stimulus_s[index].port_en,$time);
			   end	
            join_none			
          end	
		  $display("before wait fork");
          wait fork;          		
		  $display("after wait fork");
		end:start_process
		join
		
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
	   
	   if(comp_success_count[test_port_index]!=packet_count*4 || packet_count==0)
		  begin
		    test_fail=1;
			$display("comp_success_count[%0d]=%0d",test_port_index,comp_success_count[test_port_index]);
		  end
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
    for(int i =2;i<`MAX_PORT_NUM;i++)
	  port_stimulus_s[i].port_en = 1; 

    port_stimulus_s[dmac].port_en = 0;

    foreach(port_stimulus_s[key])
       port_stimulus_s[key].sa_index = key;   

    port_stimulus_s[dmac].sa_index = dmac; 

    foreach(port_stimulus_s[key])
       port_stimulus_s[key].da_index = dmac; 
 
    port_stimulus_s[dmac].da_index =   source_port;//(19- 0);   

    foreach(port_stimulus_s[key])
       port_stimulus_s[key].packet_count = packet_count; 

    port_stimulus_s[dmac].packet_count = 1; 
endfunction 

virtual function set_item_config_value();
 item_config0.eth_item_payload=`ASSIGN_FIRST_BYTE;//`ASSIGN_ALL_BYTE;// 
 item_config0.tagged_size   = 4;
endfunction
  
virtual function set_i_epp_predefine_value();
  super.set_i_epp_predefine_value(); 
   `ING_FLOW_TABLE.table_size=16;
   `ING_FLOW_TABLE.table_index = new[`ING_FLOW_TABLE.table_size];
   foreach(`ING_FLOW_TABLE.table_index[key])
      `ING_FLOW_TABLE.table_index[key] = new();	 
  for(int i=0;i<8;i++)
    begin
	    ingress_flow_id = i/2;
	    `ING_FLOW_TABLE_CONTENT[i].table_key_t={(i[4:0]+5'd2),vid[11:0],dmac[47:0]};     //ivlan
        `ING_FLOW_TABLE_CONTENT[i].table_t={1'b1,4'b0,ingress_flow_id[9:0]};     //"1'b1-配置有效,保留,ingress flow_id
		`ING_FLOW_TABLE_CONTENT[i+8].table_key_t={(i[4:0]+5'd2),default_vid[11:0],dmac[47:0]};     //ivlan
        `ING_FLOW_TABLE_CONTENT[i+8].table_t={1'b1,4'b0,ingress_flow_id[9:0]};     //"1'b1-配置有效,保留,ingress flow_id
	end
	
  `FRER_REC_TABLE.table_size=4;
  `FRER_REC_TABLE.table_index = new[`FRER_REC_TABLE.table_size];
   foreach(`FRER_REC_TABLE.table_index[key])
      `FRER_REC_TABLE.table_index[key] = new();	 
   for(int i =0;i<=ingress_flow_id;i++)begin
  `FRER_REC_TABLE_CONTENT[i].table_key_t={i[9:0]};     // 
  `FRER_REC_TABLE_CONTENT[i].table_t={1'b1,5'b0,rec_algorithm,listener_agent,136'b0};     //[143]    :valid
                                                //[142:138]:rsv[4:0]
                                                //[137]    :rec_algorithm
                                                //[136]    :listener_agent
                                                //[135:0]  :sq0_valid,seq_id_0[15:0],…,sq7_valid,seq_id_7[15:0]
    end
endfunction  

  virtual function void set_topology_config();
    topology_config0.compare_enable = 0;
	topology_config0.compare_enable[test_port_index] = 1;
  endfunction
  
  virtual function void set_1cb_config();
     super.set_1cb_config();
    `CB_CONFIG_CONTENT[0].listener_agent =1;
  endfunction
endclass 