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

`ifndef pcs_tx_rx_env
`define pcs_tx_rx_env

class pcs_tx_rx_env extends uvm_env;
   
  //  pcs_env             pcs_tx_env0;
    pcs_env               pcs_rx_env0;
    cpu_agent             cpu_agent0;
    pcs_virtual_sequencer virt_seqr;
    mac_env               mac_env0;
    
    scoreboard            scb0 ;
    tsn_switch_model      tsn_switch_model0;
    uvm_tlm_analysis_fifo#(eth_frame)       expect_fifo,expect_fifo0;
    uvm_tlm_analysis_fifo#(eth_frame)       monitor_fifo;
   
   `uvm_component_utils_begin(pcs_tx_rx_env) 
   `uvm_component_utils_end

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build
    virtual function void build();
      super.build();
        expect_fifo         =  new("expect_fifo",this);
		expect_fifo0         =  new("expect_fifo0",this);
        monitor_fifo         =  new("monitor_fifo",this);
        
        pcs_rx_env0              =  pcs_env::type_id::create("pcs_rx_env0",this);
        cpu_agent0               =  cpu_agent::type_id::create("cpu_agent0",this);
        mac_env0                 =  mac_env::type_id::create("mac_env0",this);
        virt_seqr                =  pcs_virtual_sequencer::type_id::create("virt_seqr",this);
        scb0                     =  scoreboard::type_id::create("scb0",this);
		tsn_switch_model0        =  tsn_switch_model::type_id::create("tsn_switch_model0",this);
 //       pcs_tx_env0        =  pcs_env::type_id::create("pcs_tx_env0",this);
        //pcs_rgm_model_env0 =  rgm_model_tb::type_id::create("pcs_rgm_model_env0",this);        
    endfunction : build
 
  //connect
   function void connect();  
                  
    //virtual sqr//
        virt_seqr.rgm_sqr         = cpu_agent0.sequencer;
        virt_seqr.mac_sqr         = mac_env0.mac_rx_agent0.sequencer;
        
        mac_env0.mac_rx_agent0.monitor.item_collected_port.connect(expect_fifo.analysis_export);
        scb0.expect_get_port.connect(expect_fifo.blocking_get_export);
        
		mac_env0.mac_rx_agent0.monitor.item_collected_port.connect(expect_fifo0.analysis_export);
		tsn_switch_model0.get_port.connect(expect_fifo0.blocking_get_export);
		
        mac_env0.mac_tx_agent0.monitor.item_collected_port.connect(monitor_fifo.analysis_export);
        scb0.monitor_get_port.connect(monitor_fifo.blocking_get_export);    
    endfunction : connect
  
  
endclass : pcs_tx_rx_env
`endif