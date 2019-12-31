`ifndef BASE_SCOREBOARD__SV
`define BASE_SCOREBOARD__SV
class base_scoreboard #(RM_NUM = 1,DUT_NUM = 1) extends uvm_scoreboard;
	uvm_blocking_get_port #(uvm_sequence_item)   rm_port[RM_NUM];
	uvm_blocking_get_port #(uvm_sequence_item)   dut_port[DUT_NUM];

	function new(string name = "base_scoreboard",uvm_component parent);
		super.new(name,parent);
	`uvm_info(get_type_name(),$psprintf("enter base_scoreboard new"),UVM_NONE);
	foreach(rm_port[i])begin 
		rm_port[i] = new($sformatf("rm_port_%0d",i),this);
	end
	foreach(dut_port[i])begin 
		dut_port[i] = new($sformatf("dut_port_%0d",i),this);
	end
	endfunction
	extern virtual function void build_phase(uvm_phase phase);
	`uvm_component_utils(base_scoreboard)
endclass:base_scoreboard

function void base_scoreboard::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction:build_phase
`endif
