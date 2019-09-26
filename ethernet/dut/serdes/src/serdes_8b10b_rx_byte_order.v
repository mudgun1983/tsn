//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : BPN1
// FILE NAME    : serdes_8b10b_rx_byte_order.v
// AUTHOR       : Zhang Diqiang
// Department   : ZTE-BBU
// Email        : zhang.diqiang@zte.com.cn
//------------------------------------------------------------------
// Module Hiberarchy:
//
//-----------------------------------------------------------------
// Release History:
//-----------------------------------------------------------------
// Version       Date         Author        Description
// 1.0        03-27-2012   Zhang Diqiang
// 2.0        05-10-2013   Kuang xiaobo   Modify for BPN1
// 3.0        20-05-2014   Piqiang          for  BPN2
// 4.0        15-04-2016   Luwei            for  25GSERDES
//-----------------------------------------------------------------
// Main Function:(Describing main function of the module)
// a)对Serdes过来的64bit数据进行字节序调整，将K码及K码指示放在最低bit位;
//-----------------------------------------------------------------
//REUSE ISSUES: xxxxxxxx
//Reset Strategy: xxxxxxxx
//Clock Strategy: xxxxxxxx
//Critical Timing: xxxxxxxx
//Asynchronous Interface: xxxxxxxx
//END_HEADER--------------------------------------------------------

