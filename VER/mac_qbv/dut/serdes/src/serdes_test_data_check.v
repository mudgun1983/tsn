//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_test_data_check.v
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


module serdes_test_data_check 
( 
input  wire          I_rxoutclk                         ,//
input  wire          I_rxoutrst                         ,//
input  wire  [7:0]   I_rxctrl                           ,//
input  wire  [63:0]  I_rxdata                           ,//
input  wire  [3:0]   I_serdes_rate_sel                  ,//
input  wire          I_8b10b_or_64b66b_sel              ,//
input  wire          I_err_cnt_clr                      ,//
output reg   [7:0]   O_err_counter                      
);

// ---------------------------------------------------------------------------------------------------------
// parameter define
// ---------------------------------------------------------------------------------------------------------  
parameter C_CHANNEL_FOR_CPRI_TDM  = 1'd0   ;///0 for cpri,1 for TDM,由例化时的参数决定

parameter SYMBOL_CNT1P2288   = 256*4 -1 ;
parameter SYMBOL_CNT2P4576   = 256*8 -1 ;
parameter SYMBOL_CNT3P072    = 256*10-1 ;
parameter SYMBOL_CNT4P9152   = 256*16-1 ;
parameter SYMBOL_CNT6P144    = 256*20-1 ;
parameter SYMBOL_CNT8P11008  = 256*32-1 ;
parameter SYMBOL_CNT9P8304   = 256*32-1 ;
parameter SYMBOL_CNT10P1376  = 256*40-1 ;
parameter SYMBOL_CNT12P16512 = 256*48-1 ;
parameter SYMBOL_CNT24P33024 = 256*96-1 ; 

parameter TDM_CHIP_CNT1P2288      = 4 -1   ;
parameter TDM_CHIP_CNT2P4576      = 8 -1   ;
parameter TDM_CHIP_CNT3P072       = 10-1   ;
parameter TDM_CHIP_CNT4P9152      = 16-1   ;
parameter TDM_CHIP_CNT6P144       = 20-1   ;
parameter TDM_CHIP_CNT8P11008     = 32-1   ;
parameter TDM_CHIP_CNT9P8304      = 32-1   ;
parameter TDM_CHIP_CNT10P1376     = 40-1   ;
parameter TDM_CHIP_CNT12P16512    = 48-1   ;
parameter TDM_CHIP_CNT24P33024    = 96-1   ;
// ---------------------------------------------------------------------------------------------------------
// inter wire
// ---------------------------------------------------------------------------------------------------------
wire   [7:0]         S_rxctrl_1st                       ;//
wire   [7:0]         S_rxctrl_2st                       ;//
wire   [63:0]        S_rxdata_1st                       ;//
wire   [63:0]        S_rxdata_2st                       ;//
// ---------------------------------------------------------------------------------------------------------
// inter reg
// ---------------------------------------------------------------------------------------------------------
reg    [15:0]        S_rxdata_cnt                       ;//
reg    [7:0]         S_rxctrl_test                      ;//
reg    [63:0]        S_rxdata_test                      ;//
reg                  S_err_flag                         ;//

