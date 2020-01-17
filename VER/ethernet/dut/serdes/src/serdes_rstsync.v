//FILE_HEADER-------------------------------------------------------------
//ZTE Copyright
//ZTE Company Confidential
//------------------------------------------------------------------------
//FILE NAME:      serdes_rstsync.v
//DEPARTMENT:     3G
//AUTHOR:         fan lizhen
//AUTHOR'S EMAIL: fan.lizhen1@zte.com.cn
//------------------------------------------------------------------------
//RELEASE HISTORY
//VERSION     DATE      AUTHOR           DESCRIPTION
// 1.0      2009-9-16  fan lizhen     Original version.
// 2.0      2012-07-01 zhangwei       chang for BPK_e
//------------------------------------------------------------------------
//KEYWORDS:
//------------------------------------------------------------------------
//PURPOSE: reset sync
//------------------------------------------------------------------------
//PARAMETERS
//        PARAM NAME    RANGE    :DESCRIPTION    :DEFAULT    :UNITS
//------------------------------------------------------------------------
//REUSE ISSUES
//Reset Strategy: Asynchronous
//Clock Domain: clk
//Critical Timing:
//Test Features:
//Asynchronous I/F:
//Scan Tethodology:
//Instaniations:
//Synthesizable: Yes
//Other:
//END_HEADER--------------------------------------------------------------
//`include "tb_variable_define.v"

module serdes_rstsync
        (
        clk           ,
        rst           ,
        rst_sync
        );

//output port
output            rst_sync;

//input port
input             clk;
input             rst;

//internal reg
reg               r1_rst;
reg               r2_rst;  

//-----------------------------------------------
always @(posedge clk or posedge rst)
    if( rst )
       r1_rst <= 1'b1;
    else 
       r1_rst <= 1'b0;

always @(posedge clk or posedge rst)
    if( rst )
        r2_rst <= 1'b1;
    else 
        r2_rst <= r1_rst;

BUFG rst_bufg
   (.O (rst_sync),
    .I (r2_rst));

//assign rst_sync = r2_rst;

endmodule