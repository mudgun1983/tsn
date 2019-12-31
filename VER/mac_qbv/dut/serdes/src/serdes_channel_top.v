//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_channel_top.v
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


module serdes_channel_top #
(
parameter            C_GT_TYPE                = "GTYE3",//
parameter            C_CHANNEL_FOR_CPRI_TDM   = 1'd0   ,//1'd0-CPRI;1'd1-TDM
parameter            C_CHANNEL_TXRX_SHARE_CLK = 1'd0    //1'd0-NO SHARE CLK;  1'd1-SHARE CLK
)
( 
//cpll refclk
input  wire          I_gtnorthrefclk0                   ,//
input  wire          I_gtnorthrefclk1                   ,//
input  wire          I_gtrefclk0                        ,//  
input  wire          I_gtrefclk1                        ,//
input  wire          I_gtsouthrefclk0                   ,//
input  wire          I_gtsouthrefclk1                   ,//
//from qpll0
input  wire          I_qpll0clk                         ,//
input  wire          I_qpll0refclk                      ,//
input  wire          I_qpll0reset                       ,//
input  wire          I_qpll0resetdone                   ,//
input  wire          I_qpll0lock                        ,//
input  wire          I_qpll0refclklost                  ,//
input  wire          I_qpll0fbclklost                   ,//
input  wire  [2:0]   I_qpll0rst_state                   ,//
input  wire          I_qpll0gtpowergood                 ,//
//from qpll1
input  wire          I_qpll1clk                         ,//
input  wire          I_qpll1refclk                      ,//
input  wire          I_qpll1reset                       ,//
input  wire          I_qpll1resetdone                   ,//
input  wire          I_qpll1lock                        ,//
input  wire          I_qpll1refclklost                  ,//
input  wire          I_qpll1fbclklost                   ,//
input  wire  [2:0]   I_qpll1rst_state                   ,//
input  wire          I_qpll1gtpowergood                 ,//
//channel tx                                                    
input  wire  [7:0]   I_txctrl                           ,//
input  wire  [63:0]  I_txdata                           ,//
output wire          O_gttxn                            ,//
output wire          O_gttxp                            ,//
output wire          O_txoutclk                         ,//
output wire          O_txoutrst                         ,//
//channel rx                                                    
input  wire          I_gtrxn                            ,//
input  wire          I_gtrxp                            ,//
output reg   [7:0]   O_rxctrl                           ,//    
output reg   [63:0]  O_rxdata                           ,//
output wire          O_rxoutclk                         ,//
output wire          O_rxoutrst                         ,//
//channel cpu
input  wire          I_system_clk                       ,//        
input  wire          I_system_rst                       ,//
//channel cpu interface                                                       
input  wire  [159:0] I_channel_config                   ,//          
output wire  [159:0] O_channel_state                    ,//
output wire  [159:0] O_channel_alarm                    ,//
//other
output reg           O_gtpowergood2qpll0                ,//
output reg           O_gtpowergood2qpll1                ,//
output wire   [7:0]  O_8b10b_lcv                        ,//
output wire          O_64b66b_lcv                       ,//
output wire   [3:0]  O_serdes_rate_sel                  ,//
input  wire          I_tx_scramble_en                   ,//
input  wire          I_rx_scramble_en                    //


);

// ---------------------------------------------------------------------------------------------------------
// parameter define
// ---------------------------------------------------------------------------------------------------------  

         
// ---------------------------------------------------------------------------------------------------------
// inter wire
// ---------------------------------------------------------------------------------------------------------
wire   [2:0]         S_cpllrst_state                    ;//
wire   [2:0]         S_txrst_state                      ;//
wire   [3:0]         S_rxrst_state                      ;//
wire                 S_cpllfbclklost                    ;//
wire                 S_cpllrefclklost                   ;//
wire                 S_gtpowergood                      ;//
wire                 S_rxcdrlock                        ;//
wire   [15:0]        S_rxctrl                           ;//
wire   [127:0]       S_rxdata                           ;//
wire                 S_txprgdivresetdone                ;//
wire                 S_rxprgdivresetdone                ;//
wire                 S_rxprbserr                        ;//O_rxoutclk
wire                 S_gtrxreset                        ;//async 
wire                 S_gttxreset                        ;//async
wire                 S_cpllreset                        ;//async
wire   [1:0]         S_txbufstatus                      ;//O_txoutclk
wire   [2:0]         S_rxbufstatus                      ;//O_rxoutclk
wire                 S_txuserrdy                        ;//async
wire                 S_rxuserrdy                        ;//async
wire                 S_txresetdone                      ;//O_txoutclk
wire                 S_rxresetdone                      ;//O_rxoutclk
wire                 S_rxbyteisaligned                  ;//O_rxoutclk
wire   [7:0]         S_rxnotintable                     ;//O_rxoutclk
wire   [15:0]        S_rxdisperr                        ;//O_rxoutclk 
wire                 S_cplllock                         ;//async
wire                 S_rxprbscntreset                   ;//O_rxoutclk
wire                 S_txprbsforceerr                   ;//O_txoutclk
wire   [3:0]         S_txrxprbssel                      ;//O_txoutclk
wire   [2:0]         S_cpllrefclksel                    ;//
wire   [1:0]         S_txrxpllclksel                    ;//
wire   [2:0]         S_rxoutclksel                      ;//
wire   [2:0]         S_txoutclksel                      ;//
wire   [1:0]         S_rxsysclksel                      ;//
wire   [1:0]         S_txsysclksel                      ;//
wire   [4:0]         S_txprecursor                      ;//async
wire   [4:0]         S_txpostcursor                     ;//async
wire   [4:0]         S_txdiffctrl                       ;//async
wire                 S_rx8b10ben                        ;//
wire                 S_tx8b10ben                        ;//
wire                 S_rxmcommaalignen                  ;//
wire                 S_rxpcommaalignen                  ;//
wire                 S_rxcommadeten                     ;//
wire                 S_force_gtrxreset                  ;//
wire                 S_force_gttxreset                  ;//
wire                 S_force_cpllreset                  ;//
wire                 S_force_txinhibit                  ;//
wire                 S_rxpd                             ;//async
wire                 S_txpd                             ;//
wire                 S_rxlpmen                          ;//O_rxoutclk
wire   [2:0]         S_loopback                         ;//async
wire                 S_txoutclk                         ;//
wire                 S_rxoutclk                         ;//
wire                 S_rxgearboxslip                    ;//
wire                 S_txinhibit                        ;//O_txoutclk
wire   [5:0]         S_rxheader                         ;//
wire   [1:0]         S_rxheadervalid                    ;//
wire   [63:0]        S_rx_64b66b_data                   ;//
wire   [7:0]         S_rx_64b66b_ctrl                   ;//
wire   [63:0]        S_tx_64b66b_data                   ;//
wire   [1:0]         S_tx_64b66b_header                 ;//
wire   [5:0]         S_tx_64b66b_seq                    ;//
wire                 S_rx_block_sync_lock               ;//
wire   [15:0]        S_rx_block_sync_lock_cnt           ;//
wire                 S_rx_block_sync_head_cv            ;//
wire   [15:0]        S_rx_block_sync_header_err_cnt     ;//
wire   [2:0]         S_rx_block_sync_state              ;//
wire   [2:0]         S_rx_decode_state                  ;//
wire   [7:0]         S_rx_decode_state_cnt              ;//
wire   [2:0]         S_tx_encode_state                  ;//
wire   [7:0]         S_tx_encode_state_cnt              ;//
wire                 S_8b10b_or_64b66b_sel              ;//
wire                 S_gt_rx_align                      ;//
wire                 S_cpllresetdone                    ;//
wire                 S_rxdfeagchold                     ;//
wire                 S_rxdfelfhold                      ;//
wire                 S_rxlpmhfhold                      ;//
wire                 S_rxlpmlfhold                      ;//
wire   [30:0]        S_scramble_seed                    ;//
wire   [3:0]         S_serdes_rate_sel                  ;//
wire   [7:0]         S_tx_8b10b_ctrl                    ;//
wire   [63:0]        S_tx_8b10b_data                    ;//
wire   [7:0]         S_rx_order_ctrl                    ;//
wire   [63:0]        S_rx_order_data                    ;//
wire   [7:0]         S_rx_8b10b_ctrl                    ;//
wire   [63:0]        S_rx_8b10b_data                    ;//
wire   [30:0]        S_descram_seed                     ;//
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
wire                 S_txbufstatus_d                    ;//
wire                 S_rxbufstatus_d                    ;//
wire                 S_TXUSRCLK                         ;//
wire                 S_TXUSRCLK2                        ;//
wire                 S_RXUSRCLK                         ;//
wire                 S_RXUSRCLK2                        ;//
wire                 S_rxdisperr_d                      ;//
wire                 S_rxnotintable_d                   ;//
wire                 S_rxbyteisaligned_d                ;//
wire                 S_rx_block_sync_head_cv_d          ;//
wire                 S_rx_block_sync_lock_d             ;//
wire   [2:0]         S_TXUSRCLK2_DIV                    ;//
wire   [2:0]         S_RXUSRCLK2_DIV                    ;//
wire                 S_test_en                          ;//
wire                 S_err_cnt_clr                      ;//
wire   [7:0]         S_txctrl_test_sel                  ;//
wire   [63:0]        S_txdata_test_sel                  ;//
wire   [7:0]         S_err_counter                      ;//
wire                 S_txprogdivreset                   ;//
wire                 S_rxprogdivreset                   ;//
wire                 S_txpmaresetdone                   ;//
wire                 S_rxpmaresetdone                   ;//
wire                 S_userclk_tx_reset                 ;//
wire                 S_userclk_rx_reset                 ;//   
wire                 S_serdes_rx_ksync                  ;//
wire                 S_rx_scramble_sel                  ;//
wire                 S_rx_scramble_en_cpu               ;//
wire                 S_tx_scramble_sel                  ;//
wire                 S_tx_scramble_en_cpu               ;//
wire                 S_tx_scramble_en                   ;//
wire                 S_rx_scramble_en                   ;//
wire                 S_state_err_rst_off                ;//
wire                 S_serdes_rx_ksync_d                ;//
// ---------------------------------------------------------------------------------------------------------
// inter reg
// ---------------------------------------------------------------------------------------------------------

