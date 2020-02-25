`ifndef OBM_SCOREBOARD__SV
`define OBM_SCOREBOARD__SV
class obm_scoreboard #(RM_NUM = 1,DUT_NUM = 2) extends base_scoreboard #(RM_NUM,DUT_NUM); 
	obm_mac_xaction          m_obm_mac_rm_q[8][$];
	obm_mac_xaction          m_obm_mac_dut_q[8][$];
	int                      m_obm_mac_rm_cnt[8];
	int                      m_obm_mac_dut_cnt[8];
	int                      m_obm_tx_pmac_pkt_cnt[8];
	int                      m_obm_tx_emac_pkt_cnt[8];
	int                      m_obm_tx_pmac_pkt_byte[8];
	int                      m_obm_tx_emac_pkt_byte[8];
	obm_dut_cfg              m_dut_cfg;
	//this is for check relation between pkt and gate_state
	//this gets from crllistmonitor
	obm_cmp_xaction          m_cmp_xaction;
	function new(string name = "obm_scoreboard",uvm_component parent);
		super.new(name,parent);
		//m_dut_cfg = new("m_dut_cfg");
		m_cmp_xaction = new("m_cmp_xaction");
	endfunction

	extern virtual function void build_phase(uvm_phase phase);
	//here we  may change it to main_phase later
	extern virtual task run_phase(uvm_phase phase);
	extern virtual task get_rm_data();
	extern virtual task get_dut_pdata();
	extern virtual task get_dut_edata();
	extern virtual task cmp_data_with_loss(int q_num);
	
endclass:obm_scoreboard

function void obm_scoreboard::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task obm_scoreboard::run_phase(uvm_phase phase);
	super.run_phase(phase);
	#1ns;
	`uvm_info(get_type_name(),$psprintf("enter obm_scoreboard run_phase"),UVM_NONE);
	fork
		get_rm_data();
		get_dut_pdata();
		get_dut_edata();
	join_none
	for(int k=0;k<8;k++)begin 
		fork
			automatic int cmp_num = k;
			cmp_data_with_loss(cmp_num);
		join_none
	end
	wait fork;
endtask:run_phase

task obm_scoreboard::get_rm_data();
	uvm_sequence_item seq_item;
    scatter_obm_xaction sca_xaction;
	obm_mac_xaction     mac_xaction;
	`uvm_info(get_type_name(),$psprintf("enter get_rm_data"),UVM_NONE);
	while(1)begin
		`uvm_info(get_type_name(),$psprintf("before get_rm_data"),UVM_NONE);
		rm_port[0].get(seq_item);
		`uvm_info(get_type_name(),$psprintf("after get_rm_data"),UVM_NONE);
		//sca_xaction = new();
		if(!$cast(sca_xaction,seq_item))begin 
			`uvm_fatal(get_type_name(),$psprintf("seq_item should be a extention of scatter_obm_xaction"));
		end
		mac_xaction = new();
		//mac_xaction.m_obm_mac_data = new[sca_xaction.m_scatter_obm_data];
		for(int i=0;i<sca_xaction.m_scatter_obm_data.size();i++)begin 
			mac_xaction.m_obm_mac_data.push_back(sca_xaction.m_scatter_obm_data[i]);
		end
		mac_xaction.m_obm_mac_err  = sca_xaction.m_scatter_obm_err;
		mac_xaction.m_obm_mac_ophb = sca_xaction.m_scatter_obm_ophb;
		//here we need basing on reg cfg
		mac_xaction.m_obm_mac_en   = m_dut_cfg.m_queue_map[mac_xaction.m_obm_mac_ophb];
        m_obm_mac_rm_cnt[mac_xaction.m_obm_mac_ophb] ++;
		`uvm_info(get_type_name(),$psprintf("get_rm_data get one xaction,m_obm_mac_rm_cnt[%0d] is %0d",mac_xaction.m_obm_mac_ophb,m_obm_mac_rm_cnt[mac_xaction.m_obm_mac_ophb]),UVM_NONE);
		mac_xaction.print();
		m_obm_mac_rm_q[mac_xaction.m_obm_mac_ophb].push_back(mac_xaction);
	end
endtask

