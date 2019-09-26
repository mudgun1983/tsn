//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_cpu_interface0.v
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


module serdes_cpu_interface0 #
      (
      parameter                                   C_BASE_ADDR       = 16'H0000
      )
      (
      //interface with CPU                     
      input  wire                                 I_system_clk               ,//
      input  wire                                 I_system_rst               ,//
      input  wire                                 I_cpu_wren                 ,// 
      input  wire                                 I_cpu_rden                 ,// 
      input  wire   [15 : 0]                      I_cpu_addr                 ,// 
      input  wire   [15 : 0]                      I_cpu_wdat                 ,// 
      output reg    [15 : 0]                      O_cpu_rdat                 ,//                                                                                
      //interface with serdes                      
      output reg    [ 64* 3-1:0]                  O_qpll_config              ,//
      input  wire   [ 64* 3-1:0]                  I_qpll_state               ,//
      output reg    [160*10-1:0]                  O_channel_config           ,//
      input  wire   [160*10-1:0]                  I_channel_state            ,//
      input  wire   [160*10-1:0]                  I_channel_alarm             //
      );

 
localparam  COMMON0_CFG_INI0   = 16'h0110;//C_BASE_ADDR+16'h0400
localparam  COMMON0_CFG_INI1   = 16'h0000;//C_BASE_ADDR+16'h0402
localparam  COMMON0_CFG_INI2   = 16'h0000;//C_BASE_ADDR+16'h0404
localparam  COMMON0_CFG_INI3   = 16'h0000;//C_BASE_ADDR+16'h0406
                                      
          
localparam  COMMON1_CFG_INI0   = 16'h0110;//C_BASE_ADDR+16'h0410
localparam  COMMON1_CFG_INI1   = 16'h0000;//C_BASE_ADDR+16'h0412
localparam  COMMON1_CFG_INI2   = 16'h0000;//C_BASE_ADDR+16'h0414
localparam  COMMON1_CFG_INI3   = 16'h0000;//C_BASE_ADDR+16'h0416
                                      
          
localparam  COMMON2_CFG_INI0   = 16'h0110;//C_BASE_ADDR+16'h0420
localparam  COMMON2_CFG_INI1   = 16'h0000;//C_BASE_ADDR+16'h0422
localparam  COMMON2_CFG_INI2   = 16'h0000;//C_BASE_ADDR+16'h0424
localparam  COMMON2_CFG_INI3   = 16'h0000;//C_BASE_ADDR+16'h0426
                                      

                                                                                     
localparam  CHANNEL0_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h0800
localparam  CHANNEL0_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h0802
localparam  CHANNEL0_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h0804
localparam  CHANNEL0_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h0806
localparam  CHANNEL0_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h0808
localparam  CHANNEL0_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h080a
localparam  CHANNEL0_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h080c
localparam  CHANNEL0_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h080e
localparam  CHANNEL0_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h0810
localparam  CHANNEL0_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h0812
                                                                 
                                   
localparam  CHANNEL1_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h0900 
localparam  CHANNEL1_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h0902 
localparam  CHANNEL1_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h0904 
localparam  CHANNEL1_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h0906 
localparam  CHANNEL1_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h0908 
localparam  CHANNEL1_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h090a 
localparam  CHANNEL1_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h090c 
localparam  CHANNEL1_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h090e 
localparam  CHANNEL1_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h0910 
localparam  CHANNEL1_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h0912 
                                                                 
                                   
localparam  CHANNEL2_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h0a00 
localparam  CHANNEL2_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h0a02 
localparam  CHANNEL2_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h0a04 
localparam  CHANNEL2_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h0a06 
localparam  CHANNEL2_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h0a08 
localparam  CHANNEL2_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h0a0a 
localparam  CHANNEL2_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h0a0c 
localparam  CHANNEL2_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h0a0e 
localparam  CHANNEL2_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h0a10 
localparam  CHANNEL2_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h0a12 
                                                                 
                                   
localparam  CHANNEL3_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h0b00 
localparam  CHANNEL3_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h0b02 
localparam  CHANNEL3_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h0b04 
localparam  CHANNEL3_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h0b06 
localparam  CHANNEL3_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h0b08 
localparam  CHANNEL3_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h0b0a 
localparam  CHANNEL3_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h0b0c 
localparam  CHANNEL3_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h0b0e 
localparam  CHANNEL3_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h0b10 
localparam  CHANNEL3_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h0b12 
                                         
           
localparam  CHANNEL4_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h0c00
localparam  CHANNEL4_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h0c02
localparam  CHANNEL4_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h0c04
localparam  CHANNEL4_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h0c06
localparam  CHANNEL4_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h0c08
localparam  CHANNEL4_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h0c0a
localparam  CHANNEL4_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h0c0c
localparam  CHANNEL4_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h0c0e
localparam  CHANNEL4_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h0c10
localparam  CHANNEL4_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h0c12 
                                         
           
localparam  CHANNEL5_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h0d00
localparam  CHANNEL5_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h0d02
localparam  CHANNEL5_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h0d04
localparam  CHANNEL5_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h0d06
localparam  CHANNEL5_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h0d08
localparam  CHANNEL5_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h0d0a
localparam  CHANNEL5_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h0d0c
localparam  CHANNEL5_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h0d0e
localparam  CHANNEL5_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h0d10
localparam  CHANNEL5_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h0d12 
                                         
           
localparam  CHANNEL6_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h0e00
localparam  CHANNEL6_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h0e02
localparam  CHANNEL6_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h0e04
localparam  CHANNEL6_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h0e06
localparam  CHANNEL6_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h0e08
localparam  CHANNEL6_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h0e0a
localparam  CHANNEL6_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h0e0c
localparam  CHANNEL6_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h0e0e
localparam  CHANNEL6_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h0e10
localparam  CHANNEL6_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h0e12 
                                         
           
localparam  CHANNEL7_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h0f00
localparam  CHANNEL7_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h0f02
localparam  CHANNEL7_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h0f04
localparam  CHANNEL7_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h0f06
localparam  CHANNEL7_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h0f08
localparam  CHANNEL7_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h0f0a
localparam  CHANNEL7_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h0f0c
localparam  CHANNEL7_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h0f0e
localparam  CHANNEL7_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h0f10
localparam  CHANNEL7_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h0f12 
                                         
           
localparam  CHANNEL8_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h1000
localparam  CHANNEL8_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h1002
localparam  CHANNEL8_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h1004
localparam  CHANNEL8_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h1006
localparam  CHANNEL8_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h1008
localparam  CHANNEL8_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h100a
localparam  CHANNEL8_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h100c
localparam  CHANNEL8_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h100e
localparam  CHANNEL8_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h1010
localparam  CHANNEL8_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h1012 
                                         
           
localparam  CHANNEL9_CFG_INI0  = 16'h0000;//C_BASE_ADDR+16'h1100
localparam  CHANNEL9_CFG_INI1  = 16'h000c;//C_BASE_ADDR+16'h1102
localparam  CHANNEL9_CFG_INI2  = 16'h9100;//C_BASE_ADDR+16'h1104
localparam  CHANNEL9_CFG_INI3  = 16'h0550;//C_BASE_ADDR+16'h1106
localparam  CHANNEL9_CFG_INI4  = 16'h0031;//C_BASE_ADDR+16'h1108
localparam  CHANNEL9_CFG_INI5  = 16'h0000;//C_BASE_ADDR+16'h110a
localparam  CHANNEL9_CFG_INI6  = 16'h0000;//C_BASE_ADDR+16'h110c
localparam  CHANNEL9_CFG_INI7  = 16'h0000;//C_BASE_ADDR+16'h110e
localparam  CHANNEL9_CFG_INI8  = 16'h0000;//C_BASE_ADDR+16'h1110
localparam  CHANNEL9_CFG_INI9  = 16'h0000;//C_BASE_ADDR+16'h1112 
                                                                               
                                                
         
