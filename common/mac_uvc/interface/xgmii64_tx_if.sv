//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       xgmii64_tx_if.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-11-22    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: xgmii64_tx_if
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
// CLASS: xgmii64_tx_if
//
//------------------------------------------------------------------------------

interface xgmii64_tx_if();
  logic              clk  ;
  logic              reset;
  // Actual Signals
  logic    [7:0]     txc  ;
  logic    [63:0]    txd  ;

  modport dut_tx 
  ( 
    input  clk               ,
    input  reset             ,
    input  txc               ,
    input  txd                        
  );
  
  modport tb_tx ( 
    input  clk               ,
    input  reset             ,
    output txc               ,
    output txd                        
  );
endinterface : xgmii64_tx_if
    

