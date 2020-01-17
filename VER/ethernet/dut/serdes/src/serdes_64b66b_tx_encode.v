//FILE_HEADER-------------------------------------------------------
//ZTE Copyright(C)
//ZTE Company Confidential
//------------------------------------------------------------------
//Project Name : R8852
//FILE NAME    : serdes_64b66b_tx_encode.v
//AUTHOR       : Zhou Jixian
//Department   : ZTE-BBU
//Email        : zhou.jixian@zte.com.cn
//------------------------------------------------------------------
//Module Hiberarchy:
//x serdes_64b66b_tx_encode
//-----------------------------------------------------------------
//Release History:
//-----------------------------------------------------------------
// Version       Date         Author      Description
// 1.0        02-22-2016       Zhou Jixian
// 1.1        04-21-2016       Luwei       to match 25G serdes
//-----------------------------------------------------------------
//Main Function:
// a) 完成64B/66B编码处理，只针对CPRI协议涉及的S/T/Data block类型   
// b) 总时延 6个clk
// c）目前只支持64bit
//-----------------------------------------------------------------
//REUSE ISSUES: N/A
//Reset Strategy: Asynchronous reset Synchronous release,active high
//Clock Strategy: N/A
//Critical Timing: N/A
//Asynchronous Interface: I_pcs_tx_rst
//END_HEADER--------------------------------------------------------

module serdes_64b66b_tx_encode
    (
    /// System Interface
    input                                 I_pcs_tx_clk             , ///clock signal, drived by serdes txusrclk
    input                                 I_pcs_tx_rst             , ///reset signal, high active 
    /// input TX signals before encoding                           
    input        [63:0]                   I_tx_data                , ///transmit data word   
    input        [7 :0]                   I_tx_ctrl                , ///transmit control word indicaton
                                                                   
    /// output TX signals after encoding                                   
    output reg   [63:0]                   O_tx_encode_data         , ///encoded data
    output reg   [1 :0]                   O_tx_encode_header       , ///sync header  of encoded data 
    output reg                            O_tx_encode_seq          , ///sequence counter of encoded data,used in async gearbox model
    output       [2 :0]                   O_tx_encode_state        , ///tx decode FSM state     
    output reg   [7 :0]                   O_tx_encode_state_cnt      ///counter of state changes between error and correct    
    );
    
///*********************************************************************
///local parameter define
///********************************************************************* 
/// states of encoder FSM     
localparam  C_TX_INT_ST    = 3'd1        ; /// initial  state 
localparam  C_TX_S_ST      = 3'd2        ; /// S type block encode state  
localparam  C_TX_D_ST      = 3'd3        ; /// D type block encode state  
localparam  C_TX_T_ST      = 3'd4        ; /// T type block encode state  
localparam  C_TX_E_ST      = 3'd5        ; /// E type block encode state 
/// block type field                                       
localparam  C_TYPE_S       = 8'h78       ; /// type field of S type block 
localparam  C_TYPE_T       = 8'hFF       ; /// type field of T type block 
localparam  C_TYPE_E       = 8'h1E       ; /// type field of E type block 
/// comma value                                        
localparam  C_COMMA_S      = 8'hFB       ; ///  the value of /S/ comma
localparam  C_COMMA_T      = 8'hFD       ; ///  the value of /T/ comma
/// control word type      
localparam  C_CPRI_S_TXC   = 8'b00000001 ; /// the control word of S type block
localparam  C_CPRI_T_TXC   = 8'b10000000 ; /// the control word of T type block
/// sync header            
localparam  C_DATA_HEADER  = 2'b01       ; /// sync header of data(D) type block
localparam  C_COMMA_HEADER = 2'b10       ; /// sync header of comma(T/S/E) type block

///*********************************************************************
///internal singals defination
///*********************************************************************
reg    [2 :0]                 S_state             ; /// FSM current state
reg    [2 :0]                 S_state_next        ; /// FSM next state
                                                  
reg    [63:0]                 S_tx_data_1d        ; /// I_tx_data delay one clock  
reg    [7 :0]                 S_tx_ctrl_1d        ; /// 8 bit control signal of I_tx_ctrl delay one clock
                                                  
reg    [63:0]                 S_block_payload     ; /// encoded data                                                       
reg    [1 :0]                 S_block_header      ; /// sync header of encoded data   
reg                           S_encode_err_flag   ; /// flag of error encoder 
reg                           S_encode_err_flag_1d; /// S_encode_err_flag delay 1 clock                                                                                                                                             

wire                          S_tx_seq            ; /// S_tx_seq flag of O_tx_encode_header S_tx_seq=1`b0 when interface is 64 bit
                                                  
wire                          S_comma_s_det       ; /// S type block detect signal
wire                          S_comma_t_det       ; /// T type block detect signal
wire                          S_data_det          ; /// data(D) type block detect signal
 
///********************************************************************
///      Main body of code       
///********************************************************************  
/// I_tx_data,I_tx_ctrl delay 1 clock 
always @(posedge I_pcs_tx_clk )                        
    begin                                              
        S_tx_data_1d <= I_tx_data  ; 
        S_tx_ctrl_1d <= I_tx_ctrl  ;  	     
    end  
 
