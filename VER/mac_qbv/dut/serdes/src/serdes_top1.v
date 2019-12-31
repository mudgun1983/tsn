//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_top1.v
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
`timescale 1ns / 1ps


module serdes_top1 
#(  
parameter    C_BASE_ADDR       = 16'h3000
)
( 
//interface with CPU                     
input  wire                    I_system_clk                       ,//
input  wire                    I_system_rst                       ,//
input  wire                    I_cpu_wren                         ,// 
input  wire                    I_cpu_rden                         ,// 
input  wire  [      15:0]      I_cpu_addr                         ,// 
input  wire  [      15:0]      I_cpu_wdat                         ,// 
output wire  [      15:0]      O_cpu_rdat                         ,//  
//QPLL0 refclk                       
input  wire  [     6-1:0]      I_gtnorthrefclk00                  ,//
input  wire  [     6-1:0]      I_gtnorthrefclk10                  ,//
input  wire  [     6-1:0]      I_gtrefclk00                       ,//
input  wire  [     6-1:0]      I_gtrefclk10                       ,//
input  wire  [     6-1:0]      I_gtsouthrefclk00                  ,//
input  wire  [     6-1:0]      I_gtsouthrefclk10                  ,//
//QPLL1 refclk                           
input  wire  [     6-1:0]      I_gtnorthrefclk01                  ,//  
input  wire  [     6-1:0]      I_gtnorthrefclk11                  ,//
input  wire  [     6-1:0]      I_gtrefclk01                       ,//
input  wire  [     6-1:0]      I_gtrefclk11                       ,//
input  wire  [     6-1:0]      I_gtsouthrefclk01                  ,//
input  wire  [     6-1:0]      I_gtsouthrefclk11                  ,// 
//channel cpll refclk               
input  wire  [    24-1:0]      I_gtnorthrefclk0                   ,//   
input  wire  [    24-1:0]      I_gtnorthrefclk1                   ,//   
input  wire  [    24-1:0]      I_gtrefclk0                        ,//     
input  wire  [    24-1:0]      I_gtrefclk1                        ,//   
input  wire  [    24-1:0]      I_gtsouthrefclk0                   ,//   
input  wire  [    24-1:0]      I_gtsouthrefclk1                   ,//   
//channel tx                                                                           
input  wire  [  8*24-1:0]      I_txctrl                           ,//   
input  wire  [ 64*24-1:0]      I_txdata                           ,//   
output wire  [    24-1:0]      O_gttxn                            ,//   
output wire  [    24-1:0]      O_gttxp                            ,//   
output wire  [    24-1:0]      O_txoutclk                         ,//   
output wire  [    24-1:0]      O_txoutrst                         ,//   
//channel rx                                                                           
input  wire  [    24-1:0]      I_gtrxn                            ,//   
input  wire  [    24-1:0]      I_gtrxp                            ,//   
output wire  [  8*24-1:0]      O_rxctrl                           ,//       
output wire  [ 64*24-1:0]      O_rxdata                           ,//   
output wire  [    24-1:0]      O_rxoutclk                         ,//
output wire  [    24-1:0]      O_rxoutrst                         ,//
//with cpri
output wire  [  8*24-1:0]      O_8b10b_lcv                        ,//   
output wire  [    24-1:0]      O_64b66b_lcv                       ,//
output wire  [  4*24-1:0]      O_serdes_rate_sel                  ,//
input  wire  [    24-1:0]      I_tx_scramble_en                   ,//
input  wire  [    24-1:0]      I_rx_scramble_en                    //
);

         
// ---------------------------------------------------------------------------------------------------------
// inter wire
// ---------------------------------------------------------------------------------------------------------
wire   [ 64* 6-1:0]            S_qpll_config                      ;//
wire   [ 64* 6-1:0]            S_qpll_state                       ;//
    
wire   [160*24-1:0]            S_channel_config                   ;//    
wire   [160*24-1:0]            S_channel_state                    ;//    
wire   [160*24-1:0]            S_channel_alarm                    ;//    
   

// ---------------------------------------------------------------------------------------------------------
// inter reg
// ---------------------------------------------------------------------------------------------------------



// ***********************************************************main Verilog code********************************************************//



serdes_cpu_interface1 #                                                     
            (                                                                           
            .C_BASE_ADDR                        ( C_BASE_ADDR                          )
            )                                                                          
            serdes_cpu_interface1                                                       
            (                                                                          
            .I_system_clk                       ( I_system_clk                         ),
            .I_system_rst                       ( I_system_rst                         ),
            .I_cpu_wren                         ( I_cpu_wren                           ),
            .I_cpu_rden                         ( I_cpu_rden                           ),
            .I_cpu_addr                         ( I_cpu_addr                           ),
            .I_cpu_wdat                         ( I_cpu_wdat                           ),
            .O_cpu_rdat                         ( O_cpu_rdat                           ),
            .O_qpll_config                      ( S_qpll_config                        ),
            .I_qpll_state                       ( S_qpll_state                         ),
            .O_channel_config                   ( S_channel_config                     ),
            .I_channel_state                    ( S_channel_state                      ),
            .I_channel_alarm                    ( S_channel_alarm                      )
            );
                        

//serdes_debug      serdes_debug
//            (
//            );



//serdes_quad_top可作为通用模块

`ifdef NO_SERDES_QUAD0
            assign  S_qpll_state     [ 64* 1-1: 64* 0]  =  64'd0 ;
            assign  O_gttxn          [  1*14-1:  1*10]  =   4'd0 ;
            assign  O_gttxp          [  1*14-1:  1*10]  =   4'd0 ;
            assign  O_txoutclk       [  1*14-1:  1*10]  =   4'd0 ;
            assign  O_txoutrst       [  1*14-1:  1*10]  =   4'd0 ;
            assign  O_rxctrl         [  8*14-1:  8*10]  =  32'd0 ;
            assign  O_rxdata         [ 64*14-1: 64*10]  = 256'd0 ;
            assign  O_rxoutclk       [  1*14-1:  1*10]  =   4'd0 ;
            assign  O_rxoutrst       [  1*14-1:  1*10]  =   4'd0 ;
            assign  S_channel_state  [160*14-1:160*10]  = 640'd0 ;
            assign  S_channel_alarm  [160*14-1:160*10]  = 640'd0 ;
            assign  O_8b10b_lcv      [  8*14-1:  8*10]  =  32'd0 ;
            assign  O_64b66b_lcv     [  1*14-1:  1*10]  =   4'd0 ;
            assign  O_serdes_rate_sel[  4*14-1:  4*10]  =  16'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_12"                           ),//
            .C_CHANNEL_NUM                      ( 4                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ),//1bit对应一个通道，0-cpri，1-tdm
            .C_CHANNEL_TXRX_SHARE_CLK           ( 4'b1111                              ) //1'd0-NO SHARE CLK;  1'd1-SHARE CLK
            )                                                                          
            serdes_quad_top0                                                                    
            (                                                                          
            //QPLL0/1 system CLK                                                          
            .I_system_clk                       ( I_system_clk                         ),
            .I_system_rst                       ( I_system_rst                         ),
            //QPLL0 refclk                                                             
            .I_gtnorthrefclk00                  ( I_gtnorthrefclk00[  0            ]   ),
            .I_gtnorthrefclk10                  ( I_gtnorthrefclk10[  0            ]   ),
            .I_gtrefclk00                       ( I_gtrefclk00     [  0            ]   ),
            .I_gtrefclk10                       ( I_gtrefclk10     [  0            ]   ),
            .I_gtsouthrefclk00                  ( I_gtsouthrefclk00[  0            ]   ),
            .I_gtsouthrefclk10                  ( I_gtsouthrefclk10[  0            ]   ),
            //QPLL1 refclk                                                             
            .I_gtnorthrefclk01                  ( I_gtnorthrefclk01[  0            ]   ),
            .I_gtnorthrefclk11                  ( I_gtnorthrefclk11[  0            ]   ),
            .I_gtrefclk01                       ( I_gtrefclk01     [  0            ]   ),
            .I_gtrefclk11                       ( I_gtrefclk11     [  0            ]   ),
            .I_gtsouthrefclk01                  ( I_gtsouthrefclk01[  0            ]   ),
            .I_gtsouthrefclk11                  ( I_gtsouthrefclk11[  0            ]   ),
            //QPLL0/1 cpu interface                                                
            .I_qpll_config                      ( S_qpll_config    [ 64* 1-1: 64* 0]   ),
            .O_qpll_state                       ( S_qpll_state     [ 64* 1-1: 64* 0]   ),
                                                                                    
            //channel cpll refclk                                                   
            .I_gtnorthrefclk0                   ( I_gtnorthrefclk0 [  1* 4-1:  1* 0]   ),
            .I_gtnorthrefclk1                   ( I_gtnorthrefclk1 [  1* 4-1:  1* 0]   ),
            .I_gtrefclk0                        ( I_gtrefclk0      [  1* 4-1:  1* 0]   ),
            .I_gtrefclk1                        ( I_gtrefclk1      [  1* 4-1:  1* 0]   ),
            .I_gtsouthrefclk0                   ( I_gtsouthrefclk0 [  1* 4-1:  1* 0]   ),
            .I_gtsouthrefclk1                   ( I_gtsouthrefclk1 [  1* 4-1:  1* 0]   ),
            //channel tx                                                
            .I_txctrl                           ( I_txctrl         [  8*14-1:  8*10]   ),
            .I_txdata                           ( I_txdata         [ 64*14-1: 64*10]   ),
            .O_gttxn                            ( O_gttxn          [  1*14-1:  1*10]   ),
            .O_gttxp                            ( O_gttxp          [  1*14-1:  1*10]   ),
            .O_txoutclk                         ( O_txoutclk       [  1*14-1:  1*10]   ),
            .O_txoutrst                         ( O_txoutrst       [  1*14-1:  1*10]   ),
            //channel rx                                               
            .I_gtrxn                            ( I_gtrxn          [  1*14-1:  1*10]   ),
            .I_gtrxp                            ( I_gtrxp          [  1*14-1:  1*10]   ),
            .O_rxctrl                           ( O_rxctrl         [  8*14-1:  8*10]   ),
            .O_rxdata                           ( O_rxdata         [ 64*14-1: 64*10]   ),
            .O_rxoutclk                         ( O_rxoutclk       [  1*14-1:  1*10]   ),
            .O_rxoutrst                         ( O_rxoutrst       [  1*14-1:  1*10]   ),
            //channel cpu interface                                     
            .I_channel_config                   ( S_channel_config [160*14-1:160*10]   ),
            .O_channel_state                    ( S_channel_state  [160*14-1:160*10]   ),
            .O_channel_alarm                    ( S_channel_alarm  [160*14-1:160*10]   ),
            //with cpri                                                
            .O_8b10b_lcv                        ( O_8b10b_lcv      [  8*14-1:  8*10]   ),
            .O_64b66b_lcv                       ( O_64b66b_lcv     [  1*14-1:  1*10]   ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel[  4*14-1:  4*10]   ),
            .I_tx_scramble_en                   ( I_tx_scramble_en [  1*14-1:  1*10]   ),
            .I_rx_scramble_en                   ( I_rx_scramble_en [  1*14-1:  1*10]   )
            );                                                                    