localparam  COMMON_CFG_INI  = {
                              COMMON2_CFG_INI3,COMMON2_CFG_INI2,COMMON2_CFG_INI1,COMMON2_CFG_INI0,
                              COMMON1_CFG_INI3,COMMON1_CFG_INI2,COMMON1_CFG_INI1,COMMON1_CFG_INI0,
                              COMMON0_CFG_INI3,COMMON0_CFG_INI2,COMMON0_CFG_INI1,COMMON0_CFG_INI0
                              };
                             
localparam  CHANNEL_CFG_INI = {
                              CHANNEL9_CFG_INI9,CHANNEL9_CFG_INI8,CHANNEL9_CFG_INI7,CHANNEL9_CFG_INI6,CHANNEL9_CFG_INI5,
                              CHANNEL9_CFG_INI4,CHANNEL9_CFG_INI3,CHANNEL9_CFG_INI2,CHANNEL9_CFG_INI1,CHANNEL9_CFG_INI0,
                              CHANNEL8_CFG_INI9,CHANNEL8_CFG_INI8,CHANNEL8_CFG_INI7,CHANNEL8_CFG_INI6,CHANNEL8_CFG_INI5,
                              CHANNEL8_CFG_INI4,CHANNEL8_CFG_INI3,CHANNEL8_CFG_INI2,CHANNEL8_CFG_INI1,CHANNEL8_CFG_INI0,
                              CHANNEL7_CFG_INI9,CHANNEL7_CFG_INI8,CHANNEL7_CFG_INI7,CHANNEL7_CFG_INI6,CHANNEL7_CFG_INI5,
                              CHANNEL7_CFG_INI4,CHANNEL7_CFG_INI3,CHANNEL7_CFG_INI2,CHANNEL7_CFG_INI1,CHANNEL7_CFG_INI0,
                              CHANNEL6_CFG_INI9,CHANNEL6_CFG_INI8,CHANNEL6_CFG_INI7,CHANNEL6_CFG_INI6,CHANNEL6_CFG_INI5,
                              CHANNEL6_CFG_INI4,CHANNEL6_CFG_INI3,CHANNEL6_CFG_INI2,CHANNEL6_CFG_INI1,CHANNEL6_CFG_INI0,
                              CHANNEL5_CFG_INI9,CHANNEL5_CFG_INI8,CHANNEL5_CFG_INI7,CHANNEL5_CFG_INI6,CHANNEL5_CFG_INI5,
                              CHANNEL5_CFG_INI4,CHANNEL5_CFG_INI3,CHANNEL5_CFG_INI2,CHANNEL5_CFG_INI1,CHANNEL5_CFG_INI0,
                              CHANNEL4_CFG_INI9,CHANNEL4_CFG_INI8,CHANNEL4_CFG_INI7,CHANNEL4_CFG_INI6,CHANNEL4_CFG_INI5,
                              CHANNEL4_CFG_INI4,CHANNEL4_CFG_INI3,CHANNEL4_CFG_INI2,CHANNEL4_CFG_INI1,CHANNEL4_CFG_INI0,
                              CHANNEL3_CFG_INI9,CHANNEL3_CFG_INI8,CHANNEL3_CFG_INI7,CHANNEL3_CFG_INI6,CHANNEL3_CFG_INI5,
                              CHANNEL3_CFG_INI4,CHANNEL3_CFG_INI3,CHANNEL3_CFG_INI2,CHANNEL3_CFG_INI1,CHANNEL3_CFG_INI0,
                              CHANNEL2_CFG_INI9,CHANNEL2_CFG_INI8,CHANNEL2_CFG_INI7,CHANNEL2_CFG_INI6,CHANNEL2_CFG_INI5,
                              CHANNEL2_CFG_INI4,CHANNEL2_CFG_INI3,CHANNEL2_CFG_INI2,CHANNEL2_CFG_INI1,CHANNEL2_CFG_INI0,
                              CHANNEL1_CFG_INI9,CHANNEL1_CFG_INI8,CHANNEL1_CFG_INI7,CHANNEL1_CFG_INI6,CHANNEL1_CFG_INI5,
                              CHANNEL1_CFG_INI4,CHANNEL1_CFG_INI3,CHANNEL1_CFG_INI2,CHANNEL1_CFG_INI1,CHANNEL1_CFG_INI0,
                              CHANNEL0_CFG_INI9,CHANNEL0_CFG_INI8,CHANNEL0_CFG_INI7,CHANNEL0_CFG_INI6,CHANNEL0_CFG_INI5,
                              CHANNEL0_CFG_INI4,CHANNEL0_CFG_INI3,CHANNEL0_CFG_INI2,CHANNEL0_CFG_INI1,CHANNEL0_CFG_INI0
                              };
                              
