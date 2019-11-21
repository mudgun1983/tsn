`ifndef GMII_RX_VIF_SV
`define GMII_RX_VIF_SV

//------------------------------------------------------------------------------
//
// CLASS: gmii_rx_vif
//
//------------------------------------------------------------------------------

class gmii_rx_vif extends uvm_object;

  virtual   gmii_rx_if   m_gmii_rx_if;
  
  function new(virtual gmii_rx_if vif);
    m_gmii_rx_if = vif;
  endfunction : new
  
endclass : gmii_rx_vif

`endif // GMII_RX_VIF_SV

