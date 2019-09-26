//FILE_HEADER-------------------------------------------------------
// ZTE  Copyright  (c)
// ZTE Company Confidential
//------------------------------------------------------------------
// Project Name : 8852
// FILE NAME    : serdes_64b66b_pcs_top.v
// AUTHOR       : Zhou Jixian
// Department   : ZTE-BBU
// Email        : zhou.jixian@zte.com.cn
//------------------------------------------------------------------
// Module Hiberarchy:
//x                          |----serdes_64b66b_tx_encode
//x                          |----serdes_64b66b_tx_scrambler
//x serdes_64b66b_pcs_top ---|----serdes_64b66b_rx_block_sync_sm
//x                          |----serdes_64b66b_rx_descrambler
//x                          |----serdes_64b66b_rx_decode
//-----------------------------------------------------------------
// Release History:
//-----------------------------------------------------------------
// Version    Date         Author         Description
// 1.0        mm-dd-yyyy   Author         修改、增减的主要内容描述
// 1.1        03-2-2016   zhou Jixian    初次开发
// 1.2        04-22-2016  Luwei          to match 25G serdes
//-----------------------------------------------------------------
// Main Function:(Describing main function of the module)
// a) 实现CPRI协议中64B/66B编码方式的处理，
//    包括发送测：编码、加扰;接收侧：block同步判断、解扰、解码处理
// b) 只支持64bit数据、Async gearbox模式的处理 
// c) 时延：发送 7个clk，接收 6个clk  
//----------------------------------------------------------------- 
//REUSE ISSUES:  N/A                                                
//Reset Strategy: Asynchronous reset and Synchronous release,active 
//Clock Strategy: N/A                                               
//Critical Timing: N/A                                              
//Asynchronous Interface: I_pcs_rx_rst                              
//END_HEADER--------------------------------------------------------

module serdes_64b66b_pcs_top
    #(
      parameter  C_BIT_REVERSE_EN    =1  , ///模块输入数据和输出数据bit位倒序使能：0--bit位序不颠倒，输入和输出位序为 bit63:bit0 ；
                                           ///1--bit位序颠倒，输入和输出位序为 bit0:bit63，用于匹配xilinx serdes内gearbox的位序 
      parameter  C_TX_DATA_WIDTH     =64 , 
      parameter  C_TX_CTRL_WIDTH     =8  ,
      parameter  C_RX_DATA_WIDTH     =64 ,
      parameter  C_RX_CTRL_WIDTH     =8  
    )
    (
    ///reset and clk                             
    input                             I_pcs_tx_clk                  , /// tx clock signal, drived by serdes output clk                 
    input                             I_pcs_tx_rst                  , /// tx reset signal, high active                                                                   
    input                             I_pcs_rx_clk                  , /// rx clock signal, drived by serdes output clk        
    input                             I_pcs_rx_rst                  , /// rx reset signal, high active                 
                                                                    
    ///RX channel 
    input    [C_RX_DATA_WIDTH-1:0]    I_rx_data                     , /// rx data from serdes PMA                
    input                             I_rx_valid                    , /// valid signal of rx data from serdes PMA  
    input    [1:0]                    I_rx_header                   , /// sync header from serdes PMA            
    input                             I_rx_header_valid             , /// valid signal of sync header from serdes PMA  
                                                                                                 
    output   [C_RX_DATA_WIDTH-1:0]    O_rx_data                     , /// rx data output    
    output   [C_RX_CTRL_WIDTH-1:0]    O_rx_ctrl                     , /// rx control word ouput 
    output                            O_rx_gearbox_slip             , /// RX Gearbox slip signal to serdes gearbox
         
    ///TX channel                                                                                        
    input    [C_TX_DATA_WIDTH-1:0]    I_tx_data                     , /// tx data input      
    input    [C_TX_CTRL_WIDTH-1:0]    I_tx_ctrl                     , /// tx control word input   
                                                                    
    output   [C_TX_DATA_WIDTH-1:0]    O_tx_data                     , /// tx data to serdes   
    output   [1:0]                    O_tx_header                   , /// tx sync header to serdes   
    output   [5:0]                    O_tx_seq                      , /// tx sequence to serdes

    ///maintainable and measurable port
    input                             I_rx_resetdone                , /// after rx channel reset over,block sync start    
    output                            O_rx_block_sync_lock          , /// rx channel 64B66B PCS block sync indication
    output   [15:0]                   O_rx_block_sync_lock_cnt      , /// rx channel 64B66B PCS block sync indication changed counter    
    output                            O_rx_block_sync_head_cv       , /// sync header violate 
    output   [15:0]                   O_rx_block_sync_header_err_cnt, /// sync header violate counter                             
    output   [ 2:0]                   O_rx_block_sync_state         , /// block sync FSM state 
    output   [ 2:0]                   O_rx_decode_state             , /// rx decode FSM state                    
    output   [ 7:0]                   O_rx_decode_state_cnt         , /// counter of rx decode FSM state changes 
    output   [ 2:0]                   O_tx_encode_state             , /// tx decode FSM state                                
    output   [ 7:0]                   O_tx_encode_state_cnt           /// counter of tx decode FSM state changes
     );

