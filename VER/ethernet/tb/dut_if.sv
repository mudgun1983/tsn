interface dut_if();
logic sys_reset;

`ifdef DUAL_DUT
task assert_sys_reset();
  force pcs_tb_top.SUB_UUT.sys_reset = 1;
endtask

task de_assert_sys_reset();
  release pcs_tb_top.SUB_UUT.sys_reset ;
endtask
`endif
endinterface 