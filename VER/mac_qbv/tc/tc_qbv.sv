`ifndef TC_QBV__SV
`define TC_QBV__SV
class tc_qbv extends pcs_base_test;
	`uvm_component_utils(tc_qbv)
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	extern virtual function void build_phase(uvm_phase phase);
	extern virtual task main_phase(uvm_phase phase);
endclass

function void tc_qbv::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task tc_qbv::main_phase(uvm_phase phase);
	scenario_full_throughput_switch_test v_seq;
	super.main_phase(phase);
	phase.raise_objection( this );
		#150000ns;

		#2000ns;
	phase.drop_objection( this );
endtask
`endif
