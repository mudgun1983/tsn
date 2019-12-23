`include "global_define.sv"
interface dut_if();
//logic sys_reset;

`ifndef DUMMY_DUT
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

 task init_finish(output int peek_value);
    fork	
	  begin
	  forever begin
	  @(posedge pcs_tb_top.UUT.syc_clk_250m)
      peek_value = pcs_tb_top.UUT.tsn_sw_top.ipp_top.l2mt_age_r_ini_finish && pcs_tb_top.UUT.tsn_sw_top.ipp_top.l2mt_mact_ini_finish;
	  end
	  end
	  
      begin
	    @(posedge peek_value)
		  ;
	  end
	join_any
    //peek_value = pcs_tb_top.UUT.tsn_sw_top.ipp_top.l2mt_age_r_ini_finish && pcs_tb_top.UUT.tsn_sw_top.ipp_top.l2mt_mact_ini_finish;
 endtask

 task monitor_gate_status(input int gate_id);
 endtask
`else
`endif
endinterface 