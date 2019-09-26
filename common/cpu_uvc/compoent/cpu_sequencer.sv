
`ifndef CPU_SEQUENCER__SV
`define CPU_SEQUENCER__SV

class cpu_sequencer extends uvm_sequencer #(cpu_item);

   `uvm_sequencer_utils(cpu_sequencer)

   function new(input string name, uvm_component parent=null);
      super.new(name, parent);
   endfunction : new

endclass : cpu_sequencer

`endif

