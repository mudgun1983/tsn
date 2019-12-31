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
	`uvm_component_utils_begin(obm_env)
	`uvm_component_utils_end
	function new(string name = "obm_env",uvm_component parent);
		super.new(name,parent);
	endfunction
	extern virtual function void build_phase(uvm_phase phase);
	extern virtual function void connect_phase(uvm_phase phase);
	extern virtual task run_phase(uvm_phase phase);
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
task obm_env::run_phase(uvm_phase phase);
	super.run_phase(phase);
	fork
	/*	while(1)begin
			wait(m_rm2sb_fifo[0].used() != 0);
			`uvm_info(get_type_name(),$psprintf("m_rm2sb_fifo[0] is not empty"),UVM_NONE);
		end*/
    join_none
endtask:run_phase
`endif
