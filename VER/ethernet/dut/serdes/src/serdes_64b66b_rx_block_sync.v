//FILE_HEADER-------------------------------------------------------
//ZTE Copyright(C)                                                  
//ZTE Company Confidential                                          
//------------------------------------------------------------------
//Project Name : R8852                                              
//FILE NAME    : serdes_64b66b_rx_block_sync.v                               
//AUTHOR       : Zhou jixian                                        
//Department   : ZTE-BBU                                            
//Email        : zhou.jixian@zte.com.cn                             
//------------------------------------------------------------------
//Module Hiberarchy:                                                
//x serdes_64b66b_rx_block_sync                                              
//----------------------------------------------------------------- 
//Release History:                                                  
//----------------------------------------------------------------- 
// Version       Date         Author      Description               
// 1.0         2-29-2016     Zhou Jixian                            
// 1.1        mm-dd-yyyy      Author   修改、增减的主要内容描述     
//----------------------------------------------------------------- 
//Main Function:                                                    
// a)完成64B/66B block同步状态机功能，实现block的对齐 
// b)总时延：5个clk 
// c)只支持32bit                                                                                               
//----------------------------------------------------------------- 
//REUSE ISSUES:  N/A                                                
//Reset Strategy: Asynchronous reset and Synchronous release,active 
//Clock Strategy: N/A                                               
//Critical Timing: N/A                                              
//Asynchronous Interface: I_pcs_rx_rst                              
//END_HEADER--------------------------------------------------------

module  serdes_64b66b_rx_block_sync  
     (
     input                  I_pcs_rx_clk                  , ///clock signal, drived by serdes rxusrclk  
     input                  I_pcs_rx_rst                  , ///reset signal, high active                                                                       
     input        [1:0]     I_rx_header                   , ///header of  Rx block
     input                  I_rx_header_valid             , ///header valid signal
     input                  I_rx_resetdone                , ///after rx channel reset over,block sync start 
                                                          
     output                 O_rx_block_sync_lock          , ///rx channel 64B66B PCS block sync indication 
     output reg  [15:0]     O_rx_block_sync_lock_cnt      , ///rx channel 64B66B PCS block sync indication changed counter     
     output reg             O_rx_block_sync_head_cv       , ///sync header code violations error indication, hold during a block
     output reg  [15:0]     O_rx_block_sync_header_err_cnt, ///counter of sync header error   
     output reg             O_rx_gearbox_slip             , ///slip signal to SERDES RX gearbox to shift one bit 
     output       [2:0]     O_rx_block_sync_state           ///64b66 block sync state

     );
     
///*********************************************************************
///local parameter defination
///*********************************************************************
/// threholds of sync state judge 
localparam C_SH_CNT_MAX        = 7'd64 ; ///threshold of sync header num for a judge period   
localparam C_SH_INVALID_MAX    = 6'd16 ; ///threshold of invalid sync header num 
/// states of decoder FSM  
localparam C_LOCK_INIT_ST      = 3'd0  ;/// initial state of FSM
localparam C_RESET_CNT_ST      = 3'd1  ;/// all counter reset state
localparam C_TEST_SH_ST        = 3'd2  ;/// header judge state
///localparam C_SH_VALID_ST       = 3'd3  ;/// valid header peocess state
///localparam C_SH_INVALID_ST     = 3'd4  ;/// invalid header process state
localparam C_SLIP_ST           = 3'd3  ;/// slip state 
localparam C_64_GOOD_ST        = 3'd4  ;/// block sync state

///*********************************************************************
///internal singals defination                                          
///*********************************************************************
reg [ 2: 0]   S_state                     ;/// state of FSM
reg [ 2: 0]   S_state_next                ;/// next state of FSM 
reg [31: 0]   S_slip_shift_reg            ;/// shift register for slip delay
reg [ 6: 0]   S_sync_header_cnt           ;/// header counter, range: 0-C_SH_CNT_MAX
reg [ 5: 0]   S_sync_header_invalid_cnt   ;/// invalid header counter,range: 0-C_SH_INVALID_MAX
reg           S_slip_done                 ;/// slip done signal
reg           S_rx_block_sync             ;/// rx block sync register signal   
reg           S_rx_block_sync_1d          ;/// S_rx_block_sync  delay 1 clock     
reg           S_rx_resetdone_1d           ;/// I_rx_resetdone delay 1 clk
reg           S_rx_resetdone_2d           ;/// I_rx_resetdone delay 2 clk
reg           S_rx_resetdone_3d           ;/// I_rx_resetdone delay 3 clk
wire          S_rx_resetdone_lost         ;/// rx resetdone lost 

