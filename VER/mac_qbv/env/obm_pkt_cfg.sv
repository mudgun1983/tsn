`ifndef OBM_PKT_CFG__SV
`define OBM_PKT_CFG__SV
class obm_pkt_cfg extends uvm_sequence_item;
    int                m_pkt_len = 128;
	int                m_pkt_num = 5;
	bit                m_mac_tx_chk_en = 1'b0;
	`uvm_object_utils_begin(obm_pkt_cfg)
		`uvm_field_int(m_pkt_len,UVM_ALL_ON)	
	`uvm_object_utils_end
	function new(string name ="obm_pkt_cfg");
		super.new(name);
		$value$plusargs("m_pkt_len=%d",m_pkt_len);
		$value$plusargs("m_pkt_num=%d",m_pkt_num);
		$value$plusargs("m_mac_tx_chk_en=%d",m_mac_tx_chk_en);
		`uvm_info(get_type_name(),$psprintf("m_pkt_len is %0d,m_pkt_num is %0d",m_pkt_len,m_pkt_num),UVM_NONE);
	endfunction
endclass
`endif
