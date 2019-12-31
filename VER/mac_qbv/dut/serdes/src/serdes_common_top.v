//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_common_top.v
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


module serdes_common_top #
(
parameter C_GT_TYPE  = "GTYE3"                           //
)                                     

( 
//DRP
input  wire          I_system_clk                       ,//        
input  wire          I_system_rst                       ,//
//QPLL0
input  wire          I_gtnorthrefclk00                  ,//
input  wire          I_gtnorthrefclk10                  ,//
input  wire          I_gtrefclk00                       ,//
input  wire          I_gtrefclk10                       ,//
input  wire          I_gtsouthrefclk00                  ,//
input  wire          I_gtsouthrefclk10                  ,//
input  wire          I_qpll0gtpowergood                 ,//
output wire          O_qpll0reset                       ,//
output wire          O_qpll0resetdone                   ,//
output wire  [2:0]   O_qpll0rst_state                   ,//
output wire          O_qpll0lock                        ,//
output wire          O_qpll0refclklost                  ,//
output wire          O_qpll0fbclklost                   ,//
output wire          O_qpll0outclk                      ,//
output wire          O_qpll0outrefclk                   ,//
//QPLL1
input  wire          I_gtnorthrefclk01                  ,//  
input  wire          I_gtnorthrefclk11                  ,//
input  wire          I_gtrefclk01                       ,//
input  wire          I_gtrefclk11                       ,//
input  wire          I_gtsouthrefclk01                  ,//
input  wire          I_gtsouthrefclk11                  ,//
input  wire          I_qpll1gtpowergood                 ,//
output wire          O_qpll1reset                       ,//
output wire          O_qpll1resetdone                   ,//
output wire  [2:0]   O_qpll1rst_state                   ,//
output wire          O_qpll1lock                        ,//
output wire          O_qpll1refclklost                  ,//
output wire          O_qpll1fbclklost                   ,// 
output wire          O_qpll1outclk                      ,//
output wire          O_qpll1outrefclk                   ,//
//QPLL CFG
input  wire  [63:0]  I_qpll_config                      ,// 
output wire  [63:0]  O_qpll_state                        //
);

// ---------------------------------------------------------------------------------------------------------
// parameter define
// ---------------------------------------------------------------------------------------------------------  

       
// ---------------------------------------------------------------------------------------------------------
// inter wire
// ---------------------------------------------------------------------------------------------------------
wire                 S_qpll0pd                          ;//
wire   [2:0]         S_qpll0refclksel                   ;//
wire                 S_qpll1pd                          ;//
wire   [2:0]         S_qpll1refclksel                   ;//
wire                 S_force_qpll0reset                 ;//    
wire                 S_force_qpll1reset                 ;//    
wire   [9:0]         S_cpu_drpaddr                      ;//
wire   [15:0]        S_cpu_drpdi                        ;//
wire                 S_cpu_drpwe                        ;//
wire                 S_cpu_drpen                        ;//
wire   [15:0]        S_cpu_drpdo                        ;//                                            
wire                 S_drprdy                           ;//
wire   [9:0]         S_drpaddr                          ;//
wire   [15:0]        S_drpdi                            ;//
wire                 S_drpwe                            ;//
wire                 S_drpen                            ;//
wire   [15:0]        S_drpdo                            ;//
    

// ---------------------------------------------------------------------------------------------------------
// inter reg
// ---------------------------------------------------------------------------------------------------------



// ***********************************************************main Verilog code********************************************************//
(* mark_debug = "true" *)wire  S_qpll0reset         ;
(* mark_debug = "true" *)wire  S_qpll0refclklost    ;
(* mark_debug = "true" *)wire  S_qpll0fbclklost     ;
(* mark_debug = "true" *)wire  S_qpll0lock          ;
(* mark_debug = "true" *)wire  S_qpll1reset         ;
(* mark_debug = "true" *)wire  S_qpll1refclklost    ;
(* mark_debug = "true" *)wire  S_qpll1fbclklost     ;
(* mark_debug = "true" *)wire  S_qpll1lock          ;
(* mark_debug = "true" *)wire  S_qpll0resetdone     ;
(* mark_debug = "true" *)wire  S_qpll1resetdone     ;



