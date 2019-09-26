//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       xgmii64_rx_if.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-11-22    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: xgmii64_rx_if
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
// CLASS: xgmii64_rx_if
//
//------------------------------------------------------------------------------

interface xgmii64_rx_if();
  logic              clk  ;
  logic              reset;
  // Actual Signals
  logic    [7:0]     rxc  ;
  logic    [63:0]    rxd  ;

  modport dut_rx 
  ( 
    input  clk               ,
    input  reset             ,
    input  rxc               ,
    input  rxd                        
  );
  
  modport tb_rx ( 
    input  clk               ,
    input  reset             ,
    output rxc               ,
    output rxd                        
  );
endinterface : xgmii64_rx_if
    

