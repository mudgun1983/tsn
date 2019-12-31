//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_8b10b_tdm_rx_descrambler.v
// AUTHOR       : Wang Kepan
// Department   : ZTE-BBU
// Email        : wang.kepan@zte.com.cn
//------------------------------------------------------------------
// Module Hiberarchy:
//x                                      |----xxx1
//x                                      |----xxx2
//x serdes_8b10b_tdm_rx_descrambler------|----xxx3
//x                                      |----xxx4
//x                                      |----xxx5
//-----------------------------------------------------------------
// Release History:
//-----------------------------------------------------------------
// Version       Date         Author      Description
// 1.0        02-26-2012   Wang Kepan
// 1.1        mm-dd-yyyy      Author   修改、增减的主要内容描述
//-----------------------------------------------------------------
// Main Function:(Describing main function of the module)
// a)当数据传输速率为4.9g，6.144g和9.8g时，对从serdes输出的数据进行解扰处理
// b)对随路的K码信号进行打拍处理，与解扰后的数据对齐输出
//-----------------------------------------------------------------
//REUSE ISSUES: xxxxxxxx
//Reset Strategy: xxxxxxxx
//Clock Strategy: xxxxxxxx
//Critical Timing: xxxxxxxx
//Asynchronous Interface: xxxxxxxx
//END_HEADER--------------------------------------------------------

module serdes_8b10b_tdm_rx_descrambler
      #(
        parameter C_DATA_WIDTH        = 64 ,
        parameter C_K_CTRL_WIDTH      = 8
       )
      (
      ///input signal
       input                               I_opt_rx_clk         ,///clock @serdes pcs
       input                               I_opt_rx_rst         ,///reset signal high active
       input      [(C_K_CTRL_WIDTH - 1):0] I_rx_k_ctrl          ,///K valid from word_adjust.v module
       input      [(C_DATA_WIDTH   - 1):0] I_rx_data_b_ds       ,///data from opt before descrambler
       input                        [ 3:0] I_opt_rate_sel       ,///line rate,1,2,3,4,6,10
       input  wire                  [30:0] I_scramble_tdm_seed  ,///tdm seed
       input                               I_scramble_tdm_en    ,
      ///output signal
       output reg [(C_K_CTRL_WIDTH - 1):0] O_rx_k_ctrl          ,///output K valid
       output reg [(C_DATA_WIDTH   - 1):0] O_rx_data_a_ds        ///rx data after descrambler

      );

///--interanl reg----------------
reg                     [7:0]  S_rx_k_ctrl_1d     ; ///I_rx_k_valid delay 1 clk
                               
reg                    [63:0]  S_rx_data_b_ds_1d  ; ///I_rx_data_b_ds delay 1 clk

reg                    [30:0]  S_first_seed_1d    ; 

wire [(C_K_CTRL_WIDTH - 1):0]  S_descram_k_ctrl   ; ///descram result k_valid
wire [(C_DATA_WIDTH   - 1):0]  S_descram_data     ; ///descram result rx_data

wire                   [ 1:0]  S_data_width       ; /// data width select

///-----------------------------------------------------------------------------
///      Main Verilog code        Begin
///-----------------------------------------------------------------------------

assign S_data_width = (C_DATA_WIDTH == 64) ? 2'b10 : ((C_DATA_WIDTH == 32) ? 2'b01 : 2'b00) ;

///------------------signal delay-----------------------------------------------
///I_rx_k_valid,I_init_done signal,I_rx_data_b_ds signal delay 1 clk
always @ ( posedge I_opt_rx_clk )
    begin
       S_rx_k_ctrl_1d    <= (C_K_CTRL_WIDTH == 8) ? I_rx_k_ctrl : 
                            (C_K_CTRL_WIDTH == 4) ? {{4{1'd0}},I_rx_k_ctrl} :
                            (C_K_CTRL_WIDTH == 2) ? {{6{1'd0}},I_rx_k_ctrl} : 8'd0;
       
       S_rx_data_b_ds_1d <= (C_DATA_WIDTH == 64) ? I_rx_data_b_ds : 
                            (C_DATA_WIDTH == 32) ? {{32{1'd0}},I_rx_data_b_ds}:
                            (C_DATA_WIDTH == 16) ? {{48{1'd0}},I_rx_data_b_ds}: 64'd0 ;
    end             

///-----------------------------------------------------------------------------------

///According to the different data width select different scramble seed to tdm_tx_scrambler.v
always @ ( posedge I_opt_rx_clk )
    begin
       S_first_seed_1d <= I_scramble_tdm_seed[30:0];
    end
   

///call tdm_tx_scrambler.v module to descrambler,B^A^A = B
serdes_8b10b_tdm_tx_scrambler #
          (
           .C_DATA_WIDTH         (C_DATA_WIDTH        ) ,
           .C_K_CTRL_WIDTH       (C_K_CTRL_WIDTH      )
          )
         U0_serdes_8b10b_tdm_tx_scrambler
         (
         ///Input signals
           .I_opt_tx_clk         ( I_opt_rx_clk                            ),///clock @serdes pcs
           .I_opt_tx_rst         ( I_opt_rx_rst                            ),///reset signal high active
           .I_tx_k_ctrl          ( S_rx_k_ctrl_1d[(C_K_CTRL_WIDTH - 1) :0] ),///k code valid input
           .I_tx_data_b_s        ( S_rx_data_b_ds_1d[(C_DATA_WIDTH - 1):0] ),///data before srambling
           .I_scramble_en        ( I_scramble_tdm_en                       ),///scramble enable
           .I_scramble_tdm_seed  ( S_first_seed_1d                         ),///tdm seed
           .I_opt_rate_sel       ( I_opt_rate_sel                          ),///line rate @ serdes

         ///Output signals
           .O_tx_k_ctrl          ( S_descram_k_ctrl                        ),///k code valid output
           .O_tx_data_a_s        ( S_descram_data                          ) ///data after scrambling
         );

///-----------------signal output----------------------------------------------
///output descram I_rx_k_ctrl,alignment with decsram data,delay 8 clk
always @ ( posedge I_opt_rx_clk )
    begin
       O_rx_data_a_ds <= S_descram_data;
       O_rx_k_ctrl    <= S_descram_k_ctrl;
    end
///-----------------------------------------------------------------------------

///-----------------------------------------------------------------------------
///              Main Verilog code        End
///-----------------------------------------------------------------------------
endmodule