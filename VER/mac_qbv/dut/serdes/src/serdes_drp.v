//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_drp.v
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
// 1.0        2013-7-16    piqiang   原始版本说明；
// 1.1        mm-dd-yyyy   Author   修改、增减的主要内容描述
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

`timescale 1ns/1ps

module  serdes_drp
         (
         input  wire [9:0]            I_cpu_drpaddr      ,//
         input  wire [15:0]           I_cpu_drpdi        ,//
         input  wire                  I_cpu_drpwe        ,//
         input  wire                  I_cpu_drpen        ,//
         output reg  [15:0]           O_cpu_drpdo        ,//
        
         input  wire                  I_drp_clk          ,//
         input  wire                  I_drp_rst          ,//        
         input  wire                  I_drprdy           ,//                                                
         output reg  [9:0]            O_drpaddr          ,//
         output reg  [15:0]           O_drpdi            ,//
         output reg                   O_drpwe            ,//
         output reg                   O_drpen            ,//
         input  wire [15:0]           I_drpdo             //

         );
// ----------------------------------------------------------------------------
// inter reg
// ----------------------------------------------------------------------------
reg                         S_cpu_drpen1     ;//
reg                         S_cpu_drpen2     ;//
reg                         S_cpu_drpen3     ;//
reg                         S_drpen          ;//
// ----------------------------------------------------------------------------
// inter wire
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
//      main Verilog code
// ----------------------------------------------------------------------------
always@(posedge I_drp_clk or posedge I_drp_rst)
    if(I_drp_rst)
        begin
            S_cpu_drpen1 <= 1'b0 ;
            S_cpu_drpen2 <= 1'b0 ;
            S_cpu_drpen3 <= 1'b0 ;
        end
    else
        begin
            S_cpu_drpen1 <= I_cpu_drpen  ; 
            S_cpu_drpen2 <= S_cpu_drpen1 ;
            S_cpu_drpen3 <= S_cpu_drpen2 ;
        end


always@(posedge I_drp_clk or posedge I_drp_rst)
    if(I_drp_rst)
        S_drpen <= 1'b0 ;
    else if((S_cpu_drpen2)&&(!S_cpu_drpen3))
        S_drpen <= 1'b1 ; 
    else
        S_drpen <= 1'b0 ; 


always@(posedge I_drp_clk or posedge I_drp_rst)
    if(I_drp_rst)
        begin
            O_drpaddr <= 10'b0 ;
            O_drpdi   <= 16'b0 ;
            O_drpwe   <= 1'b0  ;
        end    
    else if(S_drpen)
        begin
            O_drpaddr <= I_cpu_drpaddr ;
            O_drpdi   <= I_cpu_drpdi   ;
            O_drpwe   <= I_cpu_drpwe   ;
        end
    else
        begin
            O_drpaddr <= 10'b0 ;
            O_drpdi   <= 16'b0 ; 
            O_drpwe   <= 1'b0  ;
        end



always@(posedge I_drp_clk or posedge I_drp_rst)
    if(I_drp_rst)
        O_drpen <= 1'b0 ;
    else 
        O_drpen <= S_drpen ;


always@(posedge I_drp_clk or posedge I_drp_rst)
    if(I_drp_rst)
        O_cpu_drpdo <= 16'b0 ;
    else if(I_drprdy == 1'b1) 
        if(I_cpu_drpwe)
            O_cpu_drpdo <= I_cpu_drpdi ;
        else
            O_cpu_drpdo <= I_drpdo ;
    else
        O_cpu_drpdo <= O_cpu_drpdo ;        
            


endmodule