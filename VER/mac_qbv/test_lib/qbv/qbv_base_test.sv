`ifndef QBV_BASE_TEST__SV
`define QBV_BASE_TEST__SV
class qbv_base_test extends pcs_base_test;
	`uvm_component_utils(qbv_base_test)
	qbv_reg_seq        reg_seq;
	mac_user_sequence mac_user_sequence0;
	obm_pkt_cfg        m_pkt_cfg;
	qbv_cnt_seq        m_cnt_seq;
	qbv_gate_crl_seq   m_gate_crl_seq;
	bit [31:0]         m_dut_rx_pkt_cnt[8];
     bit [4:0] 	source_port;
     bit [11:0]	vid;
	 bit [47:0] dmac;
	 bit [2:0]  phb;
	 bit [7:0]  data_payload;
	 int        data_len;
	 bit      init_finish;

	extern function new(string name = "qbv_base_test",uvm_component parent);
	extern virtual function void build_phase(uvm_phase phase);
	extern virtual task configure_phase(uvm_phase phase);
	extern virtual function set_port_stimulus_value();
	extern virtual function set_i_epp_predefine_value();
	extern virtual task run_phase(uvm_phase phase);
	extern virtual function void end_of_elaboration_phase(uvm_phase phase);
	extern virtual function void get_mac_tx_dly();
	extern virtual function void pkt_cnt_cmp();
endclass

function qbv_base_test::new(string name = "qbv_base_test",uvm_component parent);
	super.new(name,parent);
	source_port = 0;
	vid         = 'h500;
	dmac        = 2;
	phb         = 3;
	reg_seq    = qbv_reg_seq::type_id::create("reg_seq", this);
	mac_user_sequence0=mac_user_sequence::type_id::create("mac_user_sequence0", this);
	m_pkt_cfg = new("m_pkt_cfg");
	m_cnt_seq    = qbv_cnt_seq::type_id::create("m_cnt_seq", this);
	m_gate_crl_seq    = qbv_gate_crl_seq::type_id::create("m_gate_crl_seq", this);
endfunction

function void qbv_base_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
    //reg_seq.m_obm_dut_cfg =  pcs_tx_rx_env0.m_obm_dut_cfg;
endfunction:build_phase

function void qbv_base_test::end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
    reg_seq.m_obm_dut_cfg =  pcs_tx_rx_env0.m_obm_dut_cfg;
    m_gate_crl_seq.m_obm_dut_cfg =  pcs_tx_rx_env0.m_obm_dut_cfg;
endfunction:end_of_elaboration_phase



task qbv_base_test::configure_phase(uvm_phase phase);
	super.configure_phase(phase);
	phase.raise_objection(this);
    //#150us;
	//`uvm_info(get_type_name(),$psprintf("start to cfg qbv_reg_seq"),UVM_NONE);
    //reg_seq.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	//`uvm_info(get_type_name(),$psprintf("ended to cfg qbv_reg_seq"),UVM_NONE);
	phase.drop_objection(this);
endtask:configure_phase

