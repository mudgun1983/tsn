////------------------------------------------------------------------
//// CLASS: phy_port_table_reg_seq
////------------------------------------------------------------------
`define PHY_PORT_TABLE_CONTENT reg_config.phy_port_table.PHY_PORT_TABLE_CONTENT

class phy_port_table_reg_seq extends seq_reg_user_macro ;
string scope_name = "";

  `uvm_sequence_utils(phy_port_table_reg_seq, cpu_sequencer)
  
  function new(string name="phy_port_table_reg_seq");
    super.new(name);
  endfunction : new
  
  virtual task body();
      super.body();
	  register_config reg_config;
	  if( scope_name == "" ) begin
        scope_name = get_full_name(); // this is {       sequencer.get_full_name() , get_name() }
        end

      if( !uvm_config_db #( my_bus_config )::get( null , scope_name ,
      "register_config" , reg_config ) ) begin
        `uvm_fatal(get_type_name(),"=============NO register_config==========");
      end

     `uvm_info(get_type_name(),$psprintf("\n-----------------phy_port_table_reg_seq set begin---------------",),UVM_LOW);
      
	  for(int i=0;i<reg_config.phy_port_table.table_size;i++)
	   begin     
      `user_rgm_write_with(32'h0022,{16'd1,10'b0,`PHY_PORT_TABLE_CONTENT[i].table_t.key}) //max 4096        
      `user_rgm_write_with(32'h0024,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[109:96]})
      `user_rgm_write_with(32'h0026,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[95:80]}) 
      `user_rgm_write_with(32'h0028,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[79:64]}) 
      `user_rgm_write_with(32'h002A,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[63:48]}) 
      `user_rgm_write_with(32'h002C,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[47:32]}) 
      `user_rgm_write_with(32'h002E,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[31:16]})  
      `user_rgm_write_with(32'h0030,{2'b0,`PHY_PORT_TABLE_CONTENT[i].table_t[15:0]})	  
        end
      
      `uvm_info(get_type_name(),$psprintf("\n-----------------phy_port_table_reg_seq set end---------------",),UVM_LOW);
 
//      //*****************************************************************
//      // 全局配置 
//      //*****************************************************************
  endtask