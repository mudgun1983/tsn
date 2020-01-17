`ifndef INTERFACE_AGENT_BASE__SV
`define INTERFACE_AGENT_BASE__SV
class interface_agent_base #(type VIF=int) extends uvm_agent;
	//this is just for monitor
	uvm_analysis_port #(uvm_sequence_item) mon_port;
	monitor_base #(VIF)					   mon;					   
	function new(string name,uvm_component parent);
		super.new(name,parent);
		mon_port = new("mon_port",this);
		mon      = new("mon",this);
	endfunction
	extern virtual function void build_phase(uvm_phase phase);
	extern virtual function void connect_phase(uvm_phase phase);

endclass:interface_agent_base

function void interface_agent_base::build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name(),$psprintf("enter interface_agent_base build_phase"),UVM_NONE);
	mon.out_port = mon_port;
endfunction:build_phase

function void interface_agent_base::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	mon.out_port.connect(mon_port);
endfunction:connect_phase
`endif
