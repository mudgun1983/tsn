class  full_instance_rcv_one_step_master extends full_instance_one_step_master;
 
   `uvm_component_utils(full_instance_rcv_one_step_master)
    
    function new(string name="full_instance_rcv_one_step_master" ,  uvm_component parent=null);
        super.new(name,parent);
        test_port_index= 5'd7;	
        TIME_OUT_INTERVAL = 5ms;		
		one_two_step=0;
     endfunction : new
   
    task configure_phase( uvm_phase phase);
     phase.raise_objection( this );	 
     phase.drop_objection( this );
    endtask
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);      
    auto_stop_en = 1;	
//==================================scenario============================================       
        uvm_config_db#(uvm_object_wrapper)::set(this,"pcs_tx_rx_env0.virt_seqr.run_phase", 
			             "default_sequence",
	       		    	 scenario_ptp_rcv_smoke_test::type_id::get());
//==================================scenario============================================      

  //static config         
   endfunction : build_phase

virtual task main_phase(uvm_phase phase);
  
endtask

  task run_phase(uvm_phase phase);
    bit test_fail;
    fork
	   begin
	    for(int i=0;i<topology_config0.mac_number;i++)
		 begin
		   automatic int index;
           index = i;
	       fork
	         while(1)
		       begin
		        @this.pcs_tx_rx_env0.ptp_scb0[index].fatal_event;
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
       #5ms;
         //#100us;
	   foreach(port_stimulus_s[key])begin	 
	      if(port_stimulus_s[key].port_en)begin
		      if(comp_success_count[key]==0)
			     test_fail=1;
			  $display("comp_success_count[%0d]=%0d,test_fail=%0d",key,comp_success_count[key],test_fail);
			   end
		end
			   
/* 	   if(port_stimulus_s[18].port_en)begin
		    if(comp_success_count[18]==0)
			   test_fail=1;			
			$display("comp_success_count[18]=%0d",comp_success_count[18]);
		end */
			
	   //if(comp_success_count[test_port_index]!=0)
	   if(test_fail==0)
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," PASS\n"}));	
		   $fclose(file_id);
		   `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
		 end
	   else
	     begin
		   file_id=$fopen(test_result_file,"a+"); 
		   $fwrite(file_id,$psprintf({get_type_name()," FAIL\n"}));	
		   $fclose(file_id);
		   `uvm_error(get_type_name(), "** UVM TEST FAIL **")
		 end
       $finish;      
	   end
	   
	join
   endtask:run_phase
   
virtual function set_port_stimulus_value();
    for(int i=0; i<`MAX_PORT_NUM;i++)
      begin
       port_stimulus_s[i].port_en = 1;
      end
       
	   port_stimulus_s[18].port_en = 1;
	  // port_stimulus_s[3].port_en = 1;
//port_stimulus_s[0].packet_count = 1;  //0: forever
//port_stimulus_s[1].packet_count = 1;
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

for(int i=0; i<`MAX_PORT_NUM;i++)
      begin
       port_stimulus_s[i].da_index = `PTP_PEER_MULTI_DA;
	   port_stimulus_s[i].sa_index = i;
      end
       port_stimulus_s[18].da_index = `PTP_PEER_MULTI_DA;
	   port_stimulus_s[18].sa_index = 18;
endfunction     

virtual function set_ptp_predefine_value();
  `PTP_CONFIG.table_size =32;
  `PTP_CONFIG.src_mac = 48'h8000_0000_0000;
  `PTP_CONFIG.two_step = 0;//1： two step  0: one step
  //enable all the instance
  foreach(`PTP_CONFIG_CONTENT[key])
    `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  
  //modify the config	
  foreach(`PTP_CONFIG_CONTENT[key]) begin
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_valid = 1;
  `PTP_CONFIG_CONTENT[key].descriptor_trans.inst_type = 0; //0:master
  `PTP_CONFIG_CONTENT[key].descriptor_trans.two_step = one_two_step; //1： two step  0: one step
  `PTP_CONFIG_CONTENT[key].descriptor_trans.send_period =2 ;// scale is 100us
  
  `PTP_CONFIG_CONTENT[key].ptp_trans.packet_type     =    ptp_item::Sync;
  `PTP_CONFIG_CONTENT[key].ptp_trans.messageType     =    `Sync;
  `PTP_CONFIG_CONTENT[key].ptp_trans.flagField[9]     =    one_two_step;
  
  `PTP_CONFIG_CONTENT[key].eth_trans.destination_address = `PTP_NON_PEER_MULTI_DA;
  `PTP_CONFIG_CONTENT[key].eth_trans.source_address = key;
  `PTP_CONFIG_CONTENT[key].sys_trans.destination =  key;
  `PTP_CONFIG_CONTENT[key].sys_trans.sub_type	= `Sync;
  end
  
  //re-pack to update the value
  foreach(`PTP_CONFIG_CONTENT[key])  
	   begin
	     `PTP_CONFIG_CONTENT[key].pack();
		 `PTP_CONFIG_CONTENT[key].desc_pack();
		 `PTP_CONFIG_CONTENT[key].packed_padding();
	   end
endfunction 

virtual function set_i_epp_predefine_value();
 super.set_i_epp_predefine_value();
//master_node

  `RX_PTP_FORWARD_TABLE.table_size =`MAX_PORT_NUM+1;
  `RX_PTP_FORWARD_TABLE.table_index = new[`RX_PTP_FORWARD_TABLE.table_size];
  for(int i=0;i<`RX_PTP_FORWARD_TABLE.table_size;i++)
    `RX_PTP_FORWARD_TABLE.table_index[i] = new();
  
  foreach(`RX_PTP_FORWARD_TABLE_CONTENT[key])begin
  `RX_PTP_FORWARD_TABLE_CONTENT[key].table_key_t.message_type = `Pdelay_Req;
  `RX_PTP_FORWARD_TABLE_CONTENT[key].table_key_t.phy_port = key;
  `RX_PTP_FORWARD_TABLE_CONTENT[key].table_t.fw_destination = 2'b10;
  end
  
  `RX_PTP_FORWARD_TABLE_CONTENT[`MAX_PORT_NUM].table_key_t.message_type = `Pdelay_Req;
  `RX_PTP_FORWARD_TABLE_CONTENT[`MAX_PORT_NUM].table_key_t.phy_port = 30;
  `RX_PTP_FORWARD_TABLE_CONTENT[`MAX_PORT_NUM].table_t.fw_destination = 2'b10;


endfunction

virtual function set_port_ptp_instance_mapping();
  foreach(port_ptp_instance_mapping_table[key])
     port_ptp_instance_mapping_table[key] = key;
  
  port_ptp_instance_mapping_table[18] = 30; 
endfunction
   
endclass
