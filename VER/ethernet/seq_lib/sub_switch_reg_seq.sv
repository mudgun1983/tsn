////------------------------------------------------------------------
//// CLASS: sub_phy_port_table_reg_seq
////------------------------------------------------------------------


class sub_phy_port_table_reg_seq extends seq_reg_user_macro ;
	  
  `uvm_sequence_utils(sub_phy_port_table_reg_seq, cpu_sequencer)
  register_config sub_reg_config;
  
  function new(string name="sub_phy_port_table_reg_seq");
    super.new(name);
  endfunction : new
  
   // virtual task pre_body();/*{{{*/
       // uvm_test_done.raise_objection(this);
       // `uvm_info(get_type_name(),"[START_SEQUENCE]",UVM_LOW)
  // endtask : pre_body

  // virtual task post_body();
      // uvm_test_done.drop_objection(this);
      // `uvm_info(get_type_name(),"[STOP_SEQUENCE]",UVM_LOW)
  // endtask : post_body
  
  virtual task body();
      super.body();
	  if( !uvm_config_db #( register_config )::get( null , scope_name ,
      "sub_register_config" , sub_reg_config ) ) begin
        `uvm_fatal(get_type_name(),"=============NO sub_register_config==========");
      end
	  
     `uvm_info(get_type_name(),$psprintf("\n-----------------sub_phy_port_table_reg_seq set begin---------------",),UVM_LOW);
      
	  for(int i=0;i<`SUB_PHY_PORT_TABLE.table_size;i++)
	   begin     
      `user_rgm_write_with((`SUB_CPU_ADDR+`PHY_PORT_TABLE_CONTROL)	,{1'd1,10'b0,`SUB_PHY_PORT_TABLE_CONTENT[i].table_key_t});         
      `user_rgm_write_with((`SUB_CPU_ADDR+`PHY_PORT_TABLE_DIN_0	 ),{2'b0,`SUB_PHY_PORT_TABLE_CONTENT[i].table_t[109:96]});
      `user_rgm_write_with((`SUB_CPU_ADDR+`PHY_PORT_TABLE_DIN_1	 ),{     `SUB_PHY_PORT_TABLE_CONTENT[i].table_t[95:80]}) ;
      `user_rgm_write_with((`SUB_CPU_ADDR+`PHY_PORT_TABLE_DIN_2	 ),{     `SUB_PHY_PORT_TABLE_CONTENT[i].table_t[79:64]}) ;
      `user_rgm_write_with((`SUB_CPU_ADDR+`PHY_PORT_TABLE_DIN_3	 ),{     `SUB_PHY_PORT_TABLE_CONTENT[i].table_t[63:48]}) ;
      `user_rgm_write_with((`SUB_CPU_ADDR+`PHY_PORT_TABLE_DIN_4	 ),{     `SUB_PHY_PORT_TABLE_CONTENT[i].table_t[47:32]}) ;
      `user_rgm_write_with((`SUB_CPU_ADDR+`PHY_PORT_TABLE_DIN_5	 ),{     `SUB_PHY_PORT_TABLE_CONTENT[i].table_t[31:16]}) ;
      `user_rgm_write_with((`SUB_CPU_ADDR+`PHY_PORT_TABLE_DIN_6	 ),{     `SUB_PHY_PORT_TABLE_CONTENT[i].table_t[15:0] }) ;  
        end
      
      `uvm_info(get_type_name(),$psprintf("\n-----------------sub_phy_port_table_reg_seq set end---------------",),UVM_LOW);
 
  endtask
endclass

class sub_rx_ptp_forward_table_reg_seq extends seq_reg_user_macro ;
	  
  `uvm_sequence_utils(sub_rx_ptp_forward_table_reg_seq, cpu_sequencer)
  register_config sub_reg_config;
  
  function new(string name="sub_rx_ptp_forward_table_reg_seq");
    super.new(name);
  endfunction : new
  
   // virtual task pre_body();/*{{{*/
       // uvm_test_done.raise_objection(this);
       // `uvm_info(get_type_name(),"[START_SEQUENCE]",UVM_LOW)
  // endtask : pre_body

  // virtual task post_body();
      // uvm_test_done.drop_objection(this);
      // `uvm_info(get_type_name(),"[STOP_SEQUENCE]",UVM_LOW)
  // endtask : post_body
  
  virtual task body();
      super.body();
	  if( !uvm_config_db #( register_config )::get( null , scope_name ,
      "sub_register_config" , sub_reg_config ) ) begin
        `uvm_fatal(get_type_name(),"=============NO sub_register_config==========");
      end
     `uvm_info(get_type_name(),$psprintf("\n-----------------SUB_RX_PTP_FORWARD_TABLE set begin---------------",),UVM_LOW);
      
	  for(int i=0;i<`SUB_RX_PTP_FORWARD_TABLE.table_size;i++)
	   begin     
      `user_rgm_write_with((`SUB_CPU_ADDR+`RX_PTP_FORWARD_TABLE_CONTROL ),{{16{1'b1}} , `SUB_RX_PTP_FORWARD_TABLE_CONTENT[i].table_key_t[8:0] });         
      `user_rgm_write_with((`SUB_CPU_ADDR+`RX_PTP_FORWARD_T_CONF_DIN_0	),{16'b0 , `SUB_RX_PTP_FORWARD_TABLE_CONTENT[i].table_t[35:32] }); 
	  `user_rgm_write_with((`SUB_CPU_ADDR+`RX_PTP_FORWARD_T_CONF_DIN_1	),{        `SUB_RX_PTP_FORWARD_TABLE_CONTENT[i].table_t[31:16] });
	  `user_rgm_write_with((`SUB_CPU_ADDR+`RX_PTP_FORWARD_T_CONF_DIN_2	),{        `SUB_RX_PTP_FORWARD_TABLE_CONTENT[i].table_t[15:0] }); 
	   end
      
      `uvm_info(get_type_name(),$psprintf("\n-----------------SUB_RX_PTP_FORWARD_TABLE set end---------------",),UVM_LOW);
 
  endtask
endclass

class sub_o_phy_port_pro_table_reg_seq extends seq_reg_user_macro ;
	  
  `uvm_sequence_utils(sub_o_phy_port_pro_table_reg_seq, cpu_sequencer)
   register_config sub_reg_config;
  function new(string name="sub_o_phy_port_pro_table_reg_seq");
    super.new(name);
  endfunction : new
  
   // virtual task pre_body();/*{{{*/
       // uvm_test_done.raise_objection(this);
       // `uvm_info(get_type_name(),"[START_SEQUENCE]",UVM_LOW)
  // endtask : pre_body

  // virtual task post_body();
      // uvm_test_done.drop_objection(this);
      // `uvm_info(get_type_name(),"[STOP_SEQUENCE]",UVM_LOW)
  // endtask : post_body
  
  virtual task body();
      super.body();
	  if( !uvm_config_db #( register_config )::get( null , scope_name ,
      "sub_register_config" , sub_reg_config ) ) begin
        `uvm_fatal(get_type_name(),"=============NO sub_register_config==========");
      end
	  
     `uvm_info(get_type_name(),$psprintf("\n-----------------sub_o_phy_port_pro_table set begin---------------",),UVM_LOW);
      
     for(int i=0;i<`SUB_O_PHY_PORT_PRO_TABLE.table_size;i++)
	   begin     
      `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_TABLE_CONTROL ),{{16{1'b1}} , `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_key_t[4:0]});         
      `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_T_CONF_DIN_0	),{16'b0 , `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[117:112]}); 
	  `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_T_CONF_DIN_1	),{        `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[96+:16] });
	  `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_T_CONF_DIN_2	),{        `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[80+:16] }); 
	  `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_T_CONF_DIN_3	),{        `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[64+:16] });
	  `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_T_CONF_DIN_4	),{        `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[48+:16] }); 
	  `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_T_CONF_DIN_5	),{        `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[32+:16] });
	  `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_T_CONF_DIN_6	),{        `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[16+:16] }); 
	  `user_rgm_write_with((`SUB_CPU_ADDR+`O_PHY_PORT_PRO_T_CONF_DIN_7	),{        `SUB_O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[0+:16]  });
	   end
      
      `uvm_info(get_type_name(),$psprintf("\n-----------------sub_o_phy_port_pro_table set end---------------",),UVM_LOW);
 
  endtask
endclass