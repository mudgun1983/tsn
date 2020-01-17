//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_8b10b_cpri_rx_descrambler.v
// AUTHOR       : Wang Kepan
// Department   : ZTE-BBU
// Email        : wang.kepan@zte.com.cn
//------------------------------------------------------------------
// Module Hiberarchy:
//x                                      |----xxx1
//x                                      |----xxx2
//x serdes_8b10b_cpri_rx_descrambler-----|----xxx3
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

module serdes_8b10b_cpri_rx_descrambler
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
      ///output signal
       output reg [(C_K_CTRL_WIDTH - 1):0] O_rx_k_ctrl          ,///output K valid
       output reg [(C_DATA_WIDTH   - 1):0] O_rx_data_a_ds       ,///rx data after descrambler
       output                       [30:0] O_descram_seed       ,///output to cpu , descrambler seed      
       output                       [15:0] O_scramble_seed_flag  ///scramble seed width and change cnt

      );

///--interanl reg----------------
reg                     [7:0]  S_rx_k_ctrl_1d     ; ///I_rx_k_valid delay 1 clk
reg                     [7:0]  S_rx_k_ctrl_2d     ; ///I_rx_k_valid delay 2 clk
reg                     [7:0]  S_rx_k_ctrl_3d     ; ///I_rx_k_valid delay 3 clk
reg                     [7:0]  S_rx_k_ctrl_4d     ; ///I_rx_k_valid delay 4 clk
reg                     [7:0]  S_rx_k_ctrl_5d     ; ///I_rx_k_valid delay 5 clk
                               
reg                    [63:0]  S_rx_data_b_ds_1d  ; ///I_rx_data_b_ds delay 1 clk
reg                    [63:0]  S_rx_data_b_ds_2d  ; ///I_rx_data_b_ds delay 2 clk
reg                    [63:0]  S_rx_data_b_ds_3d  ; ///I_rx_data_b_ds delay 3 clk
reg                    [63:0]  S_rx_data_b_ds_4d  ; ///I_rx_data_b_ds delay 4 clk
reg                    [63:0]  S_rx_data_b_ds_5d  ; ///I_rx_data_b_ds delay 5 clk

reg                    [15:0]  S_second_seed_low  ; ///S_second_seed_low  15 bit
reg                    [15:0]  S_second_seed_high ; ///S_second_seed_high  15 bit

