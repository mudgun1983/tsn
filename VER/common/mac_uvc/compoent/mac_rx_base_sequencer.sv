`ifndef MAC_RX_BASE_SEQUENCER_SV
`define MAC_RX_BASE_SEQUENCER_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_rx_base_sequencer
//
//------------------------------------------------------------------------------

class mac_rx_base_sequencer extends uvm_sequencer #(eth_frame);
  protected int unsigned       mac_rx_base_sqr_id;
  bit  [31:0]  init_crc;
  int          store_value0 = 0;
  `uvm_sequencer_utils_begin(mac_rx_base_sequencer)
    `uvm_field_int(mac_rx_base_sqr_id, UVM_ALL_ON)
	`uvm_field_int(init_crc          , UVM_ALL_ON)
  `uvm_sequencer_utils_end

  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    `uvm_update_sequence_lib_and_item(eth_frame)
  endfunction : new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  //function void build();
  //  uvm_object dummy;
  //  
  //  set_arbitration(SEQ_ARB_FIFO);
  //endfunction : build
  
endclass : mac_rx_base_sequencer

`endif // MAC_RX_BASE_SEQUENCER_SV