wire          S_sync_header_detect        ;/// header detect   
wire          S_sh_invalid_cnt_equals_max ;/// invalid header num reach C_SH_INVALID_MAX
wire          S_sh_cnt_less_max           ;/// header less than C_SH_CNT_MAX
    
///********************************************************************     
///      Main body of  code                                                 
///********************************************************************      
///I_rx_resetdone delay 3 clock
always @(posedge I_pcs_rx_clk or posedge I_pcs_rx_rst)
    begin
        if (I_pcs_rx_rst) 
            begin
                S_rx_resetdone_1d <= 1'd0;
                S_rx_resetdone_2d <= 1'd0;
                S_rx_resetdone_3d <= 1'd0;              
            end
        else 
            begin
            	  S_rx_resetdone_1d <= I_rx_resetdone   ;
                S_rx_resetdone_2d <= S_rx_resetdone_1d;
                S_rx_resetdone_3d <= S_rx_resetdone_2d;
            end
    end

/// avoid jitter of rx resetdone 
assign  S_rx_resetdone_lost = ~(S_rx_resetdone_1d & S_rx_resetdone_2d & S_rx_resetdone_3d) ;

/// sync header detect 
assign  S_sync_header_detect         = ^I_rx_header; 
assign  S_sh_invalid_cnt_equals_max  = (S_sync_header_invalid_cnt >= C_SH_INVALID_MAX);
assign  S_sh_cnt_less_max            = (S_sync_header_cnt < C_SH_CNT_MAX );
     
/// state update of FSM
always @(posedge I_pcs_rx_clk or posedge I_pcs_rx_rst)
    begin
        if (I_pcs_rx_rst) 
            S_state <= C_LOCK_INIT_ST;
        else if( S_rx_resetdone_lost )
            S_state <= C_LOCK_INIT_ST;
        else
            S_state <= S_state_next;
    end
    
