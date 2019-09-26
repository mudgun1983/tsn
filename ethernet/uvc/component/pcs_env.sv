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

`ifndef pcs_env
`define pcs_env

class pcs_env extends uvm_env;
   
    pcs_agent             pcs_active_agent0;
    pcs_agent             pcs_passive_agent0;
    pcs_ref_model         pcs_ref_model0;
    
   `uvm_component_utils_begin(pcs_env) 
   `uvm_component_utils_end

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build
    virtual function void build();
      super.build();
        pcs_active_agent0          =  pcs_agent::type_id::create("pcs_active_agent0",this);
        pcs_passive_agent0         =  pcs_agent::type_id::create("pcs_passive_agent0",this);    
        set_config_int("pcs_passive_agent0","is_active",UVM_PASSIVE);     
    endfunction : build

  
endclass : pcs_env
`endif