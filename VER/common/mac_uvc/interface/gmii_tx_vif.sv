`ifndef GMII_TX_VIF_SV
`define GMII_TX_VIF_SV

//------------------------------------------------------------------------------
//
// CLASS: gmii_tx_vif
//
//------------------------------------------------------------------------------

class gmii_tx_vif extends uvm_object;

  virtual   gmii_tx_if   m_gmii_tx_if;
  
  function new(virtual gmii_tx_if vif);
    m_gmii_tx_if = vif;
  endfunction : new
  
endclass : gmii_tx_vif

`endif // GMII_TX_VIF_SV

