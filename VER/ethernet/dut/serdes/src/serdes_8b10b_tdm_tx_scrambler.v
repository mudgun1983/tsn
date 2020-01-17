//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_8b10b_tdm_tx_scrambler.v
// AUTHOR       : Wang Kepan
// Department   : ZTE-BBU
// Email        : wang.kepan@zte.com.cn
//------------------------------------------------------------------
// Module Hiberarchy:
//x                                    |----xxx1
//x                                    |----xxx2
//x serdes_8b10b_tdm_tx_scrambler------|----xxx3
//x                                    |----xxx4
//x                                    |----xxx5
//-----------------------------------------------------------------
// Release History:
//-----------------------------------------------------------------
// Version       Date         Author      Description
// 1.0        02-26-2012   Wang Kepan
// 1.1        mm-dd-yyyy      Author   修改、增减的主要内容描述
//-----------------------------------------------------------------
// Main Function:(Describing main function of the module)
// a)当数据传输速率为4.9g，6.144g和9.8g时，对从serdes输出的数据进行加扰处理
// b)对随路的K码信号进行打拍处理，与加扰后的数据对齐输出
//-----------------------------------------------------------------
//REUSE ISSUES: xxxxxxxx
//Reset Strategy: xxxxxxxx
//Clock Strategy: xxxxxxxx
//Critical Timing: xxxxxxxx
//Asynchronous Interface: xxxxxxxx
//END_HEADER--------------------------------------------------------


module  serdes_8b10b_tdm_tx_scrambler
        #(
          parameter C_DATA_WIDTH        = 64 ,
          parameter C_K_CTRL_WIDTH      = 8
         )
        (                                                                                               
       ///Input signals                                                                                 
         input                               I_opt_tx_clk         ,///clock @serdes pcs                 
         input                               I_opt_tx_rst         ,///reset signal high active          
         input  wire [C_K_CTRL_WIDTH - 1:0]  I_tx_k_ctrl          ,///k code valid input                
         input  wire [C_DATA_WIDTH   - 1:0]  I_tx_data_b_s        ,///data before srambling             
         input                               I_scramble_en        ,///scramble enable                   
         input  wire [30:0]                  I_scramble_tdm_seed  ,///tdm seed                         
         input  wire [ 3:0]                  I_opt_rate_sel       ,///line rate @ serdes                
                                                                                                        
       ///Output signals                                                                                
         output reg  [C_K_CTRL_WIDTH - 1:0]  O_tx_k_ctrl          ,///k code valid output
         output reg  [C_DATA_WIDTH   - 1:0]  O_tx_data_a_s         ///data after scrambling
        );


///--reg type internal node--
reg                            S_scramble_enable     ; /// real scramble enable
reg                    [ 7:0]  S_cw_cnt              ; /// control word counter
reg                    [ 6:0]  S_chip_clk_cnt        ; /// chip data counter
reg                    [ 6:0]  S_chip_clk_cnt_sel    ; /// chip data counter select
                                                     
wire                   [15:0]  S_mask_word           ; /// mask word
wire                           S_mask_word_en        ; /// mask word enable                                                     
wire                   [ 1:0]  S_data_width          ; /// data width select
wire                   [31:0]  S_current_value       ; /// scrameble word first
wire                   [31:0]  S_current_value_high  ; /// scrameble word from first scrameble word

reg                    [31:0]  S_current_value_16bit ; /// get from S_current_value_word0
reg                    [31:0]  S_current_value_32bit ; /// {S_current_value_word1,S_current_value_word0}                                                   
reg                    [63:0]  S_current_value_64bit ; /// {S_current_value_word3,S_current_value_word2,S_current_value_word1,S_current_value_word0} 

wire                   [31:0]  S_next_value_16bit    ; /// next value,16bit scramble 
wire                   [31:0]  S_next_value_32bit    ; /// next value,32bit scramble
wire                   [63:0]  S_next_value_64bit    ; /// next value,64bit scramble

reg    [C_DATA_WIDTH   - 1:0]  S_tdm_data_b_s_1d     ; /// I_tx_data_b_s delay 1 clock 
reg  [(C_K_CTRL_WIDTH - 1):0]  S_tx_k_ctrl_1d        ; /// k code valid input delay 1 clk

///-----------------------------------------------------------------------------
///      Main Verilog code        Begin
///-----------------------------------------------------------------------------