`endif




`ifdef NO_SERDES_QUAD1
            assign  S_qpll_state     [ 64* 2-1: 64* 1]  =  64'd0 ;
            assign  O_gttxn          [  1*18-1:  1*14]  =   4'd0 ;
            assign  O_gttxp          [  1*18-1:  1*14]  =   4'd0 ;
            assign  O_txoutclk       [  1*18-1:  1*14]  =   4'd0 ;
            assign  O_txoutrst       [  1*18-1:  1*14]  =   4'd0 ;
            assign  O_rxctrl         [  8*18-1:  8*14]  =  32'd0 ;
            assign  O_rxdata         [ 64*18-1: 64*14]  = 256'd0 ;
            assign  O_rxoutclk       [  1*18-1:  1*14]  =   4'd0 ;
            assign  O_rxoutrst       [  1*18-1:  1*14]  =   4'd0 ;
            assign  S_channel_state  [160*18-1:160*14]  = 640'd0 ;
            assign  S_channel_alarm  [160*18-1:160*14]  = 640'd0 ;
            assign  O_8b10b_lcv      [  8*18-1:  8*14]  =  32'd0 ;
            assign  O_64b66b_lcv     [  1*18-1:  1*14]  =   4'd0 ;
            assign  O_serdes_rate_sel[  4*18-1:  4*14]  =  16'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_12"                           ),//
            .C_CHANNEL_NUM                      ( 4                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ),//1bit对应一个通道，0-cpri，1-tdm
            .C_CHANNEL_TXRX_SHARE_CLK           ( 4'b1111                              ) //1'd0-NO SHARE CLK;  1'd1-SHARE CLK
            )                                                                          
            serdes_quad_top1                                                                    
            (                                                                          
            //QPLL0/1 system CLK                                                          
            .I_system_clk                       ( I_system_clk                         ),
            .I_system_rst                       ( I_system_rst                         ),
            //QPLL0 refclk                                                             
            .I_gtnorthrefclk00                  ( I_gtnorthrefclk00[  1            ]   ),
            .I_gtnorthrefclk10                  ( I_gtnorthrefclk10[  1            ]   ),
            .I_gtrefclk00                       ( I_gtrefclk00     [  1            ]   ),
            .I_gtrefclk10                       ( I_gtrefclk10     [  1            ]   ),
            .I_gtsouthrefclk00                  ( I_gtsouthrefclk00[  1            ]   ),
            .I_gtsouthrefclk10                  ( I_gtsouthrefclk10[  1            ]   ),
            //QPLL1 refclk                                                             
            .I_gtnorthrefclk01                  ( I_gtnorthrefclk01[  1            ]   ),
            .I_gtnorthrefclk11                  ( I_gtnorthrefclk11[  1            ]   ),
            .I_gtrefclk01                       ( I_gtrefclk01     [  1            ]   ),
            .I_gtrefclk11                       ( I_gtrefclk11     [  1            ]   ),
            .I_gtsouthrefclk01                  ( I_gtsouthrefclk01[  1            ]   ),
            .I_gtsouthrefclk11                  ( I_gtsouthrefclk11[  1            ]   ),
            //QPLL0/1 cpu interface                                                
            .I_qpll_config                      ( S_qpll_config    [ 64* 2-1: 64* 1]   ),
            .O_qpll_state                       ( S_qpll_state     [ 64* 2-1: 64* 1]   ),
                                                                                    
            //channel cpll refclk                                                   
            .I_gtnorthrefclk0                   ( I_gtnorthrefclk0 [  1* 8-1:  1* 4]   ),
            .I_gtnorthrefclk1                   ( I_gtnorthrefclk1 [  1* 8-1:  1* 4]   ),
            .I_gtrefclk0                        ( I_gtrefclk0      [  1* 8-1:  1* 4]   ),
            .I_gtrefclk1                        ( I_gtrefclk1      [  1* 8-1:  1* 4]   ),
            .I_gtsouthrefclk0                   ( I_gtsouthrefclk0 [  1* 8-1:  1* 4]   ),
            .I_gtsouthrefclk1                   ( I_gtsouthrefclk1 [  1* 8-1:  1* 4]   ),
            //channel tx                                                 
            .I_txctrl                           ( I_txctrl         [  8*18-1:  8*14]   ),
            .I_txdata                           ( I_txdata         [ 64*18-1: 64*14]   ),
            .O_gttxn                            ( O_gttxn          [  1*18-1:  1*14]   ),
            .O_gttxp                            ( O_gttxp          [  1*18-1:  1*14]   ),
            .O_txoutclk                         ( O_txoutclk       [  1*18-1:  1*14]   ),
            .O_txoutrst                         ( O_txoutrst       [  1*18-1:  1*14]   ),
            //channel rx                                                 
            .I_gtrxn                            ( I_gtrxn          [  1*18-1:  1*14]   ),
            .I_gtrxp                            ( I_gtrxp          [  1*18-1:  1*14]   ),
            .O_rxctrl                           ( O_rxctrl         [  8*18-1:  8*14]   ),
            .O_rxdata                           ( O_rxdata         [ 64*18-1: 64*14]   ),
            .O_rxoutclk                         ( O_rxoutclk       [  1*18-1:  1*14]   ),
            .O_rxoutrst                         ( O_rxoutrst       [  1*18-1:  1*14]   ),
            //channel cpu interface                                      
            .I_channel_config                   ( S_channel_config [160*18-1:160*14]   ),
            .O_channel_state                    ( S_channel_state  [160*18-1:160*14]   ),
            .O_channel_alarm                    ( S_channel_alarm  [160*18-1:160*14]   ),
            //with cpri                                                
            .O_8b10b_lcv                        ( O_8b10b_lcv      [  8*18-1:  8*14]   ),
            .O_64b66b_lcv                       ( O_64b66b_lcv     [  1*18-1:  1*14]   ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel[  4*18-1:  4*14]   ),
            .I_tx_scramble_en                   ( I_tx_scramble_en [  1*18-1:  1*14]   ),
            .I_rx_scramble_en                   ( I_rx_scramble_en [  1*18-1:  1*14]   )
            );