///********************************************************************* 
///internal singals defination                                           
///********************************************************************* 
/// tx                                                              
 wire   [C_TX_DATA_WIDTH-1:0]         S_tx_encode_data              ; /// encoded data 
 wire   [1:0]                         S_tx_encode_header            ; /// sync header  of encoded data 
 wire                                 S_tx_encode_seq               ; /// sequence counter of encoded data,used in async gearbox model  
 wire   [C_TX_DATA_WIDTH-1:0]         S_tx_order_data               ; /// TX data after adjusting bit-order                                                                     
/// rx                                                
 wire   [C_RX_DATA_WIDTH-1:0]         S_rx_descramble_data          ; ///descrambled data               
 wire                                 S_rx_descramble_data_valid    ; ///descrambled data valid signal  
 wire   [1:0]                         S_rx_descramble_header        ; ///sync header of descrambled data
 wire                                 S_rx_descramble_header_valid  ; ///sync header valid signal       
 wire   [C_RX_DATA_WIDTH-1:0]         S_rx_order_data               ; /// RX data after adjusting bit-order
/// wire                                 S_rx_decode_valid_nc          ; ///valid sigal of decoded data, no use in async gearbox model   

///********************************************************************
///    adjust bit order code
///********************************************************************  
genvar  i,j; 
generate 
  if ( C_BIT_REVERSE_EN == 1 )    /// reverse  bit order for the input and output data
      begin
          for(i=0; i<C_TX_DATA_WIDTH; i=i+1)
              assign  O_tx_data[i] = S_tx_order_data[C_TX_DATA_WIDTH-1-i];
          for(j=0; j<C_RX_DATA_WIDTH; j=j+1)
              assign  S_rx_order_data[j] = I_rx_data[C_TX_DATA_WIDTH-1-j];
      end
  else                        /// don't reverse the order
      begin
          assign O_tx_data       =  S_tx_order_data ;
          assign S_rx_order_data =  I_rx_data       ;
      end 
endgenerate 

///********************************************************************
///      RX process code
///********************************************************************  
///Block Sync State Machine 
serdes_64b66b_rx_block_sync   U_serdes_64b66b_rx_block_sync 
    ( 
    .I_pcs_rx_clk                  (I_pcs_rx_clk                  ), ///clock signal, drived by serdes rxusrclk            
    .I_pcs_rx_rst                  (I_pcs_rx_rst                  ), ///reset signal, high active                         
    .I_rx_header                   (I_rx_header                   ), ///header of  Rx block                                
    .I_rx_header_valid             (I_rx_header_valid             ), ///header valid signal 
    .I_rx_resetdone                (I_rx_resetdone                ), ///after rx channel reset over,block sync start  
    
    .O_rx_block_sync_lock          (O_rx_block_sync_lock          ), ///rx channel 64B66B PCS block sync indication
    .O_rx_block_sync_lock_cnt      (O_rx_block_sync_lock_cnt      ), ///rx channel 64B66B PCS block sync indication changed counter                                 
    .O_rx_block_sync_head_cv       (O_rx_block_sync_head_cv       ), ///sync header code violations error indication, hold during a block
    .O_rx_block_sync_header_err_cnt(O_rx_block_sync_header_err_cnt), ///counter of sync header error  
    .O_rx_gearbox_slip             (O_rx_gearbox_slip             ), ///slip signal to SERDES RX gearbox to shift one bit                
    .O_rx_block_sync_state         (O_rx_block_sync_state         )  ///64b66 block sync state             
                                                                    
    );
          
