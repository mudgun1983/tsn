//FILE_HEADER---------------------------------------------------------
//Copyright: ZTE
//Company Confidential: ZTE
//-----------------------------------------------------------------------------
//FILE NAME: serdes_channel_rx_ksync.v
//DEPARTMENT: 5G
//AUTHOR: piqiang
//AUTHOR'S EMAIL: pi.qiang@zte.com.cn
//-----------------------------------------------------------------------------
//RELEASE HISTORY
//VERSION     DATE           AUTHOR   DESCRIPTION
//0.00.00   2016-05-20      piqiang   for serdes rst
//-----------------------------------------------------------------------------
//KEYWORDS: rx_freqlocked 
//-----------------------------------------------------------------------------
//PURPOSE:  avoid the bug of rx_freqlocked from serdes
//-----------------------------------------------------------------------------
//PARAMETERS
//PARAM NAME:    RANGE:  DESCRIPTION:   DEFAULT:  UNITS
//  DATA_WIDTH:  16 :   width of the data :  16 :  
//-----------------------------------------------------------------------------
//REUSE ISSUES
//Reset Strategy: 
//Clock Domains: fei_rclk
//Critical Timing: 
//Test Features: 
//Asynchronous I/F: 
//Scan Methodology: 
//Instantiations: 
//Synthesizable: 
//Other: 
//END_HEADER---------------------------------------------------------
`timescale 1ns/1ps

module serdes_channel_rx_ksync 
    (
    input  wire            I_serdes_rx_rst          ,//
    input  wire            I_serdes_rx_clk          ,//
    input  wire  [ 7: 0]   I_serdes_rx_k_flag       ,//
    input  wire  [63: 0]   I_serdes_rx_data         ,//
    input  wire  [ 3: 0]   I_serdes_rate            ,//
    input  wire            I_8b10b_or_64b66b_sel    ,//
    output reg             O_serdes_rx_ksync         //
    );
    
//------------------------------------------------------//
//      declaration of  correlative registers           //
//------------------------------------------------------//
reg  [10:0]  S_state_next        ;
reg  [10:0]  S_state_current     ;
reg          S_xacq2_trigger     ;
reg  [15:0]  S_rxk_ctl_cnt       ;   
reg          S_serdes_rc         ;//only one bit of this signal being high means the header was received
reg  [15:0]  S_chip_cnt          ;
wire         S_rxk_error         ;//unnormal: there are more or less than 32 cycles between two K_code
wire         S_K_code_flag       ;
wire         S_xsync_flag        ;
//--------------------------------------------//
//                 main 
//--------------------------------------------//
parameter C_CHANNEL_FOR_CPRI_TDM  = 1'd0     ;

parameter CPRI_SYMBOL_CNT1P2288   = 256*4 -1 ;
parameter CPRI_SYMBOL_CNT2P4576   = 256*8 -1 ;
parameter CPRI_SYMBOL_CNT3P072    = 256*10-1 ;
parameter CPRI_SYMBOL_CNT4P9152   = 256*16-1 ;
parameter CPRI_SYMBOL_CNT6P144    = 256*20-1 ;
parameter CPRI_SYMBOL_CNT8P11008  = 256*32-1 ;
parameter CPRI_SYMBOL_CNT9P8304   = 256*32-1 ;
parameter CPRI_SYMBOL_CNT10P1376  = 256*40-1 ;
parameter CPRI_SYMBOL_CNT12P16512 = 256*48-1 ;
parameter CPRI_SYMBOL_CNT24P33024 = 256*96-1 ;

parameter TDM_CHIP_CNT1P2288      = 4 -1     ;
parameter TDM_CHIP_CNT2P4576      = 8 -1     ;
parameter TDM_CHIP_CNT3P072       = 10-1     ;
parameter TDM_CHIP_CNT4P9152      = 16-1     ;
parameter TDM_CHIP_CNT6P144       = 20-1     ;
parameter TDM_CHIP_CNT8P11008     = 32-1     ;
parameter TDM_CHIP_CNT9P8304      = 32-1     ;
parameter TDM_CHIP_CNT10P1376     = 40-1     ;
parameter TDM_CHIP_CNT12P16512    = 48-1     ;
parameter TDM_CHIP_CNT24P33024    = 96-1     ;

parameter C_XACQ1          = 11'b00000000001           ;
parameter C_XACQ2          = 11'b00000000010           ;
parameter C_XSYNC1         = 11'b00000000100           ;
parameter C_XSYNC2         = 11'b00000001000           ;
parameter C_XSYNC3         = 11'b00000010000           ;
parameter C_XSYNC4         = 11'b00000100000           ;
parameter C_XSYNC5         = 11'b00001000000           ;
parameter C_XSYNC6         = 11'b00010000000           ;
parameter C_XSYNC7         = 11'b00100000000           ;
parameter C_XSYNC8         = 11'b01000000000           ;
parameter C_XSYNC          = 11'b10000000000           ;



//-----------------------------detecting if the header is coming---------------------------//
always@(posedge I_serdes_rx_clk or posedge I_serdes_rx_rst)
    if(I_serdes_rx_rst)
        S_serdes_rc <= 1'b0;    
    else if(I_8b10b_or_64b66b_sel)
        S_serdes_rc <= (I_serdes_rx_k_flag[7] && (I_serdes_rx_data[63:56] == 8'hFD)) ;
    else
        S_serdes_rc <= (I_serdes_rx_k_flag[0] && (I_serdes_rx_data[7 : 0] == 8'hbc)) ;

assign  S_K_code_flag    = S_serdes_rc ; 


generate 
    if (C_CHANNEL_FOR_CPRI_TDM == 1'd0) //1'd0-CPRI;1'd1-TDM
        begin : FOR_CPRI                                                                              
            always@(posedge I_serdes_rx_clk)
                case(I_serdes_rate)
                     4'd0    : S_chip_cnt <= CPRI_SYMBOL_CNT1P2288   ;
                     4'd1    : S_chip_cnt <= CPRI_SYMBOL_CNT2P4576   ;
                     4'd2    : S_chip_cnt <= CPRI_SYMBOL_CNT3P072    ;
                     4'd3    : S_chip_cnt <= CPRI_SYMBOL_CNT4P9152   ;
                     4'd4    : S_chip_cnt <= CPRI_SYMBOL_CNT6P144    ;
                     4'd5    : S_chip_cnt <= CPRI_SYMBOL_CNT8P11008  ;
                     4'd6    : S_chip_cnt <= CPRI_SYMBOL_CNT9P8304   ;
                     4'd7    : S_chip_cnt <= CPRI_SYMBOL_CNT10P1376  ;
                     4'd8    : S_chip_cnt <= CPRI_SYMBOL_CNT12P16512 ;
                     4'd9    : S_chip_cnt <= CPRI_SYMBOL_CNT24P33024 ;
                     default : S_chip_cnt <= CPRI_SYMBOL_CNT24P33024 ;
                endcase    
        end
    else if (C_CHANNEL_FOR_CPRI_TDM == 1'd1) //1'd0-CPRI;1'd1-TDM
        begin : FOR_TDM
            always@(posedge I_serdes_rx_clk)
                case(I_serdes_rate)
                     4'd0    : S_chip_cnt <= TDM_CHIP_CNT1P2288   ;
                     4'd1    : S_chip_cnt <= TDM_CHIP_CNT2P4576   ;
                     4'd2    : S_chip_cnt <= TDM_CHIP_CNT3P072    ;
                     4'd3    : S_chip_cnt <= TDM_CHIP_CNT4P9152   ;
                     4'd4    : S_chip_cnt <= TDM_CHIP_CNT6P144    ;
                     4'd5    : S_chip_cnt <= TDM_CHIP_CNT8P11008  ;
                     4'd6    : S_chip_cnt <= TDM_CHIP_CNT9P8304   ;
                     4'd7    : S_chip_cnt <= TDM_CHIP_CNT10P1376  ;
                     4'd8    : S_chip_cnt <= TDM_CHIP_CNT12P16512 ;
                     4'd9    : S_chip_cnt <= TDM_CHIP_CNT24P33024 ;
                     default : S_chip_cnt <= TDM_CHIP_CNT12P16512 ;
                endcase
        end 
endgenerate


 


       
        
always@(posedge I_serdes_rx_clk or posedge I_serdes_rx_rst)
    if(I_serdes_rx_rst)                                    
        S_rxk_ctl_cnt <= 16'd0  ;             
    else if( S_rxk_ctl_cnt == S_chip_cnt || S_K_code_flag )
        S_rxk_ctl_cnt <= 16'd0  ;
    else
        S_rxk_ctl_cnt <= S_rxk_ctl_cnt + 16'd1 ;  

assign  S_rxk_error      = ( ( S_rxk_ctl_cnt == S_chip_cnt )  ^ S_K_code_flag ) ; 
assign  S_xsync_flag     = ( ( S_rxk_ctl_cnt == S_chip_cnt ) && S_K_code_flag ) ; 

//-----------------------------state machine ---------------------------------------------//
always@(posedge I_serdes_rx_clk or posedge I_serdes_rx_rst)
    if(I_serdes_rx_rst)                                    
        S_state_current <=  C_XACQ1;                        
    else                                                     
        S_state_current <=  S_state_next ; 
         
always@(*)
    begin
        case(S_state_current)
            C_XACQ1:
                begin
                    if(S_xacq2_trigger == 1'd1)
                        S_state_next = C_XACQ2;     
                    else
                        S_state_next = C_XACQ1;
                end
            C_XACQ2:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XACQ1;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC1;
                    else
                        S_state_next = C_XACQ2;
                end
            C_XSYNC1:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XACQ1;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC2;
                    else
                        S_state_next = C_XSYNC1;
                end
            C_XSYNC2:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XSYNC1;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC3;
                    else
                        S_state_next = C_XSYNC2;
                end
            C_XSYNC3:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XSYNC2;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC4;
                    else
                        S_state_next = C_XSYNC3;
                end
            C_XSYNC4:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XSYNC3;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC5;
                    else
                        S_state_next = C_XSYNC4;
                end
            C_XSYNC5:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XSYNC4;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC6;
                    else
                        S_state_next = C_XSYNC5;
                end
            C_XSYNC6:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XSYNC5;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC7;
                    else
                        S_state_next = C_XSYNC6;
                end
            C_XSYNC7:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XSYNC6;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC8;
                    else
                        S_state_next = C_XSYNC7;
                end
            C_XSYNC8:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XSYNC7;
                    else if(S_xsync_flag)
                        S_state_next = C_XSYNC ;
                    else
                        S_state_next = C_XSYNC8;
                end
            C_XSYNC:
                begin
                    if(S_rxk_error)
                        S_state_next = C_XSYNC8;
                    else
                        S_state_next = C_XSYNC ;
                end        
            default:
                S_state_next = C_XACQ1;
        endcase
    end             

//In the state of C_XACQ1, if the K_code is detected, the signal S_xacq2_trigger will active high
always@(posedge I_serdes_rx_clk or posedge I_serdes_rx_rst)
    if(I_serdes_rx_rst)                                    
        S_xacq2_trigger <= 1'd0;      //S_xacq2_trigger: means state maching jump to C_XACQ2 soon
    else if( S_state_current == C_XACQ1 && S_K_code_flag )
        S_xacq2_trigger <= 1'd1;
    else
        S_xacq2_trigger <= 1'd0;                    
                     	
                    
always@(posedge I_serdes_rx_clk or posedge I_serdes_rx_rst)
    if(I_serdes_rx_rst)                                    
        O_serdes_rx_ksync <= 1'd0; 
    else if((S_state_current == C_XACQ1) || (S_state_current == C_XACQ2))
        O_serdes_rx_ksync <= 1'd0;
    else
        O_serdes_rx_ksync <= 1'd1;//high is lock
            


endmodule
