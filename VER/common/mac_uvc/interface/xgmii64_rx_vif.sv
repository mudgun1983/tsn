`ifndef XGMII64_RX_VIF_SV
`define XGMII64_RX_VIF_SV

//------------------------------------------------------------------------------
//
// CLASS: xgmii64_rx_vif
//
//------------------------------------------------------------------------------

class xgmii64_rx_vif extends uvm_object;

  virtual   xgmii64_rx_if   m_xgmii64_rx_if;
  
  function new(virtual xgmii64_rx_if vif);
    m_xgmii64_rx_if = vif;
  endfunction : new
  
endclass : xgmii64_rx_vif

`endif // XGMII64_RX_VIF_SV