wire                   [30:0]  S_second_seed      ; ///S_second_seed
wire                   [31:0]  S_first_seed       ; ///S_first_seed
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
       S_rx_k_ctrl_2d    <= S_rx_k_ctrl_1d    ;
       S_rx_k_ctrl_3d    <= S_rx_k_ctrl_2d    ;
       S_rx_k_ctrl_4d    <= S_rx_k_ctrl_3d    ;
       S_rx_k_ctrl_5d    <= S_rx_k_ctrl_4d    ;
       
       S_rx_data_b_ds_1d <= (C_DATA_WIDTH == 64) ? I_rx_data_b_ds : 
                            (C_DATA_WIDTH == 32) ? {{32{1'd0}},I_rx_data_b_ds}:
                            (C_DATA_WIDTH == 16) ? {{48{1'd0}},I_rx_data_b_ds}: 64'd0 ;
       S_rx_data_b_ds_2d <= S_rx_data_b_ds_1d ;
       S_rx_data_b_ds_3d <= S_rx_data_b_ds_2d ;
       S_rx_data_b_ds_4d <= S_rx_data_b_ds_3d ;
       S_rx_data_b_ds_5d <= S_rx_data_b_ds_4d ;
    end
///----------------------------------------------------------------------------

///get second seed data from scramble data
always @ ( posedge I_opt_rx_clk )
    begin
       if( S_rx_k_ctrl_2d[0] )
          case (S_data_width)
             2'b00 :
              begin
                 S_second_seed_low <= I_rx_data_b_ds[15:0] ^ (16'h5050);
              end
             2'b01 :
              begin
                 S_second_seed_low <= S_rx_data_b_ds_1d[15: 0] ^ (16'h5050);
              end
             2'b10 :
              begin
                 S_second_seed_low <= S_rx_data_b_ds_2d[47:32] ^ (16'h5050);
              end
             default : ;
          endcase
    end

always @ ( posedge I_opt_rx_clk )
    begin
       if ( S_rx_k_ctrl_3d[0] )
          case (S_data_width)
            2'b00 :
              begin
                 S_second_seed_high <= I_rx_data_b_ds[15:0] ^ (16'h5050);
              end
            2'b01 :
              begin
                 S_second_seed_high <= S_rx_data_b_ds_2d[31:16] ^ (16'h5050);
              end
            2'b10 :
              begin
                 S_second_seed_high <= S_rx_data_b_ds_3d[63:48] ^ (16'h5050);
              end
            default : ;
          endcase
    end

///get second 31bit seed
assign  S_second_seed[30:0] = {S_second_seed_high[14:0],S_second_seed_low[15:0]};

//from second seed get the first second
assign  S_first_seed[0 ] = S_first_seed[ 3]  ^ S_first_seed[31]   ; 
assign  S_first_seed[1 ] = S_first_seed[ 4]  ^ S_second_seed[ 0]  ; 
assign  S_first_seed[2 ] = S_first_seed[ 5]  ^ S_second_seed[ 1]  ; 
assign  S_first_seed[3 ] = S_first_seed[ 6]  ^ S_second_seed[ 2]  ; 
assign  S_first_seed[4 ] = S_first_seed[ 7]  ^ S_second_seed[ 3]  ; 
assign  S_first_seed[5 ] = S_first_seed[ 8]  ^ S_second_seed[ 4]  ; 
assign  S_first_seed[6 ] = S_first_seed[ 9]  ^ S_second_seed[ 5]  ; 
assign  S_first_seed[7 ] = S_first_seed[10]  ^ S_second_seed[ 6]  ; 
assign  S_first_seed[8 ] = S_first_seed[11]  ^ S_second_seed[ 7]  ; 
assign  S_first_seed[9 ] = S_first_seed[12]  ^ S_second_seed[ 8]  ; 
assign  S_first_seed[10] = S_first_seed[13]  ^ S_second_seed[ 9]  ; 
assign  S_first_seed[11] = S_first_seed[14]  ^ S_second_seed[10]  ; 
assign  S_first_seed[12] = S_first_seed[15]  ^ S_second_seed[11]  ; 
assign  S_first_seed[13] = S_first_seed[16]  ^ S_second_seed[12]  ; 
assign  S_first_seed[14] = S_first_seed[17]  ^ S_second_seed[13]  ; 
assign  S_first_seed[15] = S_first_seed[18]  ^ S_second_seed[14]  ; 
assign  S_first_seed[16] = S_first_seed[19]  ^ S_second_seed[15]  ; 
assign  S_first_seed[17] = S_first_seed[20]  ^ S_second_seed[16]  ; 
assign  S_first_seed[18] = S_first_seed[21]  ^ S_second_seed[17]  ; 
assign  S_first_seed[19] = S_first_seed[22]  ^ S_second_seed[18]  ; 
assign  S_first_seed[20] = S_first_seed[23]  ^ S_second_seed[19]  ; 
assign  S_first_seed[21] = S_first_seed[24]  ^ S_second_seed[20]  ; 
assign  S_first_seed[22] = S_first_seed[25]  ^ S_second_seed[21]  ; 
assign  S_first_seed[23] = S_first_seed[26]  ^ S_second_seed[22]  ; 
assign  S_first_seed[24] = S_first_seed[27]  ^ S_second_seed[23]  ; 
assign  S_first_seed[25] = S_first_seed[28]  ^ S_second_seed[24]  ; 
assign  S_first_seed[26] = S_first_seed[29]  ^ S_second_seed[25]  ; 
assign  S_first_seed[27] = S_first_seed[30]  ^ S_second_seed[26]  ; 
assign  S_first_seed[28] = S_first_seed[31]  ^ S_second_seed[27]  ; 
assign  S_first_seed[29] = S_second_seed[28] ^ S_second_seed[ 0]  ; 
assign  S_first_seed[30] = S_second_seed[29] ^ S_second_seed[ 1]  ; 
assign  S_first_seed[31] = S_second_seed[30] ^ S_second_seed[ 2]  ;               

///-----------------------------------------------------------------------------------

///According to the different data width select different scramble seed to cpri_tx_scrambler.v
always @ ( posedge I_opt_rx_clk )
    begin
       S_first_seed_1d <= S_first_seed[30:0];
    end

assign O_descram_seed = S_first_seed_1d ;    

///call cpri_tx_scrambler.v module to descrambler,B^A^A = B
serdes_8b10b_cpri_tx_scrambler #
          (
           .C_DATA_WIDTH         (C_DATA_WIDTH        ) ,
           .C_K_CTRL_WIDTH       (C_K_CTRL_WIDTH      )
          )
         U0_serdes_8b10b_cpri_tx_scrambler
         (
         ///Input signals
           .I_opt_tx_clk         ( I_opt_rx_clk                            ),///clock @serdes pcs
           .I_opt_tx_rst         ( I_opt_rx_rst                            ),///reset signal high active
           .I_tx_k_ctrl          ( S_rx_k_ctrl_5d[(C_K_CTRL_WIDTH - 1) :0] ),///k code valid input
           .I_tx_data_b_s        ( S_rx_data_b_ds_5d[(C_DATA_WIDTH - 1):0] ),///data before srambling
           .I_scramble_en        ( 1'b1                                    ),///scramble enable
           .I_scramble_cpri_seed ( S_first_seed_1d                         ),///cpri seed
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