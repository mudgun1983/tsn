//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       mac_tx_base_monitor.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-20    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: mac_tx_base_monitor
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

`ifndef MAC_TX_BASE_MONITOR_SV
`define MAC_TX_BASE_MONITOR_SV

class mac_tx_data_que;
  bit [7:0] data[$];

endclass : mac_tx_data_que

//------------------------------------------------------------------------------
//
// CLASS: mac_tx_base_monitor
//
//------------------------------------------------------------------------------

class mac_tx_base_monitor extends uvm_monitor;

  mac_tx_data_que           mac_tx_data_que[$];
  eth_frame                 trans_collected[$];
  event                     coverage_done     ;
  event                     idle_too_large_event;
  
  uvm_analysis_port #(eth_frame) item_collected_port;
  
  `uvm_component_utils(mac_tx_base_monitor)
  
  //--------------------------------------------------------------------
  // new - constructor
  //--------------------------------------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    item_collected_port = new("item_collected_port", this);
//    foreach(mac_tx_data_que[key])
//      mac_tx_data_que[key]= new();
  endfunction : new
  
  virtual task run();
    fork
      collect_trans();
    join  
  endtask : run
  
  virtual protected task collect_trans();
    return;   
  endtask : collect_trans
  
endclass : mac_tx_base_monitor

`endif // MAC_TX_BASE_MONITOR_SV