// ----------------------------------------------------------------------------
// wire type internal node                                                      
// ----------------------------------------------------------------------------
                              
// ----------------------------------------------------------------------------
// reg type internal node                                                      
// ----------------------------------------------------------------------------
reg    [15     : 0]                 S_reg_rdata_cm        ;
reg    [16*10  : 0]                 S_reg_rdata_ch        ;
reg    [160*10-1:0]                 S_channel_alarm_latch = 1600'd0 ;
reg    [7  : 0]                     S_cpu_rdata_sel       ;
reg                                 S_cpu_rden_d          ;
reg                                 S_cpu_wren_d1         ;
reg                                 S_cpu_wren_d2         ;
reg                                 S_cpu_wren_d3         ;
reg                                 S_cpu_rden_d1         ;
reg                                 S_cpu_rden_d2         ;
reg                                 S_cpu_rden_d3         ;
reg                                 S_cpu_wren            ;
reg     [15 : 0]                    S_cpu_waddr           ;
reg     [15 : 0]                    S_cpu_wdat            ;
reg                                 S_cpu_rden            ;
reg     [15 : 0]                    S_cpu_raddr           ;

genvar i;
genvar j;
genvar k;

// ---------------------------------------------------------------------------- 
//      main Verilog code                                                           
// ----------------------------------------------------------------------------
always@(posedge I_system_clk or posedge I_system_rst)           
    if(I_system_rst) 
        begin
            S_cpu_wren_d1 <= 1'd0 ;
            S_cpu_wren_d2 <= 1'd0 ;
            S_cpu_wren_d3 <= 1'd0 ;
            S_cpu_rden_d1 <= 1'd0 ;
            S_cpu_rden_d2 <= 1'd0 ;
            S_cpu_rden_d3 <= 1'd0 ;
        end    
    else
        begin
            S_cpu_wren_d1 <= I_cpu_wren ;
            S_cpu_wren_d2 <= S_cpu_wren_d1 ;
            S_cpu_wren_d3 <= S_cpu_wren_d2 ;
            S_cpu_rden_d1 <= I_cpu_rden ;   
            S_cpu_rden_d2 <= S_cpu_rden_d1 ;
            S_cpu_rden_d3 <= S_cpu_rden_d2 ;
        end


