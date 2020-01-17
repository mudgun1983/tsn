

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

