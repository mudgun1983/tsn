//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_quad_top.v
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


module serdes_quad_top #
(
parameter C_GT_TYPE                   = "GTYE3"                          ,//
parameter C_CHANNEL_NUM               = 4                                ,//
parameter C_CHANNEL_FOR_CPRI_TDM      = 4'b0000                          ,//
parameter C_CHANNEL_TXRX_SHARE_CLK    = 4'b0000
)                                     
(                                     
//QPLL0/1 system  CLK                        
input  wire                           I_system_clk                       ,//        
input  wire                           I_system_rst                       ,//
//QPLL0 refclk                        
input  wire                           I_gtnorthrefclk00                  ,//
input  wire                           I_gtnorthrefclk10                  ,//
input  wire                           I_gtrefclk00                       ,//
input  wire                           I_gtrefclk10                       ,//
input  wire                           I_gtsouthrefclk00                  ,//
input  wire                           I_gtsouthrefclk10                  ,//
//QPLL1 refclk                        
input  wire                           I_gtnorthrefclk01                  ,//  
input  wire                           I_gtnorthrefclk11                  ,//
input  wire                           I_gtrefclk01                       ,//
input  wire                           I_gtrefclk11                       ,//
input  wire                           I_gtsouthrefclk01                  ,//
input  wire                           I_gtsouthrefclk11                  ,//
//QPLL0/1 cpu interface               
input  wire  [63                :0]   I_qpll_config                      ,// 
output wire  [63                :0]   O_qpll_state                       ,//                               

//channel cpll refclk                  
input  wire  [    C_CHANNEL_NUM-1:0]  I_gtnorthrefclk0                   ,//   
input  wire  [    C_CHANNEL_NUM-1:0]  I_gtnorthrefclk1                   ,//   
input  wire  [    C_CHANNEL_NUM-1:0]  I_gtrefclk0                        ,//     
input  wire  [    C_CHANNEL_NUM-1:0]  I_gtrefclk1                        ,//   
input  wire  [    C_CHANNEL_NUM-1:0]  I_gtsouthrefclk0                   ,//   
input  wire  [    C_CHANNEL_NUM-1:0]  I_gtsouthrefclk1                   ,//   
//channel tx                                                                       
input wire   [  8*C_CHANNEL_NUM-1:0]  I_txctrl                           ,//   
input wire   [ 64*C_CHANNEL_NUM-1:0]  I_txdata                           ,//   
output wire  [    C_CHANNEL_NUM-1:0]  O_gttxn                            ,//   
output wire  [    C_CHANNEL_NUM-1:0]  O_gttxp                            ,//   
output wire  [    C_CHANNEL_NUM-1:0]  O_txoutclk                         ,//   
output wire  [    C_CHANNEL_NUM-1:0]  O_txoutrst                         ,//   
//channel rx                                                                       
input  wire  [    C_CHANNEL_NUM-1:0]  I_gtrxn                            ,//   
input  wire  [    C_CHANNEL_NUM-1:0]  I_gtrxp                            ,//   
output wire  [  8*C_CHANNEL_NUM-1:0]  O_rxctrl                           ,//       
output wire  [ 64*C_CHANNEL_NUM-1:0]  O_rxdata                           ,//   
output wire  [    C_CHANNEL_NUM-1:0]  O_rxoutclk                         ,//
output wire  [    C_CHANNEL_NUM-1:0]  O_rxoutrst                         ,//
//channel cpu interface                                                   
input  wire  [160*C_CHANNEL_NUM-1:0]  I_channel_config                   ,//          
output wire  [160*C_CHANNEL_NUM-1:0]  O_channel_state                    ,//
output wire  [160*C_CHANNEL_NUM-1:0]  O_channel_alarm                    ,//
//with cpri
output wire  [  8*C_CHANNEL_NUM-1:0]  O_8b10b_lcv                        ,//
output wire  [    C_CHANNEL_NUM-1:0]  O_64b66b_lcv                       ,//
output wire  [  4*C_CHANNEL_NUM-1:0]  O_serdes_rate_sel                  ,//
input  wire  [    C_CHANNEL_NUM-1:0]  I_tx_scramble_en                   ,//
input  wire  [    C_CHANNEL_NUM-1:0]  I_rx_scramble_en                    //
);

         
// ---------------------------------------------------------------------------------------------------------
// inter wire
// ---------------------------------------------------------------------------------------------------------
wire                                  S_qpll0gtpowergood                 ;//
wire                                  S_qpll0reset                       ;//
wire                                  S_qpll0resetdone                   ;//
wire   [2:0]                          S_qpll0rst_state                   ;//
wire                                  S_qpll0lock                        ;//
wire                                  S_qpll0refclklost                  ;//
wire                                  S_qpll0fbclklost                   ;//
wire                                  S_qpll0outclk                      ;//
wire                                  S_qpll0outrefclk                   ;//
wire                                  S_qpll1gtpowergood                 ;//
wire                                  S_qpll1reset                       ;//
wire                                  S_qpll1resetdone                   ;//
wire   [2:0]                          S_qpll1rst_state                   ;//
wire                                  S_qpll1lock                        ;//
wire                                  S_qpll1refclklost                  ;//    
wire                                  S_qpll1fbclklost                   ;//    
wire                                  S_qpll1outclk                      ;//    
wire                                  S_qpll1outrefclk                   ;//    
wire   [    C_CHANNEL_NUM-1:0]        S_gtpowergood2qpll0                ;//    
wire   [    C_CHANNEL_NUM-1:0]        S_gtpowergood2qpll1                ;//    
   

