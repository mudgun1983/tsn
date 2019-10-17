
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
    

