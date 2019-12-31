//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : ZXLTE xxxx
// FILE NAME    : serdes_channel_rst.v
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

module serdes_channel_rst
        (
         input  wire         I_clk                ,//
         input  wire         I_rst                ,//
         //cpll                                   
         input  wire         I_pllpd              ,//
         input  wire         I_force_pllreset     ,//
         input  wire         I_gtpowergood        ,//
         input  wire         I_plllock            ,//
         input  wire         I_pllrefclklost      ,//
         input  wire         I_pllfbclklost       ,//
         output reg          O_pllreset           ,// 
         output wire  [2:0]  O_pllrst_state       ,//
         output wire         O_pllresetdone       ,//
         //tx                                     
         input  wire         I_txpd               ,//
         input  wire         I_force_txreset      ,//
         input  wire         I_txpllresetdone     ,//
         input  wire         I_txresetdone        ,//
         input  wire         I_txbufstatus        ,//
         input  wire         I_userclk2_tx_active ,//
         output wire         O_txprogdivreset     ,//
         output reg          O_txuserrdy          ,//
         output reg          O_gttxreset          ,//
         output wire  [2:0]  O_txrst_state        ,//
         //rx
         input  wire         I_rxpd               ,//
         input  wire         I_force_rxreset      ,//
         input  wire         I_rxpllresetdone     ,//
         input  wire         I_rxcdrlock          ,//
         input  wire         I_rxresetdone        ,//
         input  wire         I_rxbufstatus        ,//
         input  wire         I_rxbyteisaligned    ,//
         input  wire         I_userclk2_rx_active ,//
         input  wire         I_serdes_rx_ksync    ,  
         output reg          O_rxprogdivreset     ,//  
         output reg          O_rxuserrdy          ,//
         output reg          O_gtrxreset          ,//
         output wire  [3:0]  O_rxrst_state        ,//
         output reg          O_rxdfeagchold       ,//
         output wire         O_rxdfelfhold        ,//
         output wire         O_rxlpmhfhold        ,//
         output wire         O_rxlpmlfhold        ,//
         //txinhibit                              
         input  wire         I_txusr2_clk         ,//               
         input  wire         I_force_txinhibit    ,//
         output reg          O_txinhibit           //

        );

//parameter define     
parameter   C_PLLRST_PULSE_WIDTH  = 13'd248   ;//122.88m时钟，即2us。data sheet上要求2us  
parameter   C_PLL_RST_TIME        = 8'd250    ;//122.88m时钟，即持续锁定1us
parameter   C_TXRST_PULSE_WIDTH   = 4'd15     ;
parameter   C_TX_RSTDONE_TIME     = 8'd15     ;
parameter   C_RXRST_PULSE_WIDTH   = 4'd15     ;
parameter   C_RX_RSTDONE_TIME     = 8'd15     ;
parameter   C_LOSS_ALIGN_TIME     = 16'hffff  ;
parameter   C_CLK_FREQUENCY       = 125       ;
parameter   C_RX_LINE_RATE        = 1         ;

//localparam define      
localparam  C_PLLRESET            = 3'b001    ;
localparam  C_WAIT_PLL_LOCKED     = 3'b010    ;
localparam  C_PLL_LOCKED          = 3'b100    ;
localparam  C_TX_RST              = 3'b001    ;
localparam  C_WAIT_TX_RSTDONE     = 3'b010    ;
localparam  C_TX_RSTDONE          = 3'b100    ;
localparam  C_RX_RST              = 4'b0001   ;
localparam  C_WAIT_RX_CDR_LOCK    = 4'b0010   ;
localparam  C_WAIT_RX_RSTDONE     = 4'b0100   ;
localparam  C_RX_RSTDONE          = 4'b1000   ;
localparam  C_CDR_TIMEOUT_FREERUN_CYC = (37000 * C_CLK_FREQUENCY) / C_RX_LINE_RATE ;
localparam  C_KSYNC_CHECK_START   = 256*96*16*1024 ;
localparam  C_PLLLOCK_TIMEOUT     = 1000000 * C_CLK_FREQUENCY ; //1S
localparam  C_TXRSTDONE_TIMEOUT   = 1000000 * C_CLK_FREQUENCY ; //1S
localparam  C_RXRSTDONE_TIMEOUT   = 1000000 * C_CLK_FREQUENCY ; //1S

