//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       gmii_tx_if.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-4-24    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: gmii_tx_if
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
// CLASS: gmii_tx_if
//
//------------------------------------------------------------------------------

//interface gmii_tx_if(input bit clk,input bit reset);
interface gmii_tx_if();
  logic              clk;
  logic              reset;
  // Actual Signals
  logic              tx_en;
  logic    [7:0]     txd;
  logic              tx_er;

  modport dut_tx 
  ( 
    input  clk               ,
    input  reset             ,
    input  tx_en             ,
    input  txd               ,
    input  tx_er             
  );
  
  modport tb_tx ( 
    input  clk               ,
    input  reset             ,
    output tx_en             ,
    output txd               ,
    output tx_er             
  );
endinterface : gmii_tx_if
    