reg    [7:0]         S_txctrl                           ;//
reg    [127:0]       S_txdata                           ;//
reg    [6:0]         S_txsequence                       ;//
reg    [5:0]         S_txheader                         ;//
reg                  S_pllreset_rpt                     ;//
reg                  S_pllresetdone_rpt                 ;//
reg                  S_plllock_rpt                      ;//
reg                  S_pllrefclklost_rpt                ;//
reg                  S_pllfbclklost_rpt                 ;//
reg    [2:0]         S_pllrst_state_rpt                 ;//
reg                  S_gtpowergood_rpt                  ;//
reg                  S_userclk2_rx_active_meta          ;//
reg                  S_userclk2_tx_active_meta          ;//
reg                  S_userclk2_rx_active               ;//
reg                  S_userclk2_tx_active               ;//
reg                  S_txoutrst                         ;//
reg                  S_rxoutrst                         ;//
reg                  S_txoutrst_d2                      ;//
reg                  S_txoutrst_d3                      ;//
(* max_fanout = 20 *) reg  S_txoutrst_d4                ;//
reg                  S_rxoutrst_d2                      ;//
reg                  S_rxoutrst_d3                      ;//
(* max_fanout = 20 *) reg  S_rxoutrst_d4                ;//


// ***********************************************************main Verilog code********************************************************//
assign  O_8b10b_lcv       = S_rxnotintable          ;
assign  O_64b66b_lcv      = S_rx_block_sync_head_cv ;
assign  O_serdes_rate_sel = S_serdes_rate_sel       ;
// ---------------------------------------------------------------------------------------------------------
// config/state/alarm
// ---------------------------------------------------------------------------------------------------------
//config
assign   S_cpu_drpen                =  I_channel_config[9*16+13:9*16+13]   ;      
assign   S_cpu_drpwe                =  I_channel_config[9*16+12:9*16+12]   ;      
assign   S_cpu_drpaddr[9:0]         =  I_channel_config[9*16+ 9:9*16+ 0]   ;///012
                                                                               
assign   S_cpu_drpdi[15:0]          =  I_channel_config[8*16+15:8*16+ 0]   ;///010

assign   S_scramble_seed[30:16]     =  I_channel_config[7*16+14:7*16+ 0]   ;///00e
assign   S_scramble_seed[15:0]      =  I_channel_config[6*16+15:6*16+ 0]   ;///00c

assign   S_rx_scramble_sel          =  I_channel_config[5*16+15:5*16+15]   ;
assign   S_rx_scramble_en_cpu       =  I_channel_config[5*16+14:5*16+14]   ;
assign   S_tx_scramble_sel          =  I_channel_config[5*16+13:5*16+13]   ;
assign   S_tx_scramble_en_cpu       =  I_channel_config[5*16+12:5*16+12]   ;
assign   S_state_err_rst_off        =  I_channel_config[5*16+ 9:5*16+ 9]   ;
assign   S_err_cnt_clr              =  I_channel_config[5*16+ 8:5*16+ 8]   ;
assign   S_test_en                  =  I_channel_config[5*16+ 7:5*16+ 7]   ;
assign   S_rxprbscntreset           =  I_channel_config[5*16+ 5:5*16+ 5]   ;
assign   S_txprbsforceerr           =  I_channel_config[5*16+ 4:5*16+ 4]   ;
assign   S_txrxprbssel[3:0]         =  I_channel_config[5*16+ 3:5*16+ 0]   ;///00a

assign   S_RXUSRCLK2_DIV[2:0]       =  I_channel_config[4*16+14:4*16+12]   ;
assign   S_TXUSRCLK2_DIV[2:0]       =  I_channel_config[4*16+10:4*16+ 8]   ;
assign   S_txrxpllclksel[1:0]       =  I_channel_config[4*16+ 5:4*16+ 4]   ;                                   
assign   S_cpllrefclksel[2:0]       =  I_channel_config[4*16+ 2:4*16+ 0]   ;///008
                                                             
