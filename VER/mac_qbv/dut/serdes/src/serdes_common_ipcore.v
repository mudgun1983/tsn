//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_common_ipcore.v
// AUTHOR       : pi qiang
// Department   : ZTE-BBU System Dept
// Email        : pi.qiang@zte.com.cn
//------------------------------------------------------------------
// Module Hiberarchy:
//x             |----xxx1
//x             |----xxx2
//x xxx_xxx-----|----xxx3 (为该模块包含的下一级子模块名，如没有下层模块，可不填)
//x             |----xxx4
//x             |----xxx5
//-----------------------------------------------------------------
// Release History:
//-----------------------------------------------------------------
// Version      Date      Author    Description
// 1.0        2016-4-25   piqiang   原始版本说明；
//-----------------------------------------------------------------
// Main Function:(Describing main function of the module)
// a)xxxxxxxx
// b)xxxxxxxx
//-----------------------------------------------------------------
//REUSE ISSUES: xxxxxxxx          
//Reset Strategy: xxxxxxxx
//Clock Strategy: xxxxxxxx
//Critical Timing: xxxxxxxx
//Asynchronous Interface: xxxxxxxx
//END_HEADER-------------------------------------------------------- 

`timescale 1ps/1ps
module serdes_common_ipcore #
  (  
  parameter C_GT_TYPE                           =     "GTYE3"    
  )                 
  (  
  //DRP
  input  wire    [0:0]                          COMMON_DRPCLK                     ,
  input  wire    [9:0]                          COMMON_DRPADDR                    ,
  input  wire    [15:0]                         COMMON_DRPDI                      ,
  input  wire    [0:0]                          COMMON_DRPWE                      ,
  input  wire    [0:0]                          COMMON_DRPEN                      ,
  output wire    [15:0]                         COMMON_DRPDO                      ,
  output wire    [0:0]                          COMMON_DRPRDY                     ,
  //QPLL0
  input  wire    [0:0]                          COMMON_GTNORTHREFCLK00            ,
  input  wire    [0:0]                          COMMON_GTNORTHREFCLK10            ,
  input  wire    [0:0]                          COMMON_GTREFCLK00                 ,  
  input  wire    [0:0]                          COMMON_GTREFCLK10                 ,
  input  wire    [0:0]                          COMMON_GTSOUTHREFCLK00            ,
  input  wire    [0:0]                          COMMON_GTSOUTHREFCLK10            ,
  input  wire    [2:0]                          COMMON_QPLL0REFCLKSEL             ,  
  input  wire    [0:0]                          COMMON_QPLL0LOCKDETCLK            ,
  input  wire    [0:0]                          COMMON_QPLL0PD                    ,
  input  wire    [0:0]                          COMMON_QPLL0RESET                 ,
  output wire    [0:0]                          COMMON_QPLL0REFCLKLOST            , 
  output wire    [0:0]                          COMMON_QPLL0FBCLKLOST             ,
  output wire    [0:0]                          COMMON_QPLL0LOCK                  ,
  output wire    [0:0]                          COMMON_QPLL0OUTCLK                ,
  output wire    [0:0]                          COMMON_QPLL0OUTREFCLK             ,
  //QPLL1     
  input  wire    [0:0]                          COMMON_GTNORTHREFCLK01            ,
  input  wire    [0:0]                          COMMON_GTNORTHREFCLK11            ,
  input  wire    [0:0]                          COMMON_GTREFCLK01                 ,
  input  wire    [0:0]                          COMMON_GTREFCLK11                 ,
  input  wire    [0:0]                          COMMON_GTSOUTHREFCLK01            ,
  input  wire    [0:0]                          COMMON_GTSOUTHREFCLK11            ,
  input  wire    [2:0]                          COMMON_QPLL1REFCLKSEL             ,
  input  wire    [0:0]                          COMMON_QPLL1LOCKDETCLK            ,
  input  wire    [0:0]                          COMMON_QPLL1PD                    ,
  input  wire    [0:0]                          COMMON_QPLL1RESET                 ,
  output wire    [0:0]                          COMMON_QPLL1REFCLKLOST            ,
  output wire    [0:0]                          COMMON_QPLL1FBCLKLOST             ,
  output wire    [0:0]                          COMMON_QPLL1LOCK                  ,
  output wire    [0:0]                          COMMON_QPLL1OUTCLK                ,
  output wire    [0:0]                          COMMON_QPLL1OUTREFCLK                      
);



generate 
    if (C_GT_TYPE == "GTYE4_25") //QPLL0 为25G，参考时钟368.64M；QPLL1 为9.8304G，参考时钟368.64M；
        begin : gen_serdes_gtye4_common_wrapper_25
            serdes_gtye4_common_wrapper_25  serdes_gtye4_common_wrapper_25 
            (
            //inputs
            .GTYE4_COMMON_BGBYPASSB                       ( 1'H1                           ),
            .GTYE4_COMMON_BGMONITORENB                    ( 1'H1                           ),
            .GTYE4_COMMON_BGPDB                           ( 1'H1                           ),
            .GTYE4_COMMON_BGRCALOVRD                      ( 5'H10                          ),
            .GTYE4_COMMON_BGRCALOVRDENB                   ( 1'H1                           ),
            .GTYE4_COMMON_DRPADDR                         ( {6'd0,COMMON_DRPADDR[9:0]}     ),
            .GTYE4_COMMON_DRPCLK                          ( COMMON_DRPCLK                  ),
            .GTYE4_COMMON_DRPDI                           ( COMMON_DRPDI                   ),
            .GTYE4_COMMON_DRPEN                           ( COMMON_DRPEN                   ),
            .GTYE4_COMMON_DRPWE                           ( COMMON_DRPWE                   ),
            .GTYE4_COMMON_GTGREFCLK0                      ( 1'b0                           ),
            .GTYE4_COMMON_GTGREFCLK1                      ( 1'b0                           ),
            .GTYE4_COMMON_GTNORTHREFCLK00                 ( COMMON_GTNORTHREFCLK00         ),
            .GTYE4_COMMON_GTNORTHREFCLK01                 ( COMMON_GTNORTHREFCLK01         ),
            .GTYE4_COMMON_GTNORTHREFCLK10                 ( COMMON_GTNORTHREFCLK10         ),
            .GTYE4_COMMON_GTNORTHREFCLK11                 ( COMMON_GTNORTHREFCLK11         ),
            .GTYE4_COMMON_GTREFCLK00                      ( COMMON_GTREFCLK00              ),
            .GTYE4_COMMON_GTREFCLK01                      ( COMMON_GTREFCLK01              ),
            .GTYE4_COMMON_GTREFCLK10                      ( COMMON_GTREFCLK10              ),
            .GTYE4_COMMON_GTREFCLK11                      ( COMMON_GTREFCLK11              ),
            .GTYE4_COMMON_GTSOUTHREFCLK00                 ( COMMON_GTSOUTHREFCLK00         ),
            .GTYE4_COMMON_GTSOUTHREFCLK01                 ( COMMON_GTSOUTHREFCLK01         ),
            .GTYE4_COMMON_GTSOUTHREFCLK10                 ( COMMON_GTSOUTHREFCLK10         ),
            .GTYE4_COMMON_GTSOUTHREFCLK11                 ( COMMON_GTSOUTHREFCLK11         ),
            .GTYE4_COMMON_PCIERATEQPLL0                   ( 3'H0                           ),
            .GTYE4_COMMON_PCIERATEQPLL1                   ( 3'H0                           ),
            .GTYE4_COMMON_PMARSVD0                        ( 8'H00                          ),
            .GTYE4_COMMON_PMARSVD1                        ( 8'H00                          ),
            .GTYE4_COMMON_QPLL0CLKRSVD0                   ( 1'H0                           ),
            .GTYE4_COMMON_QPLL0CLKRSVD1                   ( 1'H0                           ),
            .GTYE4_COMMON_QPLL0FBDIV                      ( 8'H00                          ),
            .GTYE4_COMMON_QPLL0LOCKDETCLK                 ( COMMON_QPLL0LOCKDETCLK         ),
            .GTYE4_COMMON_QPLL0LOCKEN                     ( 1'H1                           ),
            .GTYE4_COMMON_QPLL0PD                         ( COMMON_QPLL0PD                 ),
            .GTYE4_COMMON_QPLL0REFCLKSEL                  ( COMMON_QPLL0REFCLKSEL          ),
            .GTYE4_COMMON_QPLL0RESET                      ( COMMON_QPLL0RESET              ),
            .GTYE4_COMMON_QPLL1CLKRSVD0                   ( 1'H0                           ),
            .GTYE4_COMMON_QPLL1CLKRSVD1                   ( 1'H0                           ),
            .GTYE4_COMMON_QPLL1FBDIV                      ( 8'H00                          ),
            .GTYE4_COMMON_QPLL1LOCKDETCLK                 ( COMMON_QPLL1LOCKDETCLK         ),
            .GTYE4_COMMON_QPLL1LOCKEN                     ( 1'H1                           ),
            .GTYE4_COMMON_QPLL1PD                         ( COMMON_QPLL1PD                 ),
            .GTYE4_COMMON_QPLL1REFCLKSEL                  ( COMMON_QPLL1REFCLKSEL          ),
            .GTYE4_COMMON_QPLL1RESET                      ( COMMON_QPLL1RESET              ),
            .GTYE4_COMMON_QPLLRSVD1                       ( 8'H00                          ),
            .GTYE4_COMMON_QPLLRSVD2                       ( 5'H00                          ),
            .GTYE4_COMMON_QPLLRSVD3                       ( 5'H00                          ),
            .GTYE4_COMMON_QPLLRSVD4                       ( 8'H00                          ),
            .GTYE4_COMMON_RCALENB                         ( 1'H1                           ),
            .GTYE4_COMMON_SDM0DATA                        ( 25'H0000000                    ),
            .GTYE4_COMMON_SDM0RESET                       ( 1'H0                           ),
            .GTYE4_COMMON_SDM0TOGGLE                      ( 1'H0                           ),
            .GTYE4_COMMON_SDM0WIDTH                       ( 2'H0                           ),
            .GTYE4_COMMON_SDM1DATA                        ( 25'H0000000                    ),
            .GTYE4_COMMON_SDM1RESET                       ( 1'H0                           ),
            .GTYE4_COMMON_SDM1TOGGLE                      ( 1'H0                           ),
            .GTYE4_COMMON_SDM1WIDTH                       ( 2'H0                           ),
            .GTYE4_COMMON_UBCFGSTREAMEN                   ( 1'H0                           ),
            .GTYE4_COMMON_UBDO                            ( 16'H0000                       ),
            .GTYE4_COMMON_UBDRDY                          ( 1'H0                           ),
            .GTYE4_COMMON_UBENABLE                        ( 1'H0                           ),
            .GTYE4_COMMON_UBGPI                           ( 2'H0                           ),
            .GTYE4_COMMON_UBINTR                          ( 2'H0                           ),
            .GTYE4_COMMON_UBIOLMBRST                      ( 1'H0                           ),
            .GTYE4_COMMON_UBMBRST                         ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMCAPTURE                    ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMDBGRST                     ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMDBGUPDATE                  ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMREGEN                      ( 4'H0                           ),
            .GTYE4_COMMON_UBMDMSHIFT                      ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMSYSRST                     ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMTCK                        ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMTDI                        ( 1'H0                           ),
                                                             
            //outputs                                        
            .GTYE4_COMMON_DRPDO                           ( COMMON_DRPDO                   ),
            .GTYE4_COMMON_DRPRDY                          ( COMMON_DRPRDY                  ),
            .GTYE4_COMMON_PMARSVDOUT0                     (                                ),
            .GTYE4_COMMON_PMARSVDOUT1                     (                                ),
            .GTYE4_COMMON_QPLL0FBCLKLOST                  ( COMMON_QPLL0FBCLKLOST          ),
            .GTYE4_COMMON_QPLL0LOCK                       ( COMMON_QPLL0LOCK               ),
            .GTYE4_COMMON_QPLL0OUTCLK                     ( COMMON_QPLL0OUTCLK             ),
            .GTYE4_COMMON_QPLL0OUTREFCLK                  ( COMMON_QPLL0OUTREFCLK          ),
            .GTYE4_COMMON_QPLL0REFCLKLOST                 ( COMMON_QPLL0REFCLKLOST         ),
            .GTYE4_COMMON_QPLL1FBCLKLOST                  ( COMMON_QPLL1FBCLKLOST          ),
            .GTYE4_COMMON_QPLL1LOCK                       ( COMMON_QPLL1LOCK               ),
            .GTYE4_COMMON_QPLL1OUTCLK                     ( COMMON_QPLL1OUTCLK             ),
            .GTYE4_COMMON_QPLL1OUTREFCLK                  ( COMMON_QPLL1OUTREFCLK          ),
            .GTYE4_COMMON_QPLL1REFCLKLOST                 ( COMMON_QPLL1REFCLKLOST         ),
            .GTYE4_COMMON_QPLLDMONITOR0                   (                                ),
            .GTYE4_COMMON_QPLLDMONITOR1                   (                                ),
            .GTYE4_COMMON_REFCLKOUTMONITOR0               (                                ),
            .GTYE4_COMMON_REFCLKOUTMONITOR1               (                                ),
            .GTYE4_COMMON_RXRECCLK0SEL                    (                                ),
            .GTYE4_COMMON_RXRECCLK1SEL                    (                                ),
            .GTYE4_COMMON_SDM0FINALOUT                    (                                ),
            .GTYE4_COMMON_SDM0TESTDATA                    (                                ),
            .GTYE4_COMMON_SDM1FINALOUT                    (                                ),
            .GTYE4_COMMON_SDM1TESTDATA                    (                                ),
            .GTYE4_COMMON_UBDADDR                         (                                ),
            .GTYE4_COMMON_UBDEN                           (                                ),
            .GTYE4_COMMON_UBDI                            (                                ),
            .GTYE4_COMMON_UBDWE                           (                                ),
            .GTYE4_COMMON_UBMDMTDO                        (                                ),
            .GTYE4_COMMON_UBRSVDOUT                       (                                ),
            .GTYE4_COMMON_UBTXUART                        (                                )
            );
        end



    else if (C_GT_TYPE == "GTYE4_12") //QPLL0 为12G，参考时钟368.64M；QPLL1 为9.8304G，参考时钟368.64M；
        begin : gen_serdes_gtye4_common_wrapper_12
            serdes_gtye4_common_wrapper_12  serdes_gtye4_common_wrapper_12 
            (
            //inputs
            .GTYE4_COMMON_BGBYPASSB                       ( 1'H1                           ),
            .GTYE4_COMMON_BGMONITORENB                    ( 1'H1                           ),
            .GTYE4_COMMON_BGPDB                           ( 1'H1                           ),
            .GTYE4_COMMON_BGRCALOVRD                      ( 5'H10                          ),
            .GTYE4_COMMON_BGRCALOVRDENB                   ( 1'H1                           ),
            .GTYE4_COMMON_DRPADDR                         ( {6'd0,COMMON_DRPADDR[9:0]}     ),
            .GTYE4_COMMON_DRPCLK                          ( COMMON_DRPCLK                  ),
            .GTYE4_COMMON_DRPDI                           ( COMMON_DRPDI                   ),
            .GTYE4_COMMON_DRPEN                           ( COMMON_DRPEN                   ),
            .GTYE4_COMMON_DRPWE                           ( COMMON_DRPWE                   ),
            .GTYE4_COMMON_GTGREFCLK0                      ( 1'b0                           ),
            .GTYE4_COMMON_GTGREFCLK1                      ( 1'b0                           ),
            .GTYE4_COMMON_GTNORTHREFCLK00                 ( COMMON_GTNORTHREFCLK00         ),
            .GTYE4_COMMON_GTNORTHREFCLK01                 ( COMMON_GTNORTHREFCLK01         ),
            .GTYE4_COMMON_GTNORTHREFCLK10                 ( COMMON_GTNORTHREFCLK10         ),
            .GTYE4_COMMON_GTNORTHREFCLK11                 ( COMMON_GTNORTHREFCLK11         ),
            .GTYE4_COMMON_GTREFCLK00                      ( COMMON_GTREFCLK00              ),
            .GTYE4_COMMON_GTREFCLK01                      ( COMMON_GTREFCLK01              ),
            .GTYE4_COMMON_GTREFCLK10                      ( COMMON_GTREFCLK10              ),
            .GTYE4_COMMON_GTREFCLK11                      ( COMMON_GTREFCLK11              ),
            .GTYE4_COMMON_GTSOUTHREFCLK00                 ( COMMON_GTSOUTHREFCLK00         ),
            .GTYE4_COMMON_GTSOUTHREFCLK01                 ( COMMON_GTSOUTHREFCLK01         ),
            .GTYE4_COMMON_GTSOUTHREFCLK10                 ( COMMON_GTSOUTHREFCLK10         ),
            .GTYE4_COMMON_GTSOUTHREFCLK11                 ( COMMON_GTSOUTHREFCLK11         ),
            .GTYE4_COMMON_PCIERATEQPLL0                   ( 3'H0                           ),
            .GTYE4_COMMON_PCIERATEQPLL1                   ( 3'H0                           ),
            .GTYE4_COMMON_PMARSVD0                        ( 8'H00                          ),
            .GTYE4_COMMON_PMARSVD1                        ( 8'H00                          ),
            .GTYE4_COMMON_QPLL0CLKRSVD0                   ( 1'H0                           ),
            .GTYE4_COMMON_QPLL0CLKRSVD1                   ( 1'H0                           ),
            .GTYE4_COMMON_QPLL0FBDIV                      ( 8'H00                          ),
            .GTYE4_COMMON_QPLL0LOCKDETCLK                 ( COMMON_QPLL0LOCKDETCLK         ),
            .GTYE4_COMMON_QPLL0LOCKEN                     ( 1'H1                           ),
            .GTYE4_COMMON_QPLL0PD                         ( COMMON_QPLL0PD                 ),
            .GTYE4_COMMON_QPLL0REFCLKSEL                  ( COMMON_QPLL0REFCLKSEL          ),
            .GTYE4_COMMON_QPLL0RESET                      ( COMMON_QPLL0RESET              ),
            .GTYE4_COMMON_QPLL1CLKRSVD0                   ( 1'H0                           ),
            .GTYE4_COMMON_QPLL1CLKRSVD1                   ( 1'H0                           ),
            .GTYE4_COMMON_QPLL1FBDIV                      ( 8'H00                          ),
            .GTYE4_COMMON_QPLL1LOCKDETCLK                 ( COMMON_QPLL1LOCKDETCLK         ),
            .GTYE4_COMMON_QPLL1LOCKEN                     ( 1'H1                           ),
            .GTYE4_COMMON_QPLL1PD                         ( COMMON_QPLL1PD                 ),
            .GTYE4_COMMON_QPLL1REFCLKSEL                  ( COMMON_QPLL1REFCLKSEL          ),
            .GTYE4_COMMON_QPLL1RESET                      ( COMMON_QPLL1RESET              ),
            .GTYE4_COMMON_QPLLRSVD1                       ( 8'H00                          ),
            .GTYE4_COMMON_QPLLRSVD2                       ( 5'H00                          ),
            .GTYE4_COMMON_QPLLRSVD3                       ( 5'H00                          ),
            .GTYE4_COMMON_QPLLRSVD4                       ( 8'H00                          ),
            .GTYE4_COMMON_RCALENB                         ( 1'H1                           ),
            .GTYE4_COMMON_SDM0DATA                        ( 25'H0000000                    ),
            .GTYE4_COMMON_SDM0RESET                       ( 1'H0                           ),
            .GTYE4_COMMON_SDM0TOGGLE                      ( 1'H0                           ),
            .GTYE4_COMMON_SDM0WIDTH                       ( 2'H0                           ),
            .GTYE4_COMMON_SDM1DATA                        ( 25'H0000000                    ),
            .GTYE4_COMMON_SDM1RESET                       ( 1'H0                           ),
            .GTYE4_COMMON_SDM1TOGGLE                      ( 1'H0                           ),
            .GTYE4_COMMON_SDM1WIDTH                       ( 2'H0                           ),
            .GTYE4_COMMON_UBCFGSTREAMEN                   ( 1'H0                           ),
            .GTYE4_COMMON_UBDO                            ( 16'H0000                       ),
            .GTYE4_COMMON_UBDRDY                          ( 1'H0                           ),
            .GTYE4_COMMON_UBENABLE                        ( 1'H0                           ),
            .GTYE4_COMMON_UBGPI                           ( 2'H0                           ),
            .GTYE4_COMMON_UBINTR                          ( 2'H0                           ),
            .GTYE4_COMMON_UBIOLMBRST                      ( 1'H0                           ),
            .GTYE4_COMMON_UBMBRST                         ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMCAPTURE                    ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMDBGRST                     ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMDBGUPDATE                  ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMREGEN                      ( 4'H0                           ),
            .GTYE4_COMMON_UBMDMSHIFT                      ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMSYSRST                     ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMTCK                        ( 1'H0                           ),
            .GTYE4_COMMON_UBMDMTDI                        ( 1'H0                           ),
                                                             
            //outputs                                        
            .GTYE4_COMMON_DRPDO                           ( COMMON_DRPDO                   ),
            .GTYE4_COMMON_DRPRDY                          ( COMMON_DRPRDY                  ),
            .GTYE4_COMMON_PMARSVDOUT0                     (                                ),
            .GTYE4_COMMON_PMARSVDOUT1                     (                                ),
            .GTYE4_COMMON_QPLL0FBCLKLOST                  ( COMMON_QPLL0FBCLKLOST          ),
            .GTYE4_COMMON_QPLL0LOCK                       ( COMMON_QPLL0LOCK               ),
            .GTYE4_COMMON_QPLL0OUTCLK                     ( COMMON_QPLL0OUTCLK             ),
            .GTYE4_COMMON_QPLL0OUTREFCLK                  ( COMMON_QPLL0OUTREFCLK          ),
            .GTYE4_COMMON_QPLL0REFCLKLOST                 ( COMMON_QPLL0REFCLKLOST         ),
            .GTYE4_COMMON_QPLL1FBCLKLOST                  ( COMMON_QPLL1FBCLKLOST          ),
            .GTYE4_COMMON_QPLL1LOCK                       ( COMMON_QPLL1LOCK               ),
            .GTYE4_COMMON_QPLL1OUTCLK                     ( COMMON_QPLL1OUTCLK             ),
            .GTYE4_COMMON_QPLL1OUTREFCLK                  ( COMMON_QPLL1OUTREFCLK          ),
            .GTYE4_COMMON_QPLL1REFCLKLOST                 ( COMMON_QPLL1REFCLKLOST         ),
            .GTYE4_COMMON_QPLLDMONITOR0                   (                                ),
            .GTYE4_COMMON_QPLLDMONITOR1                   (                                ),
            .GTYE4_COMMON_REFCLKOUTMONITOR0               (                                ),
            .GTYE4_COMMON_REFCLKOUTMONITOR1               (                                ),
            .GTYE4_COMMON_RXRECCLK0SEL                    (                                ),
            .GTYE4_COMMON_RXRECCLK1SEL                    (                                ),
            .GTYE4_COMMON_SDM0FINALOUT                    (                                ),
            .GTYE4_COMMON_SDM0TESTDATA                    (                                ),
            .GTYE4_COMMON_SDM1FINALOUT                    (                                ),
            .GTYE4_COMMON_SDM1TESTDATA                    (                                ),
            .GTYE4_COMMON_UBDADDR                         (                                ),
            .GTYE4_COMMON_UBDEN                           (                                ),
            .GTYE4_COMMON_UBDI                            (                                ),
            .GTYE4_COMMON_UBDWE                           (                                ),
            .GTYE4_COMMON_UBMDMTDO                        (                                ),
            .GTYE4_COMMON_UBRSVDOUT                       (                                ),
            .GTYE4_COMMON_UBTXUART                        (                                )
            );
        end




endgenerate        
        
endmodule