always@(posedge I_system_clk or posedge I_system_rst)           
    if(I_system_rst) 
        begin
            S_cpu_wren  <= 1'd0 ;
            S_cpu_waddr <= 16'd0 ;
            S_cpu_wdat  <= 16'd0 ;
        end
    else if((S_cpu_wren_d2) && (!S_cpu_wren_d3))
        begin
            S_cpu_wren  <= 1'd1 ;
            S_cpu_waddr <= I_cpu_addr ;
            S_cpu_wdat  <= I_cpu_wdat ;
        end
    else
        begin
            S_cpu_wren  <= 1'd0 ;
            S_cpu_waddr <= 16'd0 ;
            S_cpu_wdat  <= 16'd0 ;
        end        
   

always@(posedge I_system_clk or posedge I_system_rst)           
    if(I_system_rst) 
        begin
            S_cpu_rden  <= 1'd0 ;
            S_cpu_raddr <= 16'd0 ;
        end
    else if((S_cpu_rden_d2) && (!S_cpu_rden_d3))
        begin
            S_cpu_rden  <= 1'd1 ;
            S_cpu_raddr <= I_cpu_addr ;
        end
    else
        begin
            S_cpu_rden  <= 1'd0 ;
            S_cpu_raddr <= 16'd0 ;
        end   

                                                          
