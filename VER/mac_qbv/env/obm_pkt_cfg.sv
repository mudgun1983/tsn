`ifndef OBM_PKT_CFG__SV
`define OBM_PKT_CFG__SV
class obm_pkt_cfg extends uvm_sequence_item;
    int                m_pkt_len;
	int                m_pkt_num = 10;
	int                m_test;
	`uvm_object_utils_begin(obm_pkt_cfg)
		`uvm_field_int(m_pkt_len,UVM_ALL_ON)	
	`uvm_object_utils_end
	function new(string name ="obm_pkt_cfg");
		super.new(name);
		m_pkt_len = 128;
		`uvm_info(get_type_name(),$psprintf("m_test is %0d",m_test),UVM_NONE);
		m_pkt_len = $value$plusargs("m_pkt_len=%d",m_pkt_len);
		m_test = $value$plusargs("m_pkt_len=%h",m_pkt_len);
		$value$plusargs("m_pkt_num=%d",m_pkt_num);
		`uvm_info(get_type_name(),$psprintf("m_pkt_len is %0d,m_pkt_num is %0d",m_pkt_len,m_pkt_num),UVM_NONE);
		`uvm_info(get_type_name(),$psprintf("m_test is %0d",m_test),UVM_NONE);
	endfunction
endclass
`endif
