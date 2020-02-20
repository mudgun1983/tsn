`ifndef OBM_ENV__SV
`define OBM_ENV__SV
class obm_env extends uvm_env;
	//obm_rm #(1,1)          m_rm;
	//change for test not get data
    //obm_scoreboard #(1,2)  m_obm_sb; 
    obm_scoreboard 		   m_obm_sb; 
	uvm_tlm_analysis_fifo #(uvm_sequence_item) m_mon2rm_fifo[1];
	uvm_tlm_analysis_fifo #(uvm_sequence_item) m_rm2sb_fifo[1];
	uvm_tlm_analysis_fifo #(uvm_sequence_item) m_dut2sb_fifo[2];
	scatter_obm_interface_agent                m_scatter_obm_if;
	obm_mac_interface_agent                    m_obm_mac_if[2];
	crllist_chk_monitor                        m_crllist_mon[1];
	obm_dut_cfg                                m_dut_cfg;
	obm_pkt_cfg                                m_pkt_cfg;
	mac_tx_monitor                             m_mac_tx_mon[1];
	`uvm_component_utils_begin(obm_env)
	`uvm_component_utils_end
	function new(string name = "obm_env",uvm_component parent);
		super.new(name,parent);
		//m_dut_cfg = new("m_dut_cfg");
		m_dut_cfg = obm_dut_cfg::type_id::create("m_dut_cfg");
		m_pkt_cfg = obm_pkt_cfg::type_id::create("m_pkt_cfg");
	endfunction
	extern virtual function void build_phase(uvm_phase phase);
	extern virtual function void connect_phase(uvm_phase phase);
	extern virtual function void end_of_elaboration_phase(uvm_phase phase);
	extern virtual task run_phase(uvm_phase phase);
	extern virtual task wait_end_sim();