// ----------------------------------------------------------------------------
// inter reg
// ----------------------------------------------------------------------------
wire [21:0]  S_signal_gather        ;//
reg  [21:0]  S_signal_gather_d1     ;//
reg  [21:0]  S_signal_gather_d2     ;//
wire         S_gtpowergood          ;//
wire         S_plllock              ;//
wire         S_pllrefclklost        ;//
wire         S_pllfbclklost         ;//
wire         S_rxbyteisaligned      ;//
wire         S_txbufstatus          ;//
wire         S_rxbufstatus          ;//
wire         S_txresetdone          ;//
wire         S_rxresetdone          ;//
wire         S_force_pllreset       ;//
wire         S_force_txreset        ;//
wire         S_force_rxreset        ;//
wire         S_force_txinhibit      ;//
wire         S_pll_pd               ;//
wire         S_txpd                 ;//
wire         S_rxpd                 ;//
reg  [2:0]   S_pllrst_state_curr    ;//
reg  [2:0]   S_pllrst_state_next    ;//
reg  [12:0]  S_pllrst_pulse_width   ;//
reg  [7:0]   S_pll_rst_time         ;//
reg  [2:0]   S_txrst_state_curr     ;//
reg  [2:0]   S_txrst_state_next     ;//
reg  [3:0]   S_txrst_pulse_width    ;//
reg  [7:0]   S_tx_rstdone_time      ;//
reg  [3:0]   S_rxrst_state_curr     ;//
reg  [3:0]   S_rxrst_state_next     ;//
reg  [3:0]   S_rxrst_pulse_width    ;//
reg  [7:0]   S_rx_rstdone_time      ;//
reg  [15:0]  S_loss_align_cnt       ;//
reg          S_loss_align           ;//
reg          S_txinhibit            ;//
reg          S_txinhibit_d1         ;//
reg [15:0]   S_align_cnt            ;//
reg          S_time_flag            ;//
reg [28:0]   S_rx_time_cnt          ;//
reg          S_rx_cdrlock_to_sat    ;//
wire         S_rxcdrlock            ;//
wire         S_txpllresetdone       ;//
wire         S_rxpllresetdone       ;//
wire         S_userclk2_tx_active   ;//
wire         S_userclk2_rx_active   ;//
wire         S_serdes_rx_ksync      ;//
reg          S_ksync_check_start    ;//
reg [28:0]   S_pll_time_cnt         ;//
reg          S_plllock_to_sat       ;//
reg  [28:0]  S_tx_time_cnt          ;//
reg          S_tx_rstdone_to_sat    ;//
reg          S_rx_rstdone_to_sat    ;//
// ----------------------------------------------------------------------------
//      main Verilog code
// ----------------------------------------------------------------------------
//-------------------synchronize the input state signal---------------------
assign  O_pllrst_state = S_pllrst_state_curr ;
assign  O_txrst_state  = S_txrst_state_curr  ;
assign  O_rxrst_state  = S_rxrst_state_curr  ;

assign  S_signal_gather = {I_gtpowergood,I_plllock,I_rxbyteisaligned,I_txbufstatus,I_rxbufstatus,I_serdes_rx_ksync,I_pllrefclklost,I_pllfbclklost,
                           I_txresetdone,I_rxresetdone,I_force_pllreset,I_force_txreset,I_force_rxreset,I_force_txinhibit,I_pllpd,
                           I_txpd,I_rxpd,I_rxcdrlock,I_txpllresetdone,I_rxpllresetdone,I_userclk2_tx_active,I_userclk2_rx_active}; 

always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        begin
            S_signal_gather_d1 <= 22'b0 ;
            S_signal_gather_d2 <= 22'b0 ;
        end
    else
        begin
            S_signal_gather_d1 <= S_signal_gather ;
            S_signal_gather_d2 <= S_signal_gather_d1 ;
        end
		  

assign  {S_gtpowergood,S_plllock,S_rxbyteisaligned,S_txbufstatus,S_rxbufstatus,S_serdes_rx_ksync,S_pllrefclklost,S_pllfbclklost,
        S_txresetdone,S_rxresetdone,S_force_pllreset,S_force_txreset,S_force_rxreset,S_force_txinhibit,S_pll_pd,
        S_txpd,S_rxpd,S_rxcdrlock,S_txpllresetdone,S_rxpllresetdone,S_userclk2_tx_active,S_userclk2_rx_active} = S_signal_gather_d2 ;

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
                    if((S_gtpowergood == 1'b0) || (S_force_pllreset == 1'b1) || (S_pll_pd == 1'b1) || (S_plllock_to_sat == 1'b1))
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
        S_pll_time_cnt <= 29'b0 ;
    else if(S_pllrst_state_curr != S_pllrst_state_next)    
        S_pll_time_cnt <= 29'b0 ;    
    else
        S_pll_time_cnt <= S_pll_time_cnt + 29'b1 ;
        
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_plllock_to_sat <= 1'b0 ;
    else if(S_pllrst_state_curr == C_WAIT_PLL_LOCKED)    
        if(S_pll_time_cnt == C_PLLLOCK_TIMEOUT)    
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


