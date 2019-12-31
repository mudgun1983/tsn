//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_top0.v
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


module serdes_top0 
#(  
parameter    C_BASE_ADDR       = 16'h1000
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
input  wire  [     3-1:0]      I_gtnorthrefclk00                  ,//
input  wire  [     3-1:0]      I_gtnorthrefclk10                  ,//
input  wire  [     3-1:0]      I_gtrefclk00                       ,//
input  wire  [     3-1:0]      I_gtrefclk10                       ,//
input  wire  [     3-1:0]      I_gtsouthrefclk00                  ,//
input  wire  [     3-1:0]      I_gtsouthrefclk10                  ,//
//QPLL1 refclk                           
input  wire  [     3-1:0]      I_gtnorthrefclk01                  ,//  
input  wire  [     3-1:0]      I_gtnorthrefclk11                  ,//
input  wire  [     3-1:0]      I_gtrefclk01                       ,//
input  wire  [     3-1:0]      I_gtrefclk11                       ,//
input  wire  [     3-1:0]      I_gtsouthrefclk01                  ,//
input  wire  [     3-1:0]      I_gtsouthrefclk11                  ,// 
//channel cpll refclk               
input  wire  [    10-1:0]      I_gtnorthrefclk0                   ,//   
input  wire  [    10-1:0]      I_gtnorthrefclk1                   ,//   
input  wire  [    10-1:0]      I_gtrefclk0                        ,//     
input  wire  [    10-1:0]      I_gtrefclk1                        ,//   
input  wire  [    10-1:0]      I_gtsouthrefclk0                   ,//   
input  wire  [    10-1:0]      I_gtsouthrefclk1                   ,//   
//channel tx                                                                           
input  wire  [  8*10-1:0]      I_txctrl                           ,//   
input  wire  [ 64*10-1:0]      I_txdata                           ,//   
output wire  [    10-1:0]      O_gttxn                            ,//   
output wire  [    10-1:0]      O_gttxp                            ,//   
output wire  [    10-1:0]      O_txoutclk                         ,//   
output wire  [    10-1:0]      O_txoutrst                         ,//   
//channel rx                                                                           
input  wire  [    10-1:0]      I_gtrxn                            ,//   
input  wire  [    10-1:0]      I_gtrxp                            ,//   
output wire  [  8*10-1:0]      O_rxctrl                           ,//       
output wire  [ 64*10-1:0]      O_rxdata                           ,//   
output wire  [    10-1:0]      O_rxoutclk                         ,//
output wire  [    10-1:0]      O_rxoutrst                         ,//
//with cpri
output wire  [  8*10-1:0]      O_8b10b_lcv                        ,//   
output wire  [    10-1:0]      O_64b66b_lcv                       ,//
output wire  [  4*10-1:0]      O_serdes_rate_sel                  ,//
input  wire  [    10-1:0]      I_tx_scramble_en                   ,//
input  wire  [    10-1:0]      I_rx_scramble_en                    //
);

         
// ---------------------------------------------------------------------------------------------------------
// inter wire
// ---------------------------------------------------------------------------------------------------------
wire   [ 64* 3-1:0]            S_qpll_config                      ;//
wire   [ 64* 3-1:0]            S_qpll_state                       ;//
    
wire   [160*10-1:0]            S_channel_config                   ;//    
wire   [160*10-1:0]            S_channel_state                    ;//    
wire   [160*10-1:0]            S_channel_alarm                    ;//    
   

// ---------------------------------------------------------------------------------------------------------
// inter reg
// ---------------------------------------------------------------------------------------------------------



// ***********************************************************main Verilog code********************************************************//