endclass:obm_env
function void obm_env::build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name(),$psprintf("obm_env build_phase"),UVM_NONE);
	//m_rm = obm_rm::type_id::create("m_rm",this);
	//m_obm_sb = obm_scoreboard::type_id::create("m_obm_sb",this);
	m_obm_sb = new("m_obm_sb",this);
	foreach(m_mon2rm_fifo[i])begin
		m_mon2rm_fifo[i] = new($sformatf("m_mon2rm_fifo_%0d",i),this);
	end
	foreach(m_rm2sb_fifo[i])begin
		m_rm2sb_fifo[i] = new($sformatf("m_rm2sb_fifo_%0d",i),this);
	end
	foreach(m_dut2sb_fifo[i])begin
		m_dut2sb_fifo[i] = new($sformatf("m_dut2sb_fifo_%0d",i),this);
	end
	m_scatter_obm_if = scatter_obm_interface_agent::type_id::create("m_scatter_obm_if",this);
	foreach(m_obm_mac_if[i])begin 
		m_obm_mac_if[i]     = obm_mac_interface_agent::type_id::create($sformatf("m_obm_mac_if_%0d",i),this);
	end

    //here for crllist
	foreach(m_crllist_mon[i])begin 
		m_crllist_mon[i] = new($sformatf("m_crllist_mon_%0d",i),this);
	end
	m_obm_sb.m_dut_cfg = m_dut_cfg;
	m_crllist_mon[0].m_cfg = m_dut_cfg;
	m_crllist_mon[0].m_base_addr = 16'h200;
	m_dut_cfg.print();
	//for mac_tx_chk
	if(m_pkt_cfg.m_mac_tx_chk_en == 1'b1)begin 
		`uvm_info(get_type_name(),$psprintf("start to create mac_tx_monitor"),UVM_NONE);
		foreach(m_mac_tx_mon[i])begin 
			m_mac_tx_mon[i] = mac_tx_monitor::type_id::create($sformatf("m_mac_tx_mon_%0d",i),this);
		end
	end
endfunction:build_phase

function void obm_env::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	/* here we change because it is a simple cheker it will be changed later
    //this for scatter to rm
	m_scatter_obm_if.mon_port.connect(m_mon2rm_fifo[0].analysis_export);
	m_rm.in_port[0].connect(m_mon2rm_fifo[0].blocking_get_export);

	//this is for rm to sb
	m_rm.out_port[0].connect(m_rm2sb_fifo[0].blocking_put_export);
    m_obm_sb.rm_port[0].connect(m_rm2sb_fifo[0].blocking_get_export);*/

	//m_scatter_obm_if.mon.out_port.connect(m_rm2sb_fifo[0].analysis_export);
	m_scatter_obm_if.mon_port.connect(m_rm2sb_fifo[0].analysis_export);
	m_obm_sb.rm_port[0].connect(m_rm2sb_fifo[0].blocking_get_export);

	//this is for dut to sb
	foreach(m_dut2sb_fifo[i])begin 
		m_obm_mac_if[i].mon_port.connect(m_dut2sb_fifo[i].analysis_export);
		m_obm_sb.dut_port[i].connect(m_dut2sb_fifo[i].blocking_get_export);
	end
endfunction:connect_phase

function void obm_env::end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	m_obm_sb.m_cmp_xaction.m_dut_cfg = m_crllist_mon[0].m_local_cfg;
	foreach(m_obm_sb.m_cmp_xaction.m_obm_data_q[i])begin 
		m_obm_sb.m_cmp_xaction.m_obm_data_q[i] = new[m_obm_sb.m_cmp_xaction.m_dut_cfg.m_spare_list_len];
		m_obm_sb.m_cmp_xaction.m_obm_ref_data[i] = new[m_obm_sb.m_cmp_xaction.m_dut_cfg.m_spare_list_len];
	end
endfunction:end_of_elaboration_phase


task obm_env::run_phase(uvm_phase phase);
	super.run_phase(phase);
	fork
	/*	while(1)begin
			wait(m_rm2sb_fifo[0].used() != 0);
			`uvm_info(get_type_name(),$psprintf("m_rm2sb_fifo[0] is not empty"),UVM_NONE);
		end*/
    join_none
endtask:run_phase
task obm_env::wait_end_sim();
	int total_cnt;
	int last_cnt;
	int timeout_cnt;
	while(1)begin 
		//repeat(50)@(posedge `U_SCATTER.syc_clk_250m);
		#350ns;
		total_cnt = 0;
		foreach(m_obm_sb.m_obm_mac_rm_cnt[i])begin 
			total_cnt = (total_cnt + m_obm_sb.m_obm_mac_rm_cnt[i]);
		end
		foreach(m_obm_sb.m_obm_mac_dut_cnt[i])begin 
			total_cnt = (total_cnt + m_obm_sb.m_obm_mac_dut_cnt[i]);
		end

		if(total_cnt == last_cnt)begin 
			timeout_cnt ++;
			//`uvm_info(get_type_name(),$psprintf("wait_end_sim timeout_cnt is %0d",timeout_cnt),UVM_NONE);
		end
		else begin 
			timeout_cnt = 0;
	    end

		if(timeout_cnt >= 1000)begin 
			`uvm_info(get_type_name(),$psprintf("it's a long time to quit"),UVM_NONE);
			break;
		end

		last_cnt = total_cnt;
	end
	//here is just for 
	m_obm_sb.m_cmp_xaction.m_dut_cfg.print();
	for(int i=0;i<8;i++)begin 
		for(int j=0;j<m_obm_sb.m_cmp_xaction.m_dut_cfg.m_spare_list_len;j++)begin 
			foreach(m_obm_sb.m_cmp_xaction.m_obm_data_q[i][j][k])begin 
				`uvm_info(get_type_name(),$psprintf("m_obm_sb.m_cmp_xaction.m_obm_data_q[%0d][%0d][%0d].size() is %0d",i,j,k,m_obm_sb.m_cmp_xaction.m_obm_data_q[i][j][k].size()),UVM_NONE); 
			end
		end
	end
endtask
`endif
