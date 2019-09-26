//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       gmii_rx_vif.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-6-1    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: gmii_rx_vif
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

`ifndef GMII_RX_VIF_SV
`define GMII_RX_VIF_SV

//------------------------------------------------------------------------------
//
// CLASS: gmii_rx_vif
//
//------------------------------------------------------------------------------

class gmii_rx_vif extends uvm_object;

  virtual   gmii_rx_if   m_gmii_rx_if;
  
  function new(virtual gmii_rx_if vif);
    m_gmii_rx_if = vif;
  endfunction : new
  
endclass : gmii_rx_vif

`endif // GMII_RX_VIF_SV

