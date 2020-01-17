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
    

