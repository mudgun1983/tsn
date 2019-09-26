//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       pcs_xilinx_serdes_if.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-4-24    Li Xiangqiong   OVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: pcs_xilinx_serdes_if
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


//------------------------------------------------------------------------------
//
// CLASS: pcs_xilinx_serdes_if
//
//------------------------------------------------------------------------------

//interface pcs_xilinx_serdes_if(input bit clk,input bit reset);
interface pcs_xilinx_serdes_if();

  logic              clk;
  logic              reset;
  // Actual Signals
  logic  [319:0]     sig_data;
    	
endinterface : pcs_xilinx_serdes_if
    

