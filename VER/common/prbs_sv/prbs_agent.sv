//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       oam_agent.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Chen Chengman
// AUTHOR'S EMAIL:  chen.chengman@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2011-9-13    Chen Chengman   UVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: label_agent
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
// END_HEADER--------------------------------------------------------------------------------------------

`ifndef PRBS_AGENT_SV
`define PRBS_AGENT_SV

//------------------------------------------------------------------------------
//
// CLASS: label_agent
//
//------------------------------------------------------------------------------

class prbs_agent extends uvm_agent;


//==================== Attribute =================//
  protected uvm_active_passive_enum is_active = UVM_ACTIVE;
  protected int prbs_agent_id;
//==================== Attribute =================//

  prbs_base_sequencer  sequencer;
  
 
//==================== Registration ==============// 
  `uvm_component_utils_begin(prbs_agent)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
    `uvm_field_int(prbs_agent_id, UVM_ALL_ON)
  `uvm_component_utils_end
//==================== Registration ==============//

//================================================//
//FUNCTION    : new
//DESCRIPTION : constructor
//================================================//
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

//================================================//
//FUNCTION    : build
//DESCRIPTION : 
//================================================//
    function void build();
         super.build();        
         if(is_active == UVM_ACTIVE) begin
             sequencer = prbs_base_sequencer::type_id::create("sequencer", this);      
         end
         //test_driver = label_test_driver::type_id::create("test_driver", this);  //need delete
    endfunction : build

//================================================//
//FUNCTION    : connect
//DESCRIPTION : 
//================================================//
    function void connect();
        ;//test_driver.seq_item_port.connect(label_sequencer0.seq_item_export);   //need delete      
    endfunction : connect


endclass : prbs_agent

`endif // LABEL_AGENT_SV