///64b/66b  descrambler 
serdes_64b66b_rx_descrambler #
    ( 
    .C_RX_DATA_WIDTH    (C_RX_DATA_WIDTH)
    )
    U_serdes_64b66b_rx_descrambler
    (  
    .I_pcs_rx_clk                  (I_pcs_rx_clk                  ), ///clock signal, drived by serdes output  
    .I_pcs_rx_rst                  (I_pcs_rx_rst                  ),           
    .I_rx_data                     (S_rx_order_data               ), /// RX scramled data from serdes         
    .I_rx_valid                    (I_rx_valid                    ), /// data valid signal                       
    .I_rx_header                   (I_rx_header                   ), /// sync header of RX scramled data        
    .I_rx_header_valid             (I_rx_header_valid             ), /// sync header valid signal 
    .I_rx_block_sync               (O_rx_block_sync_lock          ), /// block sync indication 
    		                                                          
    .O_rx_descramble_data          (S_rx_descramble_data          ), /// descrambled data                   
    .O_rx_descramble_valid         (S_rx_descramble_data_valid    ), /// descrambled data valid signal           
    .O_rx_descramble_header        (S_rx_descramble_header        ), /// sync header of descrambled data        
    .O_rx_descramble_header_valid  (S_rx_descramble_header_valid  )  /// sync header valid signal            		
    );
    
/// 64b/66b decode
serdes_64b66b_rx_decode  U_serdes_64b66b_rx_decode
    (
    .I_pcs_rx_clk                  (I_pcs_rx_clk                  ), ///clock signal, drived by serdes output clk    
    .I_pcs_rx_rst                  (I_pcs_rx_rst                  ), ///reset signal, high active  
    .I_rx_block_sync               (O_rx_block_sync_lock          ), ///block sync indication                                                               
    .I_rx_data                     (S_rx_descramble_data          ), ///RX data from  descrambler 
    .I_rx_valid                    (S_rx_descramble_data_valid    ), ///RX data valid signal  
    .I_rx_header                   (S_rx_descramble_header        ), ///header of  Rx data
    .I_rx_header_valid             (S_rx_descramble_header_valid  ), ///header valid signal                          
                                                                  
    .O_rx_decode_data              (O_rx_data                     ), ///decode data output 
/// .O_rx_decode_valid             (S_rx_decode_valid_nc          ), ///decode data valid signal，in Async gearbox model，the valid is no use  
    .O_rx_decode_ctrl              (O_rx_ctrl                     ), ///control word, corresponding to decode data 
    .O_rx_decode_state             (O_rx_decode_state             ), ///current state of decoder FSM  
    .O_rx_decode_state_cnt         (O_rx_decode_state_cnt         )  ///counter of state changes between error and correct                  
     );

///********************************************************************
///      TX process code
///********************************************************************  
///  64b/66b encode
serdes_64b66b_tx_encode  U_serdes_64b66b_tx_encode 
    (
    .I_pcs_tx_clk                  (I_pcs_tx_clk                  ), ///clock signal, drived by serdes output clk   
    .I_pcs_tx_rst                  (I_pcs_tx_rst                  ), ///reset signal, high active                                                                             
    .I_tx_data                     (I_tx_data                     ), ///transmit data word  
    .I_tx_ctrl                     (I_tx_ctrl                     ), ///transmit control word 
                                                                  
    .O_tx_encode_data              (S_tx_encode_data              ), ///encoded data   
    .O_tx_encode_header            (S_tx_encode_header            ), ///sync header  of encoded data
    .O_tx_encode_seq               (S_tx_encode_seq               ), ///sequence counter, range 0-32
    .O_tx_encode_state             (O_tx_encode_state             ), ///tx decode FSM state                               
    .O_tx_encode_state_cnt         (O_tx_encode_state_cnt         )  ///counter of state changes between error and correct
    ); 
                                                                                   
 ///64b/66b scrambler
serdes_64b66b_tx_scrambler #
    ( 
    .C_TX_DATA_WIDTH (C_TX_DATA_WIDTH)
    )
    U_serdes_64b66b_tx_scrambler
    (
    .I_pcs_tx_clk                  (I_pcs_tx_clk                  ), ///clock signal, drived by serdes output clk   
    .I_pcs_tx_rst                  (I_pcs_tx_rst                  ),                                                                  		                                                                                                     
    .I_tx_data                     (S_tx_encode_data              ), /// unscramble data
    .I_tx_seq                      ({5'd0,S_tx_encode_seq}        ), /// TX sequence counter, range 0-32                                     
    .I_tx_header                   (S_tx_encode_header            ), /// sync header of unscramble data, sync header bypass scrambler
                                                                  
    .O_tx_scramble_data            (S_tx_order_data               ), /// scrambled data                                                
    .O_tx_scramble_seq             (O_tx_seq                      ), /// sequence counter, range 0-32                                 
    .O_tx_scramble_header          (O_tx_header                   )  /// sync header of scrambled data                                    						 	
    );                                                  
     
endmodule  /// end of  serdes_64b66b_pcs_top  module 