assign S_qpll0reset      = O_qpll0reset        ;
assign S_qpll0refclklost = O_qpll0refclklost   ;
assign S_qpll0fbclklost  = O_qpll0fbclklost    ;
assign S_qpll0lock       = O_qpll0lock         ;
assign S_qpll1reset      = O_qpll1reset        ;
assign S_qpll1refclklost = O_qpll1refclklost   ;
assign S_qpll1fbclklost  = O_qpll1fbclklost    ;
assign S_qpll1lock       = O_qpll1lock         ;
assign S_qpll0resetdone  = O_qpll0resetdone    ;
assign S_qpll1resetdone  = O_qpll1resetdone    ;
// ---------------------------------------------------------------------------------------------------------
// config/state/alarm
// ---------------------------------------------------------------------------------------------------------
//config 
assign   S_cpu_drpen                =  I_qpll_config[2*16+13:2*16+13]   ;
assign   S_cpu_drpwe                =  I_qpll_config[2*16+12:2*16+12]   ;
assign   S_cpu_drpaddr[9:0]         =  I_qpll_config[2*16+ 9:2*16+ 0]   ;///004
                                              
assign   S_cpu_drpdi[15:0]          =  I_qpll_config[1*16+15:1*16+ 0]   ;///002


assign   S_qpll1refclksel[2:0]      =  I_qpll_config[0*16+10:0*16+ 8]   ;          
assign   S_qpll0refclksel[2:0]      =  I_qpll_config[0*16+ 6:0*16+ 4]   ;
assign   S_qpll1pd                  =  I_qpll_config[0*16+ 3:0*16+ 3]   ;
assign   S_qpll0pd                  =  I_qpll_config[0*16+ 2:0*16+ 2]   ;      
assign   S_force_qpll1reset         =  I_qpll_config[0*16+ 1:0*16+ 1]   ;      
assign   S_force_qpll0reset         =  I_qpll_config[0*16+ 0:0*16+ 0]   ;///000

//state
assign   O_qpll_state[15:0]         =  S_cpu_drpdo[15:0]                ;///000                                                   
                          
// ---------------------------------------------------------------------------------------------------------
// QPLL IP_CORE
// --------------------------------------------------------------------------------------------------------- 
serdes_common_ipcore #
            (
            .C_GT_TYPE                          ( C_GT_TYPE                       )
            ) 
            serdes_common_ipcore                                       
            (                                                                     
            //DRP
            .COMMON_DRPCLK                      ( I_system_clk                    ),                                                            
            .COMMON_DRPADDR                     ( S_drpaddr                       ),
            .COMMON_DRPDI                       ( S_drpdi                         ),
            .COMMON_DRPWE                       ( S_drpwe                         ),            
            .COMMON_DRPEN                       ( S_drpen                         ),
            .COMMON_DRPDO                       ( S_drpdo                         ), 
            .COMMON_DRPRDY                      ( S_drprdy                        ),
            //QPLL0            
            .COMMON_GTNORTHREFCLK00             ( I_gtnorthrefclk00               ),
            .COMMON_GTNORTHREFCLK10             ( I_gtnorthrefclk10               ),
            .COMMON_GTREFCLK00                  ( I_gtrefclk00                    ),
            .COMMON_GTREFCLK10                  ( I_gtrefclk10                    ),
            .COMMON_GTSOUTHREFCLK00             ( I_gtsouthrefclk00               ),
            .COMMON_GTSOUTHREFCLK10             ( I_gtsouthrefclk10               ),
            .COMMON_QPLL0REFCLKSEL              ( S_qpll0refclksel                ),
            .COMMON_QPLL0LOCKDETCLK             ( I_system_clk                    ),
            .COMMON_QPLL0PD                     ( S_qpll0pd                       ),     
            .COMMON_QPLL0RESET                  ( O_qpll0reset                    ),
            .COMMON_QPLL0REFCLKLOST             ( O_qpll0refclklost               ),            
            .COMMON_QPLL0FBCLKLOST              ( O_qpll0fbclklost                ),
            .COMMON_QPLL0LOCK                   ( O_qpll0lock                     ),
            .COMMON_QPLL0OUTCLK                 ( O_qpll0outclk                   ),
            .COMMON_QPLL0OUTREFCLK              ( O_qpll0outrefclk                ),
            //QPLL1
            .COMMON_GTNORTHREFCLK01             ( I_gtnorthrefclk01               ),
            .COMMON_GTNORTHREFCLK11             ( I_gtnorthrefclk11               ),   
            .COMMON_GTREFCLK01                  ( I_gtrefclk01                    ),        
            .COMMON_GTREFCLK11                  ( I_gtrefclk11                    ),     
            .COMMON_GTSOUTHREFCLK01             ( I_gtsouthrefclk01               ),
            .COMMON_GTSOUTHREFCLK11             ( I_gtsouthrefclk11               ),
            .COMMON_QPLL1REFCLKSEL              ( S_qpll1refclksel                ),                
            .COMMON_QPLL1LOCKDETCLK             ( I_system_clk                    ),                            
            .COMMON_QPLL1PD                     ( S_qpll1pd                       ),         
            .COMMON_QPLL1RESET                  ( O_qpll1reset                    ),                             
            .COMMON_QPLL1REFCLKLOST             ( O_qpll1refclklost               ),
            .COMMON_QPLL1FBCLKLOST              ( O_qpll1fbclklost                ),
            .COMMON_QPLL1LOCK                   ( O_qpll1lock                     ),
            .COMMON_QPLL1OUTCLK                 ( O_qpll1outclk                   ),
            .COMMON_QPLL1OUTREFCLK              ( O_qpll1outrefclk                )               
            );

