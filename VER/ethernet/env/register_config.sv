class register_config extends uvm_object;
`uvm_object_utils( wb_config );

PHY_PORT_TABLE phy_port_table;


  function new (string name = "mac_env_static_config");
    super.new(name);
	phy_port_table = new();
  endfunction : new
  
endclass