///S type block detect   
assign S_comma_s_det = (I_tx_ctrl   == C_CPRI_S_TXC) && (I_tx_data  [7:0] == C_COMMA_S);  
///T type block detect 
assign S_comma_t_det = (I_tx_ctrl   == C_CPRI_T_TXC) && (I_tx_data  [63:56] == C_COMMA_T);
///data type block detect
assign S_data_det    = (I_tx_ctrl   == 8'd0) ;  

/// state update of FSM
always @(posedge I_pcs_tx_clk or posedge I_pcs_tx_rst )
    if (I_pcs_tx_rst)
        S_state <= C_TX_INT_ST;            	
    else 
        S_state <= S_state_next;       
      
///combinational logic of FSM
always @(*)
    begin
        case(S_state)
             C_TX_INT_ST: 
                 begin
                     if(S_comma_s_det)
                         S_state_next = C_TX_S_ST;
                     else if(S_comma_t_det || S_data_det)
                         S_state_next = C_TX_E_ST;
                     else
                         S_state_next = C_TX_INT_ST;
                 end
             C_TX_S_ST:
                 begin
                     if(S_data_det)
                         S_state_next = C_TX_D_ST;
                     else 
                         S_state_next = C_TX_E_ST;
                 end
             C_TX_D_ST:
                 begin
                     if(S_data_det)
                         S_state_next = C_TX_D_ST;
                     else if(S_comma_t_det)
                         S_state_next = C_TX_T_ST;
                     else 
                         S_state_next = C_TX_E_ST;
                 end
             C_TX_T_ST:
                 begin
                     if(S_comma_s_det)
                         S_state_next = C_TX_S_ST;
                     else
                         S_state_next = C_TX_E_ST;
                 end
             C_TX_E_ST:
                 begin
                     if(S_data_det)
                         S_state_next = C_TX_D_ST;
                     else if (S_comma_t_det)
                         S_state_next = C_TX_T_ST;
                     else 
                         S_state_next = C_TX_E_ST;   	           	      	           	    
                 end
             default:
                 begin
                     S_state_next = C_TX_E_ST; 
                 end
        endcase 	
    end
   
/// generate output of FSM
always @(posedge I_pcs_tx_clk)
    begin
        case(S_state)
            C_TX_INT_ST:    	     	
                begin
                    S_block_payload   <= 64'd0;
                    S_block_header    <= 2'b00;  
                    S_encode_err_flag <= 1'b0 ;  	               
                end
            C_TX_S_ST:
                begin
                    S_block_payload   <= {S_tx_data_1d[63:8],C_TYPE_S}  ;
                    S_block_header    <= C_COMMA_HEADER                 ;
                    S_encode_err_flag <= 1'b0                           ; 
                end
            C_TX_D_ST:
                begin
                    S_block_payload   <= S_tx_data_1d  ;
                    S_block_header    <= C_DATA_HEADER ;
                    S_encode_err_flag <= 1'b0          ; 
                end
            C_TX_T_ST:
                begin   
                    S_block_payload   <= {S_tx_data_1d[55:0],C_TYPE_T}  ;
                    S_block_header    <= C_COMMA_HEADER                 ;
                    S_encode_err_flag <= 1'b0                           ;
                end
            C_TX_E_ST:
                begin   
                    S_block_payload   <= {8{8'd0}}     ;/// output  zeros
                    S_block_header    <= C_COMMA_HEADER;/// output comma header to differ from data block
                    S_encode_err_flag <= 1'b1          ;               
                end
            default:
                begin   
                    S_block_payload   <= {8{8'd0}}    ;/// output  zeros 
                    S_block_header    <= C_DATA_HEADER;
                    S_encode_err_flag <= 1'b1         ;
                end
        endcase   	
    end
     
///  output S_block_payload and S_block_header
always @(posedge I_pcs_tx_clk)
       begin
           O_tx_encode_data   <= S_block_payload[63:0];
           O_tx_encode_header <= S_block_header	      ;         	
       end               

///  output S_tx_seq
assign S_tx_seq = 1'b0 ;

always @(posedge I_pcs_tx_clk )  
    begin
        O_tx_encode_seq <= S_tx_seq;
    end  

///********************************************************************* 
///  maintainable  and   measurable
///*********************************************************************       
/// count  the  encode  error, cycle count from 0 to 0xFFFF      
/// S_encode_err_flag delay 1 clk to gather its edges       
always @(posedge I_pcs_tx_clk )  
    begin
        S_encode_err_flag_1d <= S_encode_err_flag;
    end  

/// count the changes between error state and correct state    
always @(posedge I_pcs_tx_clk)  
    if (S_encode_err_flag_1d ^ S_encode_err_flag) 
        O_tx_encode_state_cnt <= O_tx_encode_state_cnt + 8'd1;
    else
        O_tx_encode_state_cnt <= O_tx_encode_state_cnt;         	    

assign  O_tx_encode_state = S_state; 
                   
endmodule /// end of cpri_64b66b_encode module