assign   S_rxoutclksel[2:0]         =  I_channel_config[3*16+10:3*16+ 8]   ;
assign   S_txoutclksel[2:0]         =  I_channel_config[3*16+ 6:3*16+ 4]   ;
assign   S_rxsysclksel[1:0]         =  I_channel_config[3*16+ 3:3*16+ 2]   ;
assign   S_txsysclksel[1:0]         =  I_channel_config[3*16+ 1:3*16+ 0]   ;///006
                                    
assign   S_serdes_rate_sel[3:0]     =  I_channel_config[2*16+15:2*16+12]   ;
assign   S_rx8b10ben                =  I_channel_config[2*16+10:2*16+10]   ;
assign   S_tx8b10ben                =  I_channel_config[2*16+ 9:2*16+ 9]   ;                                                         
assign   S_8b10b_or_64b66b_sel      =  I_channel_config[2*16+ 8:2*16+ 8]   ;
assign   S_txprecursor[4:0]         =  I_channel_config[2*16+ 4:2*16+ 0]   ;///004
                                                             
assign   S_txpostcursor[4:0]        =  I_channel_config[1*16+12:1*16+ 8]   ;
assign   S_txdiffctrl[4:0]          =  I_channel_config[1*16+ 4:1*16+ 0]   ;///002
                                                             
assign   S_rxmcommaalignen          =  I_channel_config[0*16+14:0*16+14]   ;
assign   S_rxpcommaalignen          =  I_channel_config[0*16+13:0*16+13]   ;
assign   S_rxcommadeten             =  I_channel_config[0*16+12:0*16+12]   ;
assign   S_force_gtrxreset          =  I_channel_config[0*16+11:0*16+11]   ;
assign   S_force_gttxreset          =  I_channel_config[0*16+10:0*16+10]   ;
assign   S_force_cpllreset          =  I_channel_config[0*16+ 9:0*16+ 9]   ;
assign   S_force_txinhibit          =  I_channel_config[0*16+ 8:0*16+ 8]   ;
assign   S_rxpd                     =  I_channel_config[0*16+ 7:0*16+ 7]   ;
assign   S_txpd                     =  I_channel_config[0*16+ 6:0*16+ 6]   ;
assign   S_rxlpmen                  =  I_channel_config[0*16+ 4:0*16+ 4]   ;
assign   S_loopback[2:0]            =  I_channel_config[0*16+ 2:0*16+ 0]   ;///000
                                                             

//state
assign   O_channel_state   = S_8b10b_or_64b66b_sel ?
                            {
                            8'd0,S_err_counter,
                            S_cpu_drpdo[15:0],                                                                      //16bit    010
                            32'd0,                                                                                  //32bit    00c 00e
                            16'd0,                                                                                  //16bit    00a
                            S_tx_encode_state_cnt[7:0],5'b0,S_tx_encode_state[2:0],                                 //16bit    008
                            S_rx_decode_state_cnt[7:0],1'b0,S_rx_decode_state[2:0],1'b0,S_rx_block_sync_state[2:0], //16bit    006
                            S_rx_block_sync_header_err_cnt[15:0],                                                   //16bit    004
                            S_rx_block_sync_lock_cnt[15:0],                                                         //16bit    002
                            4'b0,S_rxrst_state[3:0],1'b0,S_txrst_state[2:0],1'b0,S_pllrst_state_rpt[2:0]            //16bit    000
                           }:
                            {
                            8'd0,S_err_counter,
                            S_cpu_drpdo[15:0],                                                                      //16bit    010
                            1'b0,S_descram_seed[30:0],                                                              //32bit    00c 00e
                            14'd0,I_tx_scramble_en,I_rx_scramble_en,                                                //16bit    00a
                            16'd0,                                                                                  //16bit    008
                            16'd0,                                                                                  //16bit    006
                            16'd0,                                                                                  //16bit    004
                            16'd0,                                                                                  //16bit    002
                            4'b0,S_rxrst_state[3:0],1'b0,S_txrst_state[2:0],1'b0,S_pllrst_state_rpt[2:0]            //16bit    000
                           } ;

                           
//alarm
assign   O_channel_alarm   =   {
                            32'd0,
                            94'b0,S_rx_block_sync_head_cv_d,~S_rx_block_sync_lock_d,                                //96bit    004  
                              
                            6'b0,S_txprogdivreset,S_rxprogdivreset,                                                 //8bit
                            ~S_serdes_rx_ksync,S_pllfbclklost_rpt,S_pllrefclklost_rpt,~S_gtpowergood_rpt,           //4bit
                            1'd0,~S_txprgdivresetdone,~S_rxprgdivresetdone,S_rxprbserr,                             //4bit     002 
                             
                            ~S_rxpmaresetdone,~S_txpmaresetdone,S_gtrxreset,S_gttxreset,                            //4bit
                            S_pllreset_rpt,1'd0,1'd0,~S_txuserrdy,                                                  //4bit
                            ~S_rxuserrdy,~S_txresetdone,~S_rxresetdone,~S_pllresetdone_rpt,                         //4bit
                            ~S_rxbyteisaligned_d,S_rxnotintable_d,S_rxdisperr_d,~S_plllock_rpt                      //4bit     000
                           };


always @(posedge O_txoutclk )
    begin
        S_txoutrst    <= ~S_txresetdone ;
        S_txoutrst_d2 <= S_txoutrst     ;
        S_txoutrst_d3 <= S_txoutrst_d2  ;
        S_txoutrst_d4 <= S_txoutrst_d3  ;
    end

    
always @(posedge O_rxoutclk )
    begin
        S_rxoutrst    <= ~S_rxresetdone ;
        S_rxoutrst_d2 <= S_rxoutrst     ;
        S_rxoutrst_d3 <= S_rxoutrst_d2  ;
        S_rxoutrst_d4 <= S_rxoutrst_d3  ;
    end
    

assign  O_txoutrst = S_txoutrst_d4 ;
assign  O_rxoutrst = S_rxoutrst_d4 ;

// ---------------------------------------------------------------------------------------------------------
// txoutclk/rxoutclk  bufg_gt
// ---------------------------------------------------------------------------------------------------------
assign S_userclk_tx_reset = ~(S_txprgdivresetdone && S_txpmaresetdone);
always @(posedge S_TXUSRCLK2 or posedge S_userclk_tx_reset) 
    if (S_userclk_tx_reset) 
        begin
            S_userclk2_tx_active_meta <= 1'b0;
            S_userclk2_tx_active      <= 1'b0;
        end
    else 
        begin
            S_userclk2_tx_active_meta <= 1'b1;
            S_userclk2_tx_active      <= S_userclk2_tx_active_meta;
        end

