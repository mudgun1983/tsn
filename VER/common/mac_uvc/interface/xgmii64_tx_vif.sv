`ifndef XGMII64_TX_VIF_SV
`define XGMII64_TX_VIF_SV

//------------------------------------------------------------------------------
//
// CLASS: xgmii64_tx_vif
//
//------------------------------------------------------------------------------

class xgmii64_tx_vif extends uvm_object;

  virtual   xgmii64_tx_if   m_xgmii64_tx_if;
  
  function new(virtual xgmii64_tx_if vif);
    m_xgmii64_tx_if = vif;
  endfunction : new
  
endclass : xgmii64_tx_vif

`endif // XGMII64_TX_VIF_SV

