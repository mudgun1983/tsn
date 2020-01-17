`ifndef OBM_MAC_XACTION__SV
`define OBM_MAC_XACTION__SV
class obm_mac_xaction extends uvm_sequence_item;
	 rand bit [7:0]	  m_obm_mac_data[$];
	 rand bit         m_obm_mac_err;
	 rand bit [2:0]   m_obm_mac_ophb;
	 //0 is for pmac,1 is for emac
	 rand bit         m_obm_mac_en;
	 rand bit [63:0]  m_obm_mac_ptp[$];

	 `uvm_object_utils_begin(obm_mac_xaction)
	 	`uvm_field_queue_int(m_obm_mac_data,UVM_ALL_ON)
		`uvm_field_int(m_obm_mac_err,UVM_ALL_ON)
		`uvm_field_int(m_obm_mac_ophb,UVM_ALL_ON)
		`uvm_field_int(m_obm_mac_en,UVM_ALL_ON)
		`uvm_field_queue_int(m_obm_mac_ptp,UVM_ALL_ON | UVM_NOCOMPARE)
	 `uvm_object_utils_end

	 function new(string name = "obm_mac_xaction");
	 	super.new(name);
	 endfunction:new
	 //here need aading local compare
	 //extern virtual function bit do_compare(obm_mac_xaction cmp_xaction);
endclass:obm_mac_xaction
/*function bit obm_mac_xaction::do_compare(obm_mac_xaction cmp_xaction);
	bit cmp_pass;
	return cmp_pass; 
endfunction:do_compare*/
`endif
