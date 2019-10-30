
`ifndef PCS_BASE_SEQUENCER_SV
`define PCS_BASE_SEQUENCER_SV

//------------------------------------------------------------------------------
//
// CLASS: pcs_base_sequencer
//
//------------------------------------------------------------------------------

class pcs_base_sequencer extends uvm_sequencer #(pcs_item);

 
//==================== Attribute =================//  
    protected int pcs_seqr_id;
    int pcs_block_count;
//==================== Attribute =================//  


//==================== Registration ==============//
`uvm_sequencer_utils_begin(pcs_base_sequencer)
   `uvm_field_int(pcs_seqr_id, UVM_ALL_ON)
   `uvm_field_int(pcs_block_count, UVM_ALL_ON)
`uvm_sequencer_utils_end

//   `uvm_sequencer_utils_begin(pcs_base_sequencer)
//     `uvm_field_int(pcs_seqr_id, UVM_ALL_ON)
//     `uvm_field_int(pcs_block_count, UVM_ALL_ON)
//   `uvm_sequencer_utils_end
//==================== Registration ==============//

 //================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name, uvm_component parent);
        super.new(name, parent);
        `uvm_update_sequence_lib_and_item(pcs_item)      
    endfunction : new
    
//================================================//
//FUNCTION    : build
//DESCRIPTION : 
//================================================//
    function void build();
        super.build();
        set_arbitration(SEQ_ARB_FIFO);
    endfunction
  
endclass : pcs_base_sequencer

`endif // pcs_base_sequencer_SV

