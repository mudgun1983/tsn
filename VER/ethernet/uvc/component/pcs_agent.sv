//----------------------------------------------------------------------
//   Copyright 2007-2009 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

`ifndef pcs_agent
`define pcs_agent

class pcs_agent extends uvm_env;
   
    protected uvm_active_passive_enum is_active = UVM_ACTIVE;
   
    pcs_driver             pcs_driver0;
    pcs_base_sequencer     pcs_sequencer0;
    pcs_base_monitor       pcs_monitor0;
    
    pcs_ref_model          pcs_ref_model0;
    
   `uvm_component_utils_begin(pcs_agent)
   `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON) 
   `uvm_component_utils_end

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build
    virtual function void build();
      super.build();
      if(is_active == UVM_ACTIVE) 
        begin
         pcs_driver0        =  pcs_driver::type_id::create("pcs_driver0",this);
         pcs_sequencer0     =  pcs_base_sequencer::type_id::create("pcs_sequencer0",this);          
        end
         pcs_monitor0       =  pcs_base_monitor::type_id::create("pcs_monitor0",this); 
         
       pcs_ref_model0       =  pcs_ref_model::type_id::create("pcs_ref_model0",this); 
    endfunction : build

  //connect
  function void connect();
   if (is_active == UVM_ACTIVE) begin
     pcs_driver0.seq_item_port.connect(pcs_sequencer0.seq_item_export);
   end
   
   pcs_monitor0.item_collected_port.connect(pcs_ref_model0.item_collected_export);
   
  endfunction

  
endclass : pcs_agent
`endif