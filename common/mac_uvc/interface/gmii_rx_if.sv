//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       gmii_rx_if.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-4-24    Li Xiangqiong   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: gmii_rx_if
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
// CLASS: gmii_rx_if
//
//------------------------------------------------------------------------------

//interface gmii_rx_if(input bit clk,input bit reset);
interface gmii_rx_if();

  logic              clk;
  logic              reset;
  // Actual Signals
  logic              rx_dv;
  logic    [7:0]     rxd;
  logic              rx_er;

  modport dut_rx 
  ( 
    input  clk               ,
    input  reset             ,
    output rx_dv             ,
    output rxd               ,
    output rx_er             
  );
  
  modport tb_rx ( 
    input clk               ,
    input reset             ,
    input rx_dv             ,
    input rxd               ,
    input rx_er             
  );
    	
endinterface : gmii_rx_if
    

