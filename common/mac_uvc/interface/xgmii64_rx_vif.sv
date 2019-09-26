//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       xgmii64_rx_vif.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-10-25    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: xgmii64_rx_vif
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

`ifndef XGMII64_RX_VIF_SV
`define XGMII64_RX_VIF_SV

//------------------------------------------------------------------------------
//
// CLASS: xgmii64_rx_vif
//
//------------------------------------------------------------------------------

class xgmii64_rx_vif extends uvm_object;

  virtual   xgmii64_rx_if   m_xgmii64_rx_if;
  
  function new(virtual xgmii64_rx_if vif);
    m_xgmii64_rx_if = vif;
  endfunction : new
  
endclass : xgmii64_rx_vif

`endif // XGMII64_RX_VIF_SV

