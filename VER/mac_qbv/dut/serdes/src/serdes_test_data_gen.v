//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_test_data_gen.v
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


module serdes_test_data_gen 
( 
input  wire          I_txoutclk                         ,//
input  wire          I_txoutrst                         ,//
input  wire  [7:0]   I_txctrl                           ,//
input  wire  [63:0]  I_txdata                           ,//
input  wire  [3:0]   I_serdes_rate_sel                  ,//
input  wire          I_8b10b_or_64b66b_sel              ,//
input  wire          I_test_en                          ,//
output wire  [7:0]   O_txctrl                           ,//
output wire  [63:0]  O_txdata
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
wire   [7:0]         S_txctrl_1st                       ;//
wire   [7:0]         S_txctrl_2st                       ;//
wire   [63:0]        S_txdata_1st                       ;//
wire   [63:0]        S_txdata_2st                       ;//
// ---------------------------------------------------------------------------------------------------------
// inter reg
// ---------------------------------------------------------------------------------------------------------
reg    [15:0]        S_counter_symbolm                  ;//
reg    [15:0]        S_counter_symbolm_d1               ;//
reg    [15:0]        S_counter_symbolm_d2               ;// 
reg                  S_symbol_sync                      ;// 
reg                  S_symbol_sync_d                    ;//
reg    [7:0]         S_txctrl_test                      ;//
reg    [63:0]        S_txdata_test                      ;//


// ***********************************************************main Verilog code********************************************************//
// ***********************************************************main Verilog code********************************************************//
generate 
    if (C_CHANNEL_FOR_CPRI_TDM == 1'd0) //1'd0-CPRI;1'd1-TDM
        begin : FOR_CPRI 
always @(posedge I_txoutclk or posedge I_txoutrst)
    if(I_txoutrst) 
        S_counter_symbolm <= 16'd0;
    else if
        (
         ((I_serdes_rate_sel == 4'd0) && (S_counter_symbolm == SYMBOL_CNT1P2288  )) ||
         ((I_serdes_rate_sel == 4'd1) && (S_counter_symbolm == SYMBOL_CNT2P4576  )) ||
         ((I_serdes_rate_sel == 4'd2) && (S_counter_symbolm == SYMBOL_CNT3P072   )) ||
         ((I_serdes_rate_sel == 4'd3) && (S_counter_symbolm == SYMBOL_CNT4P9152  )) ||
         ((I_serdes_rate_sel == 4'd4) && (S_counter_symbolm == SYMBOL_CNT6P144   )) ||
         ((I_serdes_rate_sel == 4'd5) && (S_counter_symbolm == SYMBOL_CNT8P11008 )) ||
         ((I_serdes_rate_sel == 4'd6) && (S_counter_symbolm == SYMBOL_CNT9P8304  )) ||
         ((I_serdes_rate_sel == 4'd7) && (S_counter_symbolm == SYMBOL_CNT10P1376 )) ||
         ((I_serdes_rate_sel == 4'd8) && (S_counter_symbolm == SYMBOL_CNT12P16512)) ||
         ((I_serdes_rate_sel == 4'd9) && (S_counter_symbolm == SYMBOL_CNT24P33024))  
        )
        S_counter_symbolm <= 16'd0;
    else    
        S_counter_symbolm <= S_counter_symbolm + 16'b1;   
        end
    else if (C_CHANNEL_FOR_CPRI_TDM == 1'd1) //1'd0-CPRI;1'd1-TDM
        begin : FOR_TDM
        	   always @(posedge I_txoutclk or posedge I_txoutrst)
                 if(I_txoutrst) 
                     S_counter_symbolm <= 16'd0;
                 else if
                     (
                      ((I_serdes_rate_sel == 4'd0) && (S_counter_symbolm == TDM_CHIP_CNT1P2288  )) ||
                      ((I_serdes_rate_sel == 4'd1) && (S_counter_symbolm == TDM_CHIP_CNT2P4576  )) ||
                      ((I_serdes_rate_sel == 4'd2) && (S_counter_symbolm == TDM_CHIP_CNT3P072   )) ||
                      ((I_serdes_rate_sel == 4'd3) && (S_counter_symbolm == TDM_CHIP_CNT4P9152  )) ||
                      ((I_serdes_rate_sel == 4'd4) && (S_counter_symbolm == TDM_CHIP_CNT6P144   )) ||
                      ((I_serdes_rate_sel == 4'd5) && (S_counter_symbolm == TDM_CHIP_CNT8P11008 )) ||
                      ((I_serdes_rate_sel == 4'd6) && (S_counter_symbolm == TDM_CHIP_CNT9P8304  )) ||
                      ((I_serdes_rate_sel == 4'd7) && (S_counter_symbolm == TDM_CHIP_CNT10P1376 )) ||
                      ((I_serdes_rate_sel == 4'd8) && (S_counter_symbolm == TDM_CHIP_CNT12P16512)) ||
                      ((I_serdes_rate_sel == 4'd9) && (S_counter_symbolm == TDM_CHIP_CNT24P33024))  
                     )
                     S_counter_symbolm <= 16'd0;
                 else    
                     S_counter_symbolm <= S_counter_symbolm + 16'b1;  
        end        
endgenerate  

always @(posedge I_txoutclk or posedge I_txoutrst)
    if(I_txoutrst) 
        S_symbol_sync <= 1'b0;
    else if(S_counter_symbolm == 16'd1)
        S_symbol_sync <= 1'b1;
    else 
        S_symbol_sync <= 1'b0;
        

always @(posedge I_txoutclk or posedge I_txoutrst)
    if(I_txoutrst) 
        S_symbol_sync_d <= 1'b0;
    else
        S_symbol_sync_d <= S_symbol_sync;


assign  S_txctrl_1st = I_8b10b_or_64b66b_sel ? 8'b10000000 : 8'b00000001 ;
assign  S_txctrl_2st = I_8b10b_or_64b66b_sel ? 8'b00000001 : 8'b00000000 ;
assign  S_txdata_1st = I_8b10b_or_64b66b_sel ? 64'hFD50505050505050 : 64'h50505050505050bc ;
assign  S_txdata_2st = I_8b10b_or_64b66b_sel ? 64'h50505050505050FB : 64'h5050505050505050 ;




always @(posedge I_txoutclk or posedge I_txoutrst)
    if(I_txoutrst) 
        begin
            S_counter_symbolm_d1 <= 16'd0 ;
            S_counter_symbolm_d2 <= 16'd0 ;
        end
    else
        begin
            S_counter_symbolm_d1 <= S_counter_symbolm ;
            S_counter_symbolm_d2 <= S_counter_symbolm_d1 ;
        end



always @(posedge I_txoutclk or posedge I_txoutrst)
    if(I_txoutrst) 
        begin 
            S_txctrl_test <= 8'b00000000 ;    
            S_txdata_test <= 64'h0 ;
        end
     else
        begin 
            S_txctrl_test <= S_symbol_sync   ? S_txctrl_1st : 
                             S_symbol_sync_d ? S_txctrl_2st : 8'b00000000;    
            S_txdata_test <= S_symbol_sync   ? S_txdata_1st : 
                             S_symbol_sync_d ? S_txdata_2st :{S_counter_symbolm_d2,16'd0,S_counter_symbolm_d2,S_counter_symbolm_d2};
        end  


assign  O_txctrl = I_test_en ? S_txctrl_test : I_txctrl ;
assign  O_txdata = I_test_en ? S_txdata_test : I_txdata ;


endmodule 