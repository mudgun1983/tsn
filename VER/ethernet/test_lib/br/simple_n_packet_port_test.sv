class simple_n_packet_port_test extends pcs_base_test;
 
   `uvm_component_utils(simple_n_packet_port_test)
 
    scenario_simple_e_p_random_packet_port_test scenario_simple_e_p_random_packet_port_test0;
	br_reg_seq br_reg_seq0;
    function new(string name="simple_n_packet_port_test" ,  uvm_component parent=null);
        super.new(name,parent); 
        //TIME_OUT_INTERVAL = 10us;
		//auto_stop_en = 0;
		test_port_index = 4;
     endfunction : new
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
//==================================scenario============================================       
        uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			             "default_sequence",
	       		    	 scenario_reg_test::type_id::get());
//==================================scenario============================================      
   scenario_simple_e_p_random_packet_port_test0=scenario_simple_e_p_random_packet_port_test::type_id::create("scenario_simple_e_p_random_packet_port_test0", this);  
   br_reg_seq0    = br_reg_seq::type_id::create("br_reg_seq0", this);  
   endfunction : build_phase
  
task configure_phase( uvm_phase phase);
     phase.raise_objection( this );
	 #150us;
     //scenario_simple_e_p_random_packet_port_test0.start(pcs_tx_rx_env0.virt_seqr);  //use to self learn the input port and output port
	 br_reg_seq0.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	 phase.drop_objection( this );
endtask
  
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration    
    
   task run_phase(uvm_phase phase);
     phase.raise_objection( this );
	 fork
	 super.run_phase(phase);
	 
	 begin
	 #140us;
	 port_stimulus_s[2].port_en = 0;
	 scenario_simple_e_p_random_packet_port_test0.start(pcs_tx_rx_env0.virt_seqr);
	 port_stimulus_s[2].port_en = 1;
	 port_stimulus_s[4].port_en = 0;
	 #60us;
	 scenario_simple_e_p_random_packet_port_test0.start(pcs_tx_rx_env0.virt_seqr);
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
 item_config0.p_mac_vlan = {3'd2,1'b0,12'h500};
 item_config0.e_mac_vlan = {3'd0,1'b0,12'h500};
endfunction
  
virtual function set_i_epp_predefine_value();
  `OBM_CONFIG.table_size=4;
   foreach(`OBM_CONFIG_CONTENT[key]) begin
      `OBM_CONFIG_CONTENT[key].queue_map=8'b00001100;     //b0,b1, emac, b2,b3, pmac
    end
	
   `IVLAN_PROPERTY_TABLE.table_size=1;
   foreach(`IVLAN_PROPERTY_TABLE_CONTENT[key]) begin
      begin
	    `IVLAN_PROPERTY_TABLE_CONTENT[key].table_key_t='h500;     //ivlan
		`IVLAN_PROPERTY_TABLE_CONTENT[key].table_t={1'b1,9'b0,1'b0,1'b0,1'b0,8'b0,32'h0000_001C};     //vlan_port_bitmap[31:0] ,port4,3,2
	  end
    end
	
	//key0=0 ，key1= 0，iph =0
	//key0=0 ，key1= 1，iph =1
    //key0=0 ，key1= 2，iph =2
    //key0=0 ，key1= 3，iph =3
    //key0=0 ，key1= 4，iph =0
    //key0=0 ，key1= 5，iph =1 
    //key0=0 ，key1= 6，iph =2
    //key0=0 ，key1= 7，iph =3
   `IPHB_TABLE.table_size=8;
   `IPHB_TABLE.table_index = new[`IPHB_TABLE.table_size];
    for(int i=0;i<`IPHB_TABLE.table_size;i++)
        `IPHB_TABLE.table_index[i] = new();
	foreach(`IPHB_TABLE_CONTENT[key]) begin
      begin
	    `IPHB_TABLE_CONTENT[key].table_key_t={4'b0,key[2:0]};     // iphb_ptr[3:0] ,ovlan_pri[2:0]
		`IPHB_TABLE_CONTENT[key].table_t=key[2:0]%4;              //vlan_port_bitmap[31:0]
	  end
    end
endfunction  


endclass 