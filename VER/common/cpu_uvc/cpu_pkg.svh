//`include "cpu_if.sv"

package cpu_pkg; 

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  

  typedef virtual cpu_if cpu_vif;
  
  //item
  `include "cpu_item.sv"
  //config
  `include "cpu_config.sv"
  //sequence_lib
  `include "cpu_seq_lib.sv"
  //compoent
  `include "cpu_sequencer.sv"
  `include "cpu_driver.sv"
  `include "cpu_monitor.sv"
  `include "cpu_agent.sv"
endpackage
