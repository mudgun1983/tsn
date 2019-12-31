`ifndef OBM_RM__SV
`define OBM_RM__SV
class obm_rm #(IN_NUM = 1,OUT_NUM = 1) extends component_base #(IN_NUM,OUT_NUM);
	`uvm_component_utils(obm_rm)
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
endclass:obm_rm
`endif
