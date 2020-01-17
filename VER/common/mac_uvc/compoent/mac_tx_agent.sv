`ifndef MAC_TX_AGENT_SV
`define MAC_TX_AGENT_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_tx_agent
//
//------------------------------------------------------------------------------

class mac_tx_agent extends uvm_agent;

  mac_tx_base_monitor           monitor       ;
  protected int unsigned        mac_tx_agent_id   ;
    
  `uvm_component_utils_begin(mac_tx_agent)
    `uvm_field_object  (monitor        ,  UVM_ALL_ON)
    `uvm_field_int     (mac_tx_agent_id,  UVM_ALL_ON)   
  `uvm_component_utils_end
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();
    monitor = mac_tx_base_monitor::type_id::create("monitor", this);
  endfunction : build

endclass : mac_tx_agent

`endif // MAC_TX_AGENT_SV

