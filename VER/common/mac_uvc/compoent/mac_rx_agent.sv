`ifndef MAC_RX_AGENT_SV
`define MAC_RX_AGENT_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_rx_agent
//
//------------------------------------------------------------------------------

class mac_rx_agent extends uvm_agent;
  mac_rx_base_driver            driver        ;
  mac_rx_base_sequencer         sequencer     ;
  mac_rx_base_monitor           monitor       ;
  protected int unsigned        mac_rx_agent_id   ;
    
  `uvm_component_utils_begin(mac_rx_agent)
    `uvm_field_object  (driver         ,  UVM_ALL_ON)
    `uvm_field_object  (sequencer      ,  UVM_ALL_ON)
    `uvm_field_object  (monitor        ,  UVM_ALL_ON)
    `uvm_field_int     (mac_rx_agent_id,  UVM_ALL_ON)   
  `uvm_component_utils_end
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();
    super.build();
    sequencer= mac_rx_base_sequencer::type_id::create("sequencer", this);
    driver   = mac_rx_base_driver::type_id::create("driver", this)      ;
    monitor  = mac_rx_base_monitor::type_id::create("monitor", this);
  endfunction : build

  //--------------------------------------------------------------------
  // connect
  //--------------------------------------------------------------------
  function void connect();  
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction

endclass : mac_rx_agent

`endif // MAC_RX_AGENT_SV