`endif





`ifdef NO_SERDES_QUAD2
            assign  S_qpll_state     [ 64* 3-1: 64* 2]  =  64'd0 ;
            assign  {O_gttxn          [  1* 2-1:  1* 0],O_gttxn          [  1*20-1:  1*18]}  =   4'd0 ;
            assign  {O_gttxp          [  1* 2-1:  1* 0],O_gttxp          [  1*20-1:  1*18]}  =   4'd0 ;
            assign  {O_txoutclk       [  1* 2-1:  1* 0],O_txoutclk       [  1*20-1:  1*18]}  =   4'd0 ;
            assign  {O_txoutrst       [  1* 2-1:  1* 0],O_txoutrst       [  1*20-1:  1*18]}  =   4'd0 ;
            assign  {O_rxctrl         [  8* 2-1:  8* 0],O_rxctrl         [  8*20-1:  8*18]}  =  32'd0 ;
            assign  {O_rxdata         [ 64* 2-1: 64* 0],O_rxdata         [ 64*20-1: 64*18]}  = 256'd0 ;
            assign  {O_rxoutclk       [  1* 2-1:  1* 0],O_rxoutclk       [  1*20-1:  1*18]}  =   4'd0 ;
            assign  {O_rxoutrst       [  1* 2-1:  1* 0],O_rxoutrst       [  1*20-1:  1*18]}  =   4'd0 ;
            assign  {S_channel_state  [160* 2-1:160* 0],S_channel_state  [160*20-1:160*18]}  = 640'd0 ;
            assign  {S_channel_alarm  [160* 2-1:160* 0],S_channel_alarm  [160*20-1:160*18]}  = 640'd0 ;
            assign  {O_8b10b_lcv      [  8* 2-1:  8* 0],O_8b10b_lcv      [  8*20-1:  8*18]}  =  32'd0 ;
            assign  {O_64b66b_lcv     [  1* 2-1:  1* 0],O_64b66b_lcv     [  1*20-1:  1*18]}  =   4'd0 ;
            assign  {O_serdes_rate_sel[  4* 2-1:  4* 0],O_serdes_rate_sel[  4*20-1:  4*18]}  =  16'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_12"                           ),//
            .C_CHANNEL_NUM                      ( 4                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ),//1bit对应一个通道，0-cpri，1-tdm
            .C_CHANNEL_TXRX_SHARE_CLK           ( 4'b1111                              ) //1'd0-NO SHARE CLK;  1'd1-SHARE CLK
            )                                                                          
            serdes_quad_top2                                                                    
            (                                                                          
            //QPLL0/1 system CLK                                                          
            .I_system_clk                       ( I_system_clk                         ),
            .I_system_rst                       ( I_system_rst                         ),
            //QPLL0 refclk                                                             
            .I_gtnorthrefclk00                  ( I_gtnorthrefclk00[  2            ]   ),
            .I_gtnorthrefclk10                  ( I_gtnorthrefclk10[  2            ]   ),
            .I_gtrefclk00                       ( I_gtrefclk00     [  2            ]   ),
            .I_gtrefclk10                       ( I_gtrefclk10     [  2            ]   ),
            .I_gtsouthrefclk00                  ( I_gtsouthrefclk00[  2            ]   ),
            .I_gtsouthrefclk10                  ( I_gtsouthrefclk10[  2            ]   ),
            //QPLL1 refclk                                                             
            .I_gtnorthrefclk01                  ( I_gtnorthrefclk01[  2            ]   ),
            .I_gtnorthrefclk11                  ( I_gtnorthrefclk11[  2            ]   ),
            .I_gtrefclk01                       ( I_gtrefclk01     [  2            ]   ),
            .I_gtrefclk11                       ( I_gtrefclk11     [  2            ]   ),
            .I_gtsouthrefclk01                  ( I_gtsouthrefclk01[  2            ]   ),
            .I_gtsouthrefclk11                  ( I_gtsouthrefclk11[  2            ]   ),
            //QPLL0/1 cpu interface                                                
            .I_qpll_config                      ( S_qpll_config    [ 64* 3-1: 64* 2]   ),
            .O_qpll_state                       ( S_qpll_state     [ 64* 3-1: 64* 2]   ),
                                                                                    
            //channel cpll refclk                                                   
            .I_gtnorthrefclk0                   ( I_gtnorthrefclk0 [  1*12-1:  1* 8]   ),
            .I_gtnorthrefclk1                   ( I_gtnorthrefclk1 [  1*12-1:  1* 8]   ),
            .I_gtrefclk0                        ( I_gtrefclk0      [  1*12-1:  1* 8]   ),
            .I_gtrefclk1                        ( I_gtrefclk1      [  1*12-1:  1* 8]   ),
            .I_gtsouthrefclk0                   ( I_gtsouthrefclk0 [  1*12-1:  1* 8]   ),
            .I_gtsouthrefclk1                   ( I_gtsouthrefclk1 [  1*12-1:  1* 8]   ),
            //channel tx                                               
            .I_txctrl                           ( {I_txctrl         [  8* 2-1:  8* 0],I_txctrl         [  8*20-1:  8*18]}   ),
            .I_txdata                           ( {I_txdata         [ 64* 2-1: 64* 0],I_txdata         [ 64*20-1: 64*18]}   ),
            .O_gttxn                            ( {O_gttxn          [  1* 2-1:  1* 0],O_gttxn          [  1*20-1:  1*18]}   ),
            .O_gttxp                            ( {O_gttxp          [  1* 2-1:  1* 0],O_gttxp          [  1*20-1:  1*18]}   ),
            .O_txoutclk                         ( {O_txoutclk       [  1* 2-1:  1* 0],O_txoutclk       [  1*20-1:  1*18]}   ),
            .O_txoutrst                         ( {O_txoutrst       [  1* 2-1:  1* 0],O_txoutrst       [  1*20-1:  1*18]}   ),
            //channel rx                                                 
            .I_gtrxn                            ( {I_gtrxn          [  1* 2-1:  1* 0],I_gtrxn          [  1*20-1:  1*18]}   ),
            .I_gtrxp                            ( {I_gtrxp          [  1* 2-1:  1* 0],I_gtrxp          [  1*20-1:  1*18]}   ),
            .O_rxctrl                           ( {O_rxctrl         [  8* 2-1:  8* 0],O_rxctrl         [  8*20-1:  8*18]}   ),
            .O_rxdata                           ( {O_rxdata         [ 64* 2-1: 64* 0],O_rxdata         [ 64*20-1: 64*18]}   ),
            .O_rxoutclk                         ( {O_rxoutclk       [  1* 2-1:  1* 0],O_rxoutclk       [  1*20-1:  1*18]}   ),
            .O_rxoutrst                         ( {O_rxoutrst       [  1* 2-1:  1* 0],O_rxoutrst       [  1*20-1:  1*18]}   ),
            //channel cpu interface                                
            .I_channel_config                   ( {S_channel_config [160* 2-1:160* 0],S_channel_config [160*20-1:160*18]}   ),
            .O_channel_state                    ( {S_channel_state  [160* 2-1:160* 0],S_channel_state  [160*20-1:160*18]}   ),
            .O_channel_alarm                    ( {S_channel_alarm  [160* 2-1:160* 0],S_channel_alarm  [160*20-1:160*18]}   ),
            //with cpri                                              
            .O_8b10b_lcv                        ( {O_8b10b_lcv      [  8* 2-1:  8* 0],O_8b10b_lcv      [  8*20-1:  8*18]}   ),
            .O_64b66b_lcv                       ( {O_64b66b_lcv     [  1* 2-1:  1* 0],O_64b66b_lcv     [  1*20-1:  1*18]}   ),
            .O_serdes_rate_sel                  ( {O_serdes_rate_sel[  4* 2-1:  4* 0],O_serdes_rate_sel[  4*20-1:  4*18]}   ),
            .I_tx_scramble_en                   ( {I_tx_scramble_en [  1* 2-1:  1* 0],I_tx_scramble_en [  1*20-1:  1*18]}   ),
            .I_rx_scramble_en                   ( {I_rx_scramble_en [  1* 2-1:  1* 0],I_rx_scramble_en [  1*20-1:  1*18]}   )
            );
