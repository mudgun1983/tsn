//FILE_HEADER-------------------------------------------------------
//ZTE Copyright(C)
//ZTE Company Confidential
//------------------------------------------------------------------
//Project Name : R8852
//FILE NAME    : serdes_64b66b_rx_decode.v
//AUTHOR       : Zhou jixian
//Department   : ZTE-BBU
//Email        : zhou.jixian@zte.com.cn
//------------------------------------------------------------------
//Module Hiberarchy:
//x serdes_64b66b_rx_decode
//-----------------------------------------------------------------
//Release History:
//-----------------------------------------------------------------
// Version       Date         Author      Description
// 1.0         02-22-2016     Zhou Jixian
// 1.1         04-22-2016     Luwei       to match 25G serdes
//-----------------------------------------------------------------
//Main Function:
// a)完成64B/66B解码处理, 只针对CPRI协议涉及的S/T/Data block类型
// b)总时延：5个clk
// c)目前只支持64bit
//-----------------------------------------------------------------
//REUSE ISSUES:  N/A
//Reset Strategy: Asynchronous reset and Synchronous release,active high
//Clock Strategy: N/A
//Critical Timing: N/A
//Asynchronous Interface: I_pcs_rx_rst
//END_HEADER--------------------------------------------------------

module serdes_64b66b_rx_decode 
    (
     /// System Interface
    input                                 I_pcs_rx_clk             , ///clock signal, drived by serdes rxusrclk  
    input                                 I_pcs_rx_rst             , ///reset signal, high active                    
    /// input RX signals after descrambling                        
    input        [63:0]                   I_rx_data                , ///RX data from  descrambler 
    input                                 I_rx_valid               , ///RX data valid signal    
    input        [1 :0]                   I_rx_header              , ///header of  Rx data
    input                                 I_rx_header_valid        , ///header valid signal 
    input                                 I_rx_block_sync          , /// sync header valid signal                                                 
    /// output RX signals after decoding                             
    output reg   [63:0]                   O_rx_decode_data         , ///decode data output 
//  output reg                            O_rx_decode_valid        , ///valid signal of decode data  
    output reg   [7 :0]                   O_rx_decode_ctrl         , ///control word, corresponding to decode data
    output       [2 :0]                   O_rx_decode_state        , ///rx decode FSM state  
    output reg   [7 :0]                   O_rx_decode_state_cnt      ///counter of state changes between error and correct 
    );
    
///*********************************************************************
///local parameter defination
///*********************************************************************
/// states of decoder FSM    
localparam  C_RX_INT_ST    = 3'd1; /// initial  state            
localparam  C_RX_S_ST      = 3'd2; /// S type block decode state 
localparam  C_RX_D_ST      = 3'd3; /// D type block decode state 
localparam  C_RX_T_ST      = 3'd4; /// T type block decode state 
localparam  C_RX_E_ST      = 3'd5; /// E type block decode state 
/// block type field   
localparam  C_TYPE_S       = 8'h78;/// type field of S type block 
localparam  C_TYPE_T       = 8'hFF;/// type field of T type block 
localparam  C_TYPE_E       = 8'h1E;/// type field of E type block 
///sync header    
localparam  C_DATA_HEADER  = 2'b01;/// sync header of data(D) type block       
localparam  C_COMMA_HEADER = 2'b10;/// sync header of comma(T/S/E) type block  

///*********************************************************************
///internal singals defination                                          
///*********************************************************************
reg    [2 :0]                   S_state             ; /// FSM current state  
reg    [2 :0]                   S_state_next        ; /// FSM next state     

reg    [1 :0]                   S_block_header      ; /// sync header of block                                                                                                         
reg    [7 :0]                   S_block_type_field  ; /// type field of block 
                                                     
reg    [63:0]                   S_raw_rxd           ; /// decoded data                                                     
reg    [7 :0]                   S_raw_rxc           ; /// control word  corresponding to decoded data 
       
reg                             S_decode_err_flag   ; /// flag of error decoder 
reg                             S_decode_err_flag_1d; /// S_decode_err_flag delay 1 clock
                                                     
reg    [63:0]                   S_rx_data_1d        ; /// I_rx_data delay 1 clock
reg    [63:0]                   S_rx_data_2d        ; /// I_rx_data delay 2 clock
reg    [63:0]                   S_rx_data_3d        ; /// I_rx_data delay 3 clock
reg    [1 :0]                   S_rx_header_1d      ; /// I_rx_header delay 1 clock
reg                             S_rx_header_valid_1d; /// I_rx_header_valid delay 1 clock
                                                     
wire                            S_comma_s_det       ; /// S type block detect
wire                            S_comma_t_det       ; /// T type block detect 
wire                            S_data_det          ; /// data(D) type block detect   

///********************************************************************  
///      Main body of  code                                               
///******************************************************************** 

/// I_rx_data  delay 2 clk, I_rx_header delay 1 clock, I_rx_header_valid delay 1 clock
always @(posedge I_pcs_rx_clk)
    begin 
        S_rx_data_1d   <= I_rx_data    ; 
        S_rx_data_2d   <= S_rx_data_1d ;
        S_rx_data_3d   <= S_rx_data_2d ;
        S_rx_header_1d <= I_rx_header  ;
        S_rx_header_valid_1d <= I_rx_header_valid   ; 
    end

/// bulid block format and pick up  block characters 
always @(posedge I_pcs_rx_clk)
        if(S_rx_header_valid_1d) 
          begin         
             S_block_type_field <= S_rx_data_1d[7:0]       ; 
             S_block_header     <= S_rx_header_1d          ; 	
          end             
        else
          begin        
             S_block_type_field <= S_block_type_field      ; 
             S_block_header     <= S_block_header          ;  	  
          end 
                
