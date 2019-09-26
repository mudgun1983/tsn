../../../RTL/core_logic/rtl/dcn/crc32_d8.v
../../../RTL/core_logic/rtl/dcn/dcn_tx/dcn_tx_shim.v
../../../RTL/core_logic/rtl/dcn/dcn_tx/packet_restore.v
../../../RTL/core_logic/rtl/dcn/dcn_tx/dcn_tx_top.v
../../../RTL/core_logic/rtl/dcn/dcn_tx/packet_classify.v
../../../RTL/core_logic/rtl/dcn/dcn_tx/block_to_shim_buf.v
../../../RTL/core_logic/rtl/dcn/dcn_tx/insert_s_t_block.v
../../../RTL/core_logic/rtl/dcn/dcn_tx/sect_data_robin.v

../../../RTL/core_logic/rtl/dcn/sync_fifo.v
../../../RTL/core_logic/rtl/dcn/dcn_cpu_main.v
../../../RTL/core_logic/rtl/dcn/sync_fifo_ctrl.v
../../../RTL/core_logic/rtl/dcn/block_ram_no_reg.v

../../../RTL/core_logic/rtl/dcn/dcn_rx/data_latch.v
../../../RTL/core_logic/rtl/dcn/dcn_rx/dcn_rx_shim.v
../../../RTL/core_logic/rtl/dcn/dcn_rx/dcn_rx_top.v
../../../RTL/core_logic/rtl/dcn/dcn_rx/decode_64b66b_dcn.v
../../../RTL/core_logic/rtl/dcn/dcn_rx/delete_s_t_block.v
../../../RTL/core_logic/rtl/dcn/dcn_rx/packet_reassemble.v
../../../RTL/core_logic/rtl/dcn/dcn_rx/dcn_rx_top.v


../../../RTL/core_logic/rtl/dcn/dcn_top.v
../../../RTL/core_logic/rtl/dcn/gmii_packet_gen.v

ge_mac.v
../../../RTL/core_logic/rtl/dcn/mac_rx_crc32.v
../../../RTL/core_logic/rtl/dcn/crc32_cal.v

//==============    pcs   ================//
../../../RTL/core_logic/rtl/pcs/cnt_module_16.v

//============== overhead ================//
../../../RTL/core_logic/rtl/overhead_manage/rx/cpu_interface_re.v
../../../RTL/core_logic/rtl/overhead_manage/rx/crc16_d144.v
../../../RTL/core_logic/rtl/overhead_manage/rx/overhead_receive_pro_top.v
../../../RTL/core_logic/rtl/overhead_manage/rx/overhead_filter.v
../../../RTL/core_logic/rtl/overhead_manage/rx/ovhead_info_manage_re.v
../../../RTL/core_logic/rtl/overhead_manage/rx/crc16_d136.v
../../../RTL/core_logic/rtl/overhead_manage/tx/overhead_send_pro_top.v
../../../RTL/core_logic/rtl/overhead_manage/tx/cpu_interface_se.v
../../../RTL/core_logic/rtl/overhead_manage/tx/ovhead_send_pro.v

//============== shim    ================//
../../../RTL/core_logic/rtl/shim/shim_rx/decode_64b66b_shim.v
../../../RTL/core_logic/rtl/shim/shim_rx/fault_detect.v
../../../RTL/core_logic/rtl/shim/shim_rx/shim_rx.v
../../../RTL/core_logic/rtl/shim/shim_rx/get_client_bitmap.v
../../../RTL/core_logic/rtl/shim/shim_rx/cross_client_recover.v
../../../RTL/core_logic/rtl/shim/shim_rx/decode_64b66b_flexe.v
../../../RTL/core_logic/rtl/shim/shim_rx/down_client_recover.v
../../../RTL/core_logic/rtl/shim/shim_rx/client_recover_cpu_intf.v
../../../RTL/core_logic/rtl/shim/shim_rx/cross_get_client_bitmap.v
../../../RTL/core_logic/rtl/shim/shim_cross/slot_switch.v
../../../RTL/core_logic/rtl/shim/shim_cross/dist_ram_reg.v
../../../RTL/core_logic/rtl/shim/shim_cross/pkt_stat.v
../../../RTL/core_logic/rtl/shim/shim_cross/client_rcv.v
../../../RTL/core_logic/rtl/shim/shim_cross/client_pro.v
../../../RTL/core_logic/rtl/shim/shim_cross/slot_buf.v
../../../RTL/core_logic/rtl/shim/shim_cross/register_pro.v
../../../RTL/core_logic/rtl/shim/shim_cross/slot_gen.v
../../../RTL/core_logic/rtl/shim/shim_tx/shim_tx.v
../../../RTL/core_logic/rtl/shim/shim_tx/client_slot_num_calculate.v
../../../RTL/core_logic/rtl/shim/shim_tx/slot_map.v
../../../RTL/core_logic/rtl/shim/shim_tx/slot_map_cpu_intf.v
../../../RTL/core_logic/rtl/shim/shim_tx/shim_mux_or_cell.v
../../../RTL/core_logic/rtl/shim/shim_tx/encode_66b.v
../../../RTL/core_logic/rtl/shim/shim_tx/slot_map_controller.v
../../../RTL/core_logic/rtl/shim/shim_tx/shim_mux_or.v
../../../RTL/core_logic/rtl/shim/shim_tx/background_taffic_insert.v
../../../RTL/core_logic/rtl/shim/shim_tx/bg_tc_tx_blk_no_gen.v

../../../RTL/core_logic/rtl/shim/shim_top/shim_top.v
../../../RTL/core_logic/rtl/shim/shim_top/shim_cpu_intf.v
../../../RTL/core_logic/rtl/shim/shim_top/flexe_in_pcs_frm_gen.v
../../../RTL/core_logic/rtl/shim/shim_top/shim_loopback.v
../../../RTL/core_logic/rtl/shim/shim_top/data_delay.v


../../../RTL/core_logic/rtl/shim_pre/rx/client_distribute.v
../../../RTL/core_logic/rtl/shim_pre/tx/client_slot_map.v
../../../RTL/core_logic/rtl/shim_pre/tx/client_aggregate.v
../../../RTL/core_logic/rtl/ethernet/vld_blk_ahead.v
../../../RTL/core_logic/rtl/ethernet/block_ram_reg.v
../../../RTL/core_logic/rtl/ethernet/vep_tx/asyn_fifo.v
../../../RTL/core_logic/rtl/ethernet/multi_blk_fifo.sv