`endif






`ifdef NO_SERDES_QUAD3
            assign  S_qpll_state     [ 64* 4-1: 64* 3]  =  64'd0 ;
            assign  O_gttxn          [  1* 6-1:  1* 2]  =   4'd0 ;
            assign  O_gttxp          [  1* 6-1:  1* 2]  =   4'd0 ;
            assign  O_txoutclk       [  1* 6-1:  1* 2]  =   4'd0 ;
            assign  O_txoutrst       [  1* 6-1:  1* 2]  =   4'd0 ;
            assign  O_rxctrl         [  8* 6-1:  8* 2]  =  32'd0 ;
            assign  O_rxdata         [ 64* 6-1: 64* 2]  = 256'd0 ;
            assign  O_rxoutclk       [  1* 6-1:  1* 2]  =   4'd0 ;
            assign  O_rxoutrst       [  1* 6-1:  1* 2]  =   4'd0 ;
            assign  S_channel_state  [160* 6-1:160* 2]  = 640'd0 ;
            assign  S_channel_alarm  [160* 6-1:160* 2]  = 640'd0 ;
            assign  O_8b10b_lcv      [  8* 6-1:  8* 2]  =  32'd0 ;
            assign  O_64b66b_lcv     [  1* 6-1:  1* 2]  =   4'd0 ;
            assign  O_serdes_rate_sel[  4* 6-1:  4* 2]  =  16'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_12"                           ),//
            .C_CHANNEL_NUM                      ( 4                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ),//1bit对应一个通道，0-cpri，1-tdm
            .C_CHANNEL_TXRX_SHARE_CLK           ( 4'b1111                              ) //1'd0-NO SHARE CLK;  1'd1-SHARE CLK
            )                                                                          
            serdes_quad_top3                                                                    
            (                                                                          
            //QPLL0/1 system CLK                                                          
            .I_system_clk                       ( I_system_clk                         ),
            .I_system_rst                       ( I_system_rst                         ),
            //QPLL0 refclk                                                             
            .I_gtnorthrefclk00                  ( I_gtnorthrefclk00[  3            ]   ),
            .I_gtnorthrefclk10                  ( I_gtnorthrefclk10[  3            ]   ),
            .I_gtrefclk00                       ( I_gtrefclk00     [  3            ]   ),
            .I_gtrefclk10                       ( I_gtrefclk10     [  3            ]   ),
            .I_gtsouthrefclk00                  ( I_gtsouthrefclk00[  3            ]   ),
            .I_gtsouthrefclk10                  ( I_gtsouthrefclk10[  3            ]   ),
            //QPLL1 refclk                                                             
            .I_gtnorthrefclk01                  ( I_gtnorthrefclk01[  3            ]   ),
            .I_gtnorthrefclk11                  ( I_gtnorthrefclk11[  3            ]   ),
            .I_gtrefclk01                       ( I_gtrefclk01     [  3            ]   ),
            .I_gtrefclk11                       ( I_gtrefclk11     [  3            ]   ),
            .I_gtsouthrefclk01                  ( I_gtsouthrefclk01[  3            ]   ),
            .I_gtsouthrefclk11                  ( I_gtsouthrefclk11[  3            ]   ),
            //QPLL0/1 cpu interface                                                
            .I_qpll_config                      ( S_qpll_config    [ 64* 4-1: 64* 3]   ),
            .O_qpll_state                       ( S_qpll_state     [ 64* 4-1: 64* 3]   ),
                                                                                    
            //channel cpll refclk                                                   
            .I_gtnorthrefclk0                   ( I_gtnorthrefclk0 [  1*16-1:  1*12]   ),
            .I_gtnorthrefclk1                   ( I_gtnorthrefclk1 [  1*16-1:  1*12]   ),
            .I_gtrefclk0                        ( I_gtrefclk0      [  1*16-1:  1*12]   ),
            .I_gtrefclk1                        ( I_gtrefclk1      [  1*16-1:  1*12]   ),
            .I_gtsouthrefclk0                   ( I_gtsouthrefclk0 [  1*16-1:  1*12]   ),
            .I_gtsouthrefclk1                   ( I_gtsouthrefclk1 [  1*16-1:  1*12]   ),
            //channel tx                                                            
            .I_txctrl                           ( I_txctrl         [  8* 6-1:  8* 2]   ),
            .I_txdata                           ( I_txdata         [ 64* 6-1: 64* 2]   ),
            .O_gttxn                            ( O_gttxn          [  1* 6-1:  1* 2]   ),
            .O_gttxp                            ( O_gttxp          [  1* 6-1:  1* 2]   ),
            .O_txoutclk                         ( O_txoutclk       [  1* 6-1:  1* 2]   ),
            .O_txoutrst                         ( O_txoutrst       [  1* 6-1:  1* 2]   ),
            //channel rx                                                           
            .I_gtrxn                            ( I_gtrxn          [  1* 6-1:  1* 2]   ),
            .I_gtrxp                            ( I_gtrxp          [  1* 6-1:  1* 2]   ),
            .O_rxctrl                           ( O_rxctrl         [  8* 6-1:  8* 2]   ),
            .O_rxdata                           ( O_rxdata         [ 64* 6-1: 64* 2]   ),
            .O_rxoutclk                         ( O_rxoutclk       [  1* 6-1:  1* 2]   ),
            .O_rxoutrst                         ( O_rxoutrst       [  1* 6-1:  1* 2]   ),
            //channel cpu interface                                                
            .I_channel_config                   ( S_channel_config [160* 6-1:160* 2]   ),
            .O_channel_state                    ( S_channel_state  [160* 6-1:160* 2]   ),
            .O_channel_alarm                    ( S_channel_alarm  [160* 6-1:160* 2]   ),
            //with cpri                                                           
            .O_8b10b_lcv                        ( O_8b10b_lcv      [  8* 6-1:  8* 2]   ),
            .O_64b66b_lcv                       ( O_64b66b_lcv     [  1* 6-1:  1* 2]   ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel[  4* 6-1:  4* 2]   ),
            .I_tx_scramble_en                   ( I_tx_scramble_en [  1* 6-1:  1* 2]   ),
            .I_rx_scramble_en                   ( I_rx_scramble_en [  1* 6-1:  1* 2]   )
            );
