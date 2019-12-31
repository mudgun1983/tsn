`include "global_define.sv"
interface dut_if();
//logic sys_reset;


 `ifdef DUAL_DUT
 task assert_sys_reset();
   force pcs_tb_top.SUB_UUT.sys_reset = 1;
 endtask

 task de_assert_sys_reset();
   release pcs_tb_top.SUB_UUT.sys_reset ;
 endtask
 
 task peek_ptp_slave_offset(output int peek_value);
    @(posedge pcs_tb_top.SUB_UUT.syc_clk_250m)
    peek_value = pcs_tb_top.SUB_UUT.hw_engine_1588_top.u_OFFSET_CAL.o_deltaT[79:0];
 endtask
 `endif

endinterface 