task obm_scoreboard::get_dut_pdata();
	uvm_sequence_item  seq_item;
	obm_mac_xaction   mac_xaction;
	`uvm_info(get_type_name(),$psprintf("enter get_dut_pdata"),UVM_NONE);
	while(1)begin 
		dut_port[0].get(seq_item);
		mac_xaction = new();
		if(!$cast(mac_xaction,seq_item))begin 
			`uvm_fatal(get_type_name(),$psprintf("seq_item should be a extention of obm_mac_xaction"));
		end
		//mac_xaction.m_obm_mac_ophb = mac_xaction.m_obm_mac_data[14][7:5];
        m_obm_mac_dut_cnt[mac_xaction.m_obm_mac_ophb] ++;
		m_obm_tx_pmac_pkt_cnt[mac_xaction.m_obm_mac_ophb]++;
		m_obm_tx_pmac_pkt_byte[mac_xaction.m_obm_mac_ophb] = (m_obm_tx_pmac_pkt_byte[mac_xaction.m_obm_mac_ophb] + mac_xaction.m_obm_mac_data.size());
		`uvm_info(get_type_name(),$psprintf("get_dut_pdata get one xaction"),UVM_NONE);
		m_obm_mac_dut_q[mac_xaction.m_obm_mac_ophb].push_back(mac_xaction);

		//here is for data num check
		for(int i=0;i<mac_xaction.m_obm_mac_ptp.size();i++)begin 
			m_cmp_xaction.store_data_base_ptp(mac_xaction.m_obm_mac_ptp[i],mac_xaction.m_obm_mac_ophb);
		end
	end
endtask:get_dut_pdata

task obm_scoreboard::get_dut_edata();
	uvm_sequence_item  seq_item;
	obm_mac_xaction   mac_xaction;
	`uvm_info(get_type_name(),$psprintf("enter get_dut_edata"),UVM_NONE);
	while(1)begin 
		dut_port[1].get(seq_item);
		mac_xaction = new();
		if(!$cast(mac_xaction,seq_item))begin 
			`uvm_fatal(get_type_name(),$psprintf("seq_item should be a extention of obm_mac_xaction"));
		end
		//mac_xaction.m_obm_mac_ophb = mac_xaction.m_obm_mac_data[14][7:5];
		`uvm_info(get_type_name(),$psprintf("get_dut_edata get one xaction"),UVM_NONE);
		mac_xaction.print();
        m_obm_mac_dut_cnt[mac_xaction.m_obm_mac_ophb] ++;
		m_obm_tx_emac_pkt_cnt[mac_xaction.m_obm_mac_ophb]++;
		m_obm_tx_emac_pkt_byte[mac_xaction.m_obm_mac_ophb] = (m_obm_tx_emac_pkt_byte[mac_xaction.m_obm_mac_ophb] + mac_xaction.m_obm_mac_data.size());
		m_obm_mac_dut_q[mac_xaction.m_obm_mac_ophb].push_back(mac_xaction);

		//here is for data num check
		for(int i=0;i<mac_xaction.m_obm_mac_ptp.size();i++)begin 
			m_cmp_xaction.store_data_base_ptp(mac_xaction.m_obm_mac_ptp[i],mac_xaction.m_obm_mac_ophb);
		end
	end
endtask:get_dut_edata

task obm_scoreboard::cmp_data_with_loss(int q_num);
	int data_index;
	bit cmp_pass;
	int sel_num;
	`uvm_info(get_type_name(),$psprintf("cmp_data_with_loss q_num is %0d",q_num),UVM_NONE);
	while(1)begin
		wait(m_obm_mac_dut_q[q_num].size() > 0);
		cmp_pass = 1'b0;
		sel_num  = 0;
		if(m_obm_mac_rm_q[q_num].size() == 0)begin 
			`uvm_info(get_type_name(),$psprintf("q_num is %0d cmp_fail,dut_data is below",q_num),UVM_NONE);
			m_obm_mac_dut_q[q_num][0].print();
			`uvm_fatal(get_type_name(),$psprintf("q_num is %0d cmp_fail for m_obm_mac_rm_q[%0d].size is 0",q_num,q_num));
		end
		foreach(m_obm_mac_rm_q[q_num][data_index])begin 
			cmp_pass = m_obm_mac_rm_q[q_num][data_index].compare(m_obm_mac_dut_q[q_num][0]);	
			if(cmp_pass == 1'b1)begin 
				sel_num = data_index;	
				`uvm_info(get_type_name(),$psprintf("cmp_pass data_index is %0d",data_index),UVM_NONE);
				break;
			end
		end
		if(cmp_pass == 1'b1)begin 
			for(int j = 0;j<=sel_num;j++)begin 
				m_obm_mac_rm_q[q_num].pop_front();
			end
			m_obm_mac_dut_q[q_num].pop_front();
		end
		else begin 
			`uvm_info(get_type_name(),$psprintf("q_num is %0d cmp_fail,rm_data is below",q_num),UVM_NONE);
			m_obm_mac_rm_q[q_num][0].print();
			`uvm_info(get_type_name(),$psprintf("q_num is %0d cmp_fail,dut_data is below",q_num),UVM_NONE);
			m_obm_mac_dut_q[q_num][0].print();
			#10ns;
			`uvm_fatal(get_type_name(),$psprintf("q_num is %0d cmp_fail",q_num));
		end
	end
endtask:cmp_data_with_loss

`endif
