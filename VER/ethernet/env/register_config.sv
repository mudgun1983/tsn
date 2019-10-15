class register_config extends uvm_object;
`uvm_object_utils( register_config );

PHY_PORT_TABLE phy_port_table;


  function new (string name = "register_config");
    super.new(name);
	phy_port_table = new();
  endfunction : new
  
endclass