always@(posedge I_system_clk or posedge I_system_rst)           
    if(I_system_rst)    
        begin
            O_qpll_config <= COMMON_CFG_INI ;
        end                                                           
    else if(S_cpu_wren)                                               
        case(S_cpu_waddr[15:0])                                       
            C_BASE_ADDR+16'h0400: O_qpll_config   [ 64*0 + 16*0 + 15 :  64*0 + 16*0 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0402: O_qpll_config   [ 64*0 + 16*1 + 15 :  64*0 + 16*1 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0404: O_qpll_config   [ 64*0 + 16*2 + 15 :  64*0 + 16*2 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0406: O_qpll_config   [ 64*0 + 16*3 + 15 :  64*0 + 16*3 + 0] <= S_cpu_wdat   ;
                                                                       
            C_BASE_ADDR+16'h0410: O_qpll_config   [ 64*1 + 16*0 + 15 :  64*1 + 16*0 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0412: O_qpll_config   [ 64*1 + 16*1 + 15 :  64*1 + 16*1 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0414: O_qpll_config   [ 64*1 + 16*2 + 15 :  64*1 + 16*2 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0416: O_qpll_config   [ 64*1 + 16*3 + 15 :  64*1 + 16*3 + 0] <= S_cpu_wdat   ;
                                                                        
            C_BASE_ADDR+16'h0420: O_qpll_config   [ 64*2 + 16*0 + 15 :  64*2 + 16*0 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0422: O_qpll_config   [ 64*2 + 16*1 + 15 :  64*2 + 16*1 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0424: O_qpll_config   [ 64*2 + 16*2 + 15 :  64*2 + 16*2 + 0] <= S_cpu_wdat   ;
            C_BASE_ADDR+16'h0426: O_qpll_config   [ 64*2 + 16*3 + 15 :  64*2 + 16*3 + 0] <= S_cpu_wdat   ;
            default             :  ;               
        endcase


generate 
    for (i=0;i<10;i=i+1)//10个通道
        begin : CPU_WR
            always@(posedge I_system_clk or posedge I_system_rst)           
                if(I_system_rst)    
                    begin
                        O_channel_config[160*i+159:160*i] <= CHANNEL_CFG_INI[160*i+159:160*i] ;
                    end                                                           
                else if((S_cpu_wren) && ((S_cpu_waddr[15:8] == C_BASE_ADDR[15:8]+8'h08+8'h01*i)))
                    case(S_cpu_waddr[7:0])  
                        8'h00: O_channel_config[160*i+ 16*0 + 15 : 160*i+ 16*0 + 0] <= S_cpu_wdat   ;
                        8'h02: O_channel_config[160*i+ 16*1 + 15 : 160*i+ 16*1 + 0] <= S_cpu_wdat   ;
                        8'h04: O_channel_config[160*i+ 16*2 + 15 : 160*i+ 16*2 + 0] <= S_cpu_wdat   ;
                        8'h06: O_channel_config[160*i+ 16*3 + 15 : 160*i+ 16*3 + 0] <= S_cpu_wdat   ;
                        8'h08: O_channel_config[160*i+ 16*4 + 15 : 160*i+ 16*4 + 0] <= S_cpu_wdat   ;
                        8'h0a: O_channel_config[160*i+ 16*5 + 15 : 160*i+ 16*5 + 0] <= S_cpu_wdat   ;
                        8'h0c: O_channel_config[160*i+ 16*6 + 15 : 160*i+ 16*6 + 0] <= S_cpu_wdat   ;
                        8'h0e: O_channel_config[160*i+ 16*7 + 15 : 160*i+ 16*7 + 0] <= S_cpu_wdat   ;
                        8'h10: O_channel_config[160*i+ 16*8 + 15 : 160*i+ 16*8 + 0] <= S_cpu_wdat   ;
                        8'h12: O_channel_config[160*i+ 16*9 + 15 : 160*i+ 16*9 + 0] <= S_cpu_wdat   ;
                        default             :  ;
                    endcase
        end