// ---------------------------------------------------------------------------------------------------------
// inter reg
// ---------------------------------------------------------------------------------------------------------



// ***********************************************************main Verilog code********************************************************//
                        
// ---------------------------------------------------------------------------------------------------------
// common
// --------------------------------------------------------------------------------------------------------- 
assign   S_qpll0gtpowergood = &S_gtpowergood2qpll0 ; 
assign   S_qpll1gtpowergood = &S_gtpowergood2qpll1 ;


serdes_common_top #
            (
            .C_GT_TYPE                          ( C_GT_TYPE                           )
            )                                                                         
            serdes_common_top                                                         
            (                                                                         
            //system CLK                                                                    
            .I_system_clk                       ( I_system_clk                        ), 
            .I_system_rst                       ( I_system_rst                        ),
            //                                                                        
            .I_gtnorthrefclk00                  ( I_gtnorthrefclk00                   ),
            .I_gtnorthrefclk10                  ( I_gtnorthrefclk10                   ),
            .I_gtrefclk00                       ( I_gtrefclk00                        ),
            .I_gtrefclk10                       ( I_gtrefclk10                        ),
            .I_gtsouthrefclk00                  ( I_gtsouthrefclk00                   ),
            .I_gtsouthrefclk10                  ( I_gtsouthrefclk10                   ),
            .I_qpll0gtpowergood                 ( S_qpll0gtpowergood                  ),
            .O_qpll0reset                       ( S_qpll0reset                        ),
            .O_qpll0resetdone                   ( S_qpll0resetdone                    ),
            .O_qpll0rst_state                   ( S_qpll0rst_state[2:0]               ),
            .O_qpll0lock                        ( S_qpll0lock                         ),
            .O_qpll0refclklost                  ( S_qpll0refclklost                   ),
            .O_qpll0fbclklost                   ( S_qpll0fbclklost                    ),
            .O_qpll0outclk                      ( S_qpll0outclk                       ),
            .O_qpll0outrefclk                   ( S_qpll0outrefclk                    ),
            //QPLL1                                                                   
            .I_gtnorthrefclk01                  ( I_gtnorthrefclk01                   ),
            .I_gtnorthrefclk11                  ( I_gtnorthrefclk11                   ),
            .I_gtrefclk01                       ( I_gtrefclk01                        ),
            .I_gtrefclk11                       ( I_gtrefclk11                        ),
            .I_gtsouthrefclk01                  ( I_gtsouthrefclk01                   ),
            .I_gtsouthrefclk11                  ( I_gtsouthrefclk11                   ),
            .I_qpll1gtpowergood                 ( S_qpll1gtpowergood                  ),
            .O_qpll1reset                       ( S_qpll1reset                        ),
            .O_qpll1resetdone                   ( S_qpll1resetdone                    ),
            .O_qpll1rst_state                   ( S_qpll1rst_state[2:0]               ),
            .O_qpll1lock                        ( S_qpll1lock                         ),
            .O_qpll1refclklost                  ( S_qpll1refclklost                   ),
            .O_qpll1fbclklost                   ( S_qpll1fbclklost                    ),
            .O_qpll1outclk                      ( S_qpll1outclk                       ),
            .O_qpll1outrefclk                   ( S_qpll1outrefclk                    ),
            //QPLL CFG                                                                
            .I_qpll_config                      ( I_qpll_config[63:0]                 ), 
            .O_qpll_state                       ( O_qpll_state[63:0]                  )   
            );
