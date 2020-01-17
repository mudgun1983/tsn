
class cpu_config extends uvm_object;
   int hold_cycles = 15;
   int idle_cycles = 15;
   `uvm_object_utils(cpu_config)
   virtual cpu_if vif;
  
endclass

