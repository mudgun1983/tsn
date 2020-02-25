`ifndef QBV_REG_SEQ__SV
`define QBV_REG_SEQ__SV
class qbv_reg_seq extends seq_reg_user_macro ;

 `uvm_sequence_utils(qbv_reg_seq, cpu_sequencer)
 obm_dut_cfg              m_obm_dut_cfg; 
  function new(string name="qbv_reg_seq");
    super.new(name);
	//m_obm_dut_cfg = new("m_obm_dut_cfg");
	m_obm_dut_cfg = obm_dut_cfg::type_id::create("m_obm_dut_cfg");
  endfunction : new

virtual task body();
      super.body();
	  `uvm_info(get_type_name(),$psprintf("--------------qbv_reg_seq start----------------"),UVM_NONE);
	  //ipp 
	  for(int i=0;i<`IPHB_TABLE.table_size;i++)
	  begin
	     `user_rgm_write_with((`IPHB_TABLE_CONTROL),({{16{1'b1}} ,`IPHB_TABLE_CONTENT[i].table_key_t})); 
		 `user_rgm_write_with((`IPHB_T_CONF_DIN),(`IPHB_TABLE_CONTENT[i].table_t)); 
      end
      m_obm_dut_cfg.print();

	  `user_rgm_write_with((`OBM_QUEUE_MAP + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_queue_map); 

	  for(int i=0;i<4;i++)begin 
	      `user_rgm_write_with((`ADMIN_BASE_TIME(i) + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_spare_base_time[(63 - 16*i)-:16]); 
	  end

	  for(int i=0;i<2;i++)begin 
	      `user_rgm_write_with((`ADMIN_CYC_TIME(i) + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_spare_cyc_time[(31 - 16*i)-:16]); 
	  end

	  for(int i=0;i<2;i++)begin 
	  	  `uvm_info(get_type_name(),$psprintf("m_obm_dut_cfg.m_spare_ext_time is 0x%0h",m_obm_dut_cfg.m_spare_ext_time[(31 - 16*i)-:16]),UVM_NONE);
	  	  `uvm_info(get_type_name(),$psprintf("cmp m_obm_dut_cfg.m_spare_ext_time is 0x%0h",m_obm_dut_cfg.m_spare_ext_time),UVM_NONE);
	      `user_rgm_write_with((`ADMIN_EXT_TIME(i) + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_spare_ext_time[(31 - 16*i)-:16]); 
	  end

	  `user_rgm_write_with((`ADMIN_LIST_ENTRY_LEN + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_spare_list_len); 

	  for(int i =0 ;i<m_obm_dut_cfg.m_spare_list_len;i++)begin 
	  	  `user_rgm_write_with((`ADMIN_LIST_ENTRY_DATA(1) + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_list_time_interval[i][22:16]); 
	  	  `user_rgm_write_with((`ADMIN_LIST_ENTRY_DATA(2) + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_list_time_interval[i][15:0]); 
	  	  `user_rgm_write_with((`ADMIN_LIST_ENTRY_DATA(3) + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_list_gate_state[i][7:0]); 
	  	  `user_rgm_write_with((`ADMIN_LIST_ENTRY_CFG + `OBM_BASE_ADDR(2)),{1'b1,7'h0,i[7:0]}); 
	  end

	  `user_rgm_write_with((`OBM_GATE_ENABLE + `OBM_BASE_ADDR(2)),m_obm_dut_cfg.m_gate_en); 
	  //here is just for test a long time between base_time and current time 
      //#30_0000ns;
	  `user_rgm_write_with((`OBM_GATE_STATUS + `OBM_BASE_ADDR(2)),16'h55AA); 

	  `uvm_info(get_type_name(),$psprintf("--------------qbv_reg_seq end----------------"),UVM_NONE);
endtask

endclass
`endif

 
