//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_rx_agent.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-20    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_rx_agent
//-----------------------------------------------------------------------------------------------------
// PURPOSE: 
//--------------------------------------------------------------------------------------------------
// PARAMETERS
//         PARAM  NAME    RANGE    : DESCRIPTION    :DEFAULT   :UNITS

//-----------------------------------------------------------------------------------------------------
//REUSE ISSUES
// Reset Strategy:  N/A
// Clock  Domains:  N/A
// Critical Timing: N/A
// Test   Features: N/A
// Asynchronous I/F:N/A
// Scan Methodology:N/A
// Instaniations:   N/A
// Synthesizable:   N/A
// Other:   
// END_HEADER---------------------------------------------------------------------------------------------

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