`endif







`ifdef NO_SERDES_QUAD4
            assign  S_qpll_state     [ 64* 5-1: 64* 4]  =  64'd0 ;
            assign  O_gttxn          [  1*10-1:  1* 6]  =   4'd0 ;
            assign  O_gttxp          [  1*10-1:  1* 6]  =   4'd0 ;
            assign  O_txoutclk       [  1*10-1:  1* 6]  =   4'd0 ;
            assign  O_txoutrst       [  1*10-1:  1* 6]  =   4'd0 ;
            assign  O_rxctrl         [  8*10-1:  8* 6]  =  32'd0 ;
            assign  O_rxdata         [ 64*10-1: 64* 6]  = 256'd0 ;
            assign  O_rxoutclk       [  1*10-1:  1* 6]  =   4'd0 ;
            assign  O_rxoutrst       [  1*10-1:  1* 6]  =   4'd0 ;
            assign  S_channel_state  [160*10-1:160* 6]  = 640'd0 ;
            assign  S_channel_alarm  [160*10-1:160* 6]  = 640'd0 ;
            assign  O_8b10b_lcv      [  8*10-1:  8* 6]  =  32'd0 ;
            assign  O_64b66b_lcv     [  1*10-1:  1* 6]  =   4'd0 ;
            assign  O_serdes_rate_sel[  4*10-1:  4* 6]  =  16'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_12"                           ),//
            .C_CHANNEL_NUM                      ( 4                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ),//1bit对应一个通道，0-cpri，1-tdm
            .C_CHANNEL_TXRX_SHARE_CLK           ( 4'b1111                              ) //1'd0-NO SHARE CLK;  1'd1-SHARE CLK
            )                                                                          
            serdes_quad_top4                                                                    
            (                                                                          
            //QPLL0/1 system CLK                                                          
            .I_system_clk                       ( I_system_clk                         ),
            .I_system_rst                       ( I_system_rst                         ),
            //QPLL0 refclk                                                             
            .I_gtnorthrefclk00                  ( I_gtnorthrefclk00[  4            ]   ),
            .I_gtnorthrefclk10                  ( I_gtnorthrefclk10[  4            ]   ),
            .I_gtrefclk00                       ( I_gtrefclk00     [  4            ]   ),
            .I_gtrefclk10                       ( I_gtrefclk10     [  4            ]   ),
            .I_gtsouthrefclk00                  ( I_gtsouthrefclk00[  4            ]   ),
            .I_gtsouthrefclk10                  ( I_gtsouthrefclk10[  4            ]   ),
            //QPLL1 refclk                                                             
            .I_gtnorthrefclk01                  ( I_gtnorthrefclk01[  4            ]   ),
            .I_gtnorthrefclk11                  ( I_gtnorthrefclk11[  4            ]   ),
            .I_gtrefclk01                       ( I_gtrefclk01     [  4            ]   ),
            .I_gtrefclk11                       ( I_gtrefclk11     [  4            ]   ),
            .I_gtsouthrefclk01                  ( I_gtsouthrefclk01[  4            ]   ),
            .I_gtsouthrefclk11                  ( I_gtsouthrefclk11[  4            ]   ),
            //QPLL0/1 cpu interface                                                
            .I_qpll_config                      ( S_qpll_config    [ 64* 5-1: 64* 4]   ),
            .O_qpll_state                       ( S_qpll_state     [ 64* 5-1: 64* 4]   ),
                                                                                    
            //channel cpll refclk                                                   
            .I_gtnorthrefclk0                   ( I_gtnorthrefclk0 [  1*20-1:  1*16]   ),
            .I_gtnorthrefclk1                   ( I_gtnorthrefclk1 [  1*20-1:  1*16]   ),
            .I_gtrefclk0                        ( I_gtrefclk0      [  1*20-1:  1*16]   ),
            .I_gtrefclk1                        ( I_gtrefclk1      [  1*20-1:  1*16]   ),
            .I_gtsouthrefclk0                   ( I_gtsouthrefclk0 [  1*20-1:  1*16]   ),
            .I_gtsouthrefclk1                   ( I_gtsouthrefclk1 [  1*20-1:  1*16]   ),
            //channel tx                                                            
            .I_txctrl                           ( I_txctrl         [  8*10-1:  8* 6]   ),
            .I_txdata                           ( I_txdata         [ 64*10-1: 64* 6]   ),
            .O_gttxn                            ( O_gttxn          [  1*10-1:  1* 6]   ),
            .O_gttxp                            ( O_gttxp          [  1*10-1:  1* 6]   ),
            .O_txoutclk                         ( O_txoutclk       [  1*10-1:  1* 6]   ),
            .O_txoutrst                         ( O_txoutrst       [  1*10-1:  1* 6]   ),
            //channel rx                                                           
            .I_gtrxn                            ( I_gtrxn          [  1*10-1:  1* 6]   ),
            .I_gtrxp                            ( I_gtrxp          [  1*10-1:  1* 6]   ),
            .O_rxctrl                           ( O_rxctrl         [  8*10-1:  8* 6]   ),
            .O_rxdata                           ( O_rxdata         [ 64*10-1: 64* 6]   ),
            .O_rxoutclk                         ( O_rxoutclk       [  1*10-1:  1* 6]   ),
            .O_rxoutrst                         ( O_rxoutrst       [  1*10-1:  1* 6]   ),
            //channel cpu interface                                                
            .I_channel_config                   ( S_channel_config [160*10-1:160* 6]   ),
            .O_channel_state                    ( S_channel_state  [160*10-1:160* 6]   ),
            .O_channel_alarm                    ( S_channel_alarm  [160*10-1:160* 6]   ),
            //with cpri                                                           
            .O_8b10b_lcv                        ( O_8b10b_lcv      [  8*10-1:  8* 6]   ),
            .O_64b66b_lcv                       ( O_64b66b_lcv     [  1*10-1:  1* 6]   ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel[  4*10-1:  4* 6]   ),
            .I_tx_scramble_en                   ( I_tx_scramble_en [  1*10-1:  1* 6]   ),
            .I_rx_scramble_en                   ( I_rx_scramble_en [  1*10-1:  1* 6]   )
            );
