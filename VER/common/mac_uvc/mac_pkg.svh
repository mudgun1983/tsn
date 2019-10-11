`include "interface/gmii_tx_if.sv" 
//`include "interface/gmii_tx_vif.sv" 
`include "interface/gmii_rx_if.sv" 
//`include "interface/gmii_rx_vif.sv"  
`include "interface/xgmii64_tx_if.sv" 
//`include "interface/xgmii64_tx_vif.sv" 
`include "interface/xgmii64_rx_if.sv" 
//`include "interface/xgmii64_rx_vif.sv"  

package mac_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  //typedef virtual gmii_tx_if      ge_tx_vif;
  //typedef virtual gmii_rx_if      ge_rx_vif;
  //typedef virtual xgmii64_tx_if   xge_tx_vif;
  //typedef virtual xgmii64_rx_if   xge_rx_vif;  
 

  //parameter,enum define
  `include "mac_define.sv"
  //interface class
   `include "interface/gmii_rx_vif.sv" 
   `include "interface/gmii_tx_vif.sv" 
   `include "interface/xgmii64_rx_vif.sv" 
   `include "interface/xgmii64_tx_vif.sv" 
 
  `include "crc_cal.sv"
  //item
  `include "item/eth_directed_protocol_error.sv" 
  `include "item/eth_protocol_error.sv" 
  `include "item/eth_preamble.sv" 
  `include "item/eth_tagged_data.sv"
  `include "item/eth_frame.sv" 
  //config
  //`include "env/runtime_config_item.sv"
  //`include "env/mac_env_static_config.sv" 
  //`include "env/mac_runtime_config_item.sv"
  //sequence_lib
  `include "seq_lib/mac_seq_lib.sv"
  //compoent
  `include "compoent/mac_rx_base_sequencer.sv" 
  `include "compoent/mac_rx_base_driver.sv"  
  `include "compoent/mac_rx_base_monitor.sv"  
  `include "compoent/mac_tx_base_sequencer.sv" 
  `include "compoent/mac_tx_base_driver.sv"  
  `include "compoent/mac_tx_base_monitor.sv"  
  `include "compoent/gmii_rx_driver.sv"  
  `include "compoent/gmii_rx_monitor.sv"
  `include "compoent/gmii_tx_driver.sv"  
  `include "compoent/gmii_tx_monitor.sv"
  `include "compoent/xgmii64_rx_driver.sv"  
  `include "compoent/xgmii64_rx_monitor.sv"
  `include "compoent/xgmii64_tx_driver.sv"  
  `include "compoent/xgmii64_tx_monitor.sv"  
    
  `include "compoent/mac_rx_agent.sv" 
  `include "compoent/mac_tx_agent.sv" 
  //env & 
  `include "env/mac_env.sv" 

endpackage:mac_pkg
