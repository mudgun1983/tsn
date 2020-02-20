`ifndef QBV_TEST_CASE1__SV
`define QBV_TEST_CASE1__SV
//in the case0,we aim to test that ,firstly we send one pkt,after 
//a certain time the gate open,so the pkt can send out,repeately
class qbv_test_case1 extends qbv_base_test;
	`uvm_component_utils(qbv_test_case1)
	extern function new(string name = "qbv_test_case1",uvm_component parent);
	extern virtual function set_port_stimulus_value();
	extern virtual function void build_phase(uvm_phase phase);
	extern virtual task run_phase(uvm_phase phase);
endclass:qbv_test_case1
function qbv_test_case1::new(string name = "qbv_test_case1",uvm_component parent);
	super.new(name,parent);
endfunction
function qbv_test_case1::set_port_stimulus_value();
    int dut_max_port;
    dut_max_port = `DUT_MAX_PORT-1;
     for(int i=0; i<20;i++)
       begin
        port_stimulus_s[i] = 0;
       end

 port_stimulus_s[source_port].port_en = 1;
 port_stimulus_s[dmac].port_en = 1;

 port_stimulus_s[dmac].packet_count = 1;  //0: forever
 port_stimulus_s[source_port].packet_count = m_pkt_cfg.m_cycle_round_num;

 port_stimulus_s[source_port].sa_index = source_port;
 port_stimulus_s[dmac].sa_index = dmac;

 port_stimulus_s[source_port].da_index =  dmac;
 port_stimulus_s[dmac].da_index =  source_port;
 endfunction

 function void qbv_test_case1::build_phase(uvm_phase phase);
 	obm_dut_cfg test_cfg;
 	super.build_phase(phase);
	set_type_override_by_type(obm_dut_cfg::get_type(),obm_case0_cfg::get_type());
	/*test_cfg = obm_dut_cfg::type_id::create("test_cfg");
	test_cfg.randomize();
	`uvm_info(get_type_name(),$psprintf("start to test obm_dut_cfg"),UVM_NONE);
	test_cfg.print();*/
 endfunction:build_phase

task qbv_test_case1::run_phase(uvm_phase phase);

bit[15:0] vlan = item_config0.e_mac_vlan[dmac];
bit[2:0]  vlan_pri;
int       delay_time;
int       timeout_cnt;
bit       send_en;

