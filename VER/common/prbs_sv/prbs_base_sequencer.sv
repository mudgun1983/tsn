`ifndef PRBS_BASE_SEQUENCER_SV
`define PRBS_BASE_SEQUENCER_SV

//------------------------------------------------------------------------------
//
// CLASS: label_base_sequencer
//
//------------------------------------------------------------------------------

class prbs_base_sequencer extends uvm_sequencer #(prbs_item);

 
//==================== Attribute =================//  
    protected int prbs_sqr_id     ;
    protected int prbs_para = 23  ;
    bit prbs_data[];
//==================== Attribute =================//  


//==================== Registration ==============//
   `uvm_sequencer_utils_begin(prbs_base_sequencer)
     `uvm_field_int(prbs_sqr_id, UVM_ALL_ON)
     `uvm_field_int(prbs_para  , UVM_ALL_ON)
   `uvm_sequencer_utils_end
//==================== Registration ==============//

 //================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name, uvm_component parent);
        super.new(name, parent);
        `uvm_update_sequence_lib_and_item(prbs_item)      
    endfunction : new
    
//================================================//
//FUNCTION    : build
//DESCRIPTION : 
//================================================//
    function void build();
        super.build();
        prbs_data=new[prbs_para];

        foreach(prbs_data[i])
          prbs_data[i]=1;                       
        
        set_arbitration(SEQ_ARB_FIFO);
    endfunction
  
endclass : prbs_base_sequencer

`endif // LABEL_BASE_SEQUENCER_SV