// ***********************************************************main Verilog code********************************************************//
generate 
    if (C_CHANNEL_FOR_CPRI_TDM == 1'd0) //1'd0-CPRI;1'd1-TDM
        begin : FOR_CPRI 
always @(posedge I_rxoutclk)
    if(
       ((!I_8b10b_or_64b66b_sel) && (I_rxctrl[0] == 1'b1) && (I_rxdata[7:0] == 8'hbc)) ||
       (( I_8b10b_or_64b66b_sel) && (I_rxctrl[7] == 1'b1) && (I_rxdata[63:56] == 8'hFD))
      )
        S_rxdata_cnt <= 16'd2 ;
    else if
        (
         ((I_serdes_rate_sel == 4'd0) && (S_rxdata_cnt == SYMBOL_CNT1P2288  )) ||
         ((I_serdes_rate_sel == 4'd1) && (S_rxdata_cnt == SYMBOL_CNT2P4576  )) ||
         ((I_serdes_rate_sel == 4'd2) && (S_rxdata_cnt == SYMBOL_CNT3P072   )) ||
         ((I_serdes_rate_sel == 4'd3) && (S_rxdata_cnt == SYMBOL_CNT4P9152  )) ||
         ((I_serdes_rate_sel == 4'd4) && (S_rxdata_cnt == SYMBOL_CNT6P144   )) ||
         ((I_serdes_rate_sel == 4'd5) && (S_rxdata_cnt == SYMBOL_CNT8P11008 )) ||
         ((I_serdes_rate_sel == 4'd6) && (S_rxdata_cnt == SYMBOL_CNT9P8304  )) ||
         ((I_serdes_rate_sel == 4'd7) && (S_rxdata_cnt == SYMBOL_CNT10P1376 )) ||
         ((I_serdes_rate_sel == 4'd8) && (S_rxdata_cnt == SYMBOL_CNT12P16512)) ||
         ((I_serdes_rate_sel == 4'd9) && (S_rxdata_cnt == SYMBOL_CNT24P33024))  
        )
        S_rxdata_cnt <= 16'd0 ;     
    else
        S_rxdata_cnt <= S_rxdata_cnt + 16'd1 ;    
        end 
    else if (C_CHANNEL_FOR_CPRI_TDM == 1'd1) //1'd0-CPRI;1'd1-TDM
        begin : FOR_TDM 
        	   always @(posedge I_rxoutclk)
                 if(
                    ((!I_8b10b_or_64b66b_sel) && (I_rxctrl[0] == 1'b1) && (I_rxdata[7:0] == 8'hbc)) ||
                    (( I_8b10b_or_64b66b_sel) && (I_rxctrl[7] == 1'b1) && (I_rxdata[63:56] == 8'hFD))
                   )
                     S_rxdata_cnt <= 16'd2 ;
                 else if
                     (
                      ((I_serdes_rate_sel == 4'd0) && (S_rxdata_cnt == TDM_CHIP_CNT1P2288  )) ||
                      ((I_serdes_rate_sel == 4'd1) && (S_rxdata_cnt == TDM_CHIP_CNT2P4576  )) ||
                      ((I_serdes_rate_sel == 4'd2) && (S_rxdata_cnt == TDM_CHIP_CNT3P072   )) ||
                      ((I_serdes_rate_sel == 4'd3) && (S_rxdata_cnt == TDM_CHIP_CNT4P9152  )) ||
                      ((I_serdes_rate_sel == 4'd4) && (S_rxdata_cnt == TDM_CHIP_CNT6P144   )) ||
                      ((I_serdes_rate_sel == 4'd5) && (S_rxdata_cnt == TDM_CHIP_CNT8P11008 )) ||
                      ((I_serdes_rate_sel == 4'd6) && (S_rxdata_cnt == TDM_CHIP_CNT9P8304  )) ||
                      ((I_serdes_rate_sel == 4'd7) && (S_rxdata_cnt == TDM_CHIP_CNT10P1376 )) ||
                      ((I_serdes_rate_sel == 4'd8) && (S_rxdata_cnt == TDM_CHIP_CNT12P16512)) ||
                      ((I_serdes_rate_sel == 4'd9) && (S_rxdata_cnt == TDM_CHIP_CNT24P33024))  
                     )
                     S_rxdata_cnt <= 16'd0 ;     
                 else
                     S_rxdata_cnt <= S_rxdata_cnt + 16'd1 ;  
        end  
endgenerate                        


assign  S_rxctrl_1st = I_8b10b_or_64b66b_sel ? 8'b10000000 : 8'b00000001 ;
assign  S_rxctrl_2st = I_8b10b_or_64b66b_sel ? 8'b00000001 : 8'b00000000 ;
assign  S_rxdata_1st = I_8b10b_or_64b66b_sel ? 64'hFD50505050505050 : 64'h50505050505050bc ;
assign  S_rxdata_2st = I_8b10b_or_64b66b_sel ? 64'h50505050505050FB : 64'h5050505050505050 ;


always @(posedge I_rxoutclk)
    begin 
        S_rxctrl_test <= (S_rxdata_cnt == 16'd0) ? S_rxctrl_1st : 
                         (S_rxdata_cnt == 16'd1) ? S_rxctrl_2st : 8'b00000000;    
        S_rxdata_test <= (S_rxdata_cnt == 16'd0) ? S_rxdata_1st : 
                         (S_rxdata_cnt == 16'd1) ? S_rxdata_2st :{S_rxdata_cnt,16'd0,S_rxdata_cnt,S_rxdata_cnt};
    end 


always@(posedge I_rxoutclk)
    if ((I_rxdata != S_rxdata_test) || (I_rxctrl != S_rxctrl_test)) 
        S_err_flag <= 1'd1;
    else
        S_err_flag <= 1'd0;
        
always@(posedge I_rxoutclk)
    if ((S_err_flag == 1'd1) && (O_err_counter != 8'd255))
        O_err_counter <= O_err_counter + 8'd1;
    else if (I_err_cnt_clr)
        O_err_counter <= 8'd0;



endmodule 