phase.raise_objection( this );
   	fork
        //basic_run_monitor(phase);

        begin
	    	//#140us;
	    	`ifndef DUMMY_DUT
	 		dut_if0.init_finish(init_finish);
			`uvm_info(get_type_name(),$psprintf("init_finish is %0d",init_finish),UVM_NONE);
	 		`else
     		`endif
			`uvm_info(get_type_name(),$psprintf("start to cfg qbv_reg_seq"),UVM_NONE);
    		reg_seq.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
			`uvm_info(get_type_name(),$psprintf("ended to cfg qbv_reg_seq"),UVM_NONE);
       		//use for L2 MAC learn
			for(int i =0;i<8;i++)begin
       		if ( !(mac_user_sequence0.randomize() with {
            	                               mac_user_sequence0.c_da_cnt==(port_stimulus_s[dmac].da_index);
                	                           mac_user_sequence0.c_sa_cnt==(port_stimulus_s[dmac].sa_index);
                    	                       mac_user_sequence0.c_packet_len == 'd46;
                        	                   mac_user_sequence0.c_tpid == 'd46;
                            	               mac_user_sequence0.c_preemptable==0;
                                	           mac_user_sequence0.c_data_payload ==0;
                                    	       //mac_user_sequence0.c_vlan == {phb,1'b0,vid};
                                    	       mac_user_sequence0.c_vlan == {i[2:0],1'b0,vid};
                                        	   } ))
       		begin
        		  `uvm_error(get_type_name(), "Randomize Failed!")
       		end
       		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[dmac].mac_rx_agent0.sequencer);
			end
			`uvm_info(get_type_name(),$psprintf("L2 mac learn has done"),UVM_NONE);
	 	end

	join

	//here start to send pkt
	//here waiting for this is to make sure the gate_state is ok
	//we may need to add one mode to decide wait this or not
    //wait(pcs_tx_rx_env0.m_obm_env.m_crllist_mon[0].m_start_chk_en[0] == 1'b1);
	//`uvm_info(get_type_name(),$psprintf("start to wait time"),UVM_NONE);
	//delay_time = $urandom_range(200,500);
	//#delay_time;
	wait(pcs_tx_rx_env0.m_obm_env.m_crllist_mon[0].m_amd2opr_cnt == 1);
	send_en = 1'b0;
	`uvm_info(get_type_name(),$psprintf("start to wait time"),UVM_NONE);
	delay_time = $urandom_range(20,50);
	#delay_time;

	//in the case1,we send more than one pkt in the interval,the pkt num is in the range of (2,5)
	//the max pky len is 1518,so we need to 
	fork 
		begin 
			while(1)begin 
				#1ns;
				timeout_cnt++;
				if(timeout_cnt >= 150000)begin 
					`uvm_fatal(get_type_name(),$psprintf("it's a long time to quit"));
				end
				if(send_en == 1'b1)begin 
					timeout_cnt = 0;
					break;
				end
			end
		end
		begin 
			wait((pcs_tx_rx_env0.m_obm_env.m_crllist_mon[0].change_second_to_ns(pcs_tx_rx_env0.m_obm_env.m_crllist_mon[0].bus.m_timestamp) + 7000) >= (pcs_tx_rx_env0.m_obm_env.m_crllist_mon[0].m_local_cfg.m_spare_total_base_time));
			send_en = 1'b1;
			`uvm_info(get_type_name(),$psprintf("has waitted time to send pkt"),UVM_NONE);
		end
	join_any
	`uvm_info(get_type_name(),$psprintf("start to send pkt,port_stimulus_s[%0d].packet_count is %0d",source_port,port_stimulus_s[source_port].packet_count),UVM_NONE);
	fork 
		for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
			//data_len = $urandom_range(1500,1500);
			for(int j=0;j<m_pkt_cfg.m_pkt_num;j++)begin
    			data_len = m_pkt_cfg.m_pkt_len;
    			vlan_pri = $urandom_range(3'h0,3'h0);
           		if ( !(mac_user_sequence0.randomize() with {
                	                               mac_user_sequence0.c_da_cnt==(port_stimulus_s[source_port].da_index);
                    	                           mac_user_sequence0.c_sa_cnt==(port_stimulus_s[source_port].sa_index);
                        	                       mac_user_sequence0.c_packet_len == data_len;
                            	                   mac_user_sequence0.c_tpid == data_len[15:0];
                                	               mac_user_sequence0.c_preemptable==0;
                                    	           mac_user_sequence0.c_data_payload == data_payload;
                                        	       //mac_user_sequence0.c_vlan == {phb,1'b0,vid};
                                        	       mac_user_sequence0.c_vlan == {vlan_pri,1'b0,vid};
                                            	   } ))
           		begin
            		  `uvm_error(get_type_name(), "Randomize Failed!")
           		end
    			data_payload ++;
           		mac_user_sequence0.start(pcs_tx_rx_env0.mac_env0[source_port].mac_rx_agent0.sequencer);
    			`uvm_info(get_type_name(),$psprintf("start to send round_num is %0d,pkt_num is %0d,wait time is 0x%0h",i,j,pcs_tx_rx_env0.m_obm_dut_cfg.m_spare_total_cyc_time),UVM_NONE);
    			//here dec 5000 is for send pkt need time
			end
			#(pcs_tx_rx_env0.m_obm_dut_cfg.m_spare_total_cyc_time - 100);
			`uvm_info(get_type_name(),$psprintf("send pkt_num is %0d done",i),UVM_NONE);
		end
		begin 
			pcs_tx_rx_env0.m_obm_env.wait_end_sim();
		end
	join

	//here is for end_of_sim_chk
	foreach(pcs_tx_rx_env0.m_obm_env.m_crllist_mon[i])begin 
		if(pcs_tx_rx_env0.m_obm_env.m_crllist_mon[i].m_cmp_list_num == 0)begin 
			`uvm_error(get_type_name(),$psprintf("m_cmp_list_num should not be 0"));
		end
		else begin 
			`uvm_info(get_type_name(),$psprintf("m_cmp_list_num is %0d",pcs_tx_rx_env0.m_obm_env.m_crllist_mon[i].m_cmp_list_num),UVM_NONE);
		end
	end
	get_mac_tx_dly();
phase.drop_objection(this);

endtask:run_phase
`endif
