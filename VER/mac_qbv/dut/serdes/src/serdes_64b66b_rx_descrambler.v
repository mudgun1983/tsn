//FILE_HEADER-------------------------------------------------------
//ZTE Copyright(C)                                                  
//ZTE Company Confidential                                          
//------------------------------------------------------------------
// Project Name : R8852 
// FILE NAME    : serdes_64b66b_rx_descrambler.v
// AUTHOR       : Zhou jixian
// Department   : ZTE-BBU
// Email        : zhou.jixian@zte.com.cn
//------------------------------------------------------------------
// Module Hiberarchy:
//x serdes_64b66b_rx_descrambler-
//-----------------------------------------------------------------
// Release History:
//-----------------------------------------------------------------
// Version       Date         Author      Description
// 1.0        12-02-2015     Zhou Jixian
// 1.1        04-22-2016     Luwei       to match 25G serdes
//-----------------------------------------------------------------
// Main Function:(Describing main function of the module)
// a)64B/66B解扰处理
// b)目前只支持64bit
// c)时延 1个clk
//----------------------------------------------------------------- 
//REUSE ISSUES:  N/A                                                
//Reset Strategy: Asynchronous reset and Synchronous release,active 
//Clock Strategy: N/A                                               
//Critical Timing: N/A                                              
//Asynchronous Interface: N/A                              
//END_HEADER--------------------------------------------------------

module serdes_64b66b_rx_descrambler #
    ( 
    parameter C_RX_DATA_WIDTH = 64
    )
    (  
    /// clock and reset Interface
    input  wire                           I_pcs_rx_clk                 , ///clock signal, drived by serdes output clk 
    input  wire                           I_pcs_rx_rst                 , /// rx reset signal, high active 
    /// signals input interface                                        
    input  wire [(C_RX_DATA_WIDTH-1):0]   I_rx_data                    , /// RX scramled data from serdes 
    input  wire                           I_rx_valid                   , /// data valid signal
    input  wire [1:0]                     I_rx_header                  , /// sync header of RX scramled data
    input  wire                           I_rx_header_valid            , /// sync header valid signal
    input  wire                           I_rx_block_sync              , /// block synchronization indication signal
    /// descrambled signals output Interface                           
    output  reg [(C_RX_DATA_WIDTH-1):0]   O_rx_descramble_data         , /// descrambled data
    output  reg                       	  O_rx_descramble_valid        , /// descrambled data valid signal
    output  reg [1:0]                     O_rx_descramble_header       , /// sync header of descrambled data
    output  reg                           O_rx_descramble_header_valid   /// sync header valid signal
    );

///*********************************************************************
///internal singals defination
///*********************************************************************
reg     [57:0]                   S_descrambler           ; /// descramble sequence 
wire    [57:0]                   S_descrambler_b         ; /// descrambler  sequence
wire    [(C_RX_DATA_WIDTH-1):0]  S_descramble_data       ; /// descrambled data 
wire    [31:0]                   S_descramble_data_inv   ; /// inverted order of  I_rx_data
wire    [31:0]                   S_descramble_data_inv_b ; /// inverted order of  S_scramble_data

///********************************************************************  
///      Main Verilog code                                               
///********************************************************************    
genvar i;
generate 
    for (i = 0; i < 32; i = i + 1)
		    begin: descramble_data_loop1 
            assign S_descramble_data[i] = I_rx_data[i] ^ S_descrambler[38-i] ^ S_descrambler[57-i]; /// descramble operation  
            assign S_descramble_data_inv[31-i] = I_rx_data[i]; ///  invert the order of I_rx_data
		    end
endgenerate

assign S_descrambler_b  = {S_descrambler[25:0],S_descramble_data_inv};///update scramble value

generate 
    for (i = 0; i < 32; i= i + 1)
        begin:  descramble_data_loop2
            assign S_descramble_data[32+i] = I_rx_data[32+i] ^ S_descrambler_b[38-i] ^ S_descrambler_b[57-i];/// scramble operation
            assign S_descramble_data_inv_b[31-i] = I_rx_data[32+i]; /// invert the order of S_scramble_data
        end
endgenerate

/// descrambled Data assignment to output port    
always @(posedge I_pcs_rx_clk or posedge I_pcs_rx_rst)
    if (I_pcs_rx_rst)
      begin
      	  O_rx_descramble_data <= 64'b0;
      	  S_descrambler        <= 58'b0;
      end
    else
      begin
          if (!I_rx_block_sync ) ///when block lose synchronization , clear the output 
              begin
              	  O_rx_descramble_data <= {C_RX_DATA_WIDTH{1'b0}};                              
              	  S_descrambler        <= 58'd0  ; 
              end
          else if (I_rx_valid)
              begin
                  O_rx_descramble_data <= S_descramble_data;      /// output the  descrambled data
                  S_descrambler        <= {S_descrambler_b[25:0],S_descramble_data_inv_b};///update descramble value
              end
          else 
              begin
              	  O_rx_descramble_data <= O_rx_descramble_data; 
              	  S_descrambler        <= S_descrambler       ;
              end
      end

///  Align the signals  with  O_descramble_rx_data
always @(posedge I_pcs_rx_clk)
    begin
        if (!I_rx_block_sync)   ///when block synchronization loss, clear the output  
            begin
            	  O_rx_descramble_valid        <= 1'b0;         
            	  O_rx_descramble_header       <= 2'd0;      
            	  O_rx_descramble_header_valid <= 1'b0;          	   
            end
        else
            begin
                O_rx_descramble_valid        <= I_rx_valid       ;
                O_rx_descramble_header       <= I_rx_header      ;
                O_rx_descramble_header_valid <= I_rx_header_valid;	
            end
    end  
endmodule	/// end of  cpri_64b66b_descrambler  module 
