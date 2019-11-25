// AUTHOR: wanggb@pcl.ac.cn

class pcs_base_test extends uvm_test;
 
   `uvm_component_utils(pcs_base_test)
 
    uvm_table_printer          printer;  

    pcs_tx_rx_env pcs_tx_rx_env0;
    register_config reg_config;
	topology_config topology_config0;
	cpu_config      cpu_config0;
    integer file_id;
    event tc_finish;
    event tc_fail;
    bit   auto_stop_en;
    int comp_success_count[];
	string global_test_log;
	string test_result_file;
	parameter test_port_index= 5'd2;
	int    TIME_OUT_INTERVAL=50ms; 
    function new(string name="pcs_base_test" ,  uvm_component parent=null);
        super.new(name,parent);
//       env_ec         = env_static_config::type_id::create("env_ec", this); 
//       set_config_object("*","static_cfg",env_ec,0);     
         reg_config = new();
		 
		 test_result_file = `test_result_file;
		 global_test_log = {get_type_name(),"_log.txt"};
		 file_id=$fopen(global_test_log,"w+");                                               
         $fclose(file_id);
		 auto_stop_en = 1; //default to enable auto stop when encounter fatal error
     endfunction : new
  
  virtual function void set_topology_config();
    topology_config0 =new();
  endfunction
  
  virtual function void set_cpu_config();
    cpu_config0 =new();
	cpu_config0.hold_cycles=15;
	cpu_config0.idle_cycles=10;
  endfunction
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
       printer = new();
       printer.knobs.depth = 6;

//  invoke config file
       set_i_epp_predefine_value();
	   set_ptp_predefine_value();
	   set_port_stimulus_value();	// define in the global_define.sv
	   set_port_ptp_instance_mapping();
//=================================set cpu agent config==========================================	
	   set_cpu_config();
       uvm_config_db #(cpu_config)::set(this, "*", "cpu_config",
       cpu_config0);   
	   
//=================================set top config==========================================
       set_topology_config();
       uvm_config_db #(topology_config)::set(this, "*", "topology_config",
       topology_config0);
	   
       pcs_tx_rx_env0 = pcs_tx_rx_env::type_id::create("pcs_tx_rx_env0", this); 

//=================================set register config==========================================

       uvm_config_db #(register_config)::set(this, "*", "register_config",
       reg_config);

//==================================scenario============================================       
       uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			            "default_sequence",
	       		    	scenario_reg_test::type_id::get());
//==================================scenario============================================         

//==================================rgm=================================================
//       set_config_int("pcs_tx_rx_env.cpu_agent0.sequencer","count",0);
//	    uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.cpu_agent0.sequencer.run_phase", 
//			        "default_sequence",
//				 reg_test_seq::type_id::get());
//====================================================================================== 

//===========//
//           //
//=== RX ====//
//           //
//===========//
//================================pcs_seq===================================================
        // uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.*.pcs_active_agent0.pcs_sequencer0.run_phase", 
			       // "default_sequence",
				// pcs_base_seq::type_id::get());
				// set_config_int("pcs_tx_rx_env0.*.pcs_active_agent0.pcs_sequencer0","count",0); 
//================================pcs_seq===================================================    

//================================mac_seq===================================================
        // uvm_config_db#(uvm_object_wrapper)::set(this,"*mac_env0.mac_rx_agent0.sequencer.run_phase", 
			        // "default_sequence",
				 // mac_user_sequence::type_id::get());
				 // set_config_int("*mac_env0.mac_rx_agent0.sequencer","count",0);
//================================pcs_seq=================================================== 
       
