//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       pcs_xilinx_serdes_vif.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-6-1    Li Xiangqiong   OVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: pcs_xilinx_serdes_vif
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

`ifndef pcs_xilinx_serdes_vif
`define pcs_xilinx_serdes_vif

//------------------------------------------------------------------------------
//
// CLASS: pcs_xilinx_serdes_if
//
//------------------------------------------------------------------------------

class pcs_xilinx_serdes_vif extends uvm_object;

  virtual   pcs_xilinx_serdes_if   pcs_xilinx_serdes_if;
  
  function new(virtual pcs_xilinx_serdes_if vif);
    pcs_xilinx_serdes_if = vif;
  endfunction : new
  
endclass : pcs_xilinx_serdes_vif

`endif // pcs_xilinx_serdes_vif

