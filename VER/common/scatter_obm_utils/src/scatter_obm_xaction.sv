`ifndef SCATTER_OBM_XACTION__SV
`define SCATTER_OBM_XACTION__SV
class scatter_obm_xaction extends uvm_sequence_item;
	 rand bit [7:0]	  m_scatter_obm_data[$];
	 rand bit [4:0]   m_scatter_obm_mod;
	 rand bit         m_scatter_obm_err;
	 rand bit [2:0]   m_scatter_obm_ophb;
	 `uvm_object_utils_begin(scatter_obm_xaction)
	 	`uvm_field_queue_int(m_scatter_obm_data,UVM_ALL_ON)
		`uvm_field_int(m_scatter_obm_mod,UVM_ALL_ON)
		`uvm_field_int(m_scatter_obm_err,UVM_ALL_ON)
		`uvm_field_int(m_scatter_obm_ophb,UVM_ALL_ON)
	 `uvm_object_utils_end

	 function new(string name = "scatter_obm_xaction");
	 	super.new(name);
	 endfunction:new
	 //here need aading local compare
	 //extern virtual function bit do_compare(scatter_obm_xaction cmp_xaction);
endclass:scatter_obm_xaction
/*function bit scatter_obm_xaction::do_compare(scatter_obm_xaction cmp_xaction);
	bit cmp_pass;
	return cmp_pass; 
endfunction:do_compare*/
`endif