// ---------------------------------------------------------------------------------------------------------
// QPLL DRP
// ---------------------------------------------------------------------------------------------------------

serdes_drp   serdes_drp
            (
            //with cpu
            .I_cpu_drpaddr                      ( S_cpu_drpaddr                   ),//
            .I_cpu_drpdi                        ( S_cpu_drpdi                     ),//
            .I_cpu_drpwe                        ( S_cpu_drpwe                     ),//
            .I_cpu_drpen                        ( S_cpu_drpen                     ),//
            .O_cpu_drpdo                        ( S_cpu_drpdo                     ),//
            //vith ip
            .I_drp_clk                          ( I_system_clk                    ),//
            .I_drp_rst                          ( I_system_rst                    ),//        
            .I_drprdy                           ( S_drprdy                        ),//                                                
            .O_drpaddr                          ( S_drpaddr                       ),//
            .O_drpdi                            ( S_drpdi                         ),//
            .O_drpwe                            ( S_drpwe                         ),//
            .O_drpen                            ( S_drpen                         ),//
            .I_drpdo                            ( S_drpdo                         ) //
            );



// ---------------------------------------------------------------------------------------------------------
// QPLL RST
// ---------------------------------------------------------------------------------------------------------
serdes_common_rst     serdes_common_rst0
            ( 
            .I_clk                              ( I_system_clk                    ),
            .I_rst                              ( I_system_rst                    ),
            //CPLL                                                                 
            .I_pllpd                            ( S_qpll0pd                       ),//belong to I_system_clk
            .I_force_pllreset                   ( S_force_qpll0reset              ),//belong to I_system_clk
            .I_gtpowergood                      ( I_qpll0gtpowergood              ),//async
            .I_plllock                          ( O_qpll0lock                     ),//async
            .I_pllrefclklost                    ( O_qpll0refclklost               ),//async
            .I_pllfbclklost                     ( O_qpll0fbclklost                ),//async
            .O_pllreset                         ( O_qpll0reset                    ),//belong to I_system_clk
            .O_pllrst_state                     ( O_qpll0rst_state                ),//belong to I_system_clk
            .O_pllresetdone                     ( O_qpll0resetdone                ) //belong to I_system_clk
            );

serdes_common_rst     serdes_common_rst1
            ( 
            .I_clk                              ( I_system_clk                    ),
            .I_rst                              ( I_system_rst                    ),
            //CPLL                                                                 
            .I_pllpd                            ( S_qpll1pd                       ),//belong to I_system_clk
            .I_force_pllreset                   ( S_force_qpll1reset              ),//belong to I_system_clk
            .I_gtpowergood                      ( I_qpll1gtpowergood              ),//async
            .I_plllock                          ( O_qpll1lock                     ),//async
            .I_pllrefclklost                    ( O_qpll1refclklost               ),//async
            .I_pllfbclklost                     ( O_qpll1fbclklost                ),//async
            .O_pllreset                         ( O_qpll1reset                    ),//belong to I_system_clk
            .O_pllrst_state                     ( O_qpll1rst_state                ),//belong to I_system_clk
            .O_pllresetdone                     ( O_qpll1resetdone                ) //belong to I_system_clk
            ); 

        
endmodule
    
