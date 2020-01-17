`ifndef OBM_MAC_INTERFACE_AGENT__SV
`define OBM_MAC_INTERFACE_AGENT__SV
class obm_mac_interface_agent #(type VIF = virtual obm_mac_interface) extends interface_agent_base #(VIF);
	`uvm_component_utils(obm_mac_interface_agent)
	obm_mac_monitor #(VIF)                obm_mac_mon;
	function new(string name,uvm_component parent);
		super.new(name,parent);
		obm_mac_mon = new("obm_mac_mon",this);
	endfunction
	extern virtual function void build_phase(uvm_phase phase);
endclass:obm_mac_interface_agent
function void obm_mac_interface_agent::build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name(),$psprintf("enter obm_mac_interface_agent build_phase"),UVM_NONE);
	if(!$cast(mon,obm_mac_mon))begin
		`uvm_fatal(get_type_name(),$psprintf("obm_mac_mon is not a extention of monitor_base"));
	end
endfunction:build_phase
`endif
