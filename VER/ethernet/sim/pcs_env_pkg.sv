//
//----------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc. 
//   Copyright 2010-2011 Synopsys, Inc.
//   Copyright 2013      NVIDIA, Corporation
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
`ifndef PCS_ENV_PKG_SV
`define PCS_ENV_PKG_SV

//dut if
  `include "../tb/dut_if.sv"
  
package pcs_env_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import cpu_pkg::*;
  import mac_pkg::*;

//item
  `include "../uvc/component/ptp_item.sv"
  `include "../uvc/component/sys_item.sv"
  `include "../uvc/component/eth_frame_simplify.sv"
  `include "../uvc/component/descriptor_item.sv"
//top config 
  `include "../config/global_config.sv"
  `include "../config/global_define.sv"
//register config
  `include "../register/register_para.sv"
  `include "../register/CONFIG_TABLE.sv"
  `include "../register/PTP_CONFIG.sv"
  `include "../register/register_config.sv"
  
//componet  
  `include "../env/pcs_virtual_sequencer.sv" 
  `include "../env/dcn_scb.sv" 
  `include "../env/tsn_switch_model.sv"
  `include "../env/tsn_switch_expect_model.sv"
  `include "../env/tsn_switch_monitor_model.sv"
  `include "../env/scoreboard.sv" 
  `include "../env/ptp_scoreboard.sv"
  //`include "../uvc/sequence/pcs_base_seq.sv"    
  `include "../env/pcs_tx_rx_env.sv" 

//seq lib
  //stimulus sequence
  `include "../seq_lib/mac_user_seq_lib.sv"
  `include "../seq_lib/mac_ptp_sequence.sv"
  //register sequence
  `include "../seq_lib/rgm_seq_lib.sv"
  `include "../seq_lib/rgm_user_seq_lib.sv"
  `include "../seq_lib/ptp_reg_seq.sv"
  `include "../seq_lib/sub_ptp_reg_seq.sv"
  `include "../seq_lib/sub_switch_reg_seq.sv"
  //scenario sequence
  `include "../seq_lib/pcs_scenario_seq_lib.sv"
  `include "../seq_lib/scenario_user_seq_lib.sv"
  
//test
  `include "../test_lib/pcs_base_test.sv"
  `include "../test_lib/user_test_lib.sv"

//append test case here  
  `include "../test_lib/ptp/scenario_ptp_rcv_smoke_test.sv"
  `include "../test_lib/ptp/ptp_rcv_smoke_test.sv"
  `include "../test_lib/ptp/ptp_slave_smoke_test.sv"
  `include "../test_lib/ptp/full_instance_one_step_master.sv"
  `include "../test_lib/ptp/full_instance_two_step_master.sv"
  `include "../test_lib/ptp/ptp_master_slave_base_test.sv"
  `include "../test_lib/ptp/ptp_master_slave_two_step_test.sv"
endpackage
`endif

