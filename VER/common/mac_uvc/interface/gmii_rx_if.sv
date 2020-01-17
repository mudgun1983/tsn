

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
    