//----------------------------------------------tx reset FSM--------------------------------------        
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_txrst_state_curr <= C_TX_RST ;
    else
        S_txrst_state_curr <= S_txrst_state_next ;
        
always @(*)
    begin        
        case(S_txrst_state_curr)        
            C_TX_RST :
                begin
                    if(S_txrst_pulse_width == C_TXRST_PULSE_WIDTH)
                        S_txrst_state_next = C_WAIT_TX_RSTDONE ;
                    else
                        S_txrst_state_next = C_TX_RST ;     
                end    

              
            C_WAIT_TX_RSTDONE :  
                begin
                    if((S_force_txreset == 1'b1) || (S_txpllresetdone == 1'b0) || (S_txpd == 1'b1) || (S_tx_rstdone_to_sat == 1'b1)) 
                        S_txrst_state_next = C_TX_RST ; 
                    else if(S_tx_rstdone_time == C_TX_RSTDONE_TIME)     
                        S_txrst_state_next = C_TX_RSTDONE ;  
                    else
                        S_txrst_state_next = C_WAIT_TX_RSTDONE ;
                end
                
            C_TX_RSTDONE :
                begin
                    if((S_force_txreset == 1'b1) || (S_txpllresetdone == 1'b0) || (S_txpd == 1'b1) || (S_txresetdone == 1'b0) || (S_txbufstatus == 1'b1)) 
                        S_txrst_state_next = C_TX_RST ;  
                    else
                        S_txrst_state_next = C_TX_RSTDONE ;     
                end 
                         
            default : S_txrst_state_next = C_TX_RST ;
        endcase           
    end        


//generate S_txrst_pulse_width
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_txrst_pulse_width <= 4'b0 ;
    else if(S_txrst_state_curr == C_TX_RST)    
        if((S_force_txreset == 1'b1) || (S_txpllresetdone == 1'b0) || (S_txpd == 1'b1)) 
            S_txrst_pulse_width <= 4'b0 ;    
        else
            S_txrst_pulse_width <= S_txrst_pulse_width + 4'b1 ;
    else
        S_txrst_pulse_width <= 4'b0 ;


assign  O_txprogdivreset = ~S_txpllresetdone ;

//generate O_gttxreset
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        O_gttxreset <= 1'b1 ;
    else if(S_txrst_state_curr == C_TX_RST)
        O_gttxreset <= 1'b1 ;
    else
        O_gttxreset <= 1'b0 ;


//generate  O_txuserrdy            
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        O_txuserrdy <= 1'b0 ;
    else if(S_txrst_state_curr == C_TX_RST)
        O_txuserrdy <= 1'b0 ;
    else if(S_userclk2_tx_active)
        O_txuserrdy <= 1'b1 ;


//generate S_tx_rstdone_time
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_tx_rstdone_time <= 8'b0 ;
    else if(S_txrst_state_curr == C_WAIT_TX_RSTDONE)
        if(S_txresetdone == 1'b1) 
            S_tx_rstdone_time <= S_tx_rstdone_time + 8'b1 ;   
        else
            S_tx_rstdone_time <= 8'b0 ; 
    else
        S_tx_rstdone_time <= 8'b0 ;


//generate S_tx_rstdone_to_sat
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_tx_time_cnt <= 29'b0 ;
    else if(S_txrst_state_curr != S_txrst_state_next)    
        S_tx_time_cnt <= 29'b0 ;    
    else
        S_tx_time_cnt <= S_tx_time_cnt + 29'b1 ;
        
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_tx_rstdone_to_sat <= 1'b0 ;
    else if(S_txrst_state_curr == C_WAIT_TX_RSTDONE)    
        if(S_tx_time_cnt == C_TXRSTDONE_TIMEOUT)    
            S_tx_rstdone_to_sat <= 1'b1 ; 
        else
            S_tx_rstdone_to_sat <= S_tx_rstdone_to_sat ;      
    else
        S_tx_rstdone_to_sat <= 1'b0 ;



//----------------------------------------------rx reset FSM--------------------------------------        
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_rxrst_state_curr <= C_RX_RST ;
    else
        S_rxrst_state_curr <= S_rxrst_state_next ;
        
always @(*)
    begin        
        case(S_rxrst_state_curr)          
            C_RX_RST :
                begin
                    if(S_rxrst_pulse_width == C_RXRST_PULSE_WIDTH)
                        S_rxrst_state_next = C_WAIT_RX_CDR_LOCK ;
                    else
                        S_rxrst_state_next = C_RX_RST ;     
                end    

            C_WAIT_RX_CDR_LOCK: 
                begin
                    if(S_rxcdrlock || S_rx_cdrlock_to_sat)
                        S_rxrst_state_next = C_WAIT_RX_RSTDONE ;
                    else
                        S_rxrst_state_next = C_WAIT_RX_CDR_LOCK ;
                end
              
            C_WAIT_RX_RSTDONE :  
                begin
                    if((S_force_rxreset == 1'b1) || (S_rxpllresetdone == 1'b0) || (S_rxpd == 1'b1) || (S_rx_rstdone_to_sat== 1'b1))
                        S_rxrst_state_next = C_RX_RST ; 
                    else if(S_rx_rstdone_time == C_RX_RSTDONE_TIME)    
                        S_rxrst_state_next = C_RX_RSTDONE ;  
                    else
                        S_rxrst_state_next = C_WAIT_RX_RSTDONE ;
                end
                
            C_RX_RSTDONE :
                begin
                    if(
                       (S_force_rxreset == 1'b1)  || 
                       (S_rxpllresetdone == 1'b0) || 
                       (S_rxpd == 1'b1)           || 
                       (S_rxresetdone == 1'b0)    || 
                       (S_rxbufstatus == 1'b1)    || 
                       (S_loss_align == 1'b1)     ||
                       (S_ksync_check_start && !S_serdes_rx_ksync)
                       ) 
                        S_rxrst_state_next = C_RX_RST ;  
                    else
                        S_rxrst_state_next = C_RX_RSTDONE ;     
                end 
                         
            default : S_rxrst_state_next = C_RX_RST ;
        endcase           
    end   


always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_rx_time_cnt <= 29'b0 ;
    else if(S_rxrst_state_curr != S_rxrst_state_next)    
        S_rx_time_cnt <= 29'b0 ;    
    else
        S_rx_time_cnt <= S_rx_time_cnt + 29'b1 ;

 
//generate S_rxrst_pulse_width
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_rxrst_pulse_width <= 4'b0 ;
    else if(S_rxrst_state_curr == C_RX_RST)
        if((S_force_rxreset == 1'b1) || (S_rxpllresetdone == 1'b0) || (S_rxpd == 1'b1)) 
            S_rxrst_pulse_width <= 4'b0 ;    
        else
            S_rxrst_pulse_width <= S_rxrst_pulse_width + 4'b1 ;
    else
        S_rxrst_pulse_width <= 4'b0 ;


//generate GTRXRESET
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        O_gtrxreset <= 1'b1 ;
    else if(S_rxrst_state_curr == C_RX_RST)
        O_gtrxreset <= 1'b1 ;
    else
        O_gtrxreset <= 1'b0 ;
        

//generate S_rx_cdrlock_to_sat
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_rx_cdrlock_to_sat <= 1'b0 ;
    else if(S_rxrst_state_curr == C_WAIT_RX_CDR_LOCK)    
        if(S_rx_time_cnt == C_CDR_TIMEOUT_FREERUN_CYC)    
            S_rx_cdrlock_to_sat <= 1'b1 ; 
        else
            S_rx_cdrlock_to_sat <= S_rx_cdrlock_to_sat ;      
    else
        S_rx_cdrlock_to_sat <= 1'b0 ;

//generate O_rxprogdivreset
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        O_rxprogdivreset <= 1'b1 ;
    else if((S_rxrst_state_curr == C_RX_RST) || (S_rxrst_state_curr == C_WAIT_RX_CDR_LOCK))
        O_rxprogdivreset <= 1'b1 ;
    else
        O_rxprogdivreset <= 1'b0 ;


//generate  O_rxuserrdy
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        O_rxuserrdy <= 1'b0 ;
    else if((S_rxrst_state_curr == C_RX_RST) || (S_rxrst_state_curr == C_WAIT_RX_CDR_LOCK))
        O_rxuserrdy <= 1'b0 ; 
    else if(S_userclk2_rx_active) 
        O_rxuserrdy <= 1'b1 ;   

        
//generate S_rx_rstdone_time
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_rx_rstdone_time <= 8'b0 ;
    else if(S_rxrst_state_curr == C_WAIT_RX_RSTDONE)    
        if(S_rxresetdone == 1'b1) 
            S_rx_rstdone_time <= S_rx_rstdone_time + 8'b1 ;    
        else
            S_rx_rstdone_time <= 8'b0 ;
    else
        S_rx_rstdone_time <= 8'b0 ;
                          

//generate S_rx_rstdone_to_sat
        
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_rx_rstdone_to_sat <= 1'b0 ;
    else if(S_rxrst_state_curr == C_WAIT_RX_RSTDONE)    
        if(S_rx_time_cnt == C_RXRSTDONE_TIMEOUT)    
            S_rx_rstdone_to_sat <= 1'b1 ; 
        else
            S_rx_rstdone_to_sat <= S_rx_rstdone_to_sat ;      
    else
        S_rx_rstdone_to_sat <= 1'b0 ;
                          

//generate S_loss_align 
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_time_flag <= 1'd0 ;
    else if(S_rx_time_cnt[25:0] == 26'h3ffffff)       
        S_time_flag <= 1'd1;
    else
        S_time_flag <= 1'd0 ;
           
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_loss_align_cnt <= C_LOSS_ALIGN_TIME ;
    else if(S_rxrst_state_curr == C_RX_RSTDONE)  
        if(S_time_flag == 1'b1)     
            S_loss_align_cnt <= C_LOSS_ALIGN_TIME ;
        else if(S_rxbyteisaligned == 1'b0)
            S_loss_align_cnt <= S_loss_align_cnt - 16'b1 ;
        else
            S_loss_align_cnt <= S_loss_align_cnt ;
    else
        S_loss_align_cnt <= C_LOSS_ALIGN_TIME ;
        
            
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_loss_align <= 1'b0 ;
    else      
        S_loss_align <= (S_loss_align_cnt == 16'h5)  ;
                

//generate S_ksync_check_start
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_ksync_check_start <= 1'b0 ;
    else if(S_rxrst_state_curr == C_RX_RSTDONE)    
        if(S_rx_time_cnt == C_KSYNC_CHECK_START)    
            S_ksync_check_start <= 1'b1 ; 
        else
            S_ksync_check_start <= S_ksync_check_start ;      
    else
        S_ksync_check_start <= 1'b0 ;
               
 
//-----------------generate TXINHIBIT -------------------------------------------------------------------------- 
//generate TXINHIBIT,the tx out is constant       
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_txinhibit <= 1'b1 ;
    else if((S_txresetdone == 1'b0) || (S_force_txinhibit == 1'b1))
        S_txinhibit <= 1'b1 ;
    else 
        S_txinhibit <= 1'b0 ;
        
//synchronize S_txinhibit from I_clk domain to I_txusr2_clk domain       
always @(posedge I_txusr2_clk) 
    begin       
        S_txinhibit_d1  <= S_txinhibit    ;    
        O_txinhibit     <= S_txinhibit_d1 ;
    end    

//-----------------generate O_rxdfeagchold --------------------------------------------------------------------------
//generate O_rxdfeagchold
always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        S_align_cnt <= 16'd0 ;
    else if(S_rxrst_state_curr == C_RX_RSTDONE) 
        if(S_rxbyteisaligned == 1'b0)
            S_align_cnt <= 16'd0 ;
        else
            S_align_cnt <= S_align_cnt + 16'd1 ;
    else
        S_align_cnt <= 16'd0 ;        


always @(posedge I_clk or posedge I_rst)
    if(I_rst)
        O_rxdfeagchold <= 1'd0 ;
    else if(S_align_cnt == 16'hffff)
        O_rxdfeagchold <= 1'd1 ;
    else if(S_rxrst_state_curr != C_RX_RSTDONE)
        O_rxdfeagchold <= 1'd0 ;
 
    
assign  O_rxdfelfhold = O_rxdfeagchold ;   
assign  O_rxlpmhfhold = O_rxdfeagchold ;
assign  O_rxlpmlfhold = O_rxdfeagchold ;
    
endmodule

