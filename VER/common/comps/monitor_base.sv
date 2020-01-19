class monitor_base #(type VIF=int) extends uvm_monitor;
	`uvm_component_utils(monitor_base)
	//this is for interface
	VIF           bus;
	//this is for tlm to checker or rm
	uvm_analysis_port #(uvm_sequence_item) out_port;

	function new (string name,uvm_component parent = null);
		super.new(name,parent);
		`uvm_info(get_type_name(),$psprintf("enter monitor_base new"),UVM_NONE);
		out_port = new("out_port",this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);	
		`uvm_info(get_type_name(),$psprintf("enter monitor_base build_phase"),UVM_NONE);
		if (!uvm_config_db #(VIF)::get(this, "", "bus", bus))begin
			`uvm_fatal(get_type_name(),$psprintf("should add VIF bus to monitor_base"));
		end
	endfunction:build_phase

endclass