serdes_cpu_interface0 #                                                     
            (                                                                           
            .C_BASE_ADDR                        ( C_BASE_ADDR                          )
            )                                                                          
            serdes_cpu_interface0                                                       
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
            assign  O_gttxn          [  1* 4-1:  1* 0]  =   4'd0 ;
            assign  O_gttxp          [  1* 4-1:  1* 0]  =   4'd0 ;
            assign  O_txoutclk       [  1* 4-1:  1* 0]  =   4'd0 ;
            assign  O_txoutrst       [  1* 4-1:  1* 0]  =   4'd0 ;
            assign  O_rxctrl         [  8* 4-1:  8* 0]  =  32'd0 ;
            assign  O_rxdata         [ 64* 4-1: 64* 0]  = 256'd0 ;
            assign  O_rxoutclk       [  1* 4-1:  1* 0]  =   4'd0 ;
            assign  O_rxoutrst       [  1* 4-1:  1* 0]  =   4'd0 ;
            assign  S_channel_state  [160* 4-1:160* 0]  = 640'd0 ;
            assign  S_channel_alarm  [160* 4-1:160* 0]  = 640'd0 ;
            assign  O_8b10b_lcv      [  8* 4-1:  8* 0]  =  32'd0 ;
            assign  O_64b66b_lcv     [  1* 4-1:  1* 0]  =   4'd0 ;
            assign  O_serdes_rate_sel[  4* 4-1:  4* 0]  =  16'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_25"                           ),//
            .C_CHANNEL_NUM                      ( 4                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ) //1bit对应一个通道，0-cpri，1-tdm
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
            .I_txctrl                           ( I_txctrl         [  8* 4-1:  8* 0]   ),
            .I_txdata                           ( I_txdata         [ 64* 4-1: 64* 0]   ),
            .O_gttxn                            ( O_gttxn          [  1* 4-1:  1* 0]   ),
            .O_gttxp                            ( O_gttxp          [  1* 4-1:  1* 0]   ),
            .O_txoutclk                         ( O_txoutclk       [  1* 4-1:  1* 0]   ),
            .O_txoutrst                         ( O_txoutrst       [  1* 4-1:  1* 0]   ),
            //channel rx                         
            .I_gtrxn                            ( I_gtrxn          [  1* 4-1:  1* 0]   ),
            .I_gtrxp                            ( I_gtrxp          [  1* 4-1:  1* 0]   ),
            .O_rxctrl                           ( O_rxctrl         [  8* 4-1:  8* 0]   ),
            .O_rxdata                           ( O_rxdata         [ 64* 4-1: 64* 0]   ),
            .O_rxoutclk                         ( O_rxoutclk       [  1* 4-1:  1* 0]   ),
            .O_rxoutrst                         ( O_rxoutrst       [  1* 4-1:  1* 0]   ),
            //channel cpu interface             
            .I_channel_config                   ( S_channel_config [160* 4-1:160* 0]   ),
            .O_channel_state                    ( S_channel_state  [160* 4-1:160* 0]   ),
            .O_channel_alarm                    ( S_channel_alarm  [160* 4-1:160* 0]   ),
            //with cpri                         
            .O_8b10b_lcv                        ( O_8b10b_lcv      [  8* 4-1:  8* 0]   ),
            .O_64b66b_lcv                       ( O_64b66b_lcv     [  1* 4-1:  1* 0]   ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel[  4* 4-1:  4* 0]   ),
            .I_tx_scramble_en                   ( I_tx_scramble_en [  1* 4-1:  1* 0]   ),
            .I_rx_scramble_en                   ( I_rx_scramble_en [  1* 4-1:  1* 0]   )
            );                                                                    
`endif




`ifdef NO_SERDES_QUAD1
            assign  S_qpll_state     [ 64* 2-1: 64* 1]  =  64'd0 ;
            assign  O_gttxn          [  1* 8-1:  1* 4]  =   4'd0 ;
            assign  O_gttxp          [  1* 8-1:  1* 4]  =   4'd0 ;
            assign  O_txoutclk       [  1* 8-1:  1* 4]  =   4'd0 ;
            assign  O_txoutrst       [  1* 8-1:  1* 4]  =   4'd0 ;
            assign  O_rxctrl         [  8* 8-1:  8* 4]  =  32'd0 ;
            assign  O_rxdata         [ 64* 8-1: 64* 4]  = 256'd0 ;
            assign  O_rxoutclk       [  1* 8-1:  1* 4]  =   4'd0 ;
            assign  O_rxoutrst       [  1* 8-1:  1* 4]  =   4'd0 ;
            assign  S_channel_state  [160* 8-1:160* 4]  = 640'd0 ;
            assign  S_channel_alarm  [160* 8-1:160* 4]  = 640'd0 ;
            assign  O_8b10b_lcv      [  8* 8-1:  8* 4]  =  32'd0 ;
            assign  O_64b66b_lcv     [  1* 8-1:  1* 4]  =   4'd0 ;
            assign  O_serdes_rate_sel[  4* 8-1:  4* 4]  =  16'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_25"                           ),//
            .C_CHANNEL_NUM                      ( 4                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ) //1bit对应一个通道，0-cpri，1-tdm
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
            .I_txctrl                           ( I_txctrl         [  8* 8-1:  8* 4]   ),
            .I_txdata                           ( I_txdata         [ 64* 8-1: 64* 4]   ),
            .O_gttxn                            ( O_gttxn          [  1* 8-1:  1* 4]   ),
            .O_gttxp                            ( O_gttxp          [  1* 8-1:  1* 4]   ),
            .O_txoutclk                         ( O_txoutclk       [  1* 8-1:  1* 4]   ),
            .O_txoutrst                         ( O_txoutrst       [  1* 8-1:  1* 4]   ),
            //channel rx                                                           
            .I_gtrxn                            ( I_gtrxn          [  1* 8-1:  1* 4]   ),
            .I_gtrxp                            ( I_gtrxp          [  1* 8-1:  1* 4]   ),
            .O_rxctrl                           ( O_rxctrl         [  8* 8-1:  8* 4]   ),
            .O_rxdata                           ( O_rxdata         [ 64* 8-1: 64* 4]   ),
            .O_rxoutclk                         ( O_rxoutclk       [  1* 8-1:  1* 4]   ),
            .O_rxoutrst                         ( O_rxoutrst       [  1* 8-1:  1* 4]   ),
            //channel cpu interface                                                
            .I_channel_config                   ( S_channel_config [160* 8-1:160* 4]   ),
            .O_channel_state                    ( S_channel_state  [160* 8-1:160* 4]   ),
            .O_channel_alarm                    ( S_channel_alarm  [160* 8-1:160* 4]   ),
            //with cpri
            .O_8b10b_lcv                        ( O_8b10b_lcv      [  8* 8-1:  8* 4]   ),
            .O_64b66b_lcv                       ( O_64b66b_lcv     [  1* 8-1:  1* 4]   ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel[  4* 8-1:  4* 4]   ),
            .I_tx_scramble_en                   ( I_tx_scramble_en [  1* 8-1:  1* 4]   ),
            .I_rx_scramble_en                   ( I_rx_scramble_en [  1* 8-1:  1* 4]   )
            );