//================================ set_type_override =======================================
      //set_type_override_by_type(pcs_base_monitor::get_type(),pcs_monitor::get_type());         
      set_type_override_by_type(mac_rx_base_driver::get_type(),gmii_rx_driver::get_type());   
      set_type_override_by_type(mac_rx_base_monitor::get_type(),gmii_rx_monitor::get_type());  
      set_type_override_by_type(mac_tx_base_monitor::get_type(),gmii_tx_monitor::get_type());  
	  set_inst_override_by_type("*mac_env0[0]*mac_rx_agent0*", mac_rx_base_driver::get_type(), xgmii64_rx_driver::get_type() );
	  set_inst_override_by_type("*mac_env0[0]*mac_rx_agent0*", mac_rx_base_monitor::get_type(), xgmii64_rx_monitor::get_type() );
	  set_inst_override_by_type("*mac_env0[0]*mac_tx_agent0*", mac_tx_base_driver::get_type(), xgmii64_tx_driver::get_type() );
	  set_inst_override_by_type("*mac_env0[0]*mac_tx_agent0*", mac_tx_base_monitor::get_type(), xgmii64_tx_monitor::get_type() );
	  set_inst_override_by_type("*mac_env0[1]*mac_rx_agent0*", mac_rx_base_driver::get_type(), xgmii64_rx_driver::get_type() );
	  set_inst_override_by_type("*mac_env0[1]*mac_rx_agent0*", mac_rx_base_monitor::get_type(), xgmii64_rx_monitor::get_type() );
	  set_inst_override_by_type("*mac_env0[1]*mac_tx_agent0*", mac_tx_base_driver::get_type(), xgmii64_tx_driver::get_type() );
	  set_inst_override_by_type("*mac_env0[1]*mac_tx_agent0*", mac_tx_base_monitor::get_type(), xgmii64_tx_monitor::get_type() );
	  set_inst_override_by_type("*tsn_switch_model0*",  tsn_switch_model::get_type(), tsn_switch_expect_model::get_type() );
	  set_inst_override_by_type("*tsn_switch_model_monitor*",  tsn_switch_model::get_type(), tsn_switch_monitor_model::get_type() );
//================================ set_type_override =======================================
      comp_success_count =new[topology_config0.mac_number]; 
   endfunction : build_phase
  
  function void connect();

  endfunction
   
  function void end_of_elaboration();
    `uvm_info(get_type_name(),
      $psprintf("Printing the test topology :\n%s", this.sprint(printer)), UVM_HIGH)
  endfunction : end_of_elaboration    
    
   task run_phase(uvm_phase phase);
    fork
	   begin
	    for(int i=0;i<topology_config0.mac_number;i++)
		 begin
		   automatic int index;
           index = i;
	       fork
	         while(1)
		       begin
		        @this.pcs_tx_rx_env0.scb0[index].fatal_event;
		    	file_id=$fopen(global_test_log,"a+"); 
		    	$fwrite(file_id,$psprintf(" FATAL ERROR in scoreboard[%0d] \n",index));	
		    	$fclose(file_id);
				if(auto_stop_en)
				  begin
				   file_id=$fopen(test_result_file,"a+"); 
		    	   $fwrite(file_id,$psprintf({get_type_name()," FATAL FAIL\n"}));	
		    	   $fclose(file_id);
				  `uvm_fatal(get_type_name(),$psprintf("FATAL ERROR ptp_scb0[%0d]",index));
				  end
		       end
		   join_none
		 end
		  wait fork ;
	   end
	   
	   begin
	    for(int i=0;i<topology_config0.mac_number;i++)
		 begin
		   automatic int index;
           index = i;
	       fork
	         while(1)
		       begin
		        @this.pcs_tx_rx_env0.scb0[index].comp_success;
				comp_success_count[index]++;
		    	file_id=$fopen(global_test_log,"a+"); 
		    	$fwrite(file_id,$psprintf(" SUCCESS=%0d in scoreboard[%0d] \n",comp_success_count[index],index));	
		    	$fclose(file_id);
		       end
		   join_none
		 end
		  wait fork ;
	   end
	   
       begin
	    for(int i=0;i<topology_config0.mac_number;i++)
		 begin
		   automatic int index;
           index = i;
	       fork
	         while(1)
		       begin
		        @this.pcs_tx_rx_env0.ptp_scb0[index].comp_success;
				comp_success_count[index]++;
		    	file_id=$fopen(global_test_log,"a+"); 
		    	$fwrite(file_id,$psprintf(" SUCCESS=%0d in scoreboard[%0d] \n",comp_success_count[index],index));	
		    	$fclose(file_id);
		       end
		   join_none
		 end
		  wait fork ;
	   end
	   
	
	   begin
       phase.phase_done.set_drain_time(this, 50000);
       #TIME_OUT_INTERVAL;
	   //#100us;
	   if(comp_success_count[test_port_index]!=0)
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," PASS\n"}));	
		   $fclose(file_id);
		 end
	   else
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," FAIL\n"}));	
		   $fclose(file_id);
		 end
       $finish;      
	   end
	   
	join
   endtask:run_phase

  function void report_phase(uvm_phase phase);
    if(1) begin
      `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
    end
    else begin
      `uvm_error(get_type_name(), "** UVM TEST FAIL **")
    end
  endfunction

 virtual function set_port_stimulus_value();
    for(int i=0; i<20;i++)
      begin
       port_stimulus_s[i] = 0;
      end
  