endgenerate






always@(posedge I_system_clk)     
    if(S_cpu_rden) 
        case(S_cpu_raddr[15:0])
            C_BASE_ADDR+16'h0400: S_reg_rdata_cm <= O_qpll_config        [ 64*0 + 16*0 + 15 :  64*0 + 16*0 + 0] ;
            C_BASE_ADDR+16'h0402: S_reg_rdata_cm <= O_qpll_config        [ 64*0 + 16*1 + 15 :  64*0 + 16*1 + 0] ;
            C_BASE_ADDR+16'h0404: S_reg_rdata_cm <= O_qpll_config        [ 64*0 + 16*2 + 15 :  64*0 + 16*2 + 0] ;
            C_BASE_ADDR+16'h0406: S_reg_rdata_cm <= O_qpll_config        [ 64*0 + 16*3 + 15 :  64*0 + 16*3 + 0] ;
            C_BASE_ADDR+16'h0408: S_reg_rdata_cm <= I_qpll_state         [ 64*0 + 16*0 + 15 :  64*0 + 16*0 + 0] ;
            C_BASE_ADDR+16'h040a: S_reg_rdata_cm <= I_qpll_state         [ 64*0 + 16*1 + 15 :  64*0 + 16*1 + 0] ;
            C_BASE_ADDR+16'h040c: S_reg_rdata_cm <= I_qpll_state         [ 64*0 + 16*2 + 15 :  64*0 + 16*2 + 0] ;    
            C_BASE_ADDR+16'h040e: S_reg_rdata_cm <= I_qpll_state         [ 64*0 + 16*3 + 15 :  64*0 + 16*3 + 0] ;   
                                                                                          
            C_BASE_ADDR+16'h0410: S_reg_rdata_cm <= O_qpll_config        [ 64*1 + 16*0 + 15 :  64*1 + 16*0 + 0] ;
            C_BASE_ADDR+16'h0412: S_reg_rdata_cm <= O_qpll_config        [ 64*1 + 16*1 + 15 :  64*1 + 16*1 + 0] ;
            C_BASE_ADDR+16'h0414: S_reg_rdata_cm <= O_qpll_config        [ 64*1 + 16*2 + 15 :  64*1 + 16*2 + 0] ;
            C_BASE_ADDR+16'h0416: S_reg_rdata_cm <= O_qpll_config        [ 64*1 + 16*3 + 15 :  64*1 + 16*3 + 0] ;
            C_BASE_ADDR+16'h0418: S_reg_rdata_cm <= I_qpll_state         [ 64*1 + 16*0 + 15 :  64*1 + 16*0 + 0] ;
            C_BASE_ADDR+16'h041a: S_reg_rdata_cm <= I_qpll_state         [ 64*1 + 16*1 + 15 :  64*1 + 16*1 + 0] ;
            C_BASE_ADDR+16'h041c: S_reg_rdata_cm <= I_qpll_state         [ 64*1 + 16*2 + 15 :  64*1 + 16*2 + 0] ;    
            C_BASE_ADDR+16'h041e: S_reg_rdata_cm <= I_qpll_state         [ 64*1 + 16*3 + 15 :  64*1 + 16*3 + 0] ;
                                                                               
            C_BASE_ADDR+16'h0420: S_reg_rdata_cm <= O_qpll_config        [ 64*2 + 16*0 + 15 :  64*2 + 16*0 + 0] ;
            C_BASE_ADDR+16'h0422: S_reg_rdata_cm <= O_qpll_config        [ 64*2 + 16*1 + 15 :  64*2 + 16*1 + 0] ;
            C_BASE_ADDR+16'h0424: S_reg_rdata_cm <= O_qpll_config        [ 64*2 + 16*2 + 15 :  64*2 + 16*2 + 0] ;
            C_BASE_ADDR+16'h0426: S_reg_rdata_cm <= O_qpll_config        [ 64*2 + 16*3 + 15 :  64*2 + 16*3 + 0] ;
            C_BASE_ADDR+16'h0428: S_reg_rdata_cm <= I_qpll_state         [ 64*2 + 16*0 + 15 :  64*2 + 16*0 + 0] ;
            C_BASE_ADDR+16'h042a: S_reg_rdata_cm <= I_qpll_state         [ 64*2 + 16*1 + 15 :  64*2 + 16*1 + 0] ;
            C_BASE_ADDR+16'h042c: S_reg_rdata_cm <= I_qpll_state         [ 64*2 + 16*2 + 15 :  64*2 + 16*2 + 0] ;    
            C_BASE_ADDR+16'h042e: S_reg_rdata_cm <= I_qpll_state         [ 64*2 + 16*3 + 15 :  64*2 + 16*3 + 0] ;
            default             : S_reg_rdata_cm <= 16'd0 ;               
        endcase
    else
        S_reg_rdata_cm <= S_reg_rdata_cm ; 