`endif





`ifdef NO_SERDES_QUAD2
            assign  S_qpll_state     [ 64* 3-1: 64* 2]  =  64'd0 ;
            assign  O_gttxn          [  1*10-1:  1* 8]  =   2'd0 ;
            assign  O_gttxp          [  1*10-1:  1* 8]  =   2'd0 ;
            assign  O_txoutclk       [  1*10-1:  1* 8]  =   2'd0 ;
            assign  O_txoutrst       [  1*10-1:  1* 8]  =   2'd0 ;
            assign  O_rxctrl         [  8*10-1:  8* 8]  =  16'd0 ;
            assign  O_rxdata         [ 64*10-1: 64* 8]  = 128'd0 ;
            assign  O_rxoutclk       [  1*10-1:  1* 8]  =   2'd0 ;
            assign  O_rxoutrst       [  1*10-1:  1* 8]  =   2'd0 ;
            assign  S_channel_state  [160*10-1:160* 8]  = 320'd0 ;
            assign  S_channel_alarm  [160*10-1:160* 8]  = 320'd0 ;
            assign  O_8b10b_lcv      [  8*10-1:  8* 8]  =  16'd0 ;
            assign  O_64b66b_lcv     [  1*10-1:  1* 8]  =   2'd0 ;
            assign  O_serdes_rate_sel[  4*10-1:  4* 8]  =   8'd0 ;
`else
serdes_quad_top #                                                     
            (                                                                           
            .C_GT_TYPE                          ( "GTYE4_25"                           ),//
            .C_CHANNEL_NUM                      ( 2                                    ),//
            .C_CHANNEL_FOR_CPRI_TDM             ( 4'b0000                              ) //1bit对应一个通道，0-cpri，1-tdm
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
            .I_gtnorthrefclk0                   ( I_gtnorthrefclk0 [  1*10-1:  1* 8]   ),
            .I_gtnorthrefclk1                   ( I_gtnorthrefclk1 [  1*10-1:  1* 8]   ),
            .I_gtrefclk0                        ( I_gtrefclk0      [  1*10-1:  1* 8]   ),
            .I_gtrefclk1                        ( I_gtrefclk1      [  1*10-1:  1* 8]   ),
            .I_gtsouthrefclk0                   ( I_gtsouthrefclk0 [  1*10-1:  1* 8]   ),
            .I_gtsouthrefclk1                   ( I_gtsouthrefclk1 [  1*10-1:  1* 8]   ),
            //channel tx                                                            
            .I_txctrl                           ( I_txctrl         [  8*10-1:  8* 8]   ),
            .I_txdata                           ( I_txdata         [ 64*10-1: 64* 8]   ),
            .O_gttxn                            ( O_gttxn          [  1*10-1:  1* 8]   ),
            .O_gttxp                            ( O_gttxp          [  1*10-1:  1* 8]   ),
            .O_txoutclk                         ( O_txoutclk       [  1*10-1:  1* 8]   ),
            .O_txoutrst                         ( O_txoutrst       [  1*10-1:  1* 8]   ),
            //channel rx                                                           
            .I_gtrxn                            ( I_gtrxn          [  1*10-1:  1* 8]   ),
            .I_gtrxp                            ( I_gtrxp          [  1*10-1:  1* 8]   ),
            .O_rxctrl                           ( O_rxctrl         [  8*10-1:  8* 8]   ),
            .O_rxdata                           ( O_rxdata         [ 64*10-1: 64* 8]   ),
            .O_rxoutclk                         ( O_rxoutclk       [  1*10-1:  1* 8]   ),
            .O_rxoutrst                         ( O_rxoutrst       [  1*10-1:  1* 8]   ),
            //channel cpu interface                                                
            .I_channel_config                   ( S_channel_config [160*10-1:160* 8]   ),
            .O_channel_state                    ( S_channel_state  [160*10-1:160* 8]   ),
            .O_channel_alarm                    ( S_channel_alarm  [160*10-1:160* 8]   ),
            //with cpri
            .O_8b10b_lcv                        ( O_8b10b_lcv      [  8*10-1:  8* 8]   ),
            .O_64b66b_lcv                       ( O_64b66b_lcv     [  1*10-1:  1* 8]   ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel[  4*10-1:  4* 8]   ),
            .I_tx_scramble_en                   ( I_tx_scramble_en [  1*10-1:  1* 8]   ),
            .I_rx_scramble_en                   ( I_rx_scramble_en [  1*10-1:  1* 8]   )
            );
`endif


endmodule
    