function qbv_base_test::set_port_stimulus_value();
    int dut_max_port;
    dut_max_port = `DUT_MAX_PORT-1;
     for(int i=0; i<20;i++)
       begin
        port_stimulus_s[i] = 0;
       end

 port_stimulus_s[source_port].port_en = 1;
 port_stimulus_s[dmac].port_en = 1;

 port_stimulus_s[dmac].packet_count = 1;  //0: forever
 port_stimulus_s[source_port].packet_count = m_pkt_cfg.m_pkt_num;

 port_stimulus_s[source_port].sa_index = source_port;
 port_stimulus_s[dmac].sa_index = dmac;

 port_stimulus_s[source_port].da_index =  dmac;
 port_stimulus_s[dmac].da_index =  source_port;
 endfunction

function qbv_base_test:: set_i_epp_predefine_value();
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

endfunction:set_i_epp_predefine_value

task qbv_base_test::run_phase(uvm_phase phase);

bit[15:0] vlan = item_config0.e_mac_vlan[dmac];
bit[2:0]  vlan_pri;
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
    wait(pcs_tx_rx_env0.m_obm_env.m_crllist_mon[0].m_start_chk_en[0] == 1'b1);
	`uvm_info(get_type_name(),$psprintf("start to wait time"),UVM_NONE);
	#500ns;
	`uvm_info(get_type_name(),$psprintf("start to send pkt,port_stimulus_s[%0d].packet_count is %0d",source_port,port_stimulus_s[source_port].packet_count),UVM_NONE);
	fork 
		for(int i=0;i<port_stimulus_s[source_port].packet_count; i++)begin
			data_len = $urandom_range(46,255);
			vlan_pri = $urandom_range(3'h0,3'h7);
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

	m_cnt_seq.start(pcs_tx_rx_env0.cpu_agent0.sequencer);
	//we need to adding some delay
	#100000ns;
	pkt_cnt_cmp();
phase.drop_objection(this);

endtask:run_phase

function void qbv_base_test::get_mac_tx_dly();
	int   min_lat,max_lat;
	if(pcs_tx_rx_env0.m_obm_env.m_pkt_cfg.m_mac_tx_chk_en == 1'b0)begin 
		return;
	end
	foreach(pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i])begin 
		for(int j=0;j<m_pkt_cfg.m_pkt_num;j++)begin 
            pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_lat_q.push_back(pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_q[j] - pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_gate_open_q[j]);
			`uvm_info(get_type_name(),$psprintf("pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[%0d].m_mac_tx_lat_q[%0d] is %0d",i,j,pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_lat_q[j]),UVM_NONE);
		end
	end
	//
	foreach(pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i])begin 
		min_lat = pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_lat_q[0];
		max_lat = pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_lat_q[0];
		for(int j=1;j<m_pkt_cfg.m_pkt_num;j++)begin 
			if(pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_lat_q[j] < min_lat)begin 
				min_lat = pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_lat_q[j];
			end
			if(pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_lat_q[j] > max_lat)begin 
				max_lat = pcs_tx_rx_env0.m_obm_env.m_mac_tx_mon[i].m_mac_tx_lat_q[j];
			end
		end
		`uvm_info(get_type_name(),$psprintf("min_lat is %0d,max_lat is %0d",min_lat,max_lat),UVM_NONE);
	end
endfunction:get_mac_tx_dly

function void qbv_base_test::pkt_cnt_cmp();
	foreach(pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_mac_rm_cnt[i])begin 
		if(pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_mac_rm_cnt[i] != m_cnt_seq.m_obm_reg_rx_pkt[i])begin 
			`uvm_error(get_type_name(),$psprintf("pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_mac_rm_cnt[%0d] is 0x%0h,m_cnt_seq.m_obm_reg_rx_pkt[%0d] is 0x%0h",i,pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_mac_rm_cnt[i],i,m_cnt_seq.m_obm_reg_rx_pkt[i]));
		end
	end

	foreach(m_cnt_seq.m_obm_reg_tx_emac_pkt[i])begin 
		if(m_cnt_seq.m_obm_reg_tx_emac_pkt[i] != pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_tx_emac_pkt_cnt[i])begin 
			`uvm_error(get_type_name(),$psprintf("m_cnt_seq.m_obm_reg_tx_emac_pkt[%0d] is 0x%0h,m_cnt_seq.m_obm_tx_emac_pkt_cnt[%0d] is 0x%0h",i,m_cnt_seq.m_obm_reg_tx_emac_pkt[i],i,pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_tx_emac_pkt_cnt[i]));
		end
	end

	foreach(m_cnt_seq.m_obm_reg_tx_emac_byte[i])begin 
		if(m_cnt_seq.m_obm_reg_tx_emac_byte[i] != pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_tx_emac_pkt_byte[i])begin 
			`uvm_error(get_type_name(),$psprintf("m_cnt_seq.m_obm_reg_tx_emac_byte[%0d] is 0x%0h,m_cnt_seq.m_obm_tx_emac_pkt_byte[%0d] is 0x%0h",i,m_cnt_seq.m_obm_reg_tx_emac_byte[i],i,pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_tx_emac_pkt_byte[i]));
		end
	end

	foreach(m_cnt_seq.m_obm_reg_tx_pmac_pkt[i])begin 
		if(m_cnt_seq.m_obm_reg_tx_pmac_pkt[i] != pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_tx_pmac_pkt_cnt[i])begin 
			`uvm_error(get_type_name(),$psprintf("m_cnt_seq.m_obm_reg_tx_pmac_pkt[%0d] is 0x%0h,m_cnt_seq.m_obm_tx_pmac_pkt_cnt[%0d] is 0x%0h",i,m_cnt_seq.m_obm_reg_tx_pmac_pkt[i],i,pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_tx_pmac_pkt_cnt[i]));
		end
	end

	foreach(m_cnt_seq.m_obm_reg_tx_pmac_byte[i])begin 
		if(m_cnt_seq.m_obm_reg_tx_pmac_byte[i] != pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_tx_pmac_pkt_byte[i])begin 
			`uvm_error(get_type_name(),$psprintf("m_cnt_seq.m_obm_reg_tx_pmac_byte[%0d] is 0x%0h,m_cnt_seq.m_obm_tx_pmac_pkt_byte[%0d] is 0x%0h",i,m_cnt_seq.m_obm_reg_tx_pmac_byte[i],i,pcs_tx_rx_env0.m_obm_env.m_obm_sb.m_obm_tx_pmac_pkt_byte[i]));
		end
	end
endfunction:pkt_cnt_cmp

`endif

