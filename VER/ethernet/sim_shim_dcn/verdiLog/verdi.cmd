srcSourceCodeView
srcResizeWindow 0 168 1592 922
wvCreateWindow
wvResizeWindow -win $_nWave2 -4 -2 1400 666
wvResizeWindow -win $_nWave2 0 27 1592 922
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_000.fsdb}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetSignalFilter -win $_nWave2 "*mana*"
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/mana_txd_i\[659:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 1)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvExpandBus -win $_nWave2 {("G1" 1)} -range 659 0 -sub_bus 66
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 687925837.693238 -snap {("G1" 11)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 721856725.202135 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 1190647348.441281 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/ge_mac0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/ge_mac0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*mana*"
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/mana_txd_i\[659:0\]} \
{/pcs_tb_top/mana_txd_i\[659:594\]} \
{/pcs_tb_top/mana_txd_i\[593:528\]} \
{/pcs_tb_top/mana_txd_i\[527:462\]} \
{/pcs_tb_top/mana_txd_i\[461:396\]} \
{/pcs_tb_top/mana_txd_i\[395:330\]} \
{/pcs_tb_top/mana_txd_i\[329:264\]} \
{/pcs_tb_top/mana_txd_i\[263:198\]} \
{/pcs_tb_top/mana_txd_i\[197:132\]} \
{/pcs_tb_top/mana_txd_i\[131:66\]} \
{/pcs_tb_top/mana_txd_i\[65:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/mana_txd_i\[659:0\]} \
{/pcs_tb_top/mana_txd_i\[659:594\]} \
{/pcs_tb_top/mana_txd_i\[593:528\]} \
{/pcs_tb_top/mana_txd_i\[527:462\]} \
{/pcs_tb_top/mana_txd_i\[461:396\]} \
{/pcs_tb_top/mana_txd_i\[395:330\]} \
{/pcs_tb_top/mana_txd_i\[329:264\]} \
{/pcs_tb_top/mana_txd_i\[263:198\]} \
{/pcs_tb_top/mana_txd_i\[197:132\]} \
{/pcs_tb_top/mana_txd_i\[131:66\]} \
{/pcs_tb_top/mana_txd_i\[65:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/mana_txd_i\[659:0\]} \
{/pcs_tb_top/mana_txd_i\[659:594\]} \
{/pcs_tb_top/mana_txd_i\[593:528\]} \
{/pcs_tb_top/mana_txd_i\[527:462\]} \
{/pcs_tb_top/mana_txd_i\[461:396\]} \
{/pcs_tb_top/mana_txd_i\[395:330\]} \
{/pcs_tb_top/mana_txd_i\[329:264\]} \
{/pcs_tb_top/mana_txd_i\[263:198\]} \
{/pcs_tb_top/mana_txd_i\[197:132\]} \
{/pcs_tb_top/mana_txd_i\[131:66\]} \
{/pcs_tb_top/mana_txd_i\[65:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvGetSignalClose -win $_nWave2
wvResizeWindow -win $_nWave2 0 27 1592 922
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvZoom -win $_nWave2 2458639840.591619 2697077090.633096
wvZoom -win $_nWave2 2552469313.986951 2566083786.597344
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetCursor -win $_nWave2 2556723836.676748 -snap {("G2" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3056793080.251197 3114612568.868175
wvZoom -win $_nWave2 3092261053.592433 3096767047.689898
wvZoom -win $_nWave2 3092855594.479860 3093571825.023130
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvZoom -win $_nWave2 2112410190.271605 2243344706.197531
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1693419739.308642 2064400867.765432
wvZoom -win $_nWave2 1776432491.817621 1804485077.148459
wvSetCursor -win $_nWave2 1780501848.331041 -snap {("G3" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3159886317.679012 3692353349.111111
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 4342661444.876543 -snap {("G3" 2)}
wvSetWindowTimeUnit -win $_nWave2 1.000000 ms
wvSetCursor -win $_nWave2 1.767616 -snap {("G2" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G2" 8)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoom -win $_nWave2 0.048179 0.078839
wvZoom -win $_nWave2 0.055442 0.059180
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvExpandBus -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvCollapseBus -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 )} 
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 )} 
wvSetPosition -win $_nWave2 {("G2" 11)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 12 13 14 15 )} 
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 12 13 14 15 )} 
wvSetPosition -win $_nWave2 {("G2" 15)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSetCursor -win $_nWave2 0.040813 -snap {("G4" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "*rd_en"
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSetPosition -win $_nWave2 {("G2" 16)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "*ren*"
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSetPosition -win $_nWave2 {("G2" 17)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "*rd_state*"
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_state\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSetPosition -win $_nWave2 {("G2" 18)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 0.285107 -snap {("G2" 2)}
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.031618 0.033897
wvSetCursor -win $_nWave2 0.032781 -snap {("G2" 17)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSetCursor -win $_nWave2 0.032657 -snap {("G2" 17)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
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
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.053652 0.063342
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "*rd_a*"
wvGetSignalSetSignalFilter -win $_nWave2 "*ra*"
wvGetSignalSetSignalFilter -win $_nWave2 "*r_a*"
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_state\[1:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/r_addr\[11:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSetPosition -win $_nWave2 {("G2" 19)}
wvGetSignalClose -win $_nWave2
wvSetRadix -win $_nWave2 -format UDec {("G2" 19)}
wvZoom -win $_nWave2 0.057989 0.059364
wvZoom -win $_nWave2 0.058861 0.058984
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "*rd*"
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_state\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/r_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_data\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSetPosition -win $_nWave2 {("G3" 5)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "*125*"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_state\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/r_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/sys_clk_125} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_state\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/r_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/sys_clk_125} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_state\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/r_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/sys_clk_125} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G4" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvSelectGroup -win $_nWave2 {G5}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "state"
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_state\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/r_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/sys_clk_125} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/state\[1:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSetPosition -win $_nWave2 {("G4" 3)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 9)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "*clean*"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*clean*"
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_clk} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_cs} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rd} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_rst} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/cpu_wr} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/packet_rd_en} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_state\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/r_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ren} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/rd_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/sys_clk_125} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/state\[1:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_clean_en_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSetPosition -win $_nWave2 {("G4" 10)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 0.056138 0.057184
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvZoom -win $_nWave2 0.053487 0.092037
wvZoom -win $_nWave2 0.058128 0.060120
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.052524 0.081917
wvZoom -win $_nWave2 0.056243 0.058148
wvZoom -win $_nWave2 0.056595 0.056965
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvZoom -win $_nWave2 0.053005 0.233706
wvZoom -win $_nWave2 0.117561 0.128297
wvZoom -win $_nWave2 0.121869 0.122722
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetSignalFilter -win $_nWave2 "*ram*"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*ram*"
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 10 11 )} 
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 10 11 )} 
wvSetPosition -win $_nWave2 {("G1" 11)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.045296 0.087218
wvZoom -win $_nWave2 0.056100 0.060919
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSetCursor -win $_nWave2 0.007591 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.054325 0.070996
wvZoom -win $_nWave2 0.057065 0.059046
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
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.054340 0.063473
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 0.056901 -snap {("G1" 1)}
wvSetMarker -win $_nWave2 0.122160
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvSetMarker -win $_nWave2 56624.000000
wvSetCursor -win $_nWave2 56152.222222 -snap {("G1" 1)}
wvSetMarker -win $_nWave2 122032.000000
wvSetCursor -win $_nWave2 56900.918519 -snap {("G1" 1)}
wvSetMarker -win $_nWave2 121536.000000
wvSetMarker -win $_nWave2 56896.000000
wvSetMarker -win $_nWave2 56624.000000
wvZoom -win $_nWave2 55403.525926 65386.143210
wvSetMarker -win $_nWave2 56736.000000
wvSetMarker -win $_nWave2 56672.000000
wvSetMarker -win $_nWave2 56624.000000
wvZoomAll -win $_nWave2
wvSetMarker -win $_nWave2 122160.000000
wvSetCursor -win $_nWave2 56152.222222 -snap {("G1" 1)}
wvSetWindowTimeUnit -win $_nWave2 1.000000 us
wvSetCursor -win $_nWave2 30.696548 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 122.041662 143.826876
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvZoom -win $_nWave2 127.101345 128.698255
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvZoom -win $_nWave2 122.486258 144.716069
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvZoom -win $_nWave2 127.957948 130.256400
wvZoom -win $_nWave2 128.294912 128.560937
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 129.117618 129.439475
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetPosition -win $_nWave2 {("G1" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetCursor -win $_nWave2 127.196410 -snap {("G1" 4)}
wvZoom -win $_nWave2 126.862632 128.690462
wvZoom -win $_nWave2 127.171502 127.586148
wvSetCursor -win $_nWave2 127.215334 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoom -win $_nWave2 94.955677 265.875896
wvZoom -win $_nWave2 123.046732 138.081380
wvZoom -win $_nWave2 128.232293 130.900479
wvZoom -win $_nWave2 129.208158 129.411977
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 129.969337 130.417237
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 86.816619 284.867031
wvZoom -win $_nWave2 124.256705 134.036972
wvZoom -win $_nWave2 128.218619 128.860071
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 78.677561 263.162877
wvZoom -win $_nWave2 125.083589 128.642334
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvZoom -win $_nWave2 124.929817 141.185810
wvZoom -win $_nWave2 128.191050 129.294852
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
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
wvZoom -win $_nWave2 121.683894 155.871274
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvZoom -win $_nWave2 128.014890 129.518502
wvZoom -win $_nWave2 128.324662 128.466206
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
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
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 126.897144 132.257239
wvZoom -win $_nWave2 128.307477 128.489456
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*ram*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvZoom -win $_nWave2 128.227721 128.695024
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 128.715216 129.961358
wvZoom -win $_nWave2 129.221942 129.328672
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 135.248920 147.090992
wvZoom -win $_nWave2 144.386321 144.614756
wvZoom -win $_nWave2 144.464052 144.530855
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 126.819748 140.120996
wvZoom -win $_nWave2 132.659571 133.583268
wvZoom -win $_nWave2 132.792851 132.958917
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 128.143677 -snap {("G2" 2)}
wvZoom -win $_nWave2 127.146450 134.251693
wvZoom -win $_nWave2 129.092717 129.547759
wvZoom -win $_nWave2 129.223331 129.292149
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_addr\[13:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_data\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/ram_wr_en} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/valid_o} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/err_o} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/packet_gen_en} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetPosition -win $_nWave2 {("G3" 1)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 873.879626 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1229.684976 1521.309872
wvZoom -win $_nWave2 1294.490509 1311.591969
wvZoom -win $_nWave2 1297.393534 1299.570803
wvZoom -win $_nWave2 1297.826972 1297.986571
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 3562.684141 3800.844472
wvZoom -win $_nWave2 3695.362967 3708.777862
wvZoom -win $_nWave2 3701.345845 3702.732879
wvZoom -win $_nWave2 3701.798557 3701.908792
wvZoomAll -win $_nWave2
wvSelectGroup -win $_nWave2 {G5}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvGetSignalOpen -win $_nWave2
wvSelectGroup -win $_nWave2 {G3}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/data_latch_loop_shim"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetPosition -win $_nWave2 {("G3" 1)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetSignalFilter -win $_nWave2 "*sfd*"
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetPosition -win $_nWave2 {("G3" 2)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 763.423931 943.053091
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 428.660496 630.743301
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1461.528167 1571.755152
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
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
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetSignalFilter -win $_nWave2 "*clk*"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/sys_clk_125} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 40.377457 47.014847
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetSignalFilter -win $_nWave2 "*rcv*"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*ind*"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvZoom -win $_nWave2 38.994668 41.575875
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetSignalFilter -win $_nWave2 "*cnt*"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoom -win $_nWave2 401.427583 811.978520
wvZoom -win $_nWave2 446.727571 516.103076
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "*reset*"
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/reset} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSetPosition -win $_nWave2 {("G3" 5)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/reset} \
{/pcs_tb_top/dcn_top/reset} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/ge_mac0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/reset} \
{/pcs_tb_top/dcn_top/reset} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetPosition -win $_nWave2 {("G3" 7)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectGroup -win $_nWave2 {G3}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectGroup -win $_nWave2 {G5}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetPosition -win $_nWave2 {("G3" 2)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 3 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 3 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 39.317380 41.823192
wvZoom -win $_nWave2 40.065643 40.231924
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "*start*"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*start*"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*prea*"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 40.035877 40.192920
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "*i_reg*"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSetPosition -win $_nWave2 {("G3" 8)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*sfd*"
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 9)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 39.912763 40.405219
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*is*"
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSetPosition -win $_nWave2 {("G3" 10)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvZoom -win $_nWave2 32.530660 77.519871
wvZoom -win $_nWave2 38.918017 41.799271
wvZoom -win $_nWave2 40.018496 40.327519
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 800.115809 858.255713
wvZoom -win $_nWave2 816.265783 823.264104
wvZoom -win $_nWave2 817.810165 818.344759
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 33.222802 60.216328
wvZoom -win $_nWave2 38.846453 41.554137
wvZoom -win $_nWave2 39.978833 40.363258
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*is*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G4" 4)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 26.993526 151.579033
wvZoom -win $_nWave2 37.471783 60.831565
wvZoom -win $_nWave2 39.959167 41.581374
wvZoom -win $_nWave2 40.249562 40.408528
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 39.787382 40.776506
wvZoom -win $_nWave2 40.024742 40.205623
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*dly*"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*dly*"
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetPosition -win $_nWave2 {("G4" 5)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*state*"
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 9)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*pream*"
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 9)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*next*"
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/next_state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSetPosition -win $_nWave2 {("G3" 10)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetCursor -win $_nWave2 40.063960 -snap {("G3" 8)}
wvSetCursor -win $_nWave2 40.056703 -snap {("G3" 7)}
wvSetCursor -win $_nWave2 40.063681 -snap {("G3" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSetPosition -win $_nWave2 {("G3" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSelectGroup -win $_nWave2 {G4}
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
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 39.380204 42.840888
wvZoom -win $_nWave2 40.199980 40.499052
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 47.908625 54.466045
wvZoom -win $_nWave2 51.450441 51.834981
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 36.038853 42.781221
wvZoom -win $_nWave2 39.857447 40.757470
wvZoom -win $_nWave2 40.018563 40.253985
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc32_cal"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*ind*"
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/next_state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetPosition -win $_nWave2 {("G3" 9)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "*rcv*"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/next_state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSetPosition -win $_nWave2 {("G5" 3)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 32.552718 52.135212
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetSignalFilter -win $_nWave2 "*cnt*"
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/next_state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSetPosition -win $_nWave2 {("G5" 4)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 25.535258 -snap {("G6" 0)}
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
wvZoomAll -win $_nWave2
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
wvSelectGroup -win $_nWave2 {G4}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetSignalFilter -win $_nWave2 "*cnt*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/next_state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetPosition -win $_nWave2 {("G5" 5)}
wvGetSignalClose -win $_nWave2
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetSignalFilter -win $_nWave2 "*cpu*"
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/next_state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_main_cs} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_rst} \
{/pcs_tb_top/dcn_top/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_tx_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/soft_rx_rst} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/preamble_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/next_state\[1:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i_dly1\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/is_preamble} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i_reg} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sfd_pulse} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_main_cs} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_rst} \
{/pcs_tb_top/dcn_top/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G6" 10)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 644.034132 860.516193
wvZoom -win $_nWave2 725.047867 754.279626
wvZoom -win $_nWave2 728.137952 733.055023
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvResizeWindow -win $_nWave2 0 27 1592 922
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*cpu*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSetPosition -win $_nWave2 {("G6" 2)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 2806.959713 3338.006145
wvZoom -win $_nWave2 2954.616526 2985.270426
wvZoom -win $_nWave2 2963.638243 2965.557227
wvZoom -win $_nWave2 2964.000198 2964.468242
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSetPosition -win $_nWave2 {("G6" 4)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvSetPosition -win $_nWave2 {("G6" 6)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalClose -win $_nWave2
wvSelectGroup -win $_nWave2 {G7}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 2 )} 
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 2 )} 
wvSetPosition -win $_nWave2 {("G7" 2)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*crc"
wvGetSignalSetSignalFilter -win $_nWave2 "*crc*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*crc*"
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvSetPosition -win $_nWave2 {("G7" 3)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*crc*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G8" 8)}
wvSetPosition -win $_nWave2 {("G8" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvSelectSignal -win $_nWave2 {( "G8" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G8" 8)}
wvSetPosition -win $_nWave2 {("G8" 8)}
wvSetPosition -win $_nWave2 {("G8" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvSelectSignal -win $_nWave2 {( "G8" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G8" 8)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 36.238327 65.692309
wvZoom -win $_nWave2 39.710544 41.602304
wvZoom -win $_nWave2 40.065826 40.374967
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51.094125 52.091420
wvZoom -win $_nWave2 51.534394 51.638178
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51.439133 51.734789
wvZoom -win $_nWave2 51.541291 51.604989
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32"
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvSelectSignal -win $_nWave2 {( "G9" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvSelectSignal -win $_nWave2 {( "G9" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G9" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectGroup -win $_nWave2 {G8}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetWindowTimeUnit -win $_nWave2 1.000000 us
wvSetCursor -win $_nWave2 345.149974 -snap {("G8" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetPosition -win $_nWave2 {("G10" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G10" 7)}
wvSetPosition -win $_nWave2 {("G10" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvSelectSignal -win $_nWave2 {( "G10" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave2 {("G10" 7)}
wvSetPosition -win $_nWave2 {("G10" 7)}
wvSetPosition -win $_nWave2 {("G10" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvSelectSignal -win $_nWave2 {( "G10" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave2 {("G10" 7)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G8" 3 )} 
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
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc32_cal"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalClose -win $_nWave2
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G8" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G8" 3 )} 
wvSetPosition -win $_nWave2 {("G11" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/ge_mac0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G11" 12)}
wvSetPosition -win $_nWave2 {("G11" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvSelectSignal -win $_nWave2 {( "G11" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G11" 12)}
wvSetPosition -win $_nWave2 {("G11" 12)}
wvSetPosition -win $_nWave2 {("G11" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvSelectSignal -win $_nWave2 {( "G11" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G11" 12)}
wvGetSignalClose -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G11" 1 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G12" 6)}
wvSetPosition -win $_nWave2 {("G12" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G12" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G12" 6)}
wvSetPosition -win $_nWave2 {("G12" 6)}
wvSetPosition -win $_nWave2 {("G12" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G12" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G12" 6)}
wvGetSignalClose -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G11" 3 )} 
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
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 130.769075 -snap {("G10" 3)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 613.098488 651.002567
wvZoom -win $_nWave2 628.722364 631.773181
wvSelectSignal -win $_nWave2 {( "G10" 4 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G10" 8)}
wvSetPosition -win $_nWave2 {("G10" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G10" 8 )} 
wvSetPosition -win $_nWave2 {("G10" 8)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 629.178747 -snap {("G10" 5)}
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 602.674866 677.535423
wvZoom -win $_nWave2 628.480456 634.810129
wvSetCursor -win $_nWave2 630.682977 -snap {("G10" 2)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G10" 9)}
wvSetPosition -win $_nWave2 {("G10" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G10" 9 )} 
wvSetPosition -win $_nWave2 {("G10" 9)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G10" 10)}
wvSetPosition -win $_nWave2 {("G10" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G10" 10 )} 
wvSetPosition -win $_nWave2 {("G10" 10)}
wvSetPosition -win $_nWave2 {("G10" 10)}
wvSetPosition -win $_nWave2 {("G10" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G10" 10 )} 
wvSetPosition -win $_nWave2 {("G10" 10)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetSignalFilter -win $_nWave2 "*tx_pac*"
wvSetPosition -win $_nWave2 {("G10" 11)}
wvSetPosition -win $_nWave2 {("G10" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G10" 11 )} 
wvSetPosition -win $_nWave2 {("G10" 11)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G11" 9 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G11" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G10" 11)}
wvSelectSignal -win $_nWave2 {( "G11" 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G10" 11)}
wvSelectSignal -win $_nWave2 {( "G11" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G10" 11)}
wvSelectSignal -win $_nWave2 {( "G11" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G10" 11)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G11" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 65.223076 105.460198
wvZoom -win $_nWave2 72.321821 74.251894
wvZoom -win $_nWave2 72.753341 72.944779
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 66.521048 100.917297
wvZoom -win $_nWave2 83.271742 85.117394
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 72.142308 75.095352
wvZoom -win $_nWave2 72.716111 73.215487
wvSelectSignal -win $_nWave2 {( "G9" 1 )} 
wvSetPosition -win $_nWave2 {("G9" 2)}
wvSetPosition -win $_nWave2 {("G9" 3)}
wvSetPosition -win $_nWave2 {("G9" 4)}
wvSetPosition -win $_nWave2 {("G9" 5)}
wvSetPosition -win $_nWave2 {("G9" 6)}
wvSetPosition -win $_nWave2 {("G9" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 7)}
wvSetCursor -win $_nWave2 72.767266 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.776198 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.783506 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.792032 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.796092 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.799746 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.805836 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.807054 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.815580 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.767672 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.773762 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.768484 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.775386 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.783506 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.790408 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.799340 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.806242 -snap {("G9" 7)}
wvSetCursor -win $_nWave2 72.814768 -snap {("G9" 7)}
wvSelectSignal -win $_nWave2 {( "G8" 1 )} 
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 4332.699044 6280.959688
wvZoom -win $_nWave2 4624.146165 4752.446256
wvZoom -win $_nWave2 4648.137239 4662.114647
wvZoom -win $_nWave2 4649.398614 4652.637282
wvZoom -win $_nWave2 4649.493405 4649.967356
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4651.210034 4653.651461
wvZoom -win $_nWave2 4651.740002 4652.065526
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 4594.405698 -snap {("G9" 3)}
wvZoom -win $_nWave2 3911.060546 6702.598185
wvZoom -win $_nWave2 4512.489387 5256.899424
wvZoom -win $_nWave2 4637.162938 4700.710136
wvZoom -win $_nWave2 4649.355734 4656.743742
wvZoom -win $_nWave2 4649.427812 4650.334795
wvZoom -win $_nWave2 4649.528834 4649.795767
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4649.474796 4649.995641
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4609.842702 4741.661452
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4289.941103 4385.965167
wvZoom -win $_nWave2 4318.514117 4327.257772
wvZoom -win $_nWave2 4319.871872 4320.973714
wvZoom -win $_nWave2 4320.008034 4320.172863
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4327.088825 4331.823021
wvZoom -win $_nWave2 4329.679162 4330.402762
wvZoom -win $_nWave2 4330.046257 4330.172740
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 12
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G10" 11 )} 
wvScrollUp -win $_nWave2 2
wvSetPosition -win $_nWave2 {("G9" 8)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/sect_data_robin_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/data_latch_loop_shim"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*tx_pac*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 12)}
wvSetPosition -win $_nWave2 {("G9" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 12 )} 
wvSetPosition -win $_nWave2 {("G9" 12)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 9 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4552.502482 4882.722366
wvZoom -win $_nWave2 4629.016845 4693.181522
wvZoom -win $_nWave2 4642.684443 4648.683580
wvZoom -win $_nWave2 4645.264560 4645.723030
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4650.646557 4652.984384
wvZoom -win $_nWave2 4651.743245 4651.950418
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4644.301007 4647.793646
wvZoom -win $_nWave2 4645.360157 4645.638432
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4650.422278 4652.623142
wvZoom -win $_nWave2 4651.771426 4651.918150
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G9" 13)}
wvSetPosition -win $_nWave2 {("G9" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 13 )} 
wvSetPosition -win $_nWave2 {("G9" 13)}
wvGetSignalClose -win $_nWave2
wvScrollDown -win $_nWave2 1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 21)}
wvSetPosition -win $_nWave2 {("G9" 21)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 14 15 16 17 18 19 20 21 )} 
wvSetPosition -win $_nWave2 {("G9" 21)}
wvSetPosition -win $_nWave2 {("G9" 21)}
wvSetPosition -win $_nWave2 {("G9" 21)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 14 15 16 17 18 19 20 21 )} 
wvSetPosition -win $_nWave2 {("G9" 21)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 15 )} 
wvSelectSignal -win $_nWave2 {( "G9" 17 )} 
wvSelectSignal -win $_nWave2 {( "G9" 16 )} 
wvSetPosition -win $_nWave2 {("G9" 16)}
wvSetPosition -win $_nWave2 {("G9" 15)}
wvSetPosition -win $_nWave2 {("G9" 14)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 14)}
wvSetPosition -win $_nWave2 {("G9" 15)}
wvSelectSignal -win $_nWave2 {( "G9" 18 )} 
wvSetPosition -win $_nWave2 {("G9" 18)}
wvSetPosition -win $_nWave2 {("G9" 17)}
wvSetPosition -win $_nWave2 {("G9" 16)}
wvSetPosition -win $_nWave2 {("G9" 15)}
wvSetPosition -win $_nWave2 {("G9" 14)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 14)}
wvSetPosition -win $_nWave2 {("G9" 15)}
wvZoom -win $_nWave2 4640.240452 4659.662446
wvZoom -win $_nWave2 4644.819621 4646.919723
wvZoom -win $_nWave2 4645.364282 4645.639173
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4647.446975 4648.233656
wvZoom -win $_nWave2 4647.705364 4647.824326
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim1"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 17)}
wvSetPosition -win $_nWave2 {("G9" 17)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 16 17 )} 
wvSetPosition -win $_nWave2 {("G9" 17)}
wvSetPosition -win $_nWave2 {("G9" 17)}
wvSetPosition -win $_nWave2 {("G9" 17)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 16 17 )} 
wvSetPosition -win $_nWave2 {("G9" 17)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 18)}
wvSetPosition -win $_nWave2 {("G9" 19)}
wvSetPosition -win $_nWave2 {("G9" 20)}
wvSetPosition -win $_nWave2 {("G9" 21)}
wvSetPosition -win $_nWave2 {("G9" 22)}
wvSetPosition -win $_nWave2 {("G9" 23)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 23)}
wvZoom -win $_nWave2 4647.665807 4657.371519
wvZoom -win $_nWave2 4651.484966 4652.210921
wvZoom -win $_nWave2 4651.783021 4651.870371
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 25)}
wvSetPosition -win $_nWave2 {("G9" 25)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 25 )} 
wvSetPosition -win $_nWave2 {("G9" 25)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 4649.063287 4650.917680
wvZoom -win $_nWave2 4649.364814 4649.595483
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_latch"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvSetPosition -win $_nWave2 {("G9" 27)}
wvSetPosition -win $_nWave2 {("G9" 27)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 27 )} 
wvSetPosition -win $_nWave2 {("G9" 27)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 4644.439200 4651.112455
wvZoom -win $_nWave2 4649.186435 4649.804932
wvZoom -win $_nWave2 4649.431822 4649.469535
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4639.466426 4647.566857
wvZoom -win $_nWave2 4645.090628 4645.742614
wvZoom -win $_nWave2 4645.455316 4645.499842
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 31)}
wvSetPosition -win $_nWave2 {("G9" 31)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 31 )} 
wvSetPosition -win $_nWave2 {("G9" 31)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 4648.813761 4650.259440
wvZoom -win $_nWave2 4649.388507 4649.580089
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvSetPosition -win $_nWave2 {("G9" 32)}
wvSetPosition -win $_nWave2 {("G9" 32)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 32 )} 
wvSetPosition -win $_nWave2 {("G9" 32)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 34)}
wvSetPosition -win $_nWave2 {("G9" 34)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 34 )} 
wvSetPosition -win $_nWave2 {("G9" 34)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 4648.866251 4650.800138
wvZoom -win $_nWave2 4649.345792 4649.477863
wvZoom -win $_nWave2 4649.380260 4649.402916
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4649.411628 4649.508293
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4649.353079 4649.456188
wvZoom -win $_nWave2 4649.378060 4649.400358
wvSelectSignal -win $_nWave2 {( "G9" 33 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvSetPosition -win $_nWave2 {("G9" 35)}
wvSetPosition -win $_nWave2 {("G9" 35)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 35 )} 
wvSetPosition -win $_nWave2 {("G9" 35)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 4649.352081 4649.442000
wvSelectSignal -win $_nWave2 {( "G9" 34 )} 
wvSelectSignal -win $_nWave2 {( "G9" 34 )} 
wvAddSignal -win $_nWave2 "/BLANK"
wvSetPosition -win $_nWave2 {("G9" 35)}
wvSetPosition -win $_nWave2 {("G9" 36)}
wvSelectGroup -win $_nWave2 {G10}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetSignalFilter -win $_nWave2 "*txc_*"
wvGetSignalSetSignalFilter -win $_nWave2 "*expand*"
wvGetSignalSetSignalFilter -win $_nWave2 "*data*"
wvSetPosition -win $_nWave2 {("G9" 39)}
wvSetPosition -win $_nWave2 {("G9" 39)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i\[3:0\]} \
{/BLANK} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i_latch\[3:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/expand_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i_latch\[63:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 39 )} 
wvSetPosition -win $_nWave2 {("G9" 39)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvSetPosition -win $_nWave2 {("G9" 40)}
wvSetPosition -win $_nWave2 {("G9" 40)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i\[3:0\]} \
{/BLANK} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i_latch\[3:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/expand_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i_latch\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o_reg\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 40 )} 
wvSetPosition -win $_nWave2 {("G9" 40)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block"
wvGetSignalSetSignalFilter -win $_nWave2 "*data_valid*"
wvGetSignalSetSignalFilter -win $_nWave2 "*eop*"
wvSetPosition -win $_nWave2 {("G9" 42)}
wvSetPosition -win $_nWave2 {("G9" 42)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i\[3:0\]} \
{/BLANK} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i_latch\[3:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/expand_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i_latch\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_valid_o_reg} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 42 )} 
wvSetPosition -win $_nWave2 {("G9" 42)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 4649.396456 4649.504651
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 40 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G9" 2 )} 
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 17 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G9" 22 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 20 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G9" 23 )} 
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G9" 19 )} 
wvSelectSignal -win $_nWave2 {( "G9" 7 )} 
wvSelectSignal -win $_nWave2 {( "G9" 8 )} 
wvScrollUp -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G9" 2 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G10" 11 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 43)}
wvSetPosition -win $_nWave2 {("G9" 43)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i\[3:0\]} \
{/BLANK} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i_latch\[3:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/expand_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i_latch\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_valid_o_reg} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/rx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 43 )} 
wvSetPosition -win $_nWave2 {("G9" 43)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G10" 8 )} 
wvZoom -win $_nWave2 595.340917 659.821462
wvZoom -win $_nWave2 627.581189 634.186513
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G10" 11 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 31 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/data_latch_loop_shim"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G9" 44)}
wvSetPosition -win $_nWave2 {("G9" 44)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i\[3:0\]} \
{/BLANK} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i_latch\[3:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/expand_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i_latch\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_valid_o_reg} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/rx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/new_crc_out_latch\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 44 )} 
wvSetPosition -win $_nWave2 {("G9" 44)}
wvGetSignalClose -win $_nWave2
wvCopySignalFullPathToClipboard -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 4
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 3
wvScrollUp -win $_nWave2 23
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G9" 2 )} 
wvZoom -win $_nWave2 1840.126869 1888.202256
wvZoom -win $_nWave2 1863.421935 1868.581245
wvZoom -win $_nWave2 1865.531799 1865.959644
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1864.109475 1865.055604
wvZoom -win $_nWave2 1864.428697 1864.595616
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 2471.508235 2717.161175
wvZoom -win $_nWave2 2577.358689 2582.950788
wvZoom -win $_nWave2 2580.218388 2580.982187
wvZoom -win $_nWave2 2580.539432 2580.678531
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1827.418210 1908.303934
wvZoom -win $_nWave2 1863.257820 1867.006182
wvZoom -win $_nWave2 1864.385376 1864.778497
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 31 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 28 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 22 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 4287.812088 4357.595648
wvZoom -win $_nWave2 4318.335303 4323.554887
wvZoom -win $_nWave2 4319.935127 4320.384945
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4599.277225 4690.650936
wvZoom -win $_nWave2 4647.638433 4652.689988
wvZoom -win $_nWave2 4649.511205 4649.950649
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 4582.453786 4737.528364
wvZoom -win $_nWave2 4647.131232 4656.334845
wvZoom -win $_nWave2 4651.493595 4652.294235
wvZoom -win $_nWave2 4651.793021 4651.895868
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2543.223083 -snap {("G9" 14)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G11" 8 )} 
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G12" 6 )} 
wvSelectSignal -win $_nWave2 {( "G12" 5 )} 
wvZoom -win $_nWave2 2821.215597 3111.693367
wvSetCursor -win $_nWave2 2920.403128 -snap {("G12" 4)}
wvZoom -win $_nWave2 2899.620979 2927.724113
wvZoom -win $_nWave2 2907.754894 2910.313878
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 8.503974 144.567558
wvZoomAll -win $_nWave2
wvSelectGroup -win $_nWave2 {G12}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G12" 2 )} 
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 45)}
wvSetPosition -win $_nWave2 {("G9" 45)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim0_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/shim1_vlan\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim0_rx\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/vlan_to_shim1_rx\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/mac_rx_crc32/rst_b} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/shim0_shim1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/block_valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/is_t0_block_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/valid_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i\[3:0\]} \
{/BLANK} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/txc_i_latch\[3:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/expand_cnt\[4:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_i_latch\[63:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_o_reg\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/data_valid_o_reg} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/delete_s_t_block/eop} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/rx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/new_crc_out_latch\[31:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_clk} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rst} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_rcv} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G11" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G12" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 45 )} 
wvSetPosition -win $_nWave2 {("G9" 45)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G10" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 69.220956 72.105163
wvZoom -win $_nWave2 70.731061 70.909272
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 70.850883 71.039816
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
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
wvZoom -win $_nWave2 37.258246 45.275843
wvZoom -win $_nWave2 39.982925 40.771648
wvZoom -win $_nWave2 40.102195 40.310598
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 162.081228 178.273630
wvZoom -win $_nWave2 168.992620 170.164265
wvZoom -win $_nWave2 169.126930 169.400314
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G11" 1 )} 
wvSelectSignal -win $_nWave2 {( "G11" 6 )} 
wvSelectSignal -win $_nWave2 {( "G11" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G10" 9 )} 
wvScrollUp -win $_nWave2 12
wvScrollUp -win $_nWave2 44
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G8" 3 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvSetPosition -win $_nWave2 {("G9" 2)}
wvSetPosition -win $_nWave2 {("G9" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 2 )} 
wvSetPosition -win $_nWave2 {("G9" 2)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvSelectSignal -win $_nWave2 {( "G9" 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G9" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 7 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G13" 8)}
wvSetPosition -win $_nWave2 {("G13" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvSelectSignal -win $_nWave2 {( "G13" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G13" 8)}
wvSetPosition -win $_nWave2 {("G13" 8)}
wvSetPosition -win $_nWave2 {("G13" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvSelectSignal -win $_nWave2 {( "G13" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G13" 8)}
wvGetSignalClose -win $_nWave2
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetSignalFilter -win $_nWave2 "*loop*"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*loop*"
wvSetPosition -win $_nWave2 {("G13" 9)}
wvSetPosition -win $_nWave2 {("G13" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
{/pcs_tb_top/dcn_top/loop_en\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvSelectSignal -win $_nWave2 {( "G13" 9 )} 
wvSetPosition -win $_nWave2 {("G13" 9)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/data_latch_loop_shim"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*loop*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G14" 4)}
wvSetPosition -win $_nWave2 {("G14" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
{/pcs_tb_top/dcn_top/loop_en\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_data_o\[65:0\]} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_valid_i} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvSelectSignal -win $_nWave2 {( "G14" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G14" 4)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G14" 4 )} 
wvSetPosition -win $_nWave2 {("G14" 3)}
wvSetPosition -win $_nWave2 {("G14" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G14" 2)}
wvSetPosition -win $_nWave2 {("G14" 3)}
wvSelectSignal -win $_nWave2 {( "G14" 3 )} 
wvSelectSignal -win $_nWave2 {( "G14" 4 )} 
wvSetPosition -win $_nWave2 {("G14" 2)}
wvSetPosition -win $_nWave2 {("G14" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G14" 1)}
wvSetPosition -win $_nWave2 {("G14" 2)}
wvZoom -win $_nWave2 163.399716 203.133526
wvZoom -win $_nWave2 174.415349 176.773535
wvZoomAll -win $_nWave2
wvSetPosition -win $_nWave2 {("G15" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/data_latch_loop_shim"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/sect_data_robin_shim0"
wvSetPosition -win $_nWave2 {("G15" 2)}
wvSetPosition -win $_nWave2 {("G15" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
{/pcs_tb_top/dcn_top/loop_en\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_valid_i} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_data_o\[65:0\]} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
{/pcs_tb_top/dcn_top/dcn_tx_top/sect_data_robin_shim0/mana_sect_dat0_ien_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/sect_data_robin_shim0/mana_sect_dat1_ien_i} \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G15" 1 2 )} 
wvSetPosition -win $_nWave2 {("G15" 2)}
wvSetPosition -win $_nWave2 {("G15" 2)}
wvSetPosition -win $_nWave2 {("G15" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat0_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat1_ien_i} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
{/pcs_tb_top/dcn_top/loop_en\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_data_i\[65:0\]} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_valid_i} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_data_o\[65:0\]} \
{/pcs_tb_top/dcn_top/data_latch_loop_shim/block_valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
{/pcs_tb_top/dcn_top/dcn_tx_top/sect_data_robin_shim0/mana_sect_dat0_ien_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/sect_data_robin_shim0/mana_sect_dat1_ien_i} \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G15" 1 2 )} 
wvSetPosition -win $_nWave2 {("G15" 2)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G14" 1 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G13" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G16" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 5659.138698 6254.198346
wvSetCursor -win $_nWave2 5830.883556 -snap {("G16" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetSignalFilter -win $_nWave2 "*crc*"
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim1"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G2" 6)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 589.545230 710.110805
wvZoom -win $_nWave2 626.205006 638.065522
wvZoom -win $_nWave2 628.654251 631.865269
wvZoom -win $_nWave2 629.742864 630.090072
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 611.001815 655.958470
wvZoom -win $_nWave2 627.924524 633.407043
wvZoom -win $_nWave2 629.716371 630.438459
wvZoom -win $_nWave2 629.792690 629.993465
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 603.424380 705.759508
wvZoom -win $_nWave2 625.971388 637.036893
wvZoom -win $_nWave2 629.147098 630.676477
wvSelectGroup -win $_nWave2 {G15}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 80.134469 83.718465
wvZoom -win $_nWave2 81.774948 82.101296
wvZoomAll -win $_nWave2
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 123.121265 140.687809
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 69.799808 81.148107
wvZoom -win $_nWave2 70.344158 71.266783
wvZoom -win $_nWave2 70.640448 70.976494
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 39.125084 42.901912
wvZoom -win $_nWave2 40.055474 40.439298
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 66.690685 84.723598
wvZoom -win $_nWave2 70.209302 74.050459
wvZoom -win $_nWave2 70.649630 71.371018
wvZoom -win $_nWave2 70.730566 70.870152
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 7322.902595 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim1"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/packet_discard_o} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetPosition -win $_nWave2 {("G2" 7)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 4669.391053 5563.102459
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/packet_discard_o} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSetPosition -win $_nWave2 {("G2" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 1910.802743 2891.479282
wvZoom -win $_nWave2 2106.140753 2207.397599
wvZoom -win $_nWave2 2135.612257 2154.711110
wvZoom -win $_nWave2 2144.618220 2147.568449
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_discard_shim0_cnt\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSetPosition -win $_nWave2 {("G2" 10)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 2124.602234 2175.566844
wvZoom -win $_nWave2 2144.200820 2147.557026
wvSetCursor -win $_nWave2 2145.712477 -snap {("G2" 5)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2146.621108 2153.868330
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetSignalFilter -win $_nWave2 "*loop*"
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_discard_shim0_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/loop_en\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSetPosition -win $_nWave2 {("G2" 11)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 561.441531 -snap {("G2" 10)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*loop*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_discard_shim0_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/loop_en\[1:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSetPosition -win $_nWave2 {("G2" 12)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_discard_shim0_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/loop_en\[1:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSetPosition -win $_nWave2 {("G2" 13)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 2503.168657 2718.826264
wvZoom -win $_nWave2 2550.332800 2568.041270
wvZoom -win $_nWave2 2551.139039 2552.636341
wvZoom -win $_nWave2 2551.382503 2551.582143
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCopySignalFullPathToClipboard -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvCopySignalFullPathToClipboard -win $_nWave2
wvZoom -win $_nWave2 1833.478757 1897.301296
wvZoom -win $_nWave2 1859.786096 1862.017291
wvZoom -win $_nWave2 1860.350244 1860.576991
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 21.070974 138.864592
wvZoom -win $_nWave2 38.404832 46.832343
wvZoom -win $_nWave2 39.871082 40.391806
wvSetCursor -win $_nWave2 40.056510 -snap {("G1" 2)}
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 15.404115 377.400813
wvZoom -win $_nWave2 35.711247 62.787422
wvSetCursor -win $_nWave2 40.047837 -snap {("G1" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 462.100067 -snap {("G1" 2)}
wvZoom -win $_nWave2 23.950308 111.298492
wvZoom -win $_nWave2 39.147472 44.260536
wvZoom -win $_nWave2 40.020434 40.456915
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvCopySignalFullPathToClipboard -win $_nWave2
wvSetCursor -win $_nWave2 7632.738888 -snap {("G1" 3)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_cpu_main"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_discard_shim0_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/loop_en\[1:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/rx_crc_err} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_addr\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_cs} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_rd} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/cpu_wr} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/dcn_tx_shim0/packet_restore/packet_discard_o} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/tx_packet_discard_shim0_cnt\[15:0\]} \
{/pcs_tb_top/dcn_top/dcn_cpu_main/loop_en\[1:0\]} \
{/pcs_tb_top/dcn_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sys_clk_125} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 4313.152147 -snap {("G10" 0)}
wvZoom -win $_nWave2 4136.004826 4513.405639
wvZoom -win $_nWave2 4290.647111 4303.533968
wvZoom -win $_nWave2 4292.690149 4293.559750
wvCopySignalFullPathToClipboard -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvCopySignalFullPathToClipboard -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvCopySignalFullPathToClipboard -win $_nWave2
wvSetCursor -win $_nWave2 4292.787007 -snap {("G13" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
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
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 39.145621 41.690087
wvZoom -win $_nWave2 40.012395 40.275116
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 610.749394 647.764509
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 445.391023 470.766936
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 443.640960 486.517503
wvZoom -win $_nWave2 457.933141 459.536654
wvZoom -win $_nWave2 458.262969 458.504148
wvSelectGroup -win $_nWave2 {G9}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G3" 6)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 45.876304 -snap {("G3" 4)}
wvZoom -win $_nWave2 44.727801 49.385617
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 48.215483 49.540878
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G5" 1 2 )} 
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G5" 1 2 )} 
wvSetPosition -win $_nWave2 {("G5" 2)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetSignalFilter -win $_nWave2 "*gen_en*"
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/packet_gen_en} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSetPosition -win $_nWave2 {("G5" 3)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 145.926484 -snap {("G10" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 12.342021 -snap {("G16" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 45.347044 49.284078
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/packet_gen_en} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob_b\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb_dly1} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/packet_gen_en} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob_b\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb_dly1} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G7" 10)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSelectSignal -win $_nWave2 {( "G7" 4 )} 
wvZoom -win $_nWave2 46.944263 47.213134
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 47.149541 -snap {("G7" 5)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 93.008403 100.580768
wvZoom -win $_nWave2 95.544838 96.406733
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/data_latch_loop_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/packet_gen_en} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob_b\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb_dly1} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 4 5 )} 
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_clk} \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/packet_gen_en} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clka} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addra\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dia\[7:0\]} \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/addrb\[11:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/clkb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/dob_b\[7:0\]} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/enb_dly1} \
{/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg/wea} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 4 5 )} 
wvSetPosition -win $_nWave2 {("G7" 5)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 12)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 133.529538 149.525263
wvZoom -win $_nWave2 139.706749 140.903177
wvZoom -win $_nWave2 140.519931 140.712527
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 139.957332 140.270496
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 140.372592 140.669971
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 139.960373 140.405231
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 140.498182 140.647191
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetCursor -win $_nWave2 140.511387
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G7" 4)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 260.201333 278.622667
wvZoom -win $_nWave2 268.258795 268.857862
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetSignalFilter -win $_nWave2 "*crc*"
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvSetPosition -win $_nWave2 {("G7" 5)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 444.001097 -snap {("G7" 2)}
wvZoom -win $_nWave2 420.425818 433.195761
wvZoom -win $_nWave2 427.080723 427.454477
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSetPosition -win $_nWave2 {("G7" 6)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 562.439050 578.091343
wvZoom -win $_nWave2 573.382930 574.528220
wvZoom -win $_nWave2 574.038445 574.286126
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/sect_data_robin_shim1"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/gmii_packet_gen/block_ram_no_reg"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G9" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G9" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G9" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 7 )} 
wvSelectSignal -win $_nWave2 {( "G9" 3 )} 
wvZoom -win $_nWave2 573.743444 574.510246
wvZoom -win $_nWave2 574.200408 574.318857
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvSetPosition -win $_nWave2 {("G14" 6)}
wvSetPosition -win $_nWave2 {("G14" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G14" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G14" 6)}
wvSetPosition -win $_nWave2 {("G14" 6)}
wvSetPosition -win $_nWave2 {("G14" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G14" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G14" 6)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 1001.659124 1092.269736
wvZoom -win $_nWave2 1049.616448 1056.467494
wvSelectSignal -win $_nWave2 {( "G14" 4 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvSetPosition -win $_nWave2 {("G14" 7)}
wvSetPosition -win $_nWave2 {("G14" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G14" 7 )} 
wvSetPosition -win $_nWave2 {("G14" 7)}
wvSetPosition -win $_nWave2 {("G14" 7)}
wvSetPosition -win $_nWave2 {("G14" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G14" 7 )} 
wvSetPosition -win $_nWave2 {("G14" 7)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G14" 3 )} 
wvSelectSignal -win $_nWave2 {( "G14" 4 )} 
wvSetPosition -win $_nWave2 {("G14" 5)}
wvSetPosition -win $_nWave2 {("G14" 6)}
wvSetPosition -win $_nWave2 {("G14" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G14" 7)}
wvSelectSignal -win $_nWave2 {( "G14" 7 )} 
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
wvSelectSignal -win $_nWave2 {( "G14" 7 )} 
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
wvSetCursor -win $_nWave2 10.415462 -snap {("G16" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 5 )} 
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 44.278375 51.191728
wvSetCursor -win $_nWave2 46.431070 -snap {("G9" 3)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G14" 7 )} 
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
wvSelectSignal -win $_nWave2 {( "G9" 8 )} 
wvSelectSignal -win $_nWave2 {( "G9" 5 )} 
wvSelectSignal -win $_nWave2 {( "G9" 6 )} 
wvSelectSignal -win $_nWave2 {( "G9" 4 )} 
wvSelectSignal -win $_nWave2 {( "G7" 4 )} 
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
wvZoom -win $_nWave2 72.453200 90.234755
wvZoom -win $_nWave2 78.871908 80.144084
wvZoom -win $_nWave2 79.132549 79.460419
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 79.390313 79.940495
wvSelectSignal -win $_nWave2 {( "G14" 3 )} 
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectGroup -win $_nWave2 {G13}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 126.330186 128.955630
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 134.052080 139.148530
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 255.148111 259.581186
wvZoom -win $_nWave2 256.820425 257.681811
wvZoom -win $_nWave2 257.290336 257.573263
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 156.517066 173.737019
wvZoom -win $_nWave2 161.949051 163.867046
wvZoom -win $_nWave2 162.373193 162.688181
wvSetCursor -win $_nWave2 162.424155 -snap {("G7" 3)}
wvSetMarker -win $_nWave2 162.520000
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetSignalFilter -win $_nWave2 "*clk*"
wvSetPosition -win $_nWave2 {("G14" 8)}
wvSetPosition -win $_nWave2 {("G14" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
{/pcs_tb_top/dcn_top/sys_clk_125} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G14" 8 )} 
wvSetPosition -win $_nWave2 {("G14" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G14" 8 )} 
wvSetPosition -win $_nWave2 {("G14" 7)}
wvSetPosition -win $_nWave2 {("G14" 6)}
wvSetPosition -win $_nWave2 {("G14" 5)}
wvSetPosition -win $_nWave2 {("G14" 4)}
wvSetPosition -win $_nWave2 {("G14" 3)}
wvSetPosition -win $_nWave2 {("G14" 2)}
wvSetPosition -win $_nWave2 {("G14" 1)}
wvSetPosition -win $_nWave2 {("G14" 0)}
wvSetPosition -win $_nWave2 {("G13" 0)}
wvSetPosition -win $_nWave2 {("G12" 0)}
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSetPosition -win $_nWave2 {("G10" 0)}
wvSetPosition -win $_nWave2 {("G9" 8)}
wvSetPosition -win $_nWave2 {("G9" 7)}
wvSetPosition -win $_nWave2 {("G9" 6)}
wvSetPosition -win $_nWave2 {("G9" 5)}
wvSetPosition -win $_nWave2 {("G9" 4)}
wvSetPosition -win $_nWave2 {("G9" 3)}
wvSetPosition -win $_nWave2 {("G9" 2)}
wvSetPosition -win $_nWave2 {("G9" 1)}
wvSetPosition -win $_nWave2 {("G9" 0)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetCursor -win $_nWave2 162.422874 -snap {("G7" 1)}
wvSignalReport -win $_nWave2 -add "\{/pcs_tb_top/dcn_top/sys_clk_125\}"
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 177.335152 -snap {("G7" 2)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalClose -win $_nWave2
wvOpenFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_001.fsdb}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*crc*"
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_000.fsdb}
wvAddSignal -win $_nWave2 -group {"G7" {/pcs_tb_top/dcn_top/sys_clk_125} \
}
wvSetActiveFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_001.fsdb}
wvAddSignal -win $_nWave2 -group {"G7" {/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
}
wvSetActiveFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_000.fsdb}
wvAddSignal -win $_nWave2 -group {"G7" {/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_001.fsdb}
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSetPosition -win $_nWave2 {("G7" 2)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetSignalFilter -win $_nWave2 "*data*"
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_000.fsdb}
wvAddSignal -win $_nWave2 -group {"G7" {/pcs_tb_top/dcn_top/sys_clk_125} \
}
wvSetActiveFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_001.fsdb}
wvAddSignal -win $_nWave2 -group {"G7" {/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
}
wvSetActiveFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_000.fsdb}
wvAddSignal -win $_nWave2 -group {"G7" {/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_001.fsdb}
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvSetPosition -win $_nWave2 {("G7" 3)}
wvGetSignalClose -win $_nWave2
wvSetActiveFile -win $_nWave2 -applyAnnotation off \
           {/home/wgb/project/609/VER/ethernet/sim_shim_dcn/sim_000.fsdb}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 39.096143 42.667732
wvZoom -win $_nWave2 40.013722 40.289576
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 378.991284 399.596635
wvZoom -win $_nWave2 385.759220 386.697350
wvZoom -win $_nWave2 385.943032 386.084896
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 716.035959 748.415797
wvZoom -win $_nWave2 726.171111 727.671641
wvZoom -win $_nWave2 726.522455 726.735945
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 712.355913 741.267766
wvZoom -win $_nWave2 725.942133 727.611029
wvZoom -win $_nWave2 726.526925 726.734519
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1047.706057 1068.590563
wvZoom -win $_nWave2 1066.926595 1067.928372
wvZoom -win $_nWave2 1067.148940 1067.328120
wvSetCursor -win $_nWave2 1067.159720 -snap {("G7" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 26.105633 49.600702
wvZoom -win $_nWave2 39.801539 40.852131
wvZoom -win $_nWave2 40.002262 40.135508
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1726.686912 1763.953536
wvZoom -win $_nWave2 1747.804666 1749.501357
wvZoom -win $_nWave2 1748.283326 1748.466789
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 928.560048 -snap {("G16" 0)}
wvSelectSignal -win $_nWave2 {( "G14" 3 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1390.917743 1438.335394
wvZoom -win $_nWave2 1405.798404 1411.311188
wvZoom -win $_nWave2 1407.649445 1408.241061
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1364.621199 1453.296945
wvZoom -win $_nWave2 1406.724155 1410.689331
wvZoom -win $_nWave2 1407.697718 1408.129697
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1714.397752 1791.578494
wvZoom -win $_nWave2 1747.403500 1749.536952
wvZoom -win $_nWave2 1748.256881 1748.468491
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/ge_mac0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/ge_mac0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/data_latch_loop_shim1"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 4 5 )} 
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 4 5 )} 
wvSetPosition -win $_nWave2 {("G7" 5)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 2061.734731 2126.602236
wvZoom -win $_nWave2 2088.525538 2090.318623
wvZoom -win $_nWave2 2088.856457 2089.131980
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 2049.462501 2128.355411
wvZoom -win $_nWave2 2088.267550 2090.191768
wvZoom -win $_nWave2 2088.822914 2089.085734
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1711.808338 1793.918019
wvZoom -win $_nWave2 1746.521374 1751.394550
wvZoom -win $_nWave2 1748.236891 1748.708360
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 690.792312 783.611951
wvZoom -win $_nWave2 724.297937 731.693323
wvZoom -win $_nWave2 726.426366 727.195967
wvZoom -win $_nWave2 726.535236 726.706676
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 352.433785 441.450566
wvZoom -win $_nWave2 385.000900 388.908954
wvZoom -win $_nWave2 385.922311 386.338535
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G9" 6 )} 
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
wvSetCursor -win $_nWave2 4.425289 -snap {("G7" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 126.336613 -snap {("G7" 3)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 245.975383 253.618686
wvZoom -win $_nWave2 248.237304 248.877352
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 165.793930 173.253882
wvZoom -win $_nWave2 167.043320 167.619495
wvSetCursor -win $_nWave2 167.196030 -snap {("G7" 0)}
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 366.876871 375.849403
wvZoom -win $_nWave2 370.035494 370.451295
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
wvZoom -win $_nWave2 406.821556 425.479739
wvZoom -win $_nWave2 410.340823 411.539194
wvZoom -win $_nWave2 410.713974 410.865963
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
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
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 525.268930 534.132260
wvZoom -win $_nWave2 532.395624 532.842393
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 567.646913 573.412055
wvZoom -win $_nWave2 572.943345 573.337062
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 484.628535 501.017407
wvZoom -win $_nWave2 491.757028 492.862944
wvZoom -win $_nWave2 491.860427 492.073518
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 6 7 8 9 )} 
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/sys_clk_125} \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/eop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/sop_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/crc_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/clk} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc\[31:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/crc_err} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/data_en} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_end} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/frame_start} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/mac_rx_crc32/rst_b} \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
{/pcs_tb_top/dcn_top/cpu_cs} \
{/pcs_tb_top/dcn_top/cpu_din\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout\[15:0\]} \
{/pcs_tb_top/dcn_top/cpu_rd} \
{/pcs_tb_top/dcn_top/cpu_wr} \
{/pcs_tb_top/dcn_top/cpu_addr\[11:0\]} \
{/pcs_tb_top/dcn_top/cpu_dout_o\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 6 7 8 9 )} 
wvSetPosition -win $_nWave2 {("G7" 9)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 239.776403 259.369028
wvZoom -win $_nWave2 248.186896 249.795721
wvZoom -win $_nWave2 248.472037 248.887977
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 248.339139 248.482520
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 319.553921 345.576059
wvZoom -win $_nWave2 329.158840 331.380242
wvZoom -win $_nWave2 329.678973 329.924592
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 521.537002 542.995590
wvZoom -win $_nWave2 532.283742 534.167911
wvZoom -win $_nWave2 532.489009 532.853588
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1012.696788 1033.559211
wvZoom -win $_nWave2 1019.311703 1020.312421
wvZoom -win $_nWave2 1019.572052 1019.754297
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1044.859690 1066.591381
wvZoom -win $_nWave2 1059.824521 1060.831600
wvZoom -win $_nWave2 1059.987455 1060.135651
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 12898.416108 13639.554937
wvZoom -win $_nWave2 13394.316316 13404.559698
wvZoom -win $_nWave2 13397.331035 13398.188814
wvZoom -win $_nWave2 13397.441221 13397.560474
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 4342.813488 5213.976673
wvSetCursor -win $_nWave2 4703.319229 -snap {("G7" 6)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 14978.805803 15342.873999
wvZoom -win $_nWave2 15192.510874 15218.262039
wvZoom -win $_nWave2 15201.031788 15202.978828
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvZoom -win $_nWave2 7697.441871 8360.566086
wvZoom -win $_nWave2 7997.195581 8046.795116
wvZoom -win $_nWave2 8015.865975 8020.100082
wvZoom -win $_nWave2 8016.984743 8017.817795
wvSelectGroup -win $_nWave2 {G9}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G16" 0)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G7" 4)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 2727.323355 2974.111316
wvZoom -win $_nWave2 2805.171915 2823.630852
wvZoom -win $_nWave2 2808.683615 2810.589538
wvZoom -win $_nWave2 2809.216654 2809.597839
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/gmii_packet_gen"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 5 6 )} 
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 5 6 )} 
wvSetPosition -win $_nWave2 {("G7" 6)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 7 8 )} 
wvSetPosition -win $_nWave2 {("G7" 8)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 9 10 11 12 13 14 15 16 )} 
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G7" 9 10 11 12 13 14 15 16 )} 
wvSetPosition -win $_nWave2 {("G7" 16)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 3403.734833 3703.314490
wvZoom -win $_nWave2 3453.664776 3517.964800
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_rx_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G8" 6)}
wvSetPosition -win $_nWave2 {("G8" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G8" 6)}
wvSetPosition -win $_nWave2 {("G8" 6)}
wvSetPosition -win $_nWave2 {("G8" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G8" 6)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvSetPosition -win $_nWave2 {("G8" 8)}
wvSetPosition -win $_nWave2 {("G8" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 7 8 )} 
wvSetPosition -win $_nWave2 {("G8" 8)}
wvSetPosition -win $_nWave2 {("G8" 8)}
wvSetPosition -win $_nWave2 {("G8" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 7 8 )} 
wvSetPosition -win $_nWave2 {("G8" 8)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvZoom -win $_nWave2 1931.332686 2364.767084
wvZoom -win $_nWave2 2078.277519 2117.744716
wvZoom -win $_nWave2 2088.577494 2092.588388
wvZoom -win $_nWave2 2089.255759 2089.627501
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G8" 10)}
wvSetPosition -win $_nWave2 {("G8" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 9 10 )} 
wvSetPosition -win $_nWave2 {("G8" 10)}
wvSetPosition -win $_nWave2 {("G8" 10)}
wvSetPosition -win $_nWave2 {("G8" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 9 10 )} 
wvSetPosition -win $_nWave2 {("G8" 10)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 2262.782520 2613.354460
wvZoom -win $_nWave2 2419.542330 2448.329132
wvZoom -win $_nWave2 2429.067719 2430.893224
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetSignalFilter -win $_nWave2 "*loop*"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*loop*"
wvSetPosition -win $_nWave2 {("G8" 11)}
wvSetPosition -win $_nWave2 {("G8" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/loop_en\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 11 )} 
wvSetPosition -win $_nWave2 {("G8" 11)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*loop*"
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/gmii_rx_if0"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G8" 16)}
wvSetPosition -win $_nWave2 {("G8" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/loop_en\[2:0\]} \
{/pcs_tb_top/gmii_rx_if0/clk} \
{/pcs_tb_top/gmii_rx_if0/reset} \
{/pcs_tb_top/gmii_rx_if0/rx_dv} \
{/pcs_tb_top/gmii_rx_if0/rx_er} \
{/pcs_tb_top/gmii_rx_if0/rxd\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 12 13 14 15 16 )} 
wvSetPosition -win $_nWave2 {("G8" 16)}
wvSetPosition -win $_nWave2 {("G8" 16)}
wvSetPosition -win $_nWave2 {("G8" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
{/pcs_tb_top/dcn_top/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_i} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/packet_reassemble/valid_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/dcn_rx_shim0/sop_o} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim0_dat1_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat0_vld_i} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_i\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_rx_top/mana_sect_shim1_dat1_vld_i} \
}
wvAddSignal -win $_nWave2 -group {"G8" \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim0_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_o\[65:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_dat_vld_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/mana_sect_shim1_sect_data_0_1_ind} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/loop_en\[2:0\]} \
{/pcs_tb_top/gmii_rx_if0/clk} \
{/pcs_tb_top/gmii_rx_if0/reset} \
{/pcs_tb_top/gmii_rx_if0/rx_dv} \
{/pcs_tb_top/gmii_rx_if0/rx_er} \
{/pcs_tb_top/gmii_rx_if0/rxd\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G8" 12 13 14 15 16 )} 
wvSetPosition -win $_nWave2 {("G8" 16)}
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/gmii_rx_if0"
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G8" 9 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G8" 8 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
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
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 0)}
wvGetSignalOpen -win $_nWave2
wvSelectGroup -win $_nWave2 {G5}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 291.960847 304.678838
wvZoom -win $_nWave2 300.832422 301.814705
wvZoom -win $_nWave2 301.440160 301.600679
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetOptions -win $_nWave2 -input off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 301.382608 301.743842
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top/dcn_tx_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/gmii_rx_if0"
wvGetSignalSetScope -win $_nWave2 "/pcs_tb_top/dcn_top"
wvGetSignalSetScope -win $_nWave2 \
           "/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify"
wvGetSignalSetOptions -win $_nWave2 -input on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -output off
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvGetSignalSetOptions -win $_nWave2 -all on
wvGetSignalSetSignalFilter -win $_nWave2 "*"
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/data_i\[7:0\]} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/valid_i} \
{/pcs_tb_top/dcn_top/data_o\[7:0\]} \
{/pcs_tb_top/dcn_top/valid_o} \
{/pcs_tb_top/dcn_top/dcn_tx_top/packet_classify/rx_crc_err} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvAddSignal -win $_nWave2 -group {"G7" \
}
wvAddSignal -win $_nWave2 -group {"G8" \
}
wvAddSignal -win $_nWave2 -group {"G9" \
}
wvAddSignal -win $_nWave2 -group {"G10" \
}
wvAddSignal -win $_nWave2 -group {"G11" \
}
wvAddSignal -win $_nWave2 -group {"G12" \
}
wvAddSignal -win $_nWave2 -group {"G13" \
}
wvAddSignal -win $_nWave2 -group {"G14" \
}
wvAddSignal -win $_nWave2 -group {"G15" \
}
wvAddSignal -win $_nWave2 -group {"G16" \
}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 314.607600 -snap {("G10" 0)}
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
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 70.719386 74.355666
wvZoom -win $_nWave2 73.099228 73.994995
wvZoom -win $_nWave2 73.498318 73.666547
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 90.115906 96.173335
wvZoom -win $_nWave2 93.730665 94.661440
wvZoom -win $_nWave2 94.304265 94.420044
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 35.226280 -snap {("G16" 0)}
wvSetCursor -win $_nWave2 81.915079 -snap {("G1" 4)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 2555.293504 3262.340736
wvZoom -win $_nWave2 2687.505588 2723.145367
wvZoom -win $_nWave2 2694.865347 2696.719775
wvSetCursor -win $_nWave2 2695.334231 -snap {("G10" 0)}
wvSetCursor -win $_nWave2 2695.329708 -snap {("G16" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 36.719579 46.542651
wvSetCursor -win $_nWave2 40.081785 -snap {("G1" 1)}
wvZoom -win $_nWave2 39.946019 40.121716
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 40.048724 40.204137
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 40.165600 40.215635
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 148.515496 -snap {("G16" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 379.615941 397.535700
wvZoom -win $_nWave2 385.909710 386.754707
wvZoom -win $_nWave2 386.071839 386.290302
wvSetCursor -win $_nWave2 386.077168 -snap {("G16" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
