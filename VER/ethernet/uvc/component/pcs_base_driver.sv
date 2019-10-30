

`ifndef PCS_BASE_DRIVER_SV
`define PCS_BASE_DRIVER_SV

//------------------------------------------------------------------------------
//
// CLASS: pcs_base_driver
//
//------------------------------------------------------------------------------

class pcs_base_driver extends uvm_driver #(pcs_item);

  uvm_event                    packet_tx_started;
  uvm_event                    packet_tx_ended  ;

  
  `uvm_component_utils(pcs_base_driver)
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

//  virtual  task get_and_drive();
//    return;
//  endtask : get_and_drive
//
//  virtual  task reset_signals();
//    return;
//  endtask : reset_signals
    
endclass : pcs_base_driver

`endif // pcs_base_driver_SV