`timescale 1 ns / 100 ps

module serdes_8b10b_rx_byte_order
    (
    input             I_rst                , //  全局复位信号，低有效
    input             I_rx_clk             , //  serdes rx clk
    input    [63:0]   I_rx_data            , //  Serdes rx data    
    input    [7 :0]   I_rx_k_ctrl          , //  Serdes rx kcode
                                           
    output   [63:0]   O_rx_data            , //  rx data after adjust
    output   [7 :0]   O_rx_k_ctrl            //  kcode after adjust
    );
    
    /// internal variable ///    
    reg      [63:0]   S_rx_data_1d         ; //  serdes rx data delay 1clk
    reg      [63:0]   S_rx_data_2d         ; //  serdes rx data delay 2clk
    reg      [63:0]   S_rx_data_adjusted   ; //  serdes rx data adjusted
    reg      [7 :0]   S_rx_k_ctrl_1d       ; //  serdes kcode delay 1clk
    reg      [7 :0]   S_rx_k_ctrl_2d       ; //  serdes kcode delay 2clk
    reg      [7 :0]   S_rx_k_ctrl_adjusted ; //  serdes kcode adjusted
    reg      [3 :0]   S_adjust_sel         ; //  adjust sel mode

///The code begins here
assign O_rx_data   = S_rx_data_adjusted    ;   
assign O_rx_k_ctrl = S_rx_k_ctrl_adjusted  ;   


///data delay 1clk
always @ (posedge I_rx_clk)
begin
    S_rx_data_1d  [63:0]      <= I_rx_data      [63:0] ; 
    S_rx_k_ctrl_1d[7:0]       <= I_rx_k_ctrl    [7:0]  ;
    S_rx_data_2d  [63:0]      <= S_rx_data_1d   [63:0] ; 
    S_rx_k_ctrl_2d[7:0]       <= S_rx_k_ctrl_1d [7:0]  ;
end    

///monitor the input signals, whether need adjust byte order,outside serdes
always @ (posedge I_rx_clk)
begin
    if((S_rx_k_ctrl_1d[7:0] == 8'b10000000) && (S_rx_data_1d[63:56] == 8'hBC))   //需要调整字节序
        begin
            S_adjust_sel <= 4'd7;
        end
    else if((S_rx_k_ctrl_1d[7:0] == 8'b01000000) && (S_rx_data_1d[55:48] == 8'hBC))   //需要调整字节序
        begin
            S_adjust_sel <= 4'd6;
        end        
    else if((S_rx_k_ctrl_1d[7:0] == 8'b00100000) && (S_rx_data_1d[47:40] == 8'hBC))   //需要调整字节序
        begin
            S_adjust_sel <= 4'd5;
        end
    else if((S_rx_k_ctrl_1d[7:0] == 8'b00010000) && (S_rx_data_1d[39:32] == 8'hBC))   //需要调整字节序
        begin
            S_adjust_sel <= 4'd4;
        end
    else if((S_rx_k_ctrl_1d[7:0] == 8'b00001000) && (S_rx_data_1d[31:24] == 8'hBC))   //需要调整字节序
        begin
            S_adjust_sel <= 4'd3;
        end
    else if((S_rx_k_ctrl_1d[7:0] == 8'b00000100) && (S_rx_data_1d[23:16] == 8'hBC))   //需要调整字节序
        begin
            S_adjust_sel <= 4'd2;
        end   
    else if((S_rx_k_ctrl_1d[7:0] == 8'b00000010) && (S_rx_data_1d[15:8] == 8'hBC))   //需要调整字节序
        begin
            S_adjust_sel <= 4'd1;
        end  
    else if((S_rx_k_ctrl_1d[7:0] == 8'b00000001) && (S_rx_data_1d[7:0] == 8'hBC))   //不需要调整字节序
        begin
            S_adjust_sel <= 4'd0;
        end   
end

always @ (posedge I_rx_clk)
begin
    case(S_adjust_sel) 
        4'd7:             
            begin
                S_rx_data_adjusted[63:0]  <= {S_rx_data_1d[55:0],S_rx_data_2d[63:56]};
                S_rx_k_ctrl_adjusted[7:0] <= {S_rx_k_ctrl_1d[6:0],S_rx_k_ctrl_2d[7]}; 
            end        
        4'd6:
            begin
                S_rx_data_adjusted[63:0]  <= {S_rx_data_1d[47:0],S_rx_data_2d[63:48]};
                S_rx_k_ctrl_adjusted[7:0] <= {S_rx_k_ctrl_1d[5:0],S_rx_k_ctrl_2d[7:6]}; 
            end         
        4'd5:
            begin
                S_rx_data_adjusted[63:0]  <= {S_rx_data_1d[39:0],S_rx_data_2d[63:40]};
                S_rx_k_ctrl_adjusted[7:0] <= {S_rx_k_ctrl_1d[4:0],S_rx_k_ctrl_2d[7:5]}; 
            end         
        4'd4: 
            begin
                S_rx_data_adjusted[63:0]  <= {S_rx_data_1d[31:0],S_rx_data_2d[63:32]};
                S_rx_k_ctrl_adjusted[7:0] <= {S_rx_k_ctrl_1d[3:0],S_rx_k_ctrl_2d[7:4]}; 
            end        
        4'd3: 
            begin
                S_rx_data_adjusted[63:0]  <= {S_rx_data_1d[23:0],S_rx_data_2d[63:24]};
                S_rx_k_ctrl_adjusted[7:0] <= {S_rx_k_ctrl_1d[2:0],S_rx_k_ctrl_2d[7:3]}; 
            end        
        4'd2: 
            begin
                S_rx_data_adjusted[63:0]  <= {S_rx_data_1d[15:0],S_rx_data_2d[63:16]};
                S_rx_k_ctrl_adjusted[7:0] <= {S_rx_k_ctrl_1d[1:0],S_rx_k_ctrl_2d[7:2]}; 
            end       
        4'd1:
            begin
                S_rx_data_adjusted[63:0]  <= {S_rx_data_1d[7:0],S_rx_data_2d[63:8]};
                S_rx_k_ctrl_adjusted[7:0] <= {S_rx_k_ctrl_1d[0],S_rx_k_ctrl_2d[7:1]}; 
            end         
        4'd0: 
            begin
                S_rx_data_adjusted[63:0]  <= S_rx_data_2d[63:0];   
                S_rx_k_ctrl_adjusted[7:0] <= S_rx_k_ctrl_2d[7:0];  
            end        
        default: 
            begin
                S_rx_data_adjusted[63:0]  <= S_rx_data_2d[63:0];
                S_rx_k_ctrl_adjusted[7:0] <= S_rx_k_ctrl_2d[7:0];
            end            
    endcase  
end

endmodule