// ---------------------------------------------------------------------------------------------------------
// MULTI CHANNEL
// --------------------------------------------------------------------------------------------------------- 
genvar  i   ;
generate  
    for (i=0;i<C_CHANNEL_NUM;i=i+1)
        begin : GEN_MULTI_CHANNEL
            serdes_channel_top #
            (
            .C_GT_TYPE                          ( C_GT_TYPE                           ),
            .C_CHANNEL_FOR_CPRI_TDM             ( C_CHANNEL_FOR_CPRI_TDM[i]           ),
            .C_CHANNEL_TXRX_SHARE_CLK           ( C_CHANNEL_TXRX_SHARE_CLK[i]         )
            )                                                         
            serdes_channel_top           
            ( 
            //cpll refclk                          
            .I_gtnorthrefclk0                   ( I_gtnorthrefclk0  [   i        ]    ),
            .I_gtnorthrefclk1                   ( I_gtnorthrefclk1  [   i        ]    ),
            .I_gtrefclk0                        ( I_gtrefclk0       [   i        ]    ),
            .I_gtrefclk1                        ( I_gtrefclk1       [   i        ]    ),
            .I_gtsouthrefclk0                   ( I_gtsouthrefclk0  [   i        ]    ),
            .I_gtsouthrefclk1                   ( I_gtsouthrefclk1  [   i        ]    ),
            //from qpll0                                                               
            .I_qpll0clk                         ( S_qpll0outclk                       ),
            .I_qpll0refclk                      ( S_qpll0outrefclk                    ),
            .I_qpll0reset                       ( S_qpll0reset                        ),
            .I_qpll0resetdone                   ( S_qpll0resetdone                    ),
            .I_qpll0lock                        ( S_qpll0lock                         ),
            .I_qpll0refclklost                  ( S_qpll0refclklost                   ),
            .I_qpll0fbclklost                   ( S_qpll0fbclklost                    ),
            .I_qpll0rst_state                   ( S_qpll0rst_state                    ),
            .I_qpll0gtpowergood                 ( S_qpll0gtpowergood                  ),
            //from qpll1                                                            
            .I_qpll1clk                         ( S_qpll1outclk                       ),
            .I_qpll1refclk                      ( S_qpll1outrefclk                    ),
            .I_qpll1reset                       ( S_qpll1reset                        ),
            .I_qpll1resetdone                   ( S_qpll1resetdone                    ),
            .I_qpll1lock                        ( S_qpll1lock                         ),
            .I_qpll1refclklost                  ( S_qpll1refclklost                   ),
            .I_qpll1fbclklost                   ( S_qpll1fbclklost                    ),
            .I_qpll1rst_state                   ( S_qpll1rst_state                    ),
            .I_qpll1gtpowergood                 ( S_qpll1gtpowergood                  ),
            //channel tx                                                      
            .I_txctrl                           ( I_txctrl          [ 8*i+ 7: 8*i]    ),
            .I_txdata                           ( I_txdata          [64*i+63:64*i]    ),
            .O_gttxn                            ( O_gttxn           [   i        ]    ),
            .O_gttxp                            ( O_gttxp           [   i        ]    ),
            .O_txoutclk                         ( O_txoutclk        [   i        ]    ),
            .O_txoutrst                         ( O_txoutrst        [   i        ]    ),
            //channel rx                                                             
            .I_gtrxn                            ( I_gtrxn           [   i        ]    ),
            .I_gtrxp                            ( I_gtrxp           [   i        ]    ),
            .O_rxctrl                           ( O_rxctrl          [ 8*i+ 7: 8*i]    ),
            .O_rxdata                           ( O_rxdata          [64*i+63:64*i]    ),
            .O_rxoutclk                         ( O_rxoutclk        [   i        ]    ),
            .O_rxoutrst                         ( O_rxoutrst        [   i        ]    ),
            //channel system                                                        
            .I_system_clk                       ( I_system_clk                        ),
            .I_system_rst                       ( I_system_rst                        ),
            //channel cpu interface                                              
            .I_channel_config                   ( I_channel_config  [160*i+159:160*i] ),
            .O_channel_state                    ( O_channel_state   [160*i+159:160*i] ),
            .O_channel_alarm                    ( O_channel_alarm   [160*i+159:160*i] ),
            //other
            .O_gtpowergood2qpll0                ( S_gtpowergood2qpll0   [i]           ),
            .O_gtpowergood2qpll1                ( S_gtpowergood2qpll1   [i]           ),
            .O_8b10b_lcv                        ( O_8b10b_lcv       [  8*i+  7:  8*i] ),
            .O_64b66b_lcv                       ( O_64b66b_lcv          [i]           ),
            .O_serdes_rate_sel                  ( O_serdes_rate_sel [  4*i+  3:  4*i] ),
            .I_tx_scramble_en                   ( I_tx_scramble_en      [i]           ),
            .I_rx_scramble_en                   ( I_rx_scramble_en      [i]           )
            );
        end
endgenerate

        
endmodule
    
