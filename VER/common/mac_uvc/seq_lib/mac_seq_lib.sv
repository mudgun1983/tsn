

//------------------------------------------------------------------------------
// CLASS: mac_base_sequence
//------------------------------------------------------------------------------
/*{{{*/
typedef class mac_rx_base_sequencer;

class mac_base_sequence extends uvm_sequence#(eth_frame);
 
  rand bit [47:0] frame_cnt;
  rand bit [47:0] da_frame_cnt;
  rand bit [47:0] sa_frame_cnt;

  `ifdef GMII_RX_PUSH_MODE
    `uvm_sequence_utils(mac_base_sequence,mac_rx_base_push_sequencer)
  `else
    `uvm_sequence_utils(mac_base_sequence,mac_rx_base_sequencer)
  `endif

  //================================================//
  //FUNCTION    : new
  //================================================//
    function new (string name = "mac_base_sequence");               
      super.new();
    endfunction:new

  //================================================//
  //TASK    : body
  //================================================//
    virtual task body();
       `uvm_info(get_type_name(),{$psprintf("generate item\n",),req.sprint()},UVM_FULL);
    endtask: body

endclass : mac_base_sequence
/*}}}*/