`endif





`ifdef NO_SERDES_QUAD5
            assign  S_qpll_state     [ 64* 6-1: 64* 5]  =  64'd0 ;
            assign  O_gttxn          [  1*24-1:  1*20]  =   4'd0 ;
            assign  O_gttxp          [  1*24-1:  1*20]  =   4'd0 ;
            assign  O_txoutclk       [  1*24-1:  1*20]  =   4'd0 ;
            assign  O_txoutrst       [  1*24-1:  1*20]  =   4'd0 ;
            assign  O_rxctrl         [  8*24-1:  8*20]  =  32'd0 ;
            assign  O_rxdata         [ 64*24-1: 64*20]  = 256'd0 ;
            assign  O_rxoutclk       [  1*24-1:  1*20]  =   4'd0 ;
            assign  O_rxoutrst       [  1*24-1:  1*20]  =   4'd0 ;
            assign  S_channel_state  [160*24-1:160*20]  = 640'd0 ;
            assign  S_channel_alarm  [160*24-1:160*20]  = 640'd0 ;
            assign  O_8b10b_lcv      [  8*24-1:  8*20]  =  32'd0 ;
            assign  O_64b66b_lcv     [  1*24-1:  1*20]  =   4'd0 ;
            assign  O_serdes_rate_sel[  4*24-1:  4*20]  =  16'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_12"                           ),//
            .C_CHANNEL_NUM                      ( 4                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ),//1bit对应一个通道，0-cpri，1-tdm
            .C_CHANNEL_TXRX_SHARE_CLK           ( 4'b1111                              ) //1'd0-NO SHARE CLK;  1'd1-SHARE CLK
            )                                                                          
            serdes_quad_top5                                                                    
            (                                                                          
            //QPLL0/1 system CLK                                                          
            .I_system_clk                       ( I_system_clk                         ),
            .I_system_rst                       ( I_system_rst                         ),
            //QPLL0 refclk                                                             
            .I_gtnorthrefclk00                  ( I_gtnorthrefclk00[  5            ]   ),
            .I_gtnorthrefclk10                  ( I_gtnorthrefclk10[  5            ]   ),
            .I_gtrefclk00                       ( I_gtrefclk00     [  5            ]   ),
            .I_gtrefclk10                       ( I_gtrefclk10     [  5            ]   ),
            .I_gtsouthrefclk00                  ( I_gtsouthrefclk00[  5            ]   ),
            .I_gtsouthrefclk10                  ( I_gtsouthrefclk10[  5            ]   ),
            //QPLL1 refclk                                                             
            .I_gtnorthrefclk01                  ( I_gtnorthrefclk01[  5            ]   ),
            .I_gtnorthrefclk11                  ( I_gtnorthrefclk11[  5            ]   ),
            .I_gtrefclk01                       ( I_gtrefclk01     [  5            ]   ),
            .I_gtrefclk11                       ( I_gtrefclk11     [  5            ]   ),
            .I_gtsouthrefclk01                  ( I_gtsouthrefclk01[  5            ]   ),
            .I_gtsouthrefclk11                  ( I_gtsouthrefclk11[  5            ]   ),
            //QPLL0/1 cpu interface                                                
            .I_qpll_config                      ( S_qpll_config    [ 64* 6-1: 64* 5]   ),
            .O_qpll_state                       ( S_qpll_state     [ 64* 6-1: 64* 5]   ),
                                                                                    
            //channel cpll refclk                                                   
            .I_gtnorthrefclk0                   ( I_gtnorthrefclk0 [  1*24-1:  1*20]   ),
            .I_gtnorthrefclk1                   ( I_gtnorthrefclk1 [  1*24-1:  1*20]   ),
            .I_gtrefclk0                        ( I_gtrefclk0      [  1*24-1:  1*20]   ),
            .I_gtrefclk1                        ( I_gtrefclk1      [  1*24-1:  1*20]   ),
            .I_gtsouthrefclk0                   ( I_gtsouthrefclk0 [  1*24-1:  1*20]   ),
            .I_gtsouthrefclk1                   ( I_gtsouthrefclk1 [  1*24-1:  1*20]   ),
            //channel tx                                                            
            .I_txctrl                           ( I_txctrl         [  8*24-1:  8*20]   ),
            .I_txdata                           ( I_txdata         [ 64*24-1: 64*20]   ),
            .O_gttxn                            ( O_gttxn          [  1*24-1:  1*20]   ),
            .O_gttxp                            ( O_gttxp          [  1*24-1:  1*20]   ),
            .O_txoutclk                         ( O_txoutclk       [  1*24-1:  1*20]   ),
            .O_txoutrst                         ( O_txoutrst       [  1*24-1:  1*20]   ),
            //channel rx                                                           
            .I_gtrxn                            ( I_gtrxn          [  1*24-1:  1*20]   ),
            .I_gtrxp                            ( I_gtrxp          [  1*24-1:  1*20]   ),
            .O_rxctrl                           ( O_rxctrl         [  8*24-1:  8*20]   ),
            .O_rxdata                           ( O_rxdata         [ 64*24-1: 64*20]   ),
            .O_rxoutclk                         ( O_rxoutclk       [  1*24-1:  1*20]   ),
            .O_rxoutrst                         ( O_rxoutrst       [  1*24-1:  1*20]   ),
            //channel cpu interface                                                
            .I_channel_config                   ( S_channel_config [160*24-1:160*20]   ),
            .O_channel_state                    ( S_channel_state  [160*24-1:160*20]   ),
            .O_channel_alarm                    ( S_channel_alarm  [160*24-1:160*20]   ),
            //with cpri
            .O_8b10b_lcv                        ( O_8b10b_lcv      [  8*24-1:  8*20]   ),
            .O_64b66b_lcv                       ( O_64b66b_lcv     [  1*24-1:  1*20]   ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel[  4*24-1:  4*20]   ),
            .I_tx_scramble_en                   ( I_tx_scramble_en [  1*24-1:  1*20]   ),
            .I_rx_scramble_en                   ( I_rx_scramble_en [  1*24-1:  1*20]   )
            );
`endif











endmodule
    