///S type block detect
assign S_comma_s_det = (S_block_header == C_COMMA_HEADER) && (S_block_type_field == C_TYPE_S );
///T type block detect
assign S_comma_t_det = (S_block_header == C_COMMA_HEADER) && (S_block_type_field == C_TYPE_T );
///data type block detect
assign S_data_det    = (S_block_header == C_DATA_HEADER) ; 

/// state update of FSM
always @(posedge I_pcs_rx_clk or posedge I_pcs_rx_rst)
    if (I_pcs_rx_rst)
        S_state <= C_RX_INT_ST;
    else if(!I_rx_block_sync)
        S_state <= C_RX_INT_ST;      	
    else if (S_rx_header_valid_1d) /// update happen when S_rx_header_valid_1d is valid 
        S_state <= S_state_next;
    else
        S_state <= S_state;

///combinational logic of FSM
always @(*)
   begin
       case(S_state)
           C_RX_INT_ST: 
               begin
                   if (S_comma_s_det)
                       S_state_next = C_RX_S_ST;
                   else if(S_data_det)
                       S_state_next = C_RX_D_ST;
                   else if (S_comma_t_det)
                       S_state_next = C_RX_T_ST; 
                   else 
                       S_state_next = C_RX_E_ST;
               end
           C_RX_S_ST:
               begin
                   if(S_data_det)
                       S_state_next = C_RX_D_ST;
                   else if(S_comma_t_det)
                       S_state_next = C_RX_T_ST;
                   else 
                       S_state_next = C_RX_E_ST;
               end
           C_RX_D_ST:
               begin
                   if(S_data_det)
                       S_state_next = C_RX_D_ST;
                   else if(S_comma_t_det)
                       S_state_next = C_RX_T_ST;
                   else 
                       S_state_next = C_RX_E_ST;
               end
           C_RX_T_ST:
               begin
                   if(S_comma_s_det)
                       S_state_next = C_RX_S_ST;
                   else
                       S_state_next = C_RX_E_ST;
               end
           C_RX_E_ST:
               begin
                   if(S_data_det)
                       S_state_next = C_RX_D_ST;
                   else if (S_comma_t_det)
                       S_state_next = C_RX_T_ST;
                   else 
                       S_state_next = C_RX_E_ST;   	           	      	           	    
               end
           default:
               begin
                   S_state_next = C_RX_E_ST; 
               end
       endcase 	
    end
   
/// generate output of FSM
always @(posedge I_pcs_rx_clk)
    begin
        case(S_state)
            C_RX_INT_ST:    	     	
                begin
                    S_raw_rxd         <= 64'd0       ;
                    S_raw_rxc         <= 8'b00000000;  
                    S_decode_err_flag <= 1'b0        ;  	               
                end                   
            C_RX_S_ST:              
                begin                 
                    S_raw_rxd         <= {S_rx_data_3d[63:8],8'hFB};
                    S_raw_rxc         <= 8'b00000001              ;
                    S_decode_err_flag <= 1'b0                      ;
                end                   
            C_RX_D_ST:              
                begin                 
                    S_raw_rxd         <= S_rx_data_3d;
                    S_raw_rxc         <= 8'b00000000  	   ;
                    S_decode_err_flag <= 1'b0              ;
                end                   
            C_RX_T_ST:              
                begin                 
                    S_raw_rxd         <= {8'hFD,S_rx_data_3d[63:8]};
                    S_raw_rxc         <= 8'b10000000  	           ;
                    S_decode_err_flag <= 1'b0                      ;
                end                   
            C_RX_E_ST:              
                begin                 
                    S_raw_rxd         <= 64'd0       ; ///clear the rx data to protect the following module
                    S_raw_rxc         <= 8'b00000000;
                    S_decode_err_flag <= 1'b1        ;                                         
                end                   
            default:              
                begin                  
                    S_raw_rxd         <= 64'd0       ;
                    S_raw_rxc         <= 8'b00000000;
                    S_decode_err_flag <= 1'b1        ;
                end
        endcase   	
    end
  
/// output  S_raw_rxd and  S_raw_rxc   
always @(posedge I_pcs_rx_clk)
    begin 
        O_rx_decode_data  <= S_raw_rxd    ; 
        O_rx_decode_ctrl  <= S_raw_rxc    ;
    end     	

///// align O_decode_rx_valid  with  O_decode_rx_data 	
//always @(posedge I_pcs_rx_clk)
//    if (I_rx_block_sync)
//        begin
//            S_rx_decode_valid  <= {S_rx_decode_valid[2:0],I_rx_valid};
//            O_rx_decode_valid  <= S_rx_decode_valid[3]               ;       
//        end 
//    else 
//        begin
//            S_rx_decode_valid  <= 4'b0000;
//            O_rx_decode_valid  <= 1'b0   ;
//        end

///********************************************************************* 
///  maintainable  and   measurable
///*********************************************************************         
always @(posedge I_pcs_rx_clk)  
    begin
        S_decode_err_flag_1d <= S_decode_err_flag;
    end  

/// count the changes between error state and correct state    
always @(posedge I_pcs_rx_clk)  
    if (S_decode_err_flag_1d ^ S_decode_err_flag) 
        O_rx_decode_state_cnt <= O_rx_decode_state_cnt + 8'd1;
    else
        O_rx_decode_state_cnt <= O_rx_decode_state_cnt;

assign O_rx_decode_state = S_state;

endmodule ///end of cpri_64b66b_decode module