assign S_data_width = (C_DATA_WIDTH == 64) ? 2'b10 : ((C_DATA_WIDTH == 32) ? 2'b01 : 2'b00) ;

///--------------------scrambler enable---------------------------------
///scramble is enable only in 4.9152(0100),6.144(0110)and 9.8304(1010)GHz
///0：1.2288g\1：2.4576g\2：3.0720g\3：4.9152g\4：6.1440g\6：9.8304g

always @ ( posedge I_opt_tx_clk )
    begin
       S_scramble_enable <= I_scramble_en && (
                                              (I_opt_rate_sel == 4'b0100) ||
                                              (I_opt_rate_sel == 4'b0110));
    end
///------------------------------------------------------------------------------

///-----------------------------control word counter-----------------------------
///chip data counter (该部分根据不同的光口速率和serdes侧数据位宽确定一个3.84Mchip内有多少个clk)
always @ ( posedge I_opt_tx_clk )
    begin
       case ({I_opt_rate_sel,S_data_width})
       
          6'b0100_00: S_chip_clk_cnt_sel <= 7'd79 ;///16bit
          6'b0100_01: S_chip_clk_cnt_sel <= 7'd39 ;///32bit
          6'b0100_10: S_chip_clk_cnt_sel <= 7'd19 ;///64bit
       
          6'b0110_01: S_chip_clk_cnt_sel <= 7'd63 ;///32bit
          6'b0110_10: S_chip_clk_cnt_sel <= 7'd31 ;///64bit
          default : ;
       endcase
    end

///one hyper fram have chip cnt    
always @ ( posedge I_opt_tx_clk )
    begin
       if((I_tx_k_ctrl[1:0] == 2'b01) && (I_tx_data_b_s[8] == 1'b0))
          begin
             S_chip_clk_cnt <= 7'd0;
          end
       else if (S_chip_clk_cnt == S_chip_clk_cnt_sel)
          begin
             S_chip_clk_cnt <= 7'd0;
          end
       else
          S_chip_clk_cnt <= S_chip_clk_cnt + 7'd1;
    end
    
///control word counter
always @ ( posedge I_opt_tx_clk )
    begin
       if((I_tx_k_ctrl[1:0] == 2'b01) && (I_tx_data_b_s[8] == 1'b0))
          begin
             S_cw_cnt <= 8'd0;
          end
       else if(S_chip_clk_cnt == S_chip_clk_cnt_sel)
          begin
             S_cw_cnt <= S_cw_cnt + 8'd1;
          end
       else
          begin
             S_cw_cnt <= S_cw_cnt;
          end
    end

///------------------------------------------------------------------------------


///-----------------------------mask word----------------------------------------
///Ns =0 & Ns =0,basic frame number 0,2,64,66,128,130,192,194
assign  S_mask_word_en = (S_chip_clk_cnt == 7'd0);

///mask word
assign  S_mask_word = (S_scramble_enable && S_mask_word_en) ? 16'h0000 : 16'hffff;

///------------------------------------------------------------------------------

///------------------------generate scrambling sequence---------------------------
///the first current value
assign S_current_value = {I_scramble_tdm_seed[3] ^ I_scramble_tdm_seed[0],I_scramble_tdm_seed};

///16bit the next current value
//calculate scrambling sequence                                                        
assign  S_next_value_16bit[0 ] = S_current_value_16bit[4 ] ^ S_current_value_16bit[1 ];
assign  S_next_value_16bit[1 ] = S_current_value_16bit[5 ] ^ S_current_value_16bit[2 ];
assign  S_next_value_16bit[2 ] = S_current_value_16bit[6 ] ^ S_current_value_16bit[3 ];
assign  S_next_value_16bit[3 ] = S_current_value_16bit[7 ] ^ S_current_value_16bit[4 ];
assign  S_next_value_16bit[4 ] = S_current_value_16bit[8 ] ^ S_current_value_16bit[5 ];
assign  S_next_value_16bit[5 ] = S_current_value_16bit[9 ] ^ S_current_value_16bit[6 ];
assign  S_next_value_16bit[6 ] = S_current_value_16bit[10] ^ S_current_value_16bit[7 ];
assign  S_next_value_16bit[7 ] = S_current_value_16bit[11] ^ S_current_value_16bit[8 ];
assign  S_next_value_16bit[8 ] = S_current_value_16bit[12] ^ S_current_value_16bit[9 ];
assign  S_next_value_16bit[9 ] = S_current_value_16bit[13] ^ S_current_value_16bit[10];
assign  S_next_value_16bit[10] = S_current_value_16bit[14] ^ S_current_value_16bit[11];
assign  S_next_value_16bit[11] = S_current_value_16bit[15] ^ S_current_value_16bit[12];
assign  S_next_value_16bit[12] = S_current_value_16bit[16] ^ S_current_value_16bit[13];
assign  S_next_value_16bit[13] = S_current_value_16bit[17] ^ S_current_value_16bit[14];
assign  S_next_value_16bit[14] = S_current_value_16bit[18] ^ S_current_value_16bit[15];
assign  S_next_value_16bit[15] = S_current_value_16bit[19] ^ S_current_value_16bit[16];
assign  S_next_value_16bit[16] = S_current_value_16bit[20] ^ S_current_value_16bit[17];
assign  S_next_value_16bit[17] = S_current_value_16bit[21] ^ S_current_value_16bit[18];
assign  S_next_value_16bit[18] = S_current_value_16bit[22] ^ S_current_value_16bit[19];
assign  S_next_value_16bit[19] = S_current_value_16bit[23] ^ S_current_value_16bit[20];
assign  S_next_value_16bit[20] = S_current_value_16bit[24] ^ S_current_value_16bit[21];
assign  S_next_value_16bit[21] = S_current_value_16bit[25] ^ S_current_value_16bit[22];
assign  S_next_value_16bit[22] = S_current_value_16bit[26] ^ S_current_value_16bit[23];
assign  S_next_value_16bit[23] = S_current_value_16bit[27] ^ S_current_value_16bit[24];
assign  S_next_value_16bit[24] = S_current_value_16bit[28] ^ S_current_value_16bit[25];
assign  S_next_value_16bit[25] = S_current_value_16bit[29] ^ S_current_value_16bit[26];
assign  S_next_value_16bit[26] = S_current_value_16bit[30] ^ S_current_value_16bit[27];
assign  S_next_value_16bit[27] = S_current_value_16bit[31] ^ S_current_value_16bit[28];
assign  S_next_value_16bit[28] = S_next_value_16bit[0 ]    ^ S_current_value_16bit[29];
assign  S_next_value_16bit[29] = S_next_value_16bit[1 ]    ^ S_current_value_16bit[30];
assign  S_next_value_16bit[30] = S_next_value_16bit[2 ]    ^ S_current_value_16bit[31];
assign  S_next_value_16bit[31] = S_next_value_16bit[3 ]    ^ S_next_value_16bit[0 ]   ;
   
//calculate scrambling sequence ,32bit
always @( posedge I_opt_tx_clk )
    begin
       if((I_tx_k_ctrl[1:0] == 2'b01) && (S_cw_cnt == 8'd255))
          begin
             S_current_value_16bit <= S_current_value       ;
          end
       else if ( S_chip_clk_cnt[0] )
          begin
             S_current_value_16bit <= S_next_value_16bit    ;
          end
       else                                                 
          begin                                             
             S_current_value_16bit <= S_current_value_16bit ;
          end
    end    
    
/// the next 32bit scramble data      
//calculate scrambling sequence                                                        
assign  S_next_value_32bit[0 ] = S_current_value_32bit[4 ] ^ S_current_value_32bit[1 ];
assign  S_next_value_32bit[1 ] = S_current_value_32bit[5 ] ^ S_current_value_32bit[2 ];
assign  S_next_value_32bit[2 ] = S_current_value_32bit[6 ] ^ S_current_value_32bit[3 ];
assign  S_next_value_32bit[3 ] = S_current_value_32bit[7 ] ^ S_current_value_32bit[4 ];
assign  S_next_value_32bit[4 ] = S_current_value_32bit[8 ] ^ S_current_value_32bit[5 ];
assign  S_next_value_32bit[5 ] = S_current_value_32bit[9 ] ^ S_current_value_32bit[6 ];
assign  S_next_value_32bit[6 ] = S_current_value_32bit[10] ^ S_current_value_32bit[7 ];
assign  S_next_value_32bit[7 ] = S_current_value_32bit[11] ^ S_current_value_32bit[8 ];
assign  S_next_value_32bit[8 ] = S_current_value_32bit[12] ^ S_current_value_32bit[9 ];
assign  S_next_value_32bit[9 ] = S_current_value_32bit[13] ^ S_current_value_32bit[10];
assign  S_next_value_32bit[10] = S_current_value_32bit[14] ^ S_current_value_32bit[11];
assign  S_next_value_32bit[11] = S_current_value_32bit[15] ^ S_current_value_32bit[12];
assign  S_next_value_32bit[12] = S_current_value_32bit[16] ^ S_current_value_32bit[13];
assign  S_next_value_32bit[13] = S_current_value_32bit[17] ^ S_current_value_32bit[14];
assign  S_next_value_32bit[14] = S_current_value_32bit[18] ^ S_current_value_32bit[15];
assign  S_next_value_32bit[15] = S_current_value_32bit[19] ^ S_current_value_32bit[16];
assign  S_next_value_32bit[16] = S_current_value_32bit[20] ^ S_current_value_32bit[17];
assign  S_next_value_32bit[17] = S_current_value_32bit[21] ^ S_current_value_32bit[18];
assign  S_next_value_32bit[18] = S_current_value_32bit[22] ^ S_current_value_32bit[19];
assign  S_next_value_32bit[19] = S_current_value_32bit[23] ^ S_current_value_32bit[20];
assign  S_next_value_32bit[20] = S_current_value_32bit[24] ^ S_current_value_32bit[21];
assign  S_next_value_32bit[21] = S_current_value_32bit[25] ^ S_current_value_32bit[22];
assign  S_next_value_32bit[22] = S_current_value_32bit[26] ^ S_current_value_32bit[23];
assign  S_next_value_32bit[23] = S_current_value_32bit[27] ^ S_current_value_32bit[24];
assign  S_next_value_32bit[24] = S_current_value_32bit[28] ^ S_current_value_32bit[25];
assign  S_next_value_32bit[25] = S_current_value_32bit[29] ^ S_current_value_32bit[26];
assign  S_next_value_32bit[26] = S_current_value_32bit[30] ^ S_current_value_32bit[27];
assign  S_next_value_32bit[27] = S_current_value_32bit[31] ^ S_current_value_32bit[28];
assign  S_next_value_32bit[28] = S_next_value_32bit[0 ]    ^ S_current_value_32bit[29];
assign  S_next_value_32bit[29] = S_next_value_32bit[1 ]    ^ S_current_value_32bit[30];
assign  S_next_value_32bit[30] = S_next_value_32bit[2 ]    ^ S_current_value_32bit[31];
assign  S_next_value_32bit[31] = S_next_value_32bit[3 ]    ^ S_next_value_32bit[0 ]   ;

//calculate scrambling sequence ,32bit
always @( posedge I_opt_tx_clk )
    begin
       if((I_tx_k_ctrl[1:0] == 2'b01) && (S_cw_cnt == 8'd255))
          begin
             S_current_value_32bit <= S_current_value    ;
          end                                            
       else                                              
          begin                                          
             S_current_value_32bit <= S_next_value_32bit ;
          end
    end

/// the first 64bit scramble data 
assign  S_current_value_high[0 ] = S_current_value[4 ]     ^ S_current_value[1 ]    ;
assign  S_current_value_high[1 ] = S_current_value[5 ]     ^ S_current_value[2 ]    ;
assign  S_current_value_high[2 ] = S_current_value[6 ]     ^ S_current_value[3 ]    ;
assign  S_current_value_high[3 ] = S_current_value[7 ]     ^ S_current_value[4 ]    ;
assign  S_current_value_high[4 ] = S_current_value[8 ]     ^ S_current_value[5 ]    ;
assign  S_current_value_high[5 ] = S_current_value[9 ]     ^ S_current_value[6 ]    ;
assign  S_current_value_high[6 ] = S_current_value[10]     ^ S_current_value[7 ]    ;
assign  S_current_value_high[7 ] = S_current_value[11]     ^ S_current_value[8 ]    ;
assign  S_current_value_high[8 ] = S_current_value[12]     ^ S_current_value[9 ]    ;
assign  S_current_value_high[9 ] = S_current_value[13]     ^ S_current_value[10]    ;
assign  S_current_value_high[10] = S_current_value[14]     ^ S_current_value[11]    ;
assign  S_current_value_high[11] = S_current_value[15]     ^ S_current_value[12]    ;
assign  S_current_value_high[12] = S_current_value[16]     ^ S_current_value[13]    ;
assign  S_current_value_high[13] = S_current_value[17]     ^ S_current_value[14]    ;
assign  S_current_value_high[14] = S_current_value[18]     ^ S_current_value[15]    ;
assign  S_current_value_high[15] = S_current_value[19]     ^ S_current_value[16]    ;
assign  S_current_value_high[16] = S_current_value[20]     ^ S_current_value[17]    ;
assign  S_current_value_high[17] = S_current_value[21]     ^ S_current_value[18]    ;
assign  S_current_value_high[18] = S_current_value[22]     ^ S_current_value[19]    ;
assign  S_current_value_high[19] = S_current_value[23]     ^ S_current_value[20]    ;
assign  S_current_value_high[20] = S_current_value[24]     ^ S_current_value[21]    ;
assign  S_current_value_high[21] = S_current_value[25]     ^ S_current_value[22]    ;
assign  S_current_value_high[22] = S_current_value[26]     ^ S_current_value[23]    ;
assign  S_current_value_high[23] = S_current_value[27]     ^ S_current_value[24]    ;
assign  S_current_value_high[24] = S_current_value[28]     ^ S_current_value[25]    ;
assign  S_current_value_high[25] = S_current_value[29]     ^ S_current_value[26]    ;
assign  S_current_value_high[26] = S_current_value[30]     ^ S_current_value[27]    ;
assign  S_current_value_high[27] = S_current_value[31]     ^ S_current_value[28]    ;
assign  S_current_value_high[28] = S_current_value_high[0] ^ S_current_value[29]    ;
assign  S_current_value_high[29] = S_current_value_high[1] ^ S_current_value[30]    ;
assign  S_current_value_high[30] = S_current_value_high[2] ^ S_current_value[31]    ;
assign  S_current_value_high[31] = S_current_value_high[3] ^ S_current_value_high[0];

/// the next 64bit scramble data
assign  S_next_value_64bit[0 ] = S_current_value_64bit[36] ^ S_current_value_64bit[33];
assign  S_next_value_64bit[1 ] = S_current_value_64bit[37] ^ S_current_value_64bit[34];
assign  S_next_value_64bit[2 ] = S_current_value_64bit[38] ^ S_current_value_64bit[35];
assign  S_next_value_64bit[3 ] = S_current_value_64bit[39] ^ S_current_value_64bit[36];
assign  S_next_value_64bit[4 ] = S_current_value_64bit[40] ^ S_current_value_64bit[37];
assign  S_next_value_64bit[5 ] = S_current_value_64bit[41] ^ S_current_value_64bit[38];
assign  S_next_value_64bit[6 ] = S_current_value_64bit[42] ^ S_current_value_64bit[39];
assign  S_next_value_64bit[7 ] = S_current_value_64bit[43] ^ S_current_value_64bit[40];
assign  S_next_value_64bit[8 ] = S_current_value_64bit[44] ^ S_current_value_64bit[41];
assign  S_next_value_64bit[9 ] = S_current_value_64bit[45] ^ S_current_value_64bit[42];
assign  S_next_value_64bit[10] = S_current_value_64bit[46] ^ S_current_value_64bit[43];
assign  S_next_value_64bit[11] = S_current_value_64bit[47] ^ S_current_value_64bit[44];
assign  S_next_value_64bit[12] = S_current_value_64bit[48] ^ S_current_value_64bit[45];
assign  S_next_value_64bit[13] = S_current_value_64bit[49] ^ S_current_value_64bit[46];
assign  S_next_value_64bit[14] = S_current_value_64bit[50] ^ S_current_value_64bit[47];
assign  S_next_value_64bit[15] = S_current_value_64bit[51] ^ S_current_value_64bit[48];
assign  S_next_value_64bit[16] = S_current_value_64bit[52] ^ S_current_value_64bit[49];
assign  S_next_value_64bit[17] = S_current_value_64bit[53] ^ S_current_value_64bit[50];
assign  S_next_value_64bit[18] = S_current_value_64bit[54] ^ S_current_value_64bit[51];
assign  S_next_value_64bit[19] = S_current_value_64bit[55] ^ S_current_value_64bit[52];
assign  S_next_value_64bit[20] = S_current_value_64bit[56] ^ S_current_value_64bit[53];
assign  S_next_value_64bit[21] = S_current_value_64bit[57] ^ S_current_value_64bit[54];
assign  S_next_value_64bit[22] = S_current_value_64bit[58] ^ S_current_value_64bit[55];
assign  S_next_value_64bit[23] = S_current_value_64bit[59] ^ S_current_value_64bit[56];
assign  S_next_value_64bit[24] = S_current_value_64bit[60] ^ S_current_value_64bit[57];
assign  S_next_value_64bit[25] = S_current_value_64bit[61] ^ S_current_value_64bit[58];
assign  S_next_value_64bit[26] = S_current_value_64bit[62] ^ S_current_value_64bit[59];
assign  S_next_value_64bit[27] = S_current_value_64bit[63] ^ S_current_value_64bit[60];
assign  S_next_value_64bit[28] = S_next_value_64bit[ 0]    ^ S_current_value_64bit[61];
assign  S_next_value_64bit[29] = S_next_value_64bit[ 1]    ^ S_current_value_64bit[62];
assign  S_next_value_64bit[30] = S_next_value_64bit[ 2]    ^ S_current_value_64bit[63];
assign  S_next_value_64bit[31] = S_next_value_64bit[ 3]    ^ S_next_value_64bit[ 0]   ;
assign  S_next_value_64bit[32] = S_next_value_64bit[ 4]    ^ S_next_value_64bit[ 1]   ;
assign  S_next_value_64bit[33] = S_next_value_64bit[ 5]    ^ S_next_value_64bit[ 2]   ;
assign  S_next_value_64bit[34] = S_next_value_64bit[ 6]    ^ S_next_value_64bit[ 3]   ;
assign  S_next_value_64bit[35] = S_next_value_64bit[ 7]    ^ S_next_value_64bit[ 4]   ;
assign  S_next_value_64bit[36] = S_next_value_64bit[ 8]    ^ S_next_value_64bit[ 5]   ;
assign  S_next_value_64bit[37] = S_next_value_64bit[ 9]    ^ S_next_value_64bit[ 6]   ;
assign  S_next_value_64bit[38] = S_next_value_64bit[10]    ^ S_next_value_64bit[ 7]   ;
assign  S_next_value_64bit[39] = S_next_value_64bit[11]    ^ S_next_value_64bit[ 8]   ;
assign  S_next_value_64bit[40] = S_next_value_64bit[12]    ^ S_next_value_64bit[ 9]   ;
assign  S_next_value_64bit[41] = S_next_value_64bit[13]    ^ S_next_value_64bit[10]   ;
assign  S_next_value_64bit[42] = S_next_value_64bit[14]    ^ S_next_value_64bit[11]   ;
assign  S_next_value_64bit[43] = S_next_value_64bit[15]    ^ S_next_value_64bit[12]   ;
assign  S_next_value_64bit[44] = S_next_value_64bit[16]    ^ S_next_value_64bit[13]   ;
assign  S_next_value_64bit[45] = S_next_value_64bit[17]    ^ S_next_value_64bit[14]   ;
assign  S_next_value_64bit[46] = S_next_value_64bit[18]    ^ S_next_value_64bit[15]   ;
assign  S_next_value_64bit[47] = S_next_value_64bit[19]    ^ S_next_value_64bit[16]   ;
assign  S_next_value_64bit[48] = S_next_value_64bit[20]    ^ S_next_value_64bit[17]   ;
assign  S_next_value_64bit[49] = S_next_value_64bit[21]    ^ S_next_value_64bit[18]   ;
assign  S_next_value_64bit[50] = S_next_value_64bit[22]    ^ S_next_value_64bit[19]   ;
assign  S_next_value_64bit[51] = S_next_value_64bit[23]    ^ S_next_value_64bit[20]   ;
assign  S_next_value_64bit[52] = S_next_value_64bit[24]    ^ S_next_value_64bit[21]   ;
assign  S_next_value_64bit[53] = S_next_value_64bit[25]    ^ S_next_value_64bit[22]   ;
assign  S_next_value_64bit[54] = S_next_value_64bit[26]    ^ S_next_value_64bit[23]   ;
assign  S_next_value_64bit[55] = S_next_value_64bit[27]    ^ S_next_value_64bit[24]   ;
assign  S_next_value_64bit[56] = S_next_value_64bit[28]    ^ S_next_value_64bit[25]   ;
assign  S_next_value_64bit[57] = S_next_value_64bit[29]    ^ S_next_value_64bit[26]   ;
assign  S_next_value_64bit[58] = S_next_value_64bit[30]    ^ S_next_value_64bit[27]   ;
assign  S_next_value_64bit[59] = S_next_value_64bit[31]    ^ S_next_value_64bit[28]   ;
assign  S_next_value_64bit[60] = S_next_value_64bit[32]    ^ S_next_value_64bit[29]   ;
assign  S_next_value_64bit[61] = S_next_value_64bit[33]    ^ S_next_value_64bit[30]   ;
assign  S_next_value_64bit[62] = S_next_value_64bit[34]    ^ S_next_value_64bit[31]   ;
assign  S_next_value_64bit[63] = S_next_value_64bit[35]    ^ S_next_value_64bit[32]   ;

//calculate scrambling sequence ,64bit

always @ ( posedge I_opt_tx_clk or posedge I_opt_tx_rst )
    if(I_opt_tx_rst)
        begin
            S_current_value_64bit <= 64'd0;
        end
    else if((I_tx_k_ctrl[1:0] == 2'b01) && (S_cw_cnt == 8'd255))
        begin
           S_current_value_64bit <= {S_current_value_high,S_current_value};
        end
    else
        begin
           S_current_value_64bit <= S_next_value_64bit;
        end

///------------------------------------------------------------------------------

///-----------------------------scrambling input data----------------------------

///input data delay 1 clock , scramble input data
always @ ( posedge I_opt_tx_clk or posedge I_opt_tx_rst )
    if(I_opt_tx_rst)
        begin
           S_tdm_data_b_s_1d <= {C_DATA_WIDTH{1'b0}} ;
        end    
    else
        begin
           S_tdm_data_b_s_1d <= I_tx_data_b_s ;
        end

always @ ( posedge I_opt_tx_clk or posedge I_opt_tx_rst )
    if(I_opt_tx_rst)
        begin
            O_tx_data_a_s[C_DATA_WIDTH-1:0] <= {C_DATA_WIDTH{1'b0}}; 
        end         
    else if(S_scramble_enable)
        begin
           case (S_data_width)
              2'b00 : O_tx_data_a_s[C_DATA_WIDTH-1:0] <=  (!S_chip_clk_cnt[0]) ? S_tdm_data_b_s_1d[15:0] ^ (S_current_value_16bit[15: 0] & S_mask_word)
                                                                               : S_tdm_data_b_s_1d[15:0] ^ (S_current_value_16bit[31:16] & S_mask_word);

              2'b01 : O_tx_data_a_s[C_DATA_WIDTH-1:0] <= {S_tdm_data_b_s_1d[31:16] ^  S_current_value_32bit[31:16],
                                                          S_tdm_data_b_s_1d[15: 0] ^ (S_current_value_32bit[15: 0] & S_mask_word)};

              2'b10 : O_tx_data_a_s[C_DATA_WIDTH-1:0] <= {S_tdm_data_b_s_1d[63:16] ^  S_current_value_64bit[63:16],
                                                          S_tdm_data_b_s_1d[15: 0] ^ (S_current_value_64bit[15: 0] & S_mask_word)};
              default : ;
           endcase
        end
    else
        begin
           O_tx_data_a_s[C_DATA_WIDTH-1:0] <= S_tdm_data_b_s_1d[C_DATA_WIDTH-1:0];
        end

///------------------------------------------------------------------------------

///-----------------------------k code output------------------------------------
///k code input delay  1 clk , k code output delay 2 clk than input
always @ ( posedge I_opt_tx_clk or posedge I_opt_tx_rst )
    if(I_opt_tx_rst)
        begin
           S_tx_k_ctrl_1d <= {C_K_CTRL_WIDTH{1'b0}};
           O_tx_k_ctrl    <= {C_K_CTRL_WIDTH{1'b0}};
        end
    else
        begin
           S_tx_k_ctrl_1d <= I_tx_k_ctrl;
           O_tx_k_ctrl    <= S_tx_k_ctrl_1d;
        end    

///------------------------------------------------------------------------------

///-----------------------------------------------------------------------------
///              Main Verilog code        End
///-----------------------------------------------------------------------------

endmodule
