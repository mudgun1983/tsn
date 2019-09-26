//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       label_item.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Chen Chengman
// AUTHOR'S EMAIL:  chen.chengman@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-13    Chen Chengman   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: label_item
//-----------------------------------------------------------------------------------------------------
// PURPOSE: 
//--------------------------------------------------------------------------------------------------
// PARAMETERS
//         PARAM  NAME    RANGE    : DESCRIPTION    :DEFAULT   :UNITS

//-----------------------------------------------------------------------------------------------------
//REUSE ISSUES
// Reset Strategy:  N/A
// Clock  Domains:  N/A
// Critical Timing: N/A
// Test   Features: N/A
// Asynchronous I/F:N/A
// Scan Methodology:N/A
// Instaniations:   N/A
// Synthesizable:   N/A
// Other:   
// END_HEADER---------------------------------------------------------------------------------------------

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
