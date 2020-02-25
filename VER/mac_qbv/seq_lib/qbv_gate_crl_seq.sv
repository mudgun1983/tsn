`ifndef QBV_GATE_CRL_SEQ__SV
`define QBV_GATE_CRL_SEQ__SV
class qbv_gate_crl_seq extends seq_reg_user_macro ;

 `uvm_sequence_utils(qbv_gate_crl_seq, cpu_sequencer)
 obm_dut_cfg              m_obm_dut_cfg; 
 bit                      m_gate_en = 1'b1;
 bit  [7:0]               m_gate_state = 8'hff;
 function new(string name="qbv_gate_crl_seq");
    super.new(name);
	//m_obm_dut_cfg = new("m_obm_dut_cfg");
	m_obm_dut_cfg = obm_dut_cfg::type_id::create("m_obm_dut_cfg");
 endfunction : new

virtual task body();
      super.body();
	  `uvm_info(get_type_name(),$psprintf("--------------qbv_gate_crl_seq start----------------"),UVM_NONE);

      for(int i =0 ;i<m_obm_dut_cfg.m_spare_list_len;i++)begin
		  `user_rgm_write_with((`ADMIN_LIST_ENTRY_DATA(3) + `OBM_BASE_ADDR(2)),m_gate_state);
		  `user_rgm_write_with((`ADMIN_LIST_ENTRY_CFG + `OBM_BASE_ADDR(2)),{1'b1,7'h0,i[7:0]});
	  end
      `user_rgm_write_with((`OBM_GATE_ENABLE + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_gate_en);
	  `user_rgm_write_with((`OBM_GATE_STATUS + `OBM_BASE_ADDR(2)),16'h55AA);
	  `uvm_info(get_type_name(),$psprintf("--------------qbv_gate_crl_seq end----------------"),UVM_NONE);
endtask

endclass
`endif

 
