class simple_qci_smoke_test extends pcs_base_test;
 
   `uvm_component_utils(simple_qci_smoke_test)
    virtual dut_if dut_if0;
	qci_reg_seq qci_reg_seq0;
	mac_user_sequence mac_user_sequence0;
	scenario_full_throughput_switch_test scenario_full_throughput_switch_test0;
	bit [4:0] source_port;
	bit [11:0]vid;
	bit [47:0] dmac;
	bit [9:0]  ingress_flow_id;
	bit [8:0]  ingress_gate_id;
	int        data_len;
	bit [63:0] base_time;
	bit [63:0] cycle_time;
	bit [31:0] time_slot_time0;
	bit [31:0] time_slot_time1;
	bit [7:0]  data_payload;
	bit [15:0] bypass_etype;
    bit [2:0]  phb;
	event      packet_trigger;
	event      packet_trigger2;
    function new(string name="simple_qci_smoke_test" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
		auto_stop_en = 1;
		test_port_index = 2;
		source_port     = 0;
		vid             = 'h500;
		dmac            = 2;
		ingress_flow_id         = 'd1023;
		ingress_gate_id         = 'd511;
		base_time       =64'd200000;  //200us
		cycle_time      =64'd50000;
		time_slot_time0 =32'd25000;
		time_slot_time1 =32'd20000;
		bypass_etype     =`BYPASS_ETYPE;
		phb             =3'd3;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);     
