////------------------------------------------------------------------
//// CLASS: phy_port_table_reg_seq
////------------------------------------------------------------------


class phy_port_table_reg_seq extends seq_reg_user_macro ;
	  
  `uvm_sequence_utils(phy_port_table_reg_seq, cpu_sequencer)
  
  function new(string name="phy_port_table_reg_seq");
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
     `uvm_info(get_type_name(),$psprintf("\n-----------------phy_port_table_reg_seq set begin---------------",),UVM_LOW);
      
	  for(int i=0;i<reg_config.phy_port_table.table_size;i++)
	   begin     
      `user_rgm_write_with(32'h0022,{1'd1,10'b0,`PHY_PORT_TABLE_CONTENT[i].table_key_t}) //max 4096        
      `user_rgm_write_with(32'h0024,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[109:96]});
      `user_rgm_write_with(32'h0026,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[95:80]}) ;
      `user_rgm_write_with(32'h0028,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[79:64]}) ;
      `user_rgm_write_with(32'h002A,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[63:48]}) ;
      `user_rgm_write_with(32'h002C,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[47:32]}) ;
      `user_rgm_write_with(32'h002E,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[31:16]}) ;
      `user_rgm_write_with(32'h0030,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[15:0] }) ;  
        end
      
      `uvm_info(get_type_name(),$psprintf("\n-----------------phy_port_table_reg_seq set end---------------",),UVM_LOW);
 
//      //*****************************************************************
//      // 全局配置 
//      //*****************************************************************
  endtask
endclass

class ipp_epp_table_reg_seq extends seq_reg_user_macro ;
	  
  `uvm_sequence_utils(ipp_epp_table_reg_seq, cpu_sequencer)
  
  function new(string name="ipp_epp_table_reg_seq");
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
     `uvm_info(get_type_name(),$psprintf("\n-----------------ipp_epp_table_reg_seq set begin---------------",),UVM_LOW);
      
	  for(int i=0;i<reg_config.phy_port_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`PHY_PORT_TABLE_CONTROL	,{1'd1,10'b0,`PHY_PORT_TABLE_CONTENT[i].table_key_t});         
      `user_rgm_write_with(`PHY_PORT_TABLE_DIN_0	,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[109:96]});
      `user_rgm_write_with(`PHY_PORT_TABLE_DIN_1	,{     `PHY_PORT_TABLE_CONTENT[i].table_t[95:80]}) ;
      `user_rgm_write_with(`PHY_PORT_TABLE_DIN_2	,{     `PHY_PORT_TABLE_CONTENT[i].table_t[79:64]}) ;
      `user_rgm_write_with(`PHY_PORT_TABLE_DIN_3	,{     `PHY_PORT_TABLE_CONTENT[i].table_t[63:48]}) ;
      `user_rgm_write_with(`PHY_PORT_TABLE_DIN_4	,{     `PHY_PORT_TABLE_CONTENT[i].table_t[47:32]}) ;
      `user_rgm_write_with(`PHY_PORT_TABLE_DIN_5	,{     `PHY_PORT_TABLE_CONTENT[i].table_t[31:16]}) ;
      `user_rgm_write_with(`PHY_PORT_TABLE_DIN_6	,{     `PHY_PORT_TABLE_CONTENT[i].table_t[15:0] }) ;  
        end
      
      
    
	  for(int i=0;i<reg_config.logic_port_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`LOGIC_PORT_TABLE_CONTROL,{1'd1,10'b0,`LOGIC_PORT_TABLE_CONTENT[i].table_key_t});         
      `user_rgm_write_with(`LOGIC_PORT_TABLE_DIN_0	,{10'b0,`LOGIC_PORT_TABLE_CONTENT[i].table_t[117:112]});
      `user_rgm_write_with(`LOGIC_PORT_TABLE_DIN_1	,{      `LOGIC_PORT_TABLE_CONTENT[i].table_t[111:96]}) ;
      `user_rgm_write_with(`LOGIC_PORT_TABLE_DIN_2	,{      `LOGIC_PORT_TABLE_CONTENT[i].table_t[95:80] }) ;
      `user_rgm_write_with(`LOGIC_PORT_TABLE_DIN_3	,{      `LOGIC_PORT_TABLE_CONTENT[i].table_t[79:64] }) ;
      `user_rgm_write_with(`LOGIC_PORT_TABLE_DIN_4	,{      `LOGIC_PORT_TABLE_CONTENT[i].table_t[63:48] }) ;
      `user_rgm_write_with(`LOGIC_PORT_TABLE_DIN_5	,{      `LOGIC_PORT_TABLE_CONTENT[i].table_t[47:32] }) ;
      `user_rgm_write_with(`LOGIC_PORT_TABLE_DIN_6	,{      `LOGIC_PORT_TABLE_CONTENT[i].table_t[31:16] }) ;  
      `user_rgm_write_with(`LOGIC_PORT_TABLE_DIN_7	,{      `LOGIC_PORT_TABLE_CONTENT[i].table_t[15:0 ] }) ;    
	   end
    
	  for(int i=0;i<reg_config.l2_protocol_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`L2_PROTOCOL_TABLE_CONTROL,{1'd1,10'b0,`L2_PROTOCOL_TABLE_CONTENT[i].table_key_t});         
      `user_rgm_write_with(`L2_PROTOCOL_TABLE_DIN_0	 ,{14'b0,`L2_PROTOCOL_TABLE_CONTENT[i].table_t[17:16]});
      `user_rgm_write_with(`L2_PROTOCOL_TABLE_DIN_1	 ,{      `L2_PROTOCOL_TABLE_CONTENT[i].table_t[15:0] }) ;   
	   end
	   
	  for(int i=0;i<reg_config.iphb_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`IPHB_TABLE_CONTROL,{1'd1,8'b0,`IPHB_TABLE_CONTENT[i].table_key_t});         
      `user_rgm_write_with(`IPHB_T_CONF_DIN	  ,{16'b0,`IPHB_TABLE_CONTENT[i].table_t[2:0]}); 
	   end 
	   
	  for(int i=0;i<reg_config.ivlan_xlate_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`IVLAN_XLATE_TABLE_CONTROL,{1'd1,14'b0,`IVLAN_XLATE_TABLE_CONTENT[i].table_key_t[16]});         
      `user_rgm_write_with(`IVLAN_XLATE_T_CONF_KEY	 ,{           `IVLAN_XLATE_TABLE_CONTENT[i].table_key_t[15:0]}); 
	  `user_rgm_write_with(`IVLAN_XLATE_T_CONF_DIN_0 ,{ 1'b0,`IVLAN_XLATE_TABLE_CONTENT[i].table_t[30:16]}); 
	  `user_rgm_write_with(`IVLAN_XLATE_T_CONF_DIN_1 ,{      `IVLAN_XLATE_TABLE_CONTENT[i].table_t[15:0]}); 
	   end 
	  
	  for(int i=0;i<reg_config.ivlan_property_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`IVLAN_PROPERTY_TABLE_CONTROL,{1'd1,3'b0, `IVLAN_PROPERTY_TABLE_CONTENT[i].table_key_t[11:0] });         
      `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_0	,{16'b0    , `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[52:48]    }); 
	  `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_1	,{           `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[47:32]    }); 
	  `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_2	,{           `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[31:16]    }); 
	  `user_rgm_write_with(`IVLAN_PROPERTY_T_CONF_DIN_3	,{           `IVLAN_PROPERTY_TABLE_CONTENT[i].table_t[15:0 ]    });	  
	   end
	   
	  for(int i=0;i<reg_config.ivlan_action_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`IVLAN_ACTION_TABLE_CONTROL	,{16'b1 , `IVLAN_ACTION_TABLE_CONTENT[i].table_key_t[3:0] });         
      `user_rgm_write_with(`IVLAN_ACTION_T_CONF_DIN_0	,{16'b0 , `IVLAN_ACTION_TABLE_CONTENT[i].table_t[17:16]    }); 
	  `user_rgm_write_with(`IVLAN_ACTION_T_CONF_DIN_1	,{        `IVLAN_ACTION_TABLE_CONTENT[i].table_t[15:0]    }); 
	   end
	   
	  for(int i=0;i<reg_config.ivlan_stg_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`IVLAN_STG_TABLE_CONTROL,{16'b1 , `IVLAN_STG_TABLE_CONTENT[i].table_key_t[7:0] });         
      `user_rgm_write_with(`ISTG_T_CONF_DIN_0	   ,{16'b0 , `IVLAN_STG_TABLE_CONTENT[i].table_t[63:48]    }); 
	  `user_rgm_write_with(`ISTG_T_CONF_DIN_1	   ,{        `IVLAN_STG_TABLE_CONTENT[i].table_t[47:32]   });
	  `user_rgm_write_with(`ISTG_T_CONF_DIN_2	   ,{        `IVLAN_STG_TABLE_CONTENT[i].table_t[31:16]    }); 
	  `user_rgm_write_with(`ISTG_T_CONF_DIN_3	   ,{        `IVLAN_STG_TABLE_CONTENT[i].table_t[15:0 ]   });
	   end 
      
      for(int i=0;i<reg_config.l2_mac_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`L2_MAC_TABLE_CONTROL,{16'b1 , `L2_MAC_TABLE_CONTENT[i].table_key_t[59:48] });         
      `user_rgm_write_with(`L2M_T_CONF_KEY_0	,{        `L2_MAC_TABLE_CONTENT[i].table_key_t[47:32]   }); 
	  `user_rgm_write_with(`L2M_T_CONF_KEY_1	,{        `L2_MAC_TABLE_CONTENT[i].table_key_t[31:16]   });
	  `user_rgm_write_with(`L2M_T_CONF_KEY_2	,{        `L2_MAC_TABLE_CONTENT[i].table_key_t[15:0]    }); 
	  `user_rgm_write_with(`L2M_T_CONF_DIN_0	,{16'b0 , `L2_MAC_TABLE_CONTENT[i].table_t[19:16]    });
	  `user_rgm_write_with(`L2M_T_CONF_DIN_1	,{        `L2_MAC_TABLE_CONTENT[i].table_t[15:0 ]   });
	   end 

      for(int i=0;i<reg_config.storm_policer_id_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`STORM_POLICER_ID_TABLE_CONTROL,{16'b1 , `STORM_POLICER_ID_TABLE_CONTENT[i].table_key_t[9:0] });         
      `user_rgm_write_with(`STORM_PID_T_CONF_DIN_0	      ,{16'b0 , `STORM_POLICER_ID_TABLE_CONTENT[i].table_t[1:0]   }); 
	  `user_rgm_write_with(`STORM_PID_T_CONF_DIN_1	      ,{        `STORM_POLICER_ID_TABLE_CONTENT[i].table_t[15:0]   });
	   end 	
      
      for(int i=0;i<reg_config.ing_flow_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`ING_FLOW_TABLE_CONTROL,{16'b1 , `ING_FLOW_TABLE_CONTENT[i].table_key_t[64] });         
      `user_rgm_write_with(`ING_FLOW_T_CONF_KEY_0 ,{        `ING_FLOW_TABLE_CONTENT[i].table_key_t[63:48]  }); 
	  `user_rgm_write_with(`ING_FLOW_T_CONF_KEY_1 ,{        `ING_FLOW_TABLE_CONTENT[i].table_key_t[47:32]   });
	  `user_rgm_write_with(`ING_FLOW_T_CONF_KEY_2 ,{        `ING_FLOW_TABLE_CONTENT[i].table_key_t[31:16]  }); 
	  `user_rgm_write_with(`ING_FLOW_T_CONF_KEY_3 ,{        `ING_FLOW_TABLE_CONTENT[i].table_key_t[15:0 ]   });
	  `user_rgm_write_with(`ING_FLOW_T_CONF_DIN	  ,{16'b0 , `ING_FLOW_TABLE_CONTENT[i].table_t[14:0]   });   
	   end
    
      for(int i=0;i<reg_config.ing_flow_pro_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`ING_FLOW_PRO_TABLE_CONTROL	,{16'b1 , `ING_FLOW_PRO_TABLE_CONTENT[i].table_key_t[12:0] });         
      `user_rgm_write_with(`ING_FLOW_PRO_T_CONF_DIN_0	,{        `ING_FLOW_PRO_TABLE_CONTENT[i].table_t[3:0]  }); 
	  `user_rgm_write_with(`ING_FLOW_PRO_T_CONF_DIN_2	,{        `ING_FLOW_PRO_TABLE_CONTENT[i].table_t[15:0]   });
	   end	
	   
	  for(int i=0;i<reg_config.ing_gate_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`ING_GATE_TABLE_CONTROL	,{16'b1 , `ING_GATE_TABLE_CONTENT[i].table_key_t[12:0] });         
      `user_rgm_write_with(`ING_GATE_T_CONF_DIN_0	,{16'b0 , `ING_GATE_TABLE_CONTENT[i].table_t[3:0]  }); 
	  `user_rgm_write_with(`ING_GATE_T_CONF_DIN_1	,{        `ING_GATE_TABLE_CONTENT[i].table_t[15:0]   });
	   end
    
      for(int i=0;i<reg_config.policer_conf_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`POLICER_CONF_TABLE_CONTROL,{16'b1 , `POLICER_CONF_TABLE_CONTENT[i].table_key_t[8:0] });         
      `user_rgm_write_with(`POLICER_C_T_CONF_DIN_0	  ,{16'b0 , `POLICER_CONF_TABLE_CONTENT[i].table_t[35:32]  }); 
	  `user_rgm_write_with(`POLICER_C_T_CONF_DIN_1	  ,{        `POLICER_CONF_TABLE_CONTENT[i].table_t[31:16]  });
	  `user_rgm_write_with(`POLICER_C_T_CONF_DIN_2	  ,{        `POLICER_CONF_TABLE_CONTENT[i].table_t[15:0 ]  });
	   end	

      for(int i=0;i<reg_config.policer_token_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`POLICER_TOKEN_TABLE_CONTROL	,{16'b1 , `POLICER_TOKEN_TABLE_CONTENT[i].table_key_t[8:0] });         
      `user_rgm_write_with(`POLICER_TOKEN_T_CONF_DIN_0	,{16'b0 , `POLICER_TOKEN_TABLE_CONTENT[i].table_t[31:16] }); 
	  `user_rgm_write_with(`POLICER_TOKEN_T_CONF_DIN_1	,{        `POLICER_TOKEN_TABLE_CONTENT[i].table_t[15:0 ] });
	   end	
    
      for(int i=0;i<reg_config.frer_rec_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`FRER_REC_TABLE_CONTROL	,{16'b1 , `FRER_REC_TABLE_CONTENT[i].table_key_t[9:0] });         
      `user_rgm_write_with(`FRER_REC_T_CONF_DIN_0	,{16'b0 , `FRER_REC_TABLE_CONTENT[i].table_t[143:128] }); 
	  `user_rgm_write_with(`FRER_REC_T_CONF_DIN_1	,{        `FRER_REC_TABLE_CONTENT[i].table_t[127:112] });
	  `user_rgm_write_with(`FRER_REC_T_CONF_DIN_2	,{        `FRER_REC_TABLE_CONTENT[i].table_t[111:96] }); 
	  `user_rgm_write_with(`FRER_REC_T_CONF_DIN_3	,{        `FRER_REC_TABLE_CONTENT[i].table_t[95:80] });
	  `user_rgm_write_with(`FRER_REC_T_CONF_DIN_4	,{        `FRER_REC_TABLE_CONTENT[i].table_t[79:64] }); 
	  `user_rgm_write_with(`FRER_REC_T_CONF_DIN_5	,{        `FRER_REC_TABLE_CONTENT[i].table_t[63:48] });
	  `user_rgm_write_with(`FRER_REC_T_CONF_DIN_6	,{        `FRER_REC_TABLE_CONTENT[i].table_t[47:32] }); 
	  `user_rgm_write_with(`FRER_REC_T_CONF_DIN_7	,{        `FRER_REC_TABLE_CONTENT[i].table_t[31:16] });
	  `user_rgm_write_with(`FRER_REC_T_CONF_DIN_8	,{        `FRER_REC_TABLE_CONTENT[i].table_t[15:0] }); 
	   end
    
	  //rx_ptp_forward_table ???????????????????????????????????????????
      for(int i=0;i<reg_config.rx_ptp_forward_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`RX_PTP_FORWARD_TABLE_CONTROL,{16'b1 , `RX_PTP_FORWARD_TABLE_CONTENT[i].table_key_t[8:0] });         
      `user_rgm_write_with(`RX_PTP_FORWARD_T_CONF_DIN_0	,{16'b0 , `RX_PTP_FORWARD_TABLE_CONTENT[i].table_t[35:32] }); 
	  `user_rgm_write_with(`RX_PTP_FORWARD_T_CONF_DIN_1	,{        `RX_PTP_FORWARD_TABLE_CONTENT[i].table_t[31:16] });
	  `user_rgm_write_with(`RX_PTP_FORWARD_T_CONF_DIN_2	,{        `RX_PTP_FORWARD_TABLE_CONTENT[i].table_t[15:0] }); 
	   end
	   
      for(int i=0;i<reg_config.out_fp_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`OUT_FP_TABLE_CONTROL,{16'b1 , `OUT_FP_TABLE_CONTENT[i].table_key_t[9:0] });         
      `user_rgm_write_with(`OUT_FP_T_CONF_DIN_0	,{16'b0 , `OUT_FP_TABLE_CONTENT[i].table_t[71:64] }); 
	  `user_rgm_write_with(`OUT_FP_T_CONF_DIN_1	,{        `OUT_FP_TABLE_CONTENT[i].table_t[63:48] });
	  `user_rgm_write_with(`OUT_FP_T_CONF_DIN_2	,{        `OUT_FP_TABLE_CONTENT[i].table_t[47:32]}); 
	  `user_rgm_write_with(`OUT_FP_T_CONF_DIN_3	,{        `OUT_FP_TABLE_CONTENT[i].table_t[31:16]});
	  `user_rgm_write_with(`OUT_FP_T_CONF_DIN_4	,{        `OUT_FP_TABLE_CONTENT[i].table_t[15:0] }); 
	   end
	   
	  for(int i=0;i<reg_config.l2_mc_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`L2_MC_TABLE_CONTROL	,{16'b1 , `L2_MC_TABLE_CONTENT[i].table_key_t[7:0] });         
      `user_rgm_write_with(`L2_MC_T_CONF_DIN_0	,{16'b0 , `L2_MC_TABLE_CONTENT[i].table_t[32] }); 
	  `user_rgm_write_with(`L2_MC_T_CONF_DIN_1	,{        `L2_MC_TABLE_CONTENT[i].table_t[31:16] });
	  `user_rgm_write_with(`L2_MC_T_CONF_DIN_2	,{        `L2_MC_TABLE_CONTENT[i].table_t[15:0] }); 
	   end
	   
	  for(int i=0;i<reg_config.time_slot_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`TIME_SLOT_RAM_CONTROL,{16'b1 , `TIME_SLOT_TABLE_CONTENT[i].table_key_t[3:0] });         
      `user_rgm_write_with(`CONF_SLOT_RAM_WDATA_0,{16'b0 , `TIME_SLOT_TABLE_CONTENT[i].table_t[31:16] }); 
	  `user_rgm_write_with(`CONF_SLOT_RAM_WDATA_1,{        `TIME_SLOT_TABLE_CONTENT[i].table_t[15:0]  });
	   end  
	  
	  for(int i=0;i<reg_config.evlan_xlate_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`EVLAN_XLATE_TABLE_CONTROL,{16'b1 , `EVLAN_XLATE_TABLE_CONTENT[i].table_key_t[16] });         
      `user_rgm_write_with(`EVLAN_XLATE_T_CONF_KEY	 ,{        `EVLAN_XLATE_TABLE_CONTENT[i].table_key_t[15:0] }); 
	  `user_rgm_write_with(`EVLAN_XLATE_T_DIN_0	     ,{16'b0 , `EVLAN_XLATE_TABLE_CONTENT[i].table_t[30:16]  });
	  `user_rgm_write_with(`EVLAN_XLATE_T_DIN_1	     ,{        `EVLAN_XLATE_TABLE_CONTENT[i].table_t[15:0]   }); 
	   end 
	   
	  for(int i=0;i<reg_config.evlan_action_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`EVLAN_ACTION_TABLE_CONTROL	,{16'b1 , `EVLAN_ACTION_TABLE_CONTENT[i].table_key_t[3:0] });         
      `user_rgm_write_with(`EVLAN_ACTION_T_CONF_DIN_0	,{16'b0 , `EVLAN_ACTION_TABLE_CONTENT[i].table_t[17:16] }); 
	  `user_rgm_write_with(`EVLAN_ACTION_T_CONF_DIN_1	,{        `EVLAN_ACTION_TABLE_CONTENT[i].table_t[15:0]  });
	   end 
	   
	  for(int i=0;i<reg_config.evlan_property_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`EVLAN_PROPERTY_TABLE_CONTROL,{16'b1 , `EVLAN_PROPERTY_TABLE_CONTENT[i].table_key_t[11:0] });         
      `user_rgm_write_with(`EVLAN_PROPERTY_T_CONF_DIN_0	,{16'b0 , `EVLAN_PROPERTY_TABLE_CONTENT[i].table_t[52:48]  }); 
	  `user_rgm_write_with(`EVLAN_PROPERTY_T_CONF_DIN_1	,{        `EVLAN_PROPERTY_TABLE_CONTENT[i].table_t[47:32]  });
	  `user_rgm_write_with(`EVLAN_PROPERTY_T_CONF_DIN_2	,{        `EVLAN_PROPERTY_TABLE_CONTENT[i].table_t[31:16] }); 
	  `user_rgm_write_with(`EVLAN_PROPERTY_T_CONF_DIN_3	,{        `EVLAN_PROPERTY_TABLE_CONTENT[i].table_t[15:0]  });
	   end
	   
	  for(int i=0;i<reg_config.evlan_stg_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`EVLAN_STG_TABLE_CONTROL,{16'b1 , `EVLAN_STG_TABLE_CONTENT[i].table_key_t[7:0] });         
      `user_rgm_write_with(`ESTG_T_CONF_DIN_0	   ,{16'b0 , `EVLAN_STG_TABLE_CONTENT[i].table_t[63:48]  }); 
	  `user_rgm_write_with(`ESTG_T_CONF_DIN_1	   ,{        `EVLAN_STG_TABLE_CONTENT[i].table_t[47:32]  });
	  `user_rgm_write_with(`ESTG_T_CONF_DIN_2	   ,{        `EVLAN_STG_TABLE_CONTENT[i].table_t[31:16] }); 
	  `user_rgm_write_with(`ESTG_T_CONF_DIN_3	   ,{        `EVLAN_STG_TABLE_CONTENT[i].table_t[15:0]  });
	   end
	   
	  for(int i=0;i<reg_config.oport_pro_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`OPORT_PRO_TABLE_CONTROL	,{16'b1 , `OPORT_PRO_TABLE_CONTENT[i].table_key_t[4:0]});         
      `user_rgm_write_with(`OPORT_PRO_TABLE_DIN_0	,{16'b0 , `OPORT_PRO_TABLE_CONTENT[i].table_t[17:16]  }); 
	  `user_rgm_write_with(`OPORT_PRO_TABLE_DIN_1	,{        `OPORT_PRO_TABLE_CONTENT[i].table_t[15:0]  });
	   end
	  
	  for(int i=0;i<reg_config.dot1p_map_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`DOT1P_MAP_TABLE_CONTROL,{16'b1 , `DOT1P_MAP_TABLE_CONTENT[i].table_key_t[6:0]});         
      `user_rgm_write_with(`DOT1P_MAP_T_DIN_0	   ,{16'b0 , `DOT1P_MAP_TABLE_CONTENT[i].table_t[17:16]  }); 
	  `user_rgm_write_with(`DOT1P_MAP_T_DIN_1	   ,{        `DOT1P_MAP_TABLE_CONTENT[i].table_t[15:0]  });
	   end
	   
	   
	  for(int i=0;i<reg_config.lag_sel_port_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`LAG_SEL_PORT_TABLE_CONTROL	,{16'b1 , `LAG_SEL_PORT_TABLE_CONTENT[i].table_key_t[6:0]});         
      `user_rgm_write_with(`LAG_SEL_PORT_T_CONF_DIN_0	,{16'b0 , `LAG_SEL_PORT_TABLE_CONTENT[i].table_t[17:16]  }); 
	  `user_rgm_write_with(`LAG_SEL_PORT_T_CONF_DIN_1	,{        `LAG_SEL_PORT_TABLE_CONTENT[i].table_t[15:0]  });
	   end
	   
	  for(int i=0;i<reg_config.o_phy_port_pro_table.table_size;i++)
	   begin     
      `user_rgm_write_with(`O_PHY_PORT_PRO_TABLE_CONTROL,{16'b1 , `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_key_t[4:0]});         
      `user_rgm_write_with(`O_PHY_PORT_PRO_T_CONF_DIN_0	,{16'b0 , `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[117:112]}); 
	  `user_rgm_write_with(`O_PHY_PORT_PRO_T_CONF_DIN_1	,{        `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[96+:16] });
	  `user_rgm_write_with(`O_PHY_PORT_PRO_T_CONF_DIN_2	,{        `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[80+:16] }); 
	  `user_rgm_write_with(`O_PHY_PORT_PRO_T_CONF_DIN_3	,{        `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[64+:16] });
	  `user_rgm_write_with(`O_PHY_PORT_PRO_T_CONF_DIN_4	,{        `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[48+:16] }); 
	  `user_rgm_write_with(`O_PHY_PORT_PRO_T_CONF_DIN_5	,{        `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[32+:16] });
	  `user_rgm_write_with(`O_PHY_PORT_PRO_T_CONF_DIN_6	,{        `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[16+:16] }); 
	  `user_rgm_write_with(`O_PHY_PORT_PRO_T_CONF_DIN_7	,{        `O_PHY_PORT_PRO_TABLE_CONTENT[i].table_t[0+:16]  });
	   end
	   
	   `uvm_info(get_type_name(),$psprintf("\n-----------------ipp_epp_table_reg_seq set end---------------",),UVM_LOW);
  endtask
endclass