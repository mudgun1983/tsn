class  full_instance_rcv_two_step_master extends full_instance_rcv_one_step_master;
 
   `uvm_component_utils(full_instance_rcv_two_step_master)
    
    function new(string name="full_instance_rcv_two_step_master" ,  uvm_component parent=null);
        super.new(name,parent);
        test_port_index= 5'd6;	
        TIME_OUT_INTERVAL = 10ms;		
		one_two_step=1;
     endfunction : new

task run_phase(uvm_phase phase);
   fork
     super.run_phase(phase);
	 
	 begin
	   while(1)
	    begin
		 #1us;
	     item_config0.tagged_size = $urandom_range(1,2);
		end
	 end
   join
endtask

virtual function set_ptp_predefine_value();
     super.set_ptp_predefine_value();
	 `PTP_CONFIG.table_size =1;
     `PTP_CONFIG.src_mac = 48'h8000_0000_0000;
     `PTP_CONFIG.two_step = one_two_step;//1： two step  0: one step
endfunction

virtual function set_port_stimulus_value();
    for(int i=0; i<`MAX_PORT_NUM;i++)
      begin
       port_stimulus_s[i].port_en = 0;
      end
        port_stimulus_s[test_port_index].port_en = 1;
	   port_stimulus_s[18].port_en = 0;
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
      end
       port_stimulus_s[18].da_index = `PTP_PEER_MULTI_DA;
endfunction     

virtual function set_item_config_value();
   super.set_item_config_value();
endfunction
endclass	 