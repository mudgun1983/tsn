`ifndef MAC_RX_BASE_PUSH_SEQUENCER_SV
`define MAC_RX_BASE_PUSH_SEQUENCER_SV

//------------------------------------------------------------------------------
//
// CLASS: mac_rx_base_push_sequencer
//
//------------------------------------------------------------------------------

class mac_rx_base_push_sequencer extends uvm_push_sequencer #(eth_frame);

  protected int unsigned       mac_rx_base_push_sqr_id;
  mac_runtime_config_item      rt_cfg;
  mac_env_static_config        static_cfg;

  `uvm_sequencer_utils_begin(mac_rx_base_push_sequencer)
    `uvm_field_int(mac_rx_base_push_sqr_id, UVM_ALL_ON)
  `uvm_sequencer_utils_end

  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    `uvm_update_sequence_lib_and_item(eth_frame)
    rt_cfg     = new();
    static_cfg = new();
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

endclass : mac_rx_base_push_sequencer

`endif // MAC_RX_BASE_PUSH_SEQUENCER_SV