generate 
    for (i=0;i<10;i=i+1)//10个通道
        begin : CPU_RD
            always@(posedge I_system_clk)     
                if(S_cpu_rden) 
                    if(S_cpu_raddr[15:8] == (C_BASE_ADDR[15:8]+8'h08+8'h01*i))
                        case(S_cpu_raddr[7:0])
                            8'h00:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*0 + 15 : 160*i+ 16*0 + 0] ;
                            8'h02:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*1 + 15 : 160*i+ 16*1 + 0] ;
                            8'h04:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*2 + 15 : 160*i+ 16*2 + 0] ;
                            8'h06:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*3 + 15 : 160*i+ 16*3 + 0] ;
                            8'h08:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*4 + 15 : 160*i+ 16*4 + 0] ;
                            8'h0a:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*5 + 15 : 160*i+ 16*5 + 0] ;
                            8'h0c:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*6 + 15 : 160*i+ 16*6 + 0] ;
                            8'h0e:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*7 + 15 : 160*i+ 16*7 + 0] ;
                            8'h10:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*8 + 15 : 160*i+ 16*8 + 0] ;
                            8'h12:    S_reg_rdata_ch[16*i+15:16*i] <= O_channel_config     [160*i+ 16*9 + 15 : 160*i+ 16*9 + 0] ;
                            8'h30:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*0 + 15 : 160*i+ 16*0 + 0] ;
                            8'h32:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*1 + 15 : 160*i+ 16*1 + 0] ;
                            8'h34:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*2 + 15 : 160*i+ 16*2 + 0] ;
                            8'h36:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*3 + 15 : 160*i+ 16*3 + 0] ;
                            8'h38:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*4 + 15 : 160*i+ 16*4 + 0] ;
                            8'h3a:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*5 + 15 : 160*i+ 16*5 + 0] ;
                            8'h3c:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*6 + 15 : 160*i+ 16*6 + 0] ;
                            8'h3e:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*7 + 15 : 160*i+ 16*7 + 0] ;
                            8'h40:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*8 + 15 : 160*i+ 16*8 + 0] ;
                            8'h42:    S_reg_rdata_ch[16*i+15:16*i] <= I_channel_state      [160*i+ 16*9 + 15 : 160*i+ 16*9 + 0] ;
                            8'h60:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*0 + 15 : 160*i+ 16*0 + 0] ;
                            8'h62:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*1 + 15 : 160*i+ 16*1 + 0] ;
                            8'h64:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*2 + 15 : 160*i+ 16*2 + 0] ;
                            8'h66:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*3 + 15 : 160*i+ 16*3 + 0] ;
                            8'h68:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*4 + 15 : 160*i+ 16*4 + 0] ;
                            8'h6a:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*5 + 15 : 160*i+ 16*5 + 0] ;
                            8'h6c:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*6 + 15 : 160*i+ 16*6 + 0] ;
                            8'h6e:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*7 + 15 : 160*i+ 16*7 + 0] ;
                            8'h70:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*8 + 15 : 160*i+ 16*8 + 0] ;
                            8'h72:    S_reg_rdata_ch[16*i+15:16*i] <= S_channel_alarm_latch[160*i+ 16*9 + 15 : 160*i+ 16*9 + 0] ;
                            default : S_reg_rdata_ch[16*i+15:16*i] <= 16'd0 ;               
                        endcase
                    else
                        S_reg_rdata_ch[16*i+15:16*i] <= 16'd0 ;    
                else
                    S_reg_rdata_ch[16*i+15:16*i] <= S_reg_rdata_ch[16*i+15:16*i] ; 
        end
