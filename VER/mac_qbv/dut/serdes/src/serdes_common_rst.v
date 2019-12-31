//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_common_rst.v
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
// 1.0        2013-7-11   piqiang   原始版本说明；
// 1.1        mm-dd-yyyy   Author   修改、增减的主要内容描述
//-----------------------------------------------------------------
// Main Function:(Describing main function of the module)
// a)generate serdes reset signal
// b)xxxxxxxx
//-----------------------------------------------------------------
//REUSE ISSUES: xxxxxxxx          
//Reset Strategy: xxxxxxxx
//Clock Strategy: xxxxxxxx
//Critical Timing: xxxxxxxx
//Asynchronous Interface: xxxxxxxx
//END_HEADER--------------------------------------------------------      
      
`timescale 1ns/1ps

module serdes_common_rst
        (
         input  wire         I_clk              ,//
         input  wire         I_rst              ,//
         //cpll
         input  wire         I_pllpd            ,//
         input  wire         I_force_pllreset   ,//
         input  wire         I_gtpowergood      ,//
         input  wire         I_plllock          ,//
         input  wire         I_pllrefclklost    ,//
         input  wire         I_pllfbclklost     ,//
         output reg          O_pllreset         ,// 
         output wire  [2:0]  O_pllrst_state     ,//
         output wire         O_pllresetdone      //

        );

//parameter define     
parameter   C_PLLRST_PULSE_WIDTH  = 13'd15      ;  
parameter   C_PLL_RST_TIME        = 8'd125      ;//122.88m时钟，即持续锁定1us
parameter   C_CLK_FREQUENCY       = 125         ;


//localparam define      
localparam  C_PLLRESET        = 3'b001   ;
localparam  C_WAIT_PLL_LOCKED = 3'b010   ;
localparam  C_PLL_LOCKED      = 3'b100   ;
localparam  C_PLLLOCK_TIMEOUT = 1000000 * C_CLK_FREQUENCY ; //1S

// ----------------------------------------------------------------------------
// inter reg
// ----------------------------------------------------------------------------
wire [5:0]   S_signal_gather        ;//
reg  [5:0]   S_signal_gather_d1     ;//
reg  [5:0]   S_signal_gather_d2     ;//
wire         S_gtpowergood          ;//
wire         S_plllock              ;//
wire         S_pllrefclklost        ;//
wire         S_pllfbclklost         ;//
wire         S_force_pllreset       ;//
wire         S_pll_pd               ;//
reg  [2:0]   S_pllrst_state_curr    ;//
reg  [2:0]   S_pllrst_state_next    ;//
reg  [12:0]  S_pllrst_pulse_width   ;//
reg  [7:0]   S_pll_rst_time         ;//
reg  [28:0]  S_time_cnt             ;//
reg          S_plllock_to_sat       ;//

// ----------------------------------------------------------------------------
//      main Verilog code
// ----------------------------------------------------------------------------
//-------------------synchronize the input state signal---------------------
assign  O_pllrst_state = S_pllrst_state_curr ;

assign  S_signal_gather = {I_gtpowergood,I_plllock,I_force_pllreset,I_pllpd,I_pllrefclklost,I_pllfbclklost}; 

always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        begin
            S_signal_gather_d1 <= 6'b0 ;
            S_signal_gather_d2 <= 6'b0 ;
        end
    else
        begin
            S_signal_gather_d1 <= S_signal_gather ;
            S_signal_gather_d2 <= S_signal_gather_d1 ;
        end
		  

assign  {S_gtpowergood,S_plllock,S_force_pllreset,S_pll_pd,S_pllrefclklost,S_pllfbclklost} = S_signal_gather_d2 ;

//----------------------------------------------pll reset FSM--------------------------------------      
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_pllrst_state_curr <= C_PLLRESET ;
    else
        S_pllrst_state_curr <= S_pllrst_state_next ;
        
always @(*)
    begin        
        case(S_pllrst_state_curr)        
            C_PLLRESET :
                begin
                    if(S_pllrst_pulse_width == C_PLLRST_PULSE_WIDTH)
                        S_pllrst_state_next = C_WAIT_PLL_LOCKED ;
                    else
                        S_pllrst_state_next = C_PLLRESET ;
                end
                
            C_WAIT_PLL_LOCKED :
                begin
                    if((S_gtpowergood == 1'b0) || (S_force_pllreset == 1'b1) || (S_pll_pd == 1'b1) || ( S_plllock_to_sat == 1'b1))
                        S_pllrst_state_next = C_PLLRESET ;
                    else if(S_pll_rst_time == C_PLL_RST_TIME)
                        S_pllrst_state_next = C_PLL_LOCKED ;
                    else
                        S_pllrst_state_next = C_WAIT_PLL_LOCKED ;     
                end    
        
            C_PLL_LOCKED :
                begin
                    if((S_gtpowergood == 1'b0) || 
                       (S_force_pllreset == 1'b1) || 
                       (S_pll_pd ==  1'b1) || 
                       (S_plllock == 1'b0) ||
                       (S_pllrefclklost == 1'b1) ||
                       (S_pllfbclklost == 1'b1)
                      )
                        S_pllrst_state_next = C_PLLRESET ;  
                    else
                        S_pllrst_state_next = C_PLL_LOCKED ;     
                end 
                         
            default : S_pllrst_state_next = C_PLLRESET ;
        endcase           
    end   


//generate S_pllrst_pulse_width
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_pllrst_pulse_width <= 13'b0 ;
    else if(S_pllrst_state_curr == C_PLLRESET)    
        if((S_gtpowergood == 1'b0) || (S_force_pllreset == 1'b1) || (S_pll_pd ==  1'b1))
            S_pllrst_pulse_width <= 13'b0 ;    
        else
            S_pllrst_pulse_width <= S_pllrst_pulse_width + 13'b1 ;
    else
        S_pllrst_pulse_width <= 13'b0 ;
        

//generate S_pll_rst_time
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_pll_rst_time <= 8'b0 ;   
    else if(S_pllrst_state_curr == C_WAIT_PLL_LOCKED)
        if(S_plllock)
            S_pll_rst_time <= S_pll_rst_time + 8'b1 ;
        else
            S_pll_rst_time <= 8'b0 ;
    else
        S_pll_rst_time <= 8'b0 ;


//generate S_plllock_to_sat
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_time_cnt <= 29'b0 ;
    else if(S_pllrst_state_curr != S_pllrst_state_next)    
        S_time_cnt <= 29'b0 ;    
    else
        S_time_cnt <= S_time_cnt + 29'b1 ;
        
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_plllock_to_sat <= 1'b0 ;
    else if(S_pllrst_state_curr == C_WAIT_PLL_LOCKED)    
        if(S_time_cnt == C_PLLLOCK_TIMEOUT)    
            S_plllock_to_sat <= 1'b1 ; 
        else
            S_plllock_to_sat <= S_plllock_to_sat ;      
    else
        S_plllock_to_sat <= 1'b0 ;



//generate O_pllreset
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        O_pllreset <= 1'b1 ;
    else if(S_pllrst_state_curr == C_PLLRESET)
        O_pllreset <= 1'b1 ;
    else
        O_pllreset <= 1'b0 ;


assign  O_pllresetdone = (S_pllrst_state_curr == C_PLL_LOCKED) ;


    
endmodule

