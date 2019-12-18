class qci_reg_seq extends seq_reg_user_macro ;

 `uvm_sequence_utils(qci_reg_seq, cpu_sequencer)
 
  int write_exp_data_fd        ;
  string tran_exp;
  bit read_data_tmp;
  function new(string name="qci_reg_seq");
    super.new(name);
	tran_exp = {get_name(),".txt"};
	write_exp_data_fd=$fopen(tran_exp,"w+");                                               
    $fclose(write_exp_data_fd);
  endfunction : new

virtual task body();
      super.body();
	  $display("--------------qci_reg_seq start----------------");
	  //ipp 
	  for(int i=0;i<`IPHB_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`IPHB_TABLE_CONTROL),({{16{1'b1}} ,`IPHB_TABLE_CONTENT[i].table_key_t})); 
		 `user_rgm_write_with((`IPHB_T_CONF_DIN),(`IPHB_TABLE_CONTENT[i].table_t)); 
       end
	   
	  //ivaln port_bitmap 
	  for(int i=0;i<`IVLAN_PROPERTY_TABLE.table_size;i++)
	   begin
	   `user_rgm_write_with(`IVLAN_PROPERTY_TABLE_CONTROL , {{16{1'b1}},`IVLAN_PROPERTY_TABLE_CONTENT[i].table_key_t});
	   `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_0 ,            `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[52:48]); 
	   `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_1 ,            `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[47:32]);
	   `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_2 ,            `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[31:16]);
	   `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_3 ,            `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[15:0] );
	   end
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
	   
	   //ing_flow_pro
      for(int i=0;i<`ING_FLOW_PRO_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`ING_FLOW_PRO_TABLE_CONTROL),({{16{1'b1}} ,`ING_FLOW_PRO_TABLE_CONTENT[i].table_key_t})); 
		 `user_rgm_write_with((`ING_FLOW_PRO_T_CONF_DIN_0),(`ING_FLOW_PRO_TABLE_CONTENT[i].table_t[19:16]));
		 `user_rgm_write_with((`ING_FLOW_PRO_T_CONF_DIN_2),(`ING_FLOW_PRO_TABLE_CONTENT[i].table_t[15:0]));		 
       end	
	   //ing_gate_table
      for(int i=0;i<`ING_GATE_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`ING_GATE_TABLE_CONTROL),({{16{1'b1}} ,`ING_GATE_TABLE_CONTENT[i].table_key_t})); 
		 `user_rgm_write_with((`ING_GATE_T_CONF_DIN_0),(`ING_GATE_TABLE_CONTENT[i].table_t[19:16]));
		 `user_rgm_write_with((`ING_GATE_T_CONF_DIN_1),(`ING_GATE_TABLE_CONTENT[i].table_t[15:0]));		 
       end
	  
	   //TIME_SLOT_RAM
      for(int i=0;i<`TIME_SLOT_TABLE.table_size;i++)
	   begin
	     `user_rgm_write_with((`TIME_SLOT_RAM_CONTROL),({{16{1'b1}} ,`TIME_SLOT_TABLE_CONTENT[i].table_key_t})); 
		 `user_rgm_write_with((`CONF_SLOT_RAM_WDATA_0),(`TIME_SLOT_TABLE_CONTENT[i].table_t[31:16]));
		 `user_rgm_write_with((`CONF_SLOT_RAM_WDATA_1),(`TIME_SLOT_TABLE_CONTENT[i].table_t[15:0]));        	 
       end
	   
	     `user_rgm_write_with((`ADMIN_BASE_TIME_0), (`TIME_SLOT_TABLE.admin_base_time[63:48]));
         `user_rgm_write_with((`ADMIN_BASE_TIME_1), (`TIME_SLOT_TABLE.admin_base_time[47:32]));
         `user_rgm_write_with((`ADMIN_BASE_TIME_2), (`TIME_SLOT_TABLE.admin_base_time[31:16]));
         `user_rgm_write_with((`ADMIN_BASE_TIME_3), (`TIME_SLOT_TABLE.admin_base_time[15:0] ));
         `user_rgm_write_with((`ADMIN_CYCLE_TIME_0),(`TIME_SLOT_TABLE.admin_cycle_time[63:48]));
         `user_rgm_write_with((`ADMIN_CYCLE_TIME_1),(`TIME_SLOT_TABLE.admin_cycle_time[47:32]));
         `user_rgm_write_with((`ADMIN_CYCLE_TIME_2),(`TIME_SLOT_TABLE.admin_cycle_time[31:16]));
         `user_rgm_write_with((`ADMIN_CYCLE_TIME_3),(`TIME_SLOT_TABLE.admin_cycle_time[15:0] ));
         `user_rgm_write_with((`ADMIN_SLOT_NUM),    (`TIME_SLOT_TABLE.admin_slot_num[3:0]));	
	   
       	   
	   //TIME_SLOT_CONF_CONTROL_STATUS
	   `user_rgm_write_with((`TIME_SLOT_CONF_CONTROL_STATUS),    (16'h55aa));		
	  $display("--------------qci_reg_seq end----------------");
endtask
	  
endclass

 