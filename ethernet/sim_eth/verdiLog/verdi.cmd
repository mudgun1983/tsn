srcSourceCodeView
srcResizeWindow 0 27 1592 922
wvCreateWindow
wvResizeWindow -win $_nWave2 -4 -2 1400 666
wvResizeWindow -win $_nWave2 0 27 1592 922
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_eth/sim_000.fsdb}
wvGetSignalOpen -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/xgmii64_rx_if"
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/xgmii64_rx_if/clk} \
{/pcs_tb_top/xgmii64_rx_if/reset} \
{/pcs_tb_top/xgmii64_rx_if/rxc\[7:0\]} \
{/pcs_tb_top/xgmii64_rx_if/rxd\[63:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/xgmii64_rx_if/clk} \
{/pcs_tb_top/xgmii64_rx_if/reset} \
{/pcs_tb_top/xgmii64_rx_if/rxc\[7:0\]} \
{/pcs_tb_top/xgmii64_rx_if/rxd\[63:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 6025049577.224199 7692447018.362989
wvZoom -win $_nWave2 6613682410.537053 6673020397.766191
wvZoom -win $_nWave2 6644217189.730357 6647680332.045509
wvZoom -win $_nWave2 6645437300.367723 6645676392.755317
wvZoom -win $_nWave2 6645460443.829429 6645481885.566679
wvZoomAll -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvResizeWindow -win $_nWave2 0 27 1592 922
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 6199672.338388 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dut"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dut/eth_gth_loop_dis_u0"
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/xgmii64_rx_if/clk} \
{/pcs_tb_top/xgmii64_rx_if/reset} \
{/pcs_tb_top/xgmii64_rx_if/rxc\[7:0\]} \
{/pcs_tb_top/xgmii64_rx_if/rxd\[63:0\]} \
{/pcs_tb_top/dut/eth_gth_loop_dis_u0/loop_en} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCopySignalFullPathToClipboard -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dut"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/xgmii64_rx_if/clk} \
{/pcs_tb_top/xgmii64_rx_if/reset} \
{/pcs_tb_top/xgmii64_rx_if/rxc\[7:0\]} \
{/pcs_tb_top/xgmii64_rx_if/rxd\[63:0\]} \
{/pcs_tb_top/dut/eth_gth_loop_dis_u0/loop_en} \
{/pcs_tb_top/dut/xgmii_txc_dat_i\[23:0\]} \
{/pcs_tb_top/dut/xgmii_txd_dat_i\[191:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/xgmii64_rx_if/clk} \
{/pcs_tb_top/xgmii64_rx_if/reset} \
{/pcs_tb_top/xgmii64_rx_if/rxc\[7:0\]} \
{/pcs_tb_top/xgmii64_rx_if/rxd\[63:0\]} \
{/pcs_tb_top/dut/eth_gth_loop_dis_u0/loop_en} \
{/pcs_tb_top/dut/xgmii_txc_dat_i\[23:0\]} \
{/pcs_tb_top/dut/xgmii_txd_dat_i\[191:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave2 {("G1" 7)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dut"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dut"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dut"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/xgmii64_rx_if/clk} \
{/pcs_tb_top/xgmii64_rx_if/reset} \
{/pcs_tb_top/xgmii64_rx_if/rxc\[7:0\]} \
{/pcs_tb_top/xgmii64_rx_if/rxd\[63:0\]} \
{/pcs_tb_top/dut/eth_gth_loop_dis_u0/loop_en} \
{/pcs_tb_top/dut/xgmii_txc_dat_i\[23:0\]} \
{/pcs_tb_top/dut/xgmii_txd_dat_i\[191:0\]} \
{/pcs_tb_top/dut/xgmii_txc_dat_o\[23:0\]} \
{/pcs_tb_top/dut/xgmii_txd_dat_o\[191:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 9 )} 
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/xgmii64_rx_if/clk} \
{/pcs_tb_top/xgmii64_rx_if/reset} \
{/pcs_tb_top/xgmii64_rx_if/rxc\[7:0\]} \
{/pcs_tb_top/xgmii64_rx_if/rxd\[63:0\]} \
{/pcs_tb_top/dut/eth_gth_loop_dis_u0/loop_en} \
{/pcs_tb_top/dut/xgmii_txc_dat_i\[23:0\]} \
{/pcs_tb_top/dut/xgmii_txd_dat_i\[191:0\]} \
{/pcs_tb_top/dut/xgmii_txc_dat_o\[23:0\]} \
{/pcs_tb_top/dut/xgmii_txd_dat_o\[191:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 9 )} 
wvSetPosition -win $_nWave2 {("G1" 9)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
