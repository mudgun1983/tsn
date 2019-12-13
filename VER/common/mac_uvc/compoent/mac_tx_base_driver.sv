`ifndef MAC_TX_BASE_DRIVER_SV
`define MAC_TX_BASE_DRIVER_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_tx_base_driver
//
//------------------------------------------------------------------------------

class mac_tx_base_driver extends uvm_driver #(eth_frame);

  uvm_event                    packet_tx_started;
  uvm_event                    packet_tx_ended  ;
  
  REQ                          reqs_list[$]     ;
  bit                          cfg_ResetMode    ;
  bit                          cfg_LinkEN       ;
  
  `uvm_component_utils(mac_tx_base_driver)
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    packet_tx_started = new("packet_tx_started");
    packet_tx_ended   = new("packet_tx_ended  ");
  endfunction : new

  virtual protected task get_and_drive();
    return;
  endtask : get_and_drive

  virtual protected task reset_signals();
    return;
  endtask : reset_signals
  
  virtual protected task mac_tx(eth_frame trans);
    return;
  endtask : mac_tx
  
endclass : mac_tx_base_driver

`endif // MAC_TX_BASE_DRIVER_SV

