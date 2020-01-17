//FILE_HEADER-------------------------------------------------------
//ZTE Copyright(C)                                                  
//ZTE Company Confidential                                          
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_64b66b_tx_scrambler.v
// AUTHOR       : Zhou jixian
// Department   : ZTE-BBU
// Email        : zhou.jixian@zte.com.cn
//------------------------------------------------------------------
// Module Hiberarchy:
//x serdes_64b66b_tx_scrambler
//-----------------------------------------------------------------
// Release History:
//-----------------------------------------------------------------
// Version       Date         Author      Description
// 1.0        12-02-2015     Zhou Jixian
// 1.1        04-19-2016     Luwei       to match 25G serdes
//-----------------------------------------------------------------
//Main Function
// a)64B/66B加扰处理
// b)只支持64bit
// c)时延 1个clk
//----------------------------------------------------------------- 
//REUSE ISSUES:  N/A                                                
//Reset Strategy: Asynchronous reset and Synchronous release,active 
//Clock Strategy: N/A                                               
//Critical Timing: N/A                                              
//Asynchronous Interface: N/A                              
//END_HEADER--------------------------------------------------------

module serdes_64b66b_tx_scrambler #
    ( 
    parameter C_TX_DATA_WIDTH = 64
    )
    (
    /// clock and reset Interface
    input  wire                           I_pcs_tx_clk         , ///clock signal, drived by serdes output clk  
    input  wire                           I_pcs_tx_rst         , /// tx reset signal, high active                   
    /// input Interface                                        
    input  wire  [(C_TX_DATA_WIDTH-1):0]  I_tx_data            , /// unscramble data input 
    input  wire  [5:0]                    I_tx_seq             , /// sequence counter, range 0-32
    input  wire  [1:0]                    I_tx_header          , /// sync header of unscramble data, sync header bypass scrambler 
    /// output interface                   
    output reg   [(C_TX_DATA_WIDTH-1):0]  O_tx_scramble_data   , /// scrambled data output
    output reg   [5:0]                    O_tx_scramble_seq    , /// sequence counter, range 0-32 
    output reg   [1:0]                    O_tx_scramble_header   /// sync header of scrambled data
    );

///*********************************************************************
///internal singals defination                                          
///*********************************************************************
reg     	[57:0]                    S_scrambler           ; /// scramble  sequence
wire    	[57:0]                    S_scrambler_b         ; /// scramble  sequence
wire     	[(C_TX_DATA_WIDTH-1):0]   S_scramble_data       ; /// scrambled data
wire     	[31:0]                    S_scramble_data_inv   ; /// inverted order of  S_scramble_data 
wire     	[31:0]                    S_scramble_data_inv_b ; /// inverted order of  S_scramble_data
///********************************************************************
///      Main Verilog code                                             
///******************************************************************** 
/// scramble process  
genvar i;
generate 
    for (i=0; i<32; i= i+1)
        begin:  scramble_data_loop1
            assign S_scramble_data[i] = I_tx_data[i] ^ S_scrambler[38-i] ^ S_scrambler[57-i];/// scramble operation
            assign S_scramble_data_inv[31-i] = S_scramble_data[i]; /// invert the order of S_scramble_data
        end
endgenerate

assign S_scrambler_b  = {S_scrambler[25:0],S_scramble_data_inv};///update scramble value


generate 
    for (i=0; i<32; i= i+1)
        begin:  scramble_data_loop2
            assign S_scramble_data[32+i] = I_tx_data[32+i] ^ S_scrambler_b[38-i] ^ S_scrambler_b[57-i];/// scramble operation
            assign S_scramble_data_inv_b[31-i] = S_scramble_data[32+i]; /// invert the order of S_scramble_data
        end
endgenerate



///Scrambled Data assignment to output port 
always @(posedge I_pcs_tx_clk or posedge I_pcs_tx_rst)
    if (I_pcs_tx_rst)
      begin
      	  O_tx_scramble_data <= 64'b0;
      	  S_scrambler        <= 58'b0;
      end
    else 
       begin 
           if (I_tx_seq[5] == 1'b0) ///  0-31 is valid 
               begin
                   O_tx_scramble_data <= S_scramble_data;      /// output the  scrambled data 
                   S_scrambler        <= {S_scrambler_b[25:0],S_scramble_data_inv_b};///update scramble value 
               end 
           else
               begin                       	
               	  O_tx_scramble_data  <= O_tx_scramble_data;
               	  S_scrambler         <= S_scrambler;
               end
       end

///Align the signals with O_scramble_tx_data   
always @(posedge I_pcs_tx_clk)
    begin 
        O_tx_scramble_seq    <= I_tx_seq   ;
        O_tx_scramble_header <= I_tx_header; 
    end
     
endmodule /// end of  cpri_64b66b_scrambler  module 