///combinational logic of FSM 
always @(*)
    begin
        case (S_state)
            C_LOCK_INIT_ST:
                begin
                    S_state_next = C_RESET_CNT_ST;            
                end
            C_RESET_CNT_ST:  
                begin
                    S_state_next = C_TEST_SH_ST;  
                end  
            C_TEST_SH_ST:
                begin        	                    	
                    if (I_rx_header_valid && S_sync_header_detect && S_sh_cnt_less_max)                    
                        S_state_next = C_TEST_SH_ST;
                    else if (I_rx_header_valid && S_sync_header_detect && S_sync_header_invalid_cnt == 6'd0) 
                        S_state_next = C_64_GOOD_ST; 
                    else if (I_rx_header_valid && S_sync_header_detect && |S_sync_header_invalid_cnt) 
                        S_state_next = C_RESET_CNT_ST; 
                    else if (I_rx_header_valid && !S_sync_header_detect && (S_sh_invalid_cnt_equals_max || !S_rx_block_sync ) )
                        S_state_next = C_SLIP_ST;
                    else if (I_rx_header_valid && !S_sync_header_detect && S_sh_cnt_less_max  )       /// sync, invalid_cnt equals max and sh_cnt doesn't equal max 
                        S_state_next = C_TEST_SH_ST;
                    else
                        S_state_next = C_RESET_CNT_ST;                  
                end          
            C_SLIP_ST:
                begin
                    if (S_slip_done)
                        S_state_next = C_RESET_CNT_ST; 
                    else
                        S_state_next = C_SLIP_ST;
                end          
            C_64_GOOD_ST:
                begin
                    S_state_next = C_RESET_CNT_ST; 
                end
            default:
                begin 
                    S_state_next = C_LOCK_INIT_ST;
                end 
        endcase         
    end 
    
/// generate output of FSM     
always @(posedge I_pcs_rx_clk or posedge I_pcs_rx_rst)
    if ( I_pcs_rx_rst )
        begin
            S_rx_block_sync           <=  1'd0 ;
            S_sync_header_cnt         <=  7'd0;        
            S_sync_header_invalid_cnt <=  6'd0;
            S_slip_done               <=  1'd0;       
            S_slip_shift_reg          <= 32'd1;       
            O_rx_gearbox_slip         <= 1'd0;      
        end
    else 
        case (S_state )
             C_LOCK_INIT_ST:
                 begin
                 	   S_rx_block_sync <= 1'b0;                   	    
                 end                          
             C_RESET_CNT_ST:  
                 begin
                	   S_sync_header_cnt         <=  7'd0;
                	   S_sync_header_invalid_cnt <=  6'd0; 
                	   S_slip_done               <=  1'd0; 
                	   S_slip_shift_reg          <= 32'd1;              	  
                 end 
             C_TEST_SH_ST:
                 if (I_rx_header_valid && !S_sync_header_detect)
                     begin
                         S_sync_header_cnt         <= S_sync_header_cnt + 7'd1 ;
                         S_sync_header_invalid_cnt <= S_sync_header_invalid_cnt + 6'd1;
                     end
                 else if (I_rx_header_valid)
                     begin
                     	   S_sync_header_cnt         <= S_sync_header_cnt + 7'd1 ;
                         S_sync_header_invalid_cnt <= S_sync_header_invalid_cnt;
                     end
                 else
                     begin
                         S_sync_header_cnt         <= S_sync_header_cnt ;
                         S_sync_header_invalid_cnt <= S_sync_header_invalid_cnt ;
                     end                                      
             C_SLIP_ST:
                 if (S_slip_shift_reg[0])
                     begin
                    	   O_rx_gearbox_slip <= 1'd1; /// generate one clock pulse
                    	   S_rx_block_sync   <= 1'b0; 
                    	   S_slip_shift_reg  <= {S_slip_shift_reg[30:0],1'd0};
                     end
                 else 
                     begin
                    	   O_rx_gearbox_slip <= 1'd0;
                    	   S_slip_shift_reg  <= {S_slip_shift_reg[30:0],1'd0};
                    	   S_slip_done       <= S_slip_shift_reg[31]; ///wait 32 clocks after O_rx_gearbox_slip pulse 
                     end                 
             C_64_GOOD_ST:
                 begin
                     S_rx_block_sync <=1'b1; 
                 end
             default: 
                 begin
                 	   S_rx_block_sync <= 1'b0;
                 end
        endcase
        
assign O_rx_block_sync_lock  = S_rx_block_sync;  
assign O_rx_block_sync_state =         S_state;     
                         
///********************************************************************* 
///  maintainable  and   measurable
///********************************************************************* 
/// generate the sh_cv        
always @(posedge I_pcs_rx_clk)
    begin
        if (!S_rx_block_sync || (!S_sync_header_detect && I_rx_header_valid)) /// sync header is error
            O_rx_block_sync_head_cv <= 1'd1;
        else if (S_sync_header_detect && I_rx_header_valid)  /// sync header is right
            O_rx_block_sync_head_cv <= 1'd0;
        else 
            O_rx_block_sync_head_cv <= 1'd0;
    end

/// count the sync header errors
always @(posedge I_pcs_rx_clk)
    begin 
        if (O_rx_block_sync_head_cv) 
            O_rx_block_sync_header_err_cnt <= O_rx_block_sync_header_err_cnt + 16'd1;
        else
            O_rx_block_sync_header_err_cnt <= O_rx_block_sync_header_err_cnt;   
    end

/// S_decode_err_flag delay 1 clk to capture its edges       
always @(posedge I_pcs_rx_clk)  
    begin
        S_rx_block_sync_1d <= S_rx_block_sync;
    end  

/// count the changes of sync   
always @(posedge I_pcs_rx_clk)  
    if ( S_rx_block_sync_1d ^ S_rx_block_sync) 
        O_rx_block_sync_lock_cnt <= O_rx_block_sync_lock_cnt + 16'd1;
    else
        O_rx_block_sync_lock_cnt <= O_rx_block_sync_lock_cnt;
     
endmodule   /// end of cpri_64b66b_block_sync_sm module

    