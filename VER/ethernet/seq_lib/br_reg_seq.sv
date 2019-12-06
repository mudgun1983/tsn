class br_reg_seq extends seq_reg_user_macro ;

 `uvm_sequence_utils(br_reg_seq, cpu_sequencer)
 
  int write_exp_data_fd        ;
  string tran_exp;
  bit read_data_tmp;
  function new(string name="br_reg_seq");
    super.new(name);
	tran_exp = {get_name(),".txt"};
	write_exp_data_fd=$fopen(tran_exp,"w+");                                               
    $fclose(write_exp_data_fd);
  endfunction : new

virtual task body();
      super.body();
	  $display("--------------br_reg_seq start----------------");
	  //obm config
	  for(int i=0;i<`OBM_CONFIG.table_size;i++)
	   begin
	  `user_rgm_write_with((`BASE_OFFSET_OBUF_4+`QUEUE_MAP),(`OBM_CONFIG_CONTENT[i].queue_map)); 
	   end
	  
	  //ipp
	  for(int i=0;i<`IVLAN_PROPERTY_TABLE.table_size;i++)
	   begin
	   `user_rgm_write_with(`IVLAN_PROPERTY_TABLE_CONTROL , {{16{1'b1}},`IVLAN_PROPERTY_TABLE_CONTENT[i].table_key_t});
	   `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_0 ,            `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[52:48]); 
	   `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_1 ,            `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[47:32]);
	   `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_2 ,            `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[31:16]);
	   `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_3 ,            `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[15:0] );
	   end
	   
      for(int i=0;i<`IPHB_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`IPHB_TABLE_CONTROL),({{16{1'b1}} ,`IPHB_TABLE_CONTENT[i].table_key_t})); 
		 `user_rgm_write_with((`IPHB_T_CONF_DIN),(`IPHB_TABLE_CONTENT[i].table_t)); 
       end	   
	  //mac
	  for(int i=0;i<`MAC_CONFIG.table_size;i++)
	    begin
	     `user_rgm_write_with((`BASE_OFFSET_GE_4+`PMAC_MPKT_SIZE),(`MAC_CONFIG_CONTENT[i].mpkt_size)); 
	    end
	  
	  $display("--------------br_reg_seq end----------------");
endtask
	  
endclass