`ifndef PRBS_SV
`define PRBS_SV


//------------------------------------------------------------------------------
//
// CLASS: label_item
//
//------------------------------------------------------------------------------

class prbs_item extends uvm_sequence_item;
   
//==================== Enum ======================//
//typedef typedef enum {,,} enum_name

//==================== Enum ======================//


//==================== Knob ======================//
//randc enum_name kind_name;
    
//==================== Knob ======================//


//==================== Attribute =================// 
rand bit prbs_data;
 //==================== Attribute =================//


//==================== Registration ==============//
    `uvm_object_utils_begin(prbs_item)
         `uvm_field_int(prbs_data   , UVM_ALL_ON|UVM_NOPACK)                     
    `uvm_object_utils_end
//==================== Registration ==============//



//==================== Constraint ================//

//==================== Constraint ================//



//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "prbs_item");               
        super.new();                    
    endfunction:new 
 
endclass : prbs_item

`endif // LABEL_ITEM_SV
