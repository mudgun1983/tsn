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

  //add by liaoyuan
  import base_package::*;
  import obm_mac_package::*;
  import scatter_obm_package::*;
  import obm_dut_cfg_package::*;
  import crllist_chk_package::*;
  //ended by liaoyuan

//global define
  `include "../config/global_define.sv"
  //add by liaoyuan
  `include "../../mac_qbv/env/obm_define.sv"
  //ended by liaoyuan
   

//top config 
  `include "../config/global_config.sv"
  
//item
  `include "../uvc/component/ptp_item.sv"
  `include "../uvc/component/sys_item.sv"
  `include "../uvc/component/eth_frame_simplify.sv"
  `include "../uvc/component/descriptor_item.sv"

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
  `include "../env/scoreboard_p_e_out_of_order.sv"
  //`include "../uvc/sequence/pcs_base_seq.sv"    
 //add by liaoyuan
 `include "../../mac_qbv/env/obm_cmp_xaction.sv"
 `include "../../mac_qbv/env/base_scoreboard.sv"
 `include "../../mac_qbv/env/obm_rm.sv"
 //`include "../../mac_qbv/env/obm_dut_cfg.sv"
  `include "../../mac_qbv/env/obm_scoreboard.sv"
  `include "../../mac_qbv/env/obm_env.sv"
  //ended by liaoyuan

  `include "../env/pcs_tx_rx_env.sv" 
  `include "../env/tsn_switch_expect_model_qci.sv"
  `include "../env/tsn_switch_monitor_model_qci.sv"
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
  `include "../seq_lib/br_reg_seq.sv"
  `include "../seq_lib/qci_reg_seq.sv"
  //scenario sequence
  `include "../seq_lib/pcs_scenario_seq_lib.sv"
  `include "../seq_lib/scenario_user_seq_lib.sv"
  //add by liaoyuan
  `include "../../mac_qbv/seq_lib/qbv_reg_seq.sv"
  //ended by liaoyuan

  
  `include "../test_lib/br/scenario_simple_preemptable_packet_port_test.sv"
  `include "../test_lib/br/scenario_simple_e_p_mix_packet_port_test.sv"
  `include "../test_lib/br/scenario_simple_e_p_random_packet_port_test.sv"
//test
  `include "../test_lib/pcs_base_test.sv"
  `include "../test_lib/user_test_lib.sv"
  //add by liaoyuan
  `include "../../mac_qbv/tc/tc_qbv.sv"
 `include "../../mac_qbv/test_lib/qbv/qbv_base_test.sv"
 `include "../../mac_qbv/test_lib/qbv/qbv_test_case0.sv"
 //ended by liaoyuan

//append test case here  
  //PTP
  `include "../test_lib/ptp/scenario_ptp_rcv_smoke_test.sv"
  `include "../test_lib/ptp/ptp_rcv_smoke_test.sv"
  `include "../test_lib/ptp/ptp_slave_smoke_test.sv"
  `include "../test_lib/ptp/full_instance_one_step_master.sv"
  `include "../test_lib/ptp/full_instance_two_step_master.sv"
  `include "../test_lib/ptp/ptp_master_slave_base_test.sv"
  `include "../test_lib/ptp/ptp_master_slave_two_step_test.sv"
  `include "../test_lib/ptp/full_instance_rcv_one_step_master.sv"
  `include "../test_lib/ptp/full_instance_rcv_two_step_master.sv"
  `include "../test_lib/ptp/full_instance_slave.sv"
  `include "../test_lib/ptp/ptp_rcv_vlan_random_one_instance_test.sv"
  //BR
  `include "../test_lib/br/simple_n_packet_port_test.sv"  
  `include "../test_lib/br/simple_preemptable_packet_port_test.sv"  
  `include "../test_lib/br/simple_e_p_mix_packet_port_test.sv" 
  `include "../test_lib/br/simple_e_p_random_packet_port_test.sv"
  `include "../test_lib/br/simple_p_packet_port_test.sv"
  `include "../test_lib/br/e_n_packet_multi_port_to_e_p_mac_test.sv"
  `include "../test_lib/br/e_p_packet_multi_port_to_e_mac_test.sv"
  `include "../test_lib/br/smd_r_response_port_test.sv"
  `include "../test_lib/br/smd_v_trigger_port_test.sv"
  `include "../test_lib/br/e_n_packet_set_port_to_e_p_mac_test.sv"
  `include "../test_lib/br/e_p_packet_set_port_to_e_mac_test.sv"
  
  //QCI
  `include "../test_lib/qci/simple_qci_smoke_test.sv"
  `include "../test_lib/qci/test_qci_bypass_packet.sv"
  `include "../test_lib/qci/test_qci_bypass_multi_stream.sv"
  `include "../test_lib/qci/test_qci_pass_multi_port.sv"
  `include "../test_lib/qci/test_qci_bypass_multi_port.sv"
  `include "../test_lib/qci/test_qci_pass_multi_vid_one_port.sv"
  `include "../test_lib/qci/test_qci_pass_multi_port_with_bypass_background.sv"
  `include "../test_lib/qci/test_qci_pass_multi_port_multi_gate.sv"
  `include "../test_lib/qci/test_qci_pass_multi_port_multi_gate_with_bypass_background.sv"
  
  //switch
  `include "../test_lib/switch/full_throughput_switch_vlan_random_test.sv"
endpackage

import pcs_env_pkg::*;
`endif

