class cb_reg_seq extends seq_reg_user_macro ;

 `uvm_sequence_utils(cb_reg_seq, cpu_sequencer)
 
  int write_exp_data_fd        ;
  string tran_exp;
  bit read_data_tmp;
  function new(string name="cb_reg_seq");
    super.new(name);
	tran_exp = {get_name(),".txt"};
	write_exp_data_fd=$fopen(tran_exp,"w+");                                               
    $fclose(write_exp_data_fd);
  endfunction : new

virtual task body();
      super.body();
	  $display("--------------cb_reg_seq start----------------");
      //ing_flow_id
      for(int i=0;i<`ING_FLOW_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`ING_FLOW_TABLE_CONTROL),({{16{1'b1}} ,`ING_FLOW_TABLE_CONTENT[i].table_key_t[64]})); 
		 `user_rgm_write_with((`ING_FLOW_T_CONF_KEY_0),(`ING_FLOW_TABLE_CONTENT[i].table_key_t[63:48]));
		 `user_rgm_write_with((`ING_FLOW_T_CONF_KEY_1),(`ING_FLOW_TABLE_CONTENT[i].table_key_t[47:32]));
		 `user_rgm_write_with((`ING_FLOW_T_CONF_KEY_2),(`ING_FLOW_TABLE_CONTENT[i].table_key_t[31:16]));
		 `user_rgm_write_with((`ING_FLOW_T_CONF_KEY_3),(`ING_FLOW_TABLE_CONTENT[i].table_key_t[15:0] ));
		 `user_rgm_write_with((`ING_FLOW_T_CONF_DIN),(`ING_FLOW_TABLE_CONTENT[i].table_t[15:0] ));		 
       end	
	   
	   //FRER_REC_TABLE
	   for(int i=0;i<`FRER_REC_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`FRER_REC_TABLE_CONTROL),({{16{1'b1}} ,`FRER_REC_TABLE_CONTENT[i].table_key_t})); 
		 `user_rgm_write_with((`FRER_REC_T_CONF_DIN_0),(`FRER_REC_TABLE_CONTENT[i].table_t[143:128] ));	             
		 `user_rgm_write_with((`FRER_REC_T_CONF_DIN_1),(`FRER_REC_TABLE_CONTENT[i].table_t[127:112] ));	
         `user_rgm_write_with((`FRER_REC_T_CONF_DIN_2),(`FRER_REC_TABLE_CONTENT[i].table_t[111:96] ));
         `user_rgm_write_with((`FRER_REC_T_CONF_DIN_3),(`FRER_REC_TABLE_CONTENT[i].table_t[95:80] ));
         `user_rgm_write_with((`FRER_REC_T_CONF_DIN_4),(`FRER_REC_TABLE_CONTENT[i].table_t[79:64] ));
         `user_rgm_write_with((`FRER_REC_T_CONF_DIN_5),(`FRER_REC_TABLE_CONTENT[i].table_t[63:48] ));
         `user_rgm_write_with((`FRER_REC_T_CONF_DIN_6),(`FRER_REC_TABLE_CONTENT[i].table_t[47:32] ));
         `user_rgm_write_with((`FRER_REC_T_CONF_DIN_7),(`FRER_REC_TABLE_CONTENT[i].table_t[31:16] ));	
         `user_rgm_write_with((`FRER_REC_T_CONF_DIN_8),(`FRER_REC_TABLE_CONTENT[i].table_t[15:0] ));		 
       end	
       
	  //L2_MAC_TABLE
      for(int i=0;i<`L2_MAC_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`L2_MAC_TABLE_CONTROL),({{16{1'b1}} ,`L2_MAC_TABLE_CONTENT[i].table_key_t[59:48]} )); 
		 `user_rgm_write_with((`L2M_T_CONF_KEY_0),(                 `L2_MAC_TABLE_CONTENT[i].table_key_t[47:32]  )); 
		 `user_rgm_write_with((`L2M_T_CONF_KEY_1),(                 `L2_MAC_TABLE_CONTENT[i].table_key_t[31:16]  )); 
		 `user_rgm_write_with((`L2M_T_CONF_KEY_2),(                 `L2_MAC_TABLE_CONTENT[i].table_key_t[15:0]   )); 
		 `user_rgm_write_with((`L2M_T_CONF_DIN_0),(`L2_MAC_TABLE_CONTENT[i].table_t[19:16] ));	
         `user_rgm_write_with((`L2M_T_CONF_DIN_1),(`L2_MAC_TABLE_CONTENT[i].table_t[15:0] ));			 
       end
	   
	   //L2_MAC_TABLE
      for(int i=0;i<`L2_MAC_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`L2_MAC_TABLE_CONTROL),({{16{1'b1}} ,`L2_MAC_TABLE_CONTENT[i].table_key_t[59:48]} )); 
		 `user_rgm_write_with((`L2M_T_CONF_KEY_0),(                 `L2_MAC_TABLE_CONTENT[i].table_key_t[47:32]  )); 
		 `user_rgm_write_with((`L2M_T_CONF_KEY_1),(                 `L2_MAC_TABLE_CONTENT[i].table_key_t[31:16]  )); 
		 `user_rgm_write_with((`L2M_T_CONF_KEY_2),(                 `L2_MAC_TABLE_CONTENT[i].table_key_t[15:0]   )); 
		 `user_rgm_write_with((`L2M_T_CONF_DIN_0),(`L2_MAC_TABLE_CONTENT[i].table_t[19:16] ));	
         `user_rgm_write_with((`L2M_T_CONF_DIN_1),(`L2_MAC_TABLE_CONTENT[i].table_t[15:0] ));			 
       end
	   
	   //OUT_FP_TABLE
      for(int i=0;i<`OUT_FP_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`OUT_FP_TABLE_CONTROL),({{16{1'b1}} ,`OUT_FP_TABLE_CONTENT[i].table_key_t})); 
		 `user_rgm_write_with((`OUT_FP_T_CONF_DIN_0),(`OUT_FP_TABLE_CONTENT[i].table_t[71:64] ));	
         `user_rgm_write_with((`OUT_FP_T_CONF_DIN_1),(`OUT_FP_TABLE_CONTENT[i].table_t[63:48] ));	
         `user_rgm_write_with((`OUT_FP_T_CONF_DIN_2),(`OUT_FP_TABLE_CONTENT[i].table_t[47:32] ));
         `user_rgm_write_with((`OUT_FP_T_CONF_DIN_3),(`OUT_FP_TABLE_CONTENT[i].table_t[31:16] ));
         `user_rgm_write_with((`OUT_FP_T_CONF_DIN_4),(`OUT_FP_TABLE_CONTENT[i].table_t[15:0]  ));	 
       end
	   
	  $display("--------------cb_reg_seq end----------------");
endtask
	  
endclass

 