BUFG_GT bufg_gt_TXUSRCLK
            (
            .I                                  ( S_txoutclk                      ),
            .CE                                 ( 1'd1                            ),
            .CEMASK                             ( 1'd0                            ),
            .CLR                                ( S_userclk_tx_reset              ),
            .CLRMASK                            ( 1'd0                            ),
            .DIV                                ( 3'd0                            ),
            .O                                  ( S_TXUSRCLK                      )
            );


//BUFG_GT bufg_gt_TXUSRCLK2
//            (
//            .I                                  ( S_txoutclk                      ),
//            .CE                                 ( 1'd1                            ),
//            .CEMASK                             ( 1'd0                            ),
//            .CLR                                ( S_userclk_tx_reset              ),
//            .CLRMASK                            ( 1'd0                            ),
//            .DIV                                ( S_TXUSRCLK2_DIV                 ),
//            .O                                  ( S_TXUSRCLK2                     )
//            );
//                             
assign  S_TXUSRCLK2 = S_TXUSRCLK ;


            
generate 
    if (C_CHANNEL_TXRX_SHARE_CLK == 1'd0) //1'd0-NO SHARE CLK;  1'd1-SHARE CLK
        begin : NO_SHARE_CLK
        
            assign S_userclk_rx_reset = ~(S_rxprgdivresetdone && S_rxpmaresetdone);
            always @(posedge S_RXUSRCLK2 or posedge S_userclk_rx_reset) 
                if (S_userclk_rx_reset) 
                    begin
                        S_userclk2_rx_active_meta <= 1'b0;
                        S_userclk2_rx_active      <= 1'b0;
                    end
                else 
                    begin
                        S_userclk2_rx_active_meta <= 1'b1;
                        S_userclk2_rx_active      <= S_userclk2_rx_active_meta;
                    end
            
            BUFG_GT bufg_gt_RXUSRCLK
                        (
                        .I                                  ( S_rxoutclk                      ),
                        .CE                                 ( 1'd1                            ),
                        .CEMASK                             ( 1'd0                            ),
                        .CLR                                ( S_userclk_rx_reset              ),
                        .CLRMASK                            ( 1'd0                            ),
                        .DIV                                ( 3'd0                            ),
                        .O                                  ( S_RXUSRCLK                      )
                        );                                                                      
            
//            BUFG_GT bufg_gt_RXUSRCLK2
//                        (
//                        .I                                  ( S_rxoutclk                      ),
//                        .CE                                 ( 1'd1                            ),
//                        .CEMASK                             ( 1'd0                            ),
//                        .CLR                                ( S_userclk_rx_reset              ),
//                        .CLRMASK                            ( 1'd0                            ),
//                        .DIV                                ( S_RXUSRCLK2_DIV                 ),
//                        .O                                  ( S_RXUSRCLK2                     )
//                        );     
//              
        assign  S_RXUSRCLK2 = S_RXUSRCLK ;    
              
        end
    else if (C_CHANNEL_TXRX_SHARE_CLK == 1'd1)//1'd0-NO SHARE CLK;  1'd1-SHARE CLK
        begin : SHARE_CLK
            always @(posedge S_TXUSRCLK2 or posedge S_userclk_tx_reset) 
                if (S_userclk_tx_reset) 
                    begin
                        S_userclk2_rx_active      <= 1'b0;
                    end
                else 
                    begin
                        S_userclk2_rx_active      <= S_userclk2_tx_active;
                    end

            assign  S_RXUSRCLK           = S_TXUSRCLK           ;
            assign  S_RXUSRCLK2          = S_TXUSRCLK2          ;
        end 
endgenerate


assign  O_txoutclk = S_TXUSRCLK2 ;
assign  O_rxoutclk = S_RXUSRCLK2 ;


// ---------------------------------------------------------------------------------------------------------
// test_data and check
// --------------------------------------------------------------------------------------------------------- 
serdes_test_data_gen  serdes_test_data_gen
            ( 
            .I_txoutclk                         ( O_txoutclk               ),//
            .I_txoutrst                         ( O_txoutrst               ),//
            .I_txctrl                           ( I_txctrl                 ),//
            .I_txdata                           ( I_txdata                 ),//
            .I_serdes_rate_sel                  ( S_serdes_rate_sel        ),//
            .I_8b10b_or_64b66b_sel              ( S_8b10b_or_64b66b_sel    ),//
            .I_test_en                          ( S_test_en                ),//
            .O_txctrl                           ( S_txctrl_test_sel        ),//
            .O_txdata                           ( S_txdata_test_sel        )
            );

serdes_test_data_check  serdes_test_data_check
            ( 
            .I_rxoutclk                         ( O_rxoutclk               ),//
            .I_rxoutrst                         ( O_rxoutrst               ),//
            .I_rxctrl                           ( O_rxctrl                 ),//
            .I_rxdata                           ( O_rxdata                 ),//
            .I_serdes_rate_sel                  ( S_serdes_rate_sel        ),//
            .I_8b10b_or_64b66b_sel              ( S_8b10b_or_64b66b_sel    ),//
            .I_err_cnt_clr                      ( S_err_cnt_clr            ),//
            .O_err_counter                      ( S_err_counter            )
            );

// ---------------------------------------------------------------------------------------------------------
// CHANNEL IP_CORE
// --------------------------------------------------------------------------------------------------------- 
serdes_channel_ipcore #
            (
            .C_GT_TYPE                          ( C_GT_TYPE                       )
            )                                                         
            serdes_channel_ipcore           
            (
            //CPLL   
            .CHANNEL_GTNORTHREFCLK0             ( I_gtnorthrefclk0                ),
            .CHANNEL_GTNORTHREFCLK1             ( I_gtnorthrefclk1                ),
            .CHANNEL_GTREFCLK0                  ( I_gtrefclk0                     ),
            .CHANNEL_GTREFCLK1                  ( I_gtrefclk1                     ),
            .CHANNEL_GTSOUTHREFCLK0             ( I_gtsouthrefclk0                ),
            .CHANNEL_GTSOUTHREFCLK1             ( I_gtsouthrefclk1                ),
            .CHANNEL_CPLLRESET                  ( 1'b0                            ),
            .CHANNEL_CPLLPD                     ( S_cpllreset                     ),
            .CHANNEL_CPLLLOCKDETCLK             ( I_system_clk                    ),
            .CHANNEL_CPLLREFCLKSEL              ( S_cpllrefclksel[2:0]            ),
            .CHANNEL_CPLLFBCLKLOST              ( S_cpllfbclklost                 ),
            .CHANNEL_CPLLREFCLKLOST             ( S_cpllrefclklost                ),
            .CHANNEL_CPLLLOCK                   ( S_cplllock                      ),
            //FROM QPLL                        
            .CHANNEL_QPLL0CLK                   ( I_qpll0clk                      ),
            .CHANNEL_QPLL0REFCLK                ( I_qpll0refclk                   ),
            .CHANNEL_QPLL1CLK                   ( I_qpll1clk                      ),
            .CHANNEL_QPLL1REFCLK                ( I_qpll1refclk                   ),
            //DRP                              
            .CHANNEL_DRPCLK                     ( I_system_clk                    ),
            .CHANNEL_DRPADDR                    ( S_drpaddr[9:0]                  ),
            .CHANNEL_DRPDI                      ( S_drpdi[15:0]                   ),
            .CHANNEL_DRPWE                      ( S_drpwe                         ),
            .CHANNEL_DRPEN                      ( S_drpen                         ),
            .CHANNEL_DRPDO                      ( S_drpdo[15:0]                   ),
            .CHANNEL_DRPRDY                     ( S_drprdy                        ),
            //                                
            .CHANNEL_LOOPBACK                   ( S_loopback[2:0]                 ),
            .CHANNEL_GTPOWERGOOD                ( S_gtpowergood                   ),                              
            //TX CLK                            
            .CHANNEL_TXPLLCLKSEL                ( S_txrxpllclksel[1:0]            ),
            .CHANNEL_TXSYSCLKSEL                ( S_txsysclksel[1:0]              ),
            .CHANNEL_TXOUTCLKSEL                ( S_txoutclksel[2:0]              ),
            .CHANNEL_TXPROGDIVRESET             ( S_txprogdivreset                ),
            .CHANNEL_TXPRGDIVRESETDONE          ( S_txprgdivresetdone             ),
            .CHANNEL_TXOUTCLK                   ( S_txoutclk                      ),
            .CHANNEL_TXUSRCLK                   ( S_TXUSRCLK                      ),
            .CHANNEL_TXUSRCLK2                  ( S_TXUSRCLK2                     ),
            //TX INTERFACE DATA                
            .CHANNEL_TXCTRL2                    ( S_txctrl[7:0]                   ),
            .CHANNEL_TXDATA                     ( S_txdata[127:0]                 ),
            //TX GEARBOX                       
            .CHANNEL_TXSEQUENCE                 ( S_txsequence[6:0]               ),
            .CHANNEL_TXHEADER                   ( S_txheader[5:0]                 ),
            //TX 8B10B                         
            .CHANNEL_TX8B10BEN                  ( S_tx8b10ben                     ),
            //TX PRBS                          
            .CHANNEL_TXPRBSFORCEERR             ( S_txprbsforceerr                ),
            .CHANNEL_TXPRBSSEL                  ( S_txrxprbssel[3:0]              ),
            //TX BUFFER                        
            .CHANNEL_TXBUFSTATUS                ( S_txbufstatus[1:0]              ),
            //TX Configurable Driver           
            .CHANNEL_TXDIFFCTRL                 ( S_txdiffctrl[4:0]               ),
            .CHANNEL_TXPOSTCURSOR               ( S_txpostcursor[4:0]             ),
            .CHANNEL_TXPRECURSOR                ( S_txprecursor[4:0]              ),
            .CHANNEL_TXINHIBIT                  ( S_txinhibit                     ),
            //TX PIN DATA                      
            .CHANNEL_GTTXN                      ( O_gttxn                         ),
            .CHANNEL_GTTXP                      ( O_gttxp                         ),
            //TX OTHER                                      
            .CHANNEL_TXPD                       ( {S_txpd,S_txpd}                 ),
            .CHANNEL_GTTXRESET                  ( S_gttxreset                     ),
            .CHANNEL_TXUSERRDY                  ( S_txuserrdy                     ),
            .CHANNEL_TXRESETDONE                ( S_txresetdone                   ),                                            
            .CHANNEL_TXPMARESETDONE             ( S_txpmaresetdone                ),
            //RX CLK                                        
            .CHANNEL_RXPLLCLKSEL                ( S_txrxpllclksel[1:0]            ),
            .CHANNEL_RXSYSCLKSEL                ( S_rxsysclksel[1:0]              ),
            .CHANNEL_RXOUTCLKSEL                ( S_rxoutclksel[2:0]              ),
            .CHANNEL_RXPROGDIVRESET             ( S_rxprogdivreset                ),
            .CHANNEL_RXPRGDIVRESETDONE          ( S_rxprgdivresetdone             ),
            .CHANNEL_RXOUTCLK                   ( S_rxoutclk                      ),
            .CHANNEL_RXUSRCLK                   ( S_RXUSRCLK                      ),
            .CHANNEL_RXUSRCLK2                  ( S_RXUSRCLK2                     ),
            //RX PIN DATA                                   
            .CHANNEL_GTRXN                      ( I_gtrxn                         ),
            .CHANNEL_GTRXP                      ( I_gtrxp                         ),
            //RX PMA                                       
            .CHANNEL_RXLPMEN                    ( S_rxlpmen                       ),
            .CHANNEL_RXLPMHFHOLD                ( S_rxlpmhfhold                   ),
            .CHANNEL_RXLPMLFHOLD                ( S_rxlpmlfhold                   ),
            .CHANNEL_RXDFEAGCHOLD               ( S_rxdfeagchold                  ),
            .CHANNEL_RXDFELFHOLD                ( S_rxdfelfhold                   ),
            .CHANNEL_RXCDRLOCK                  ( S_rxcdrlock                     ),
            //RX PRBS                                       
            .CHANNEL_RXPRBSCNTRESET             ( S_rxprbscntreset                ),
            .CHANNEL_RXPRBSSEL                  ( S_txrxprbssel[3:0]              ),
            .CHANNEL_RXPRBSERR                  ( S_rxprbserr                     ),
            //RX ALIGN                                       
            .CHANNEL_RXCOMMADETEN               ( S_rxcommadeten                  ),
            .CHANNEL_RXMCOMMAALIGNEN            ( S_rxmcommaalignen               ),
            .CHANNEL_RXPCOMMAALIGNEN            ( S_rxpcommaalignen               ),
            .CHANNEL_RXBYTEISALIGNED            ( S_rxbyteisaligned               ),
            //RX 8B10B                                        
            .CHANNEL_RX8B10BEN                  ( S_rx8b10ben                     ),
            .CHANNEL_RXCTRL1                    ( S_rxdisperr[15:0]               ),
            .CHANNEL_RXCTRL3                    ( S_rxnotintable[7:0]             ),
            //RX BUFFER                                      
            .CHANNEL_RXBUFSTATUS                ( S_rxbufstatus[2:0]              ),
            //RX GEARBOX                                      
            .CHANNEL_RXGEARBOXSLIP              ( S_rxgearboxslip                 ),
            .CHANNEL_RXHEADER                   ( S_rxheader[5:0]                 ),
            .CHANNEL_RXHEADERVALID              ( S_rxheadervalid[1:0]            ),
            //RX INTERFACE DATA                               
            .CHANNEL_RXCTRL0                    ( S_rxctrl[15:0]                  ),
            .CHANNEL_RXDATA                     ( S_rxdata[127:0]                 ),
            //RX OTHER                                        
            .CHANNEL_RXPD                       ( {S_rxpd,S_rxpd}                 ),
            .CHANNEL_GTRXRESET                  ( S_gtrxreset                     ),
            .CHANNEL_RXUSERRDY                  ( S_rxuserrdy                     ),
            .CHANNEL_RXRESETDONE                ( S_rxresetdone                   ),
            .CHANNEL_RXPMARESETDONE             ( S_rxpmaresetdone                )
            );


// ---------------------------------------------------------------------------------------------------------
// 8b10b_pcs_top
// ---------------------------------------------------------------------------------------------------------
//tx
generate 
    if (C_CHANNEL_FOR_CPRI_TDM == 1'd0) //1'd0-CPRI;1'd1-TDM
        begin : cpri_tx_scrambler
        
            assign S_tx_scramble_en = S_tx_scramble_sel ? S_tx_scramble_en_cpu : I_tx_scramble_en ;
            
            serdes_8b10b_cpri_tx_scrambler #                                                  
            (                                                                     
            .C_DATA_WIDTH                       ( 64                              ),
            .C_K_CTRL_WIDTH                     ( 8                               )
            )                                                                     
            serdes_8b10b_cpri_tx_scrambler                                          
            (                                                                                               
            ///Input signals                                                                                 
            .I_opt_tx_clk                       ( O_txoutclk                      ),///clock @serdes pcs                 
            .I_opt_tx_rst                       ( O_txoutrst                      ),///reset signal high active          
            .I_tx_k_ctrl                        ( S_txctrl_test_sel               ),///k code valid input                
            .I_tx_data_b_s                      ( S_txdata_test_sel               ),///data before srambling             
            .I_scramble_en                      ( S_tx_scramble_en                ),///scramble enable                   
            .I_scramble_cpri_seed               ( S_scramble_seed                 ),///cpri seed                         
            .I_opt_rate_sel                     ( S_serdes_rate_sel               ),///line rate @ serdes                                                                                                              
            ///Output signals                                                                                              
            .O_tx_k_ctrl                        ( S_tx_8b10b_ctrl                 ),///k code valid output
            .O_tx_data_a_s                      ( S_tx_8b10b_data                 ) ///data after scrambling
            );
        end
    else if (C_CHANNEL_FOR_CPRI_TDM == 1'd1)//1'd0-CPRI;1'd1-TDM 
        begin : tdm_tx_scrambler
        
            assign S_tx_scramble_en = S_tx_scramble_sel ? S_tx_scramble_en_cpu : I_tx_scramble_en ;
            
            serdes_8b10b_tdm_tx_scrambler #                                                  
            (                                                                     
            .C_DATA_WIDTH                       ( 64                              ),
            .C_K_CTRL_WIDTH                     ( 8                               )
            )                                                                     
            serdes_8b10b_tdm_tx_scrambler                                          
            (                                                                                               
            ///Input signals                                                                                 
            .I_opt_tx_clk                       ( O_txoutclk                      ),///clock @serdes pcs                 
            .I_opt_tx_rst                       ( O_txoutrst                      ),///reset signal high active          
            .I_tx_k_ctrl                        ( S_txctrl_test_sel               ),///k code valid input                
            .I_tx_data_b_s                      ( S_txdata_test_sel               ),///data before srambling             
            .I_scramble_en                      ( S_tx_scramble_en                ),///scramble enable                   
            .I_scramble_tdm_seed                ( S_scramble_seed                 ),///tdm seed                         
            .I_opt_rate_sel                     ( S_serdes_rate_sel               ),///line rate @ serdes                                                                                                              
            ///Output signals                                                                                              
            .O_tx_k_ctrl                        ( S_tx_8b10b_ctrl                 ),///k code valid output
            .O_tx_data_a_s                      ( S_tx_8b10b_data                 ) ///data after scrambling
            );
        end 
endgenerate

//rx
serdes_8b10b_rx_byte_order  serdes_8b10b_rx_byte_order
            (
            .I_rst                              ( O_rxoutrst                      ),
            .I_rx_clk                           ( O_rxoutclk                      ),
            .I_rx_data                          ( S_rxdata[63:0]                  ),
            .I_rx_k_ctrl                        ( S_rxctrl[7:0]                   ),
            .O_rx_data                          ( S_rx_order_data[63:0]           ),
            .O_rx_k_ctrl                        ( S_rx_order_ctrl[7:0]            )
            );                                                                    


generate 
    if (C_CHANNEL_FOR_CPRI_TDM == 1'd0) //1'd0-CPRI;1'd1-TDM
        begin : cpri_rx_descrambler                                                                              
            
                                                                                  
            serdes_8b10b_cpri_rx_descrambler #                                                  
            (                                                                     
            .C_DATA_WIDTH                       ( 64                              ),
            .C_K_CTRL_WIDTH                     ( 8                               )
            )                                                                     
            serdes_8b10b_cpri_rx_descrambler                                         
            (                                                                     
            ///input signal                                                       
            .I_opt_rx_clk                       ( O_rxoutclk                      ),///clock @serdes pcs
            .I_opt_rx_rst                       ( O_rxoutrst                      ),///reset signal high active
            .I_rx_k_ctrl                        ( S_rx_order_ctrl[7:0]            ),///K valid from word_adjust.v module
            .I_rx_data_b_ds                     ( S_rx_order_data[63:0]           ),///data from opt before descrambler
            .I_opt_rate_sel                     ( S_serdes_rate_sel               ),///line rate,1,2,3,4,6,10
            ///output signal                                                      
            .O_rx_k_ctrl                        ( S_rx_8b10b_ctrl                 ),///output K valid
            .O_rx_data_a_ds                     ( S_rx_8b10b_data                 ),///rx data after descrambler
            .O_descram_seed                     ( S_descram_seed                  ),///output to cpu , descrambler seed      
            .O_scramble_seed_flag               (                                 ) ///scramble seed width and change cnt
            );
        end
    else if (C_CHANNEL_FOR_CPRI_TDM == 1'd1) //1'd0-CPRI;1'd1-TDM
        begin : tdm_rx_descrambler
            
            assign S_rx_scramble_en = S_rx_scramble_sel ? S_rx_scramble_en_cpu : I_rx_scramble_en ;
                                                                                  
            serdes_8b10b_tdm_rx_descrambler #                                                  
            (                                                                     
            .C_DATA_WIDTH                       ( 64                              ),
            .C_K_CTRL_WIDTH                     ( 8                               )
            )                                                                     
            serdes_8b10b_tdm_rx_descrambler                                         
            (                                                                     
            ///input signal                                                       
            .I_opt_rx_clk                       ( O_rxoutclk                      ),///clock @serdes pcs
            .I_opt_rx_rst                       ( O_rxoutrst                      ),///reset signal high active
            .I_rx_k_ctrl                        ( S_rx_order_ctrl[7:0]            ),///K valid from word_adjust.v module
            .I_rx_data_b_ds                     ( S_rx_order_data[63:0]           ),///data from opt before descrambler
            .I_opt_rate_sel                     ( S_serdes_rate_sel               ),///line rate,1,2,3,4,6,10
            .I_scramble_tdm_seed                ( S_scramble_seed                 ),///tdm seed
            .I_scramble_tdm_en                  ( S_rx_scramble_en                ),  
            ///output signal                                                      
            .O_rx_k_ctrl                        ( S_rx_8b10b_ctrl                 ),///output K valid
            .O_rx_data_a_ds                     ( S_rx_8b10b_data                 ) ///rx data after descrambler
            );
            
            assign S_descram_seed = S_scramble_seed ;
        end 
endgenerate
// ---------------------------------------------------------------------------------------------------------
// 64b66b_pcs_top
// ---------------------------------------------------------------------------------------------------------
serdes_64b66b_pcs_top  serdes_64b66b_pcs_top
            (
            ///reset and clk                                  
            .I_pcs_tx_clk                       ( O_txoutclk                      ), ///tx clock signal, drived by serdes output clk       
            .I_pcs_tx_rst                       ( O_txoutrst                      ), ///tx reset signal, high active                                                                           
            .I_pcs_rx_clk                       ( O_rxoutclk                      ), ///rx clock signal, drived by serdes output clk       
            .I_pcs_rx_rst                       ( O_rxoutrst                      ), ///rx reset signal, high active                       
                                                                                                                                           
            ///RX channel                                                                                                                  
            .I_rx_data                          ( S_rxdata[63:0]                  ), ///rx data from serdes PMA                            
            .I_rx_valid                         ( 1'b1                            ), ///valid signal of rx data from serdes PMA            
            .I_rx_header                        ( S_rxheader[1:0]                 ), ///sync header from serdes PMA                        
            .I_rx_header_valid                  ( S_rxheadervalid[0]              ), ///valid signal of sync header from serdes PMA        
                                                                                                                                           
            .O_rx_data                          ( S_rx_64b66b_data[63:0]          ), ///rx data output                                     
            .O_rx_ctrl                          ( S_rx_64b66b_ctrl[7:0]           ), ///rx control word ouput                              
            .O_rx_gearbox_slip                  ( S_rxgearboxslip                 ), ///RX Gearbox slip signal to serdes gearbox           
                                                                                                                                           
            ///TX channel                                                                                                                  
            .I_tx_data                          ( S_txdata_test_sel               ), ///tx data input                                      
            .I_tx_ctrl                          ( S_txctrl_test_sel               ), ///tx control word input                              
                                                                                                                                           
            .O_tx_data                          ( S_tx_64b66b_data                ), ///tx data to serdes PMA                                
            .O_tx_header                        ( S_tx_64b66b_header              ), ///tx sync header to serdes PMA                           
            .O_tx_seq                           ( S_tx_64b66b_seq                 ), ///tx sequence to serdes PMA                             
                                                                                                                                     
            ///maintainable and measurable port                                                                                      
            .I_rx_resetdone                     ( S_rxresetdone                   ), ///after rx channel reset over,block sync start   
            .O_rx_block_sync_lock               ( S_rx_block_sync_lock            ), ///rx channel 64B66B PCS block sync indication                 
            .O_rx_block_sync_lock_cnt           ( S_rx_block_sync_lock_cnt        ), ///rx channel 64B66B PCS block sync indication changed counter 
            .O_rx_block_sync_head_cv            ( S_rx_block_sync_head_cv         ), ///sync header violate                            
            .O_rx_block_sync_header_err_cnt     ( S_rx_block_sync_header_err_cnt  ), ///sync header violate counter                    
            .O_rx_block_sync_state              ( S_rx_block_sync_state           ), ///block sync FSM state                                             
            .O_rx_decode_state                  ( S_rx_decode_state               ), ///rx decode FSM state                            
            .O_rx_decode_state_cnt              ( S_rx_decode_state_cnt           ), ///counter of rx decode FSM state changes         
            .O_tx_encode_state                  ( S_tx_encode_state               ), ///tx decode FSM state                            
            .O_tx_encode_state_cnt              ( S_tx_encode_state_cnt           )  ///counter of tx decode FSM state changes         
            );


// ---------------------------------------------------------------------------------------------------------
// SERDES的8B10B输出 与 64B66B输出 的选择
// ---------------------------------------------------------------------------------------------------------
///TX
always @(posedge O_txoutclk or posedge O_txoutrst)
    if(O_txoutrst)
        begin           	                                                   
            S_txctrl                       <=  8'd0                           ;    
            S_txdata                       <= 128'd0                          ;    
            S_txsequence                   <= 7'd0                            ;    
            S_txheader                     <= 6'd0                            ;    
        end                                                                        
    else if(S_8b10b_or_64b66b_sel) 
        begin           	  
            S_txctrl                       <=  8'd0                           ;
            S_txdata                       <= {64'd0,S_tx_64b66b_data}        ;
            S_txsequence                   <= {1'd0,S_tx_64b66b_seq}          ;
            S_txheader                     <= {4'd0,S_tx_64b66b_header}       ;
        end                                                                   
    else                                                                      
        begin                                                                 
            S_txctrl                       <= S_tx_8b10b_ctrl                 ;
            S_txdata                       <= {64'd0,S_tx_8b10b_data}         ;
            S_txsequence                   <= 7'd0                            ;
            S_txheader                     <= 6'd0                            ;
        end                                

    
    
///RX
always @(posedge O_rxoutclk or posedge O_rxoutrst)
    if(O_rxoutrst)
        begin
            O_rxctrl                       <= 8'd0                            ;
            O_rxdata                       <= 64'd0                           ;
        end      
    else if(S_8b10b_or_64b66b_sel)
        begin
            O_rxctrl                       <= S_rx_64b66b_ctrl[7:0]           ;
            O_rxdata                       <= S_rx_64b66b_data[63:0]          ;
        end                                                                   
    else                                                                      
        begin                                                                 
            O_rxctrl                       <= S_rx_8b10b_ctrl[7:0]            ;
            O_rxdata                       <= S_rx_8b10b_data[63:0]           ;
        end     
        
assign  S_txbufstatus_d           = S_8b10b_or_64b66b_sel ? |S_txbufstatus[1:0]        : S_txbufstatus[1]    ;
assign  S_rxbufstatus_d           = S_8b10b_or_64b66b_sel ? |S_rxbufstatus[1:0]        : S_rxbufstatus[2]    ;
assign  S_rxdisperr_d             = S_8b10b_or_64b66b_sel ? 1'b0                       : |S_rxdisperr[7:0]   ;
assign  S_rxnotintable_d          = S_8b10b_or_64b66b_sel ? 1'b0                       : |S_rxnotintable     ;
assign  S_rxbyteisaligned_d       = S_8b10b_or_64b66b_sel ? 1'b1                       : S_rxbyteisaligned   ;
assign  S_rx_block_sync_head_cv_d = S_8b10b_or_64b66b_sel ? S_rx_block_sync_head_cv    : 1'b0                ;
assign  S_rx_block_sync_lock_d    = S_8b10b_or_64b66b_sel ? S_rx_block_sync_lock       : 1'b1                ;
// ---------------------------------------------------------------------------------------------------------
// CHANNEL DRP
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
// CHANNEL Reset
// ---------------------------------------------------------------------------------------------------------        
assign  S_gt_rx_align       = S_state_err_rst_off ? 1'd1 : S_rxbyteisaligned_d &&       
                                                           (!S_rxnotintable_d) &&      
                                                           (!S_rxdisperr_d) &&         
                                                           (!S_rx_block_sync_head_cv_d) ;
//((S_loopback[2:0]== 3'b100) || (S_loopback[2:0]== 3'b110)) || (S_txrxprbssel[3:0] != 4'b0000))    
                                                              
                                                              
assign  S_serdes_rx_ksync_d = S_state_err_rst_off ? 1'd1 : S_serdes_rx_ksync ;


///SERDES TXRX的用到的PLL状态标志选择
always @(posedge I_system_clk or posedge I_system_rst)
    if(I_system_rst)
        begin
            S_pllreset_rpt      <= 1'b1   ;
            S_pllresetdone_rpt  <= 1'b0   ;
            S_plllock_rpt       <= 1'b0   ;
            S_pllrefclklost_rpt <= 1'b1   ;
            S_pllfbclklost_rpt  <= 1'b1   ;
            S_pllrst_state_rpt  <= 3'b000 ;
            S_gtpowergood_rpt   <= 1'b0   ;
            O_gtpowergood2qpll0 <= 1'b1   ;
            O_gtpowergood2qpll1 <= 1'b1   ;
        end
    else
        case(S_txrxpllclksel)
            2'b00   :
                begin
                    S_pllreset_rpt             <= S_cpllreset                     ; 
                    S_pllresetdone_rpt         <= S_cpllresetdone                 ; 
                    S_plllock_rpt              <= S_cplllock                      ; 
                    S_pllrefclklost_rpt        <= S_cpllrefclklost                ; 
                    S_pllfbclklost_rpt         <= S_cpllfbclklost                 ; 
                    S_pllrst_state_rpt         <= S_cpllrst_state                 ;
                    S_gtpowergood_rpt          <= S_gtpowergood                   ;
                    O_gtpowergood2qpll0        <= 1'b1                            ;
                    O_gtpowergood2qpll1        <= 1'b1                            ; 
                end                            
            2'b11   :                          
                begin                          
                    S_pllreset_rpt             <= I_qpll0reset                    ;
                    S_pllresetdone_rpt         <= I_qpll0resetdone                ;
                    S_plllock_rpt              <= I_qpll0lock                     ;
                    S_pllrefclklost_rpt        <= I_qpll0refclklost               ;
                    S_pllfbclklost_rpt         <= I_qpll0fbclklost                ;
                    S_pllrst_state_rpt         <= I_qpll0rst_state                ;
                    S_gtpowergood_rpt          <= I_qpll0gtpowergood              ;
                    O_gtpowergood2qpll0        <= S_gtpowergood                   ;
                    O_gtpowergood2qpll1        <= 1'b1                            ;
                end                            
            2'b10   :                                                               
                begin                          
                    S_pllreset_rpt             <= I_qpll1reset                    ;
                    S_pllresetdone_rpt         <= I_qpll1resetdone                ;
                    S_plllock_rpt              <= I_qpll1lock                     ;
                    S_pllrefclklost_rpt        <= I_qpll1refclklost               ;
                    S_pllfbclklost_rpt         <= I_qpll1fbclklost                ;
                    S_pllrst_state_rpt         <= I_qpll1rst_state                ;
                    S_gtpowergood_rpt          <= I_qpll1gtpowergood              ;
                    O_gtpowergood2qpll0        <= 1'b1                            ;
                    O_gtpowergood2qpll1        <= S_gtpowergood                   ;
                end                            
            default :                          
                begin                          
                    S_pllreset_rpt             <= 1'b1                            ;
                    S_pllresetdone_rpt         <= 1'b0                            ;
                    S_plllock_rpt              <= 1'b0                            ;
                    S_pllrefclklost_rpt        <= 1'b1                            ;
                    S_pllfbclklost_rpt         <= 1'b1                            ;
                    S_pllrst_state_rpt         <= 3'b000                          ;
                    S_gtpowergood_rpt          <= 1'b0                            ;
                    O_gtpowergood2qpll0        <= 1'b1                            ;
                    O_gtpowergood2qpll1        <= 1'b1                            ;
                end
        endcase 


serdes_channel_rx_ksync #                                                  
            (                                                                     
            .C_CHANNEL_FOR_CPRI_TDM             ( C_CHANNEL_FOR_CPRI_TDM          )
            )                                                                     
            serdes_channel_rx_ksync
            (
            .I_serdes_rx_rst                    ( O_rxoutrst                      ),//
            .I_serdes_rx_clk                    ( O_rxoutclk                      ),//
            .I_serdes_rx_k_flag                 ( O_rxctrl                        ),//
            .I_serdes_rx_data                   ( O_rxdata                        ),//
            .I_serdes_rate                      ( S_serdes_rate_sel               ),//
            .I_8b10b_or_64b66b_sel              ( S_8b10b_or_64b66b_sel           ),//
            .O_serdes_rx_ksync                  ( S_serdes_rx_ksync               ) //
            );


serdes_channel_rst     serdes_channel_rst
            ( 
            .I_clk                              ( I_system_clk                    ),
            .I_rst                              ( I_system_rst                    ),
            //CPLL                                                                 
            .I_pllpd                            ( 1'b0                            ),//belong to I_system_clk
            .I_force_pllreset                   ( S_force_cpllreset               ),//belong to I_system_clk
            .I_gtpowergood                      ( S_gtpowergood                   ),//async
            .I_plllock                          ( S_cplllock                      ),//async
            .I_pllrefclklost                    ( S_cpllrefclklost                ),//async
            .I_pllfbclklost                     ( S_cpllfbclklost                 ),//async
            .O_pllreset                         ( S_cpllreset                     ),//belong to I_system_clk
            .O_pllrst_state                     ( S_cpllrst_state                 ),//belong to I_system_clk
            .O_pllresetdone                     ( S_cpllresetdone                 ),//belong to I_system_clk
            //TX                                                                   
            .I_txpd                             ( S_txpd                          ),//belong to I_system_clk
            .I_force_txreset                    ( S_force_gttxreset               ),//belong to I_system_clk
            .I_txpllresetdone                   ( S_pllresetdone_rpt              ),//belong to I_system_clk
            .I_txresetdone                      ( S_txresetdone                   ),//belong to O_txoutclk
            .I_txbufstatus                      ( 1'd0                            ),//belong to O_txoutclk
            .I_userclk2_tx_active               ( S_userclk2_tx_active            ),
            .O_txprogdivreset                   ( S_txprogdivreset                ),
            .O_txuserrdy                        ( S_txuserrdy                     ),//belong to I_system_clk
            .O_gttxreset                        ( S_gttxreset                     ),//belong to I_system_clk
            .O_txrst_state                      ( S_txrst_state                   ),//belong to I_system_clk
            //RX                                                                   
            .I_rxpd                             ( S_rxpd                          ),//belong to I_system_clk
            .I_force_rxreset                    ( S_force_gtrxreset               ),//belong to I_system_clk
            .I_rxpllresetdone                   ( S_pllresetdone_rpt              ),//belong to I_system_clk
            .I_rxcdrlock                        ( S_rxcdrlock                     ),
            .I_rxresetdone                      ( S_rxresetdone                   ),//belong to O_rxoutclk
            .I_rxbufstatus                      ( 1'd0                            ),//belong to O_rxoutclk
            .I_rxbyteisaligned                  ( S_gt_rx_align                   ),//belong to O_rxoutclk
            .I_userclk2_rx_active               ( S_userclk2_rx_active            ),
            .I_serdes_rx_ksync                  ( S_serdes_rx_ksync_d             ),
            .O_rxprogdivreset                   ( S_rxprogdivreset                ),
            .O_rxuserrdy                        ( S_rxuserrdy                     ),//belong to I_system_clk
            .O_gtrxreset                        ( S_gtrxreset                     ),//belong to I_system_clk
            .O_rxrst_state                      ( S_rxrst_state                   ),//belong to I_system_clk
            .O_rxdfeagchold                     ( S_rxdfeagchold                  ),//async
            .O_rxdfelfhold                      ( S_rxdfelfhold                   ),//async
            .O_rxlpmhfhold                      ( S_rxlpmhfhold                   ),//async
            .O_rxlpmlfhold                      ( S_rxlpmlfhold                   ),//async
            //txinhibit                                                            
            .I_txusr2_clk                       ( O_txoutclk                      ),
            .I_force_txinhibit                  ( S_force_txinhibit               ),//belong to I_system_clk
            .O_txinhibit                        ( S_txinhibit                     ) //belong to O_txoutclk
            );


endmodule        
