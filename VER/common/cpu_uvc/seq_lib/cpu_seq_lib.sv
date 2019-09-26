

`ifndef CPU_SEQ_LIB_SV
`define CPU_SEQ_LIB_SV

typedef class cpu_sequencer;

class cpu_base_sequence extends uvm_sequence #(cpu_item);
    
    `uvm_sequence_utils(cpu_base_sequence,cpu_sequencer)
    function new(string name="cpu_base_sequence");
        super.new(name);
    endfunction : new
 
    virtual task body();
        `uvm_do(req)
        `uvm_info(get_type_name(),{$psprintf("generate item\n",),req.sprint()},UVM_FULL);
    endtask
endclass : cpu_base_sequence

`endif // CPU_SEQ_LIB_SV