// port_stimulus_s[0].port_en = 1;
// port_stimulus_s[1].port_en = 1;
port_stimulus_s[2].port_en = 1;
port_stimulus_s[3].port_en = 1;
port_stimulus_s[4].port_en = 1;
port_stimulus_s[5].port_en = 1;
port_stimulus_s[6].port_en = 1;
port_stimulus_s[7].port_en = 1;
port_stimulus_s[8].port_en = 1;
port_stimulus_s[9].port_en = 1;
port_stimulus_s[10].port_en = 1;
port_stimulus_s[11].port_en = 1;
port_stimulus_s[12].port_en = 1;
port_stimulus_s[13].port_en = 1;
port_stimulus_s[14].port_en = 1;
port_stimulus_s[15].port_en = 1;
port_stimulus_s[16].port_en = 1;
port_stimulus_s[17].port_en = 1;
port_stimulus_s[18].port_en = 1;
port_stimulus_s[19].port_en = 1;

port_stimulus_s[0].packet_count = 1;  //0: forever
port_stimulus_s[1].packet_count = 1;
//port_stimulus_s[2].packet_count = 1; //comment means no limit, it will generate packet forever
//port_stimulus_s[3].packet_count = 1;
//port_stimulus_s[4].packet_count = 1;
//port_stimulus_s[5].packet_count = 1;
//port_stimulus_s[6].packet_count = 1;
//port_stimulus_s[7].packet_count = 1;
//port_stimulus_s[8].packet_count = 1;
//port_stimulus_s[9].packet_count = 1;
//port_stimulus_s[10].packet_count = 1;
//port_stimulus_s[11].packet_count = 1;
//port_stimulus_s[12].packet_count = 1;
//port_stimulus_s[13].packet_count = 1;
//port_stimulus_s[14].packet_count = 1;
//port_stimulus_s[15].packet_count = 1;
//port_stimulus_s[16].packet_count = 1;
//port_stimulus_s[17].packet_count = 1;
//port_stimulus_s[18].packet_count = 1;
//port_stimulus_s[19].packet_count = 1;

port_stimulus_s[0].sa_index = 0;   
port_stimulus_s[1].sa_index = 1;
port_stimulus_s[2].sa_index = 2;  
port_stimulus_s[3].sa_index = 3;
port_stimulus_s[4].sa_index = 4;
port_stimulus_s[5].sa_index = 5;
port_stimulus_s[6].sa_index = 6;
port_stimulus_s[7].sa_index = 7;
port_stimulus_s[8].sa_index = 8;
port_stimulus_s[9].sa_index = 9;
port_stimulus_s[10].sa_index = 10;
port_stimulus_s[11].sa_index = 11;
port_stimulus_s[12].sa_index = 12;
port_stimulus_s[13].sa_index = 13;
port_stimulus_s[14].sa_index = 14;
port_stimulus_s[15].sa_index = 15;
port_stimulus_s[16].sa_index = 16;
port_stimulus_s[17].sa_index = 17;
port_stimulus_s[18].sa_index = 18;
port_stimulus_s[19].sa_index = 19;

port_stimulus_s[0].da_index =   0;//(19- 0);   
port_stimulus_s[1].da_index =   1;//(19- 1);
port_stimulus_s[2].da_index =   2;//(19- 2);  
port_stimulus_s[3].da_index =   3;//(19- 3);
port_stimulus_s[4].da_index =   4;//(19- 4);
port_stimulus_s[5].da_index =   5;//(19- 5);
port_stimulus_s[6].da_index =   6;//(19- 6);
port_stimulus_s[7].da_index =   7;//(19- 7);
port_stimulus_s[8].da_index =   8;//(19- 8);
port_stimulus_s[9].da_index =   9;//(19- 9);
port_stimulus_s[10].da_index = 10;//(19-10);
port_stimulus_s[11].da_index = 11;//(19-11);
port_stimulus_s[12].da_index = 12;//(19-12);
port_stimulus_s[13].da_index = 13;//(19-13);
port_stimulus_s[14].da_index = 14;//(19-14);
port_stimulus_s[15].da_index = 15;//(19-15);
port_stimulus_s[16].da_index = 16;//(19-16);
port_stimulus_s[17].da_index = 17;//(19-17);
port_stimulus_s[18].da_index = 18;//(19-18);
port_stimulus_s[19].da_index = 19;//(19-19);
endfunction     

virtual function set_ptp_predefine_value();
endfunction     

virtual function set_i_epp_predefine_value();
endfunction    

virtual function set_port_ptp_instance_mapping();
  foreach(port_ptp_instance_mapping_table[key])
     port_ptp_instance_mapping_table[key] = key;
endfunction 
endclass : pcs_base_test