//=================================get dut if connected with DUT================================
        if( !uvm_config_db #(virtual dut_if )::get( this , "" , "dut_vif" ,dut_if0 ) ) begin
           `uvm_fatal(get_type_name(),"=============dut_if==========");
		end
		
//==================================scenario============================================       
        uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			             "default_sequence",
	       		    	 scenario_reg_test::type_id::get());
//==================================scenario============================================      
  
   qci_reg_seq0    = qci_reg_seq::type_id::create("qci_reg_seq0", this);  
   mac_user_sequence0=mac_user_sequence::type_id::create("mac_user_sequence0", this);  
   scenario_full_throughput_switch_test0  =  scenario_full_throughput_switch_test::type_id::create("mac_user_sequence0", this);  
   endfunction : build_phase
  
task configure_phase( uvm_phase phase);
     phase.raise_objection( this );
	 #150us;
     qci_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 phase.drop_objection( this );
endtask
  
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration    
    
   task run_phase(uvm_phase phase);
     bit[15:0] vlan = item_config0.e_mac_vlan[dmac];
     phase.raise_objection( this );
	 fork
	 basic_run_monitor(phase);
	 
	 begin
	 #100us;
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
	 #10us;  //for calibration
	 while(1)
	   begin
	    -> packet_trigger;
		#cycle_time;
	   end
	 end
	 
	 begin
	 #base_time;
	 #time_slot_time0;
	 while(1)
	   begin
	    -> packet_trigger2;
		#time_slot_time1;
	   end
	 end
	 
	 begin
	 //#base_time;
	 //while(1)begin
	 for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
		//dut_if0.monitor_gate_status(ingress_gate_id);
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
		//#time_slot_time0;
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

virtual function set_item_config_value();
 item_config0.eth_item_payload=`ASSIGN_ALL_BYTE;
 item_config0.p_mac_vlan[2] = {3'd2,1'b0,vid};
 item_config0.e_mac_vlan[2] = {3'd0,1'b0,vid};
 item_config0.p_mac_vlan[4] = {3'd2,1'b0,vid};
 item_config0.e_mac_vlan[4] = {3'd0,1'b0,vid};
endfunction
  
virtual function set_i_epp_predefine_value();

	
   `IVLAN_PROPERTY_TABLE.table_size=1;
   foreach(`IVLAN_PROPERTY_TABLE_CONTENT[key]) begin
      begin
	    `IVLAN_PROPERTY_TABLE_CONTENT[key].table_key_t='h500;     //ivlan
		`IVLAN_PROPERTY_TABLE_CONTENT[key].table_t={1'b1,9'b0,1'b0,1'b0,1'b0,8'b0,32'h0000_001F};     //vlan_port_bitmap[31:0] ,port4,3,2,1,0
	  end
    end
	
   `ING_FLOW_TABLE.table_size=1;
   foreach(`ING_FLOW_TABLE_CONTENT[key]) begin
      begin
	    `ING_FLOW_TABLE_CONTENT[key].table_key_t={source_port[4:0],vid[11:0],dmac[47:0]};     //ivlan
		`ING_FLOW_TABLE_CONTENT[key].table_t={1'b1,4'b0,ingress_flow_id[9:0]};     //"1'b1-配置有效,保留,ingress flow_id
	  end
    end
	
   `ING_FLOW_PRO_TABLE.table_size=8;
   `ING_FLOW_PRO_TABLE.table_index = new[`ING_FLOW_PRO_TABLE.table_size];
   foreach(`ING_FLOW_PRO_TABLE.table_index[key])
      `ING_FLOW_PRO_TABLE.table_index[key] = new();
	  
   foreach(`ING_FLOW_PRO_TABLE_CONTENT[key]) begin
      begin
	    `ING_FLOW_PRO_TABLE_CONTENT[key].table_key_t={key[2:0],ingress_flow_id[9:0]};     //
		`ING_FLOW_PRO_TABLE_CONTENT[key].table_t={1'b1,ingress_gate_id[8:0],1'b0,9'b0};   //  "1'b0-gate_id无效; 1'b1-gate_id有效。"ingress gate_id"1'b0-meter_id无效; 1'b1-meter_id有效。"
	  end
    end
	
   `ING_GATE_TABLE.table_size=2;
   `ING_GATE_TABLE.table_index = new[`ING_GATE_TABLE.table_size];
   foreach(`ING_GATE_TABLE.table_index[key])
      `ING_GATE_TABLE.table_index[key] = new();
	  
	    `ING_GATE_TABLE_CONTENT[0].table_key_t={0,ingress_gate_id[8:0]};     //time_slot=0 ,ingress gate_id
		`ING_GATE_TABLE_CONTENT[0].table_t={1'b1,7'd0,8'b1111_0111,1'b0,3'b0};   //  "1'b0-gate_id无效; 1'b1-gate_id有效。  0:open,1:close each bit indicate the phb value. eg, bit0 -> phb=0,bit7->phb=7
        `ING_GATE_TABLE_CONTENT[1].table_key_t={1,ingress_gate_id[8:0]};     //time_slot=0 ,ingress gate_id
		`ING_GATE_TABLE_CONTENT[1].table_t={1'b1,7'd0,8'b1111_1111,1'b0,3'b0};   //  "1'b0-gate_id无效; 1'b1-gate_id有效。  0:open,1:close each bit indicate the phb value. eg, bit0 -> phb=0,bit7->phb=7

	
   `TIME_SLOT_TABLE.table_size=2;
   `TIME_SLOT_TABLE.table_index = new[`TIME_SLOT_TABLE.table_size];
   foreach(`TIME_SLOT_TABLE.table_index[key])
      `TIME_SLOT_TABLE.table_index[key] = new();
	  
	    `TIME_SLOT_TABLE_CONTENT[0].table_key_t=0;       //time_slot = 0 
		`TIME_SLOT_TABLE_CONTENT[0].table_t={((time_slot_time0/8)-2)};// ((conf_slot_ram_wdata[31:0]+2)*8ns)  //25us;
        `TIME_SLOT_TABLE_CONTENT[1].table_key_t=1;       //time_slot = 1 
		`TIME_SLOT_TABLE_CONTENT[1].table_t={((time_slot_time1/8)-2)};//(conf_slot_ram_wdata[31:0]+2)*8ns)  //20us;
    `TIME_SLOT_TABLE.admin_base_time =base_time;//bit [63:0] admin_base_time;
	`TIME_SLOT_TABLE.admin_cycle_time=cycle_time;//bit [63:0] admin_cycle_time;
	`TIME_SLOT_TABLE.admin_slot_num  =4'd1;//bit [3:0]  admin_slot_num;
	
    //key0=0 ，key1= 0，iph =0
	//key0=0 ，key1= 1，iph =1
    //key0=0 ，key1= 2，iph =2
    //key0=0 ，key1= 3，iph =3
    //key0=0 ，key1= 4，iph =4
    //key0=0 ，key1= 5，iph =5 
    //key0=0 ，key1= 6，iph =6
    //key0=0 ，key1= 7，iph =7
   `IPHB_TABLE.table_size=8;
   `IPHB_TABLE.table_index = new[`IPHB_TABLE.table_size];
    for(int i=0;i<`IPHB_TABLE.table_size;i++)
        `IPHB_TABLE.table_index[i] = new();
	foreach(`IPHB_TABLE_CONTENT[key]) begin
      begin
	    `IPHB_TABLE_CONTENT[key].table_key_t={4'b0,key[2:0]};     // iphb_ptr[3:0] ,ovlan_pri[2:0]
		`IPHB_TABLE_CONTENT[key].table_t=key[2:0];              //
	  end
    end	
endfunction  

  virtual function void set_topology_config();
    topology_config0.compare_enable = 0;
	topology_config0.compare_enable[test_port_index] = 1;
  endfunction
endclass 