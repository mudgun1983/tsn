`ifndef MAC_RX_LABEL_SEQUENCER_SV
`define MAC_RX_LABEL_SEQUENCER_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_rx_label_sequencer
//
//------------------------------------------------------------------------------
typedef class label_frame;
class mac_rx_label_sequencer extends mac_rx_base_sequencer;
  
  protected int unsigned       mac_rx_label_sqr_id;
  uvm_seq_item_pull_port       #(label_frame) upper_req_port;
  
  `uvm_sequencer_utils_begin(mac_rx_label_sequencer)
    `uvm_field_int(mac_rx_label_sqr_id, UVM_ALL_ON)
  `uvm_sequencer_utils_end

  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    upper_req_port = new("upper_req_port",this);
    `uvm_update_sequence_lib_and_item(eth_frame)
  endfunction : new

  //--------------------------------------------------------------------
  // build
  //--------------------------------------------------------------------
  function void build();
    uvm_object dummy;
    if(!get_config_object("mac_env_static_config",dummy,0)) begin
    	uvm_report_error("build","no value for mac_env_static_config");
    end
    else begin
    	if(!$cast(static_cfg,dummy)) 
    		uvm_report_error("build","static_cfg is incorrect type");
    end
    
    set_arbitration(SEQ_ARB_FIFO);
  endfunction : build
  
endclass : mac_rx_label_sequencer

`endif // MAC_RX_LABEL_SEQUENCER_SV

