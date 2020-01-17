`ifndef SCATTER_OBM_INTERFACE_AGENT__SV
`define SCATTER_OBM_INTERFACE_AGENT__SV
class scatter_obm_interface_agent #(type VIF = virtual scatter_obm_interface) extends interface_agent_base #(VIF);
	`uvm_component_utils(scatter_obm_interface_agent)
	scatter_obm_monitor #(VIF)                scatter_obm_mon;
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	extern virtual function void build_phase(uvm_phase phase);
endclass:scatter_obm_interface_agent
function void scatter_obm_interface_agent::build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_type_name(),$psprintf("enter scatter_obm_interface_agent build_phase"),UVM_NONE);
	//scatter_obm_mon = scatter_obm_monitor::type_id::create("scatter_obm_mon",this);
	scatter_obm_mon = new("scatter_obm_mon",this);
	if(!$cast(mon,scatter_obm_mon))begin
		`uvm_fatal(get_type_name(),$psprintf("scatter_obm_mon is not a extention of monitor_base"));
	end
endfunction:build_phase
`endif