endgenerate


//告警锁存、读清
generate 
    for (i=0;i<10;i=i+1)//10个通道
        begin : ALARM_LATCH2
            for (j=0;j<10;j=j+1)//10个16bit
                begin : ALARM_LATCH1 
                    for (k=0;k<16;k=k+1)//16bit
                        begin : ALARM_LATCH0 
                            always@(posedge I_system_clk)                                                                         
                                if(I_channel_alarm[160*i+16*j+k])                                             
                                    S_channel_alarm_latch[160*i+16*j+k] <= 1'b1;                                   
                                else if((S_cpu_raddr[15:0]==(C_BASE_ADDR+16'h0800+16'h0100*i+16'h0060+16'h0002*j)) && S_cpu_rden) 
                                    S_channel_alarm_latch[160*i+16*j+k] <= 1'b0;
                        end
                end
        end
endgenerate   

always@(posedge I_system_clk)
    begin
        S_cpu_rdata_sel <= S_cpu_raddr[15:8] ;
        S_cpu_rden_d    <= S_cpu_rden ;
    end    
        
always@(posedge I_system_clk) 
    if(S_cpu_rden_d)    
        case(S_cpu_rdata_sel)
            C_BASE_ADDR[15:8]+8'h00,
            C_BASE_ADDR[15:8]+8'h01,
            C_BASE_ADDR[15:8]+8'h02,
            C_BASE_ADDR[15:8]+8'h03,
            C_BASE_ADDR[15:8]+8'h04,
            C_BASE_ADDR[15:8]+8'h05,
            C_BASE_ADDR[15:8]+8'h06,
            C_BASE_ADDR[15:8]+8'h07:    O_cpu_rdat <= S_reg_rdata_cm[      15:    0]; 
            C_BASE_ADDR[15:8]+8'h08:    O_cpu_rdat <= S_reg_rdata_ch[16* 0+15:16* 0];   
            C_BASE_ADDR[15:8]+8'h09:    O_cpu_rdat <= S_reg_rdata_ch[16* 1+15:16* 1];   
            C_BASE_ADDR[15:8]+8'h0a:    O_cpu_rdat <= S_reg_rdata_ch[16* 2+15:16* 2];   
            C_BASE_ADDR[15:8]+8'h0b:    O_cpu_rdat <= S_reg_rdata_ch[16* 3+15:16* 3];   
            C_BASE_ADDR[15:8]+8'h0c:    O_cpu_rdat <= S_reg_rdata_ch[16* 4+15:16* 4];   
            C_BASE_ADDR[15:8]+8'h0d:    O_cpu_rdat <= S_reg_rdata_ch[16* 5+15:16* 5];   
            C_BASE_ADDR[15:8]+8'h0e:    O_cpu_rdat <= S_reg_rdata_ch[16* 6+15:16* 6];   
            C_BASE_ADDR[15:8]+8'h0f:    O_cpu_rdat <= S_reg_rdata_ch[16* 7+15:16* 7];   
            C_BASE_ADDR[15:8]+8'h10:    O_cpu_rdat <= S_reg_rdata_ch[16* 8+15:16* 8];   
            C_BASE_ADDR[15:8]+8'h11:    O_cpu_rdat <= S_reg_rdata_ch[16* 9+15:16* 9];         
            default                :    O_cpu_rdat <= 16'd0; 
        endcase        
    else
        O_cpu_rdat <= O_cpu_rdat;

endmodule