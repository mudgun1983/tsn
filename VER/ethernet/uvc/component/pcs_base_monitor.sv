

`ifndef PCS_BASE_MONITOR_SV
`define PCS_BASE_MONITOR_SV

//------------------------------------------------------------------------------
//
// CLASS: pcs_base_monitor
//
//------------------------------------------------------------------------------

class pcs_base_monitor extends uvm_monitor ;

  uvm_event                    packet_tx_started;
  uvm_event                    packet_tx_ended  ;
  
  `uvm_component_utils(pcs_base_monitor)
  
  uvm_analysis_port #(pcs_item) item_collected_port;
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    item_collected_port = new("item_collected_port", this);
    
  endfunction : new

  virtual task run_phase(uvm_phase phase);
    fork
      collect_transactions();
    join
  endtask : run_phase

// collect_transactions
  virtual protected task collect_transactions();
  endtask  
    
endclass : pcs_base_monitor

`endif // pcs_base_driver_SV

