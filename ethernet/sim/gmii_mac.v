//FILE_HEADER-------------------------------------------------------------------
// ZTE Copyright (c)
// ZTE Company Confidential
//------------------------------------------------------------------------------
// FILE NAME      : gmii_mac.v
// DEPARTMENT     : ASIC_FPGA_R&D_Dept
// MANUAL_PERCENT : 100%  
// AUTHOR         : Zeng Zhibo
// AUTHOR'S EMAIL : zeng.zhibo@zte.com.cn
//------------------------------------------------------------------------------
// RELEASE HISTORY
// VERSION  DATE         AUTHOR     DESCRIPTION
// 0.1.00   2010-12-13   Zeng zhibo   initial version
//------------------------------------------------------------------------------
// KEYWORDS       : FPGA, Altera Stratix IV
//------------------------------------------------------------------------------
// PURPOSE        :
//------------------------------------------------------------------------------
// PARAMETERS
//    PARAM NAME            RANGE    :DESCRIPTION         :DEFAULT      :UNITS
//    N/A
//------------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy     : Asynchronous,active low system reset;
// Clock  Domains     :
// Critical Timing    : N/A
// Test   Features    : N/A
// Asynchronous I/F   : system_rst_b
// Scan Methodology   : N/A
// Instantiations     : N/A
// Synthesizable      : Y
// Other              : N/A
//END_FILEHEADER----------------------------------------------------------------
module gmii_mac
        (
        sys_clk                        ,
        sys_rst                        ,
        soft_rst                       ,
                                       
        gmii_rx_data                   ,
        gmii_rx_dv                     ,
        gmii_rx_err                    ,
        gmii_rx_clk                    ,
                                                                      
        gmii_tx_data                   ,
        gmii_tx_en                     ,
        gmii_tx_err                    ,
        gmii_tx_clk                    ,
                                       
        rx_data_out                    ,
        rx_data_en                     ,
        
        tx_data_in                     ,
        tx_data_en                     ,
        
        rd_state                       ,
        wr_state                       ,
        
        gmii_rx_pkg_total_cnt          ,
        gmii_rx_err_pkg_cnt            ,
        gmii_tx_pkg_total_cnt          ,
        mac_stat_clr
        );
input                     sys_clk                          ;
input                     sys_rst                          ;
input   [2:0]             soft_rst                         ;
                                                           
input   [7:0]             gmii_rx_data                     ;
input                     gmii_rx_dv                       ;
input                     gmii_rx_err                      ;
input                     gmii_rx_clk                      ;
                                                           
output  [7:0]             gmii_tx_data                     ;
output                    gmii_tx_en                       ;
output                    gmii_tx_err                      ;
input                     gmii_tx_clk                      ;
                                                           
output  [7:0]             rx_data_out                      ;
output                    rx_data_en                       ;
                                                           
input   [7:0]             tx_data_in                       ;
input                     tx_data_en                       ;
                                                           
output  [31:0]            gmii_rx_pkg_total_cnt            ;
output  [31:0]            gmii_rx_err_pkg_cnt              ;
output  [31:0]            gmii_tx_pkg_total_cnt            ;
input   [2:0]             mac_stat_clr                     ;

output   [15:0]           rd_state                         ;
output   [15:0]           wr_state                         ;

wire                      rx_frm_valid                     ;
wire    [7:0]             rx_frm_data                      ; 
wire                      rx_good_frm_ind                  ;
wire                      rx_bad_frm_ind                   ;
wire                      rx_crc_err                       ;
wire                      rx_frm_sop                       ;
wire                      rx_frm_eop                       ;

wire    [7:0]             tx_data                          ;
wire                      tx_data_valid                    ;
wire                      tx_data_sof                      ;

wire                      tx_data_sop                      ;
wire                      tx_data_eop                      ;
wire                      tx_req                           ;
wire                      tx_ack                           ;

reg                       tx_data_en_delay                 ;
reg     [7:0]             tx_data_in_delay                 ;
reg                       tx_data_sop_delay                ;

wire     [7:0]            rx_data_temp                     ;
wire                      rx_data_en_temp                  ;
reg      [7:0]            rx_data_delay1                   ;
reg                       rx_data_en_delay1                ;
reg      [7:0]            rx_data_delay2                   ;
reg                       rx_data_en_delay2                ;
reg      [7:0]            rx_data_delay3                   ;
reg                       rx_data_en_delay3                ;
reg      [7:0]            rx_data_delay4                   ;
reg                       rx_data_en_delay4                ;
wire                      tx_data_eof                      ;
wire     [15:0]           rd_state                         ;
wire     [15:0]           wr_state                         ;

wire                      crc_tx_sop                       ;
wire                      crc_tx_eop                       ;
wire                      crc_tx_valid                     ;
wire     [7:0]            crc_tx_data                      ;

ge_mac ge_mac_inst1
        (
        .reset_b                        (sys_rst & soft_rst[0]                  ),
                                                                                
        .rx_clk                         (gmii_rx_clk                            ),
        .tx_clk                         (gmii_tx_clk                            ),
                                                                                
        .gmii_txd                       (gmii_tx_data                           ),
        .gmii_tx_en                     (gmii_tx_en                             ),
        .gmii_tx_er                     (gmii_tx_err                            ),
                                                                                
        .gmii_rxd                       (gmii_rx_data                           ),
        .gmii_rx_dv                     (gmii_rx_dv                             ),
        .gmii_rx_er                     (gmii_rx_err                            ),
                                                                                
        .rx_sop                         (rx_frm_sop                             ),
        .rx_eop                         (rx_frm_eop                             ),
        .rx_valid                       (rx_frm_valid                           ),
        .rx_data                        (rx_frm_data                            ),
        .rx_good_frm_ind                (rx_good_frm_ind                        ),
        .rx_bad_frm_ind                 (rx_bad_frm_ind                         ),
        .rx_crc_err                     (rx_crc_err                             ),
        .rx_len_nc_ind                  (                                       ),
        .rx_ssf_ind                     (                                       ),
        .rx_slf_ind                     (                                       ),
        .tx_req                         (tx_req                                 ),  
        .tx_ack                         (tx_ack                                 ),	       
        .tx_frm_err                     (1'b0                                   ),
        .tx_frm_data                    (tx_data                                ),
        .tx_pld_valid                   (tx_data_valid                          ),
        .tx_data_sof                    (tx_data_sof                            ),
        .tx_pkt_type                    (                                       ),
        .mac_rx_frm_ind                 (                                       ),
        .mac_rx_frm_err_ind             (                                       ),
        .mac_tx_frm_ind                 (                                       ),
        .mac_tx_frm_err_ind             (                                       )
        );


  eth_rx_fifo eth_rx_fifo_inst1                                                    
        (                                                                          
                                                                                   
        .wclk                           (gmii_rx_clk                            ), 
        .rclk                           (sys_clk                                ), 
                                                                                   
        .reset_b                        (sys_rst & soft_rst[1]                  ), 
        .wr_reset                       (sys_rst & soft_rst[1]                  ), 
        .rd_reset                       (sys_rst & soft_rst[1]                  ), 
        .rx_valid                       (rx_frm_valid                           ), 
        .rx_data                        (rx_frm_data                            ), 
        .rx_good_frame                  (rx_good_frm_ind                        ), 
        .rx_bad_frame                   (rx_bad_frm_ind                         ), 
        .rx_sop                         (rx_frm_sop                             ), 
        .rx_eop                         (rx_frm_eop                             ), 
                                                                                   
        .rx_data_req                    (1'b1                                   ), 
        .rx_sof                         (                                       ), 
        .rx_eof                         (                                       ), 
        .rx_valid_out                   (rx_data_en_temp                        ), 
        .rx_data_out                    (rx_data_temp                           ) 
//        .rd_state                       (rd_state                               ), 
//        .wr_state                       (wr_state                               )                                                                     
        );

    
 eth_tx_fifo  eth_tx_fifo_inst1(
        .wclk                           (sys_clk                                ),
        .rclk                           (gmii_tx_clk                            ),
                                                                                
        .reset_b                        (sys_rst & soft_rst[2]                  ),
        .rd_reset                       (sys_rst & soft_rst[2]                  ),
        .wr_reset                       (sys_rst & soft_rst[2]                  ),
        .tx_req                         (tx_req                                 ),
        .tx_data_out                    (tx_data                                ),
        .tx_valid_out                   (tx_data_valid                          ),
        .tx_sof_out                     (tx_data_sof                            ),
        .tx_eof_out                     (tx_data_eof                            ),
        .tx_ack                         (tx_ack                                 ),//from ge_mac_inst1
        .tx_sop                         (crc_tx_sop                             ),
        .tx_eop                         (crc_tx_eop                             ),
        .tx_valid                       (crc_tx_valid                           ),
        .tx_data                        (crc_tx_data                            ),
        .rd_sig                         (rd_state                               ), 
        .wr_sig                         (wr_state                               )             
         );	   
		

at_fcs at_fcs
       (
        .clk                            (sys_clk                                ),
        .reset_b                        (sys_rst                                ),
        .tx_valid                       (tx_data_en_delay                       ),
        .tx_data                        (tx_data_in_delay                       ),
        .tx_sop                         (tx_data_sop_delay                      ),
        .tx_eop                         (tx_data_eop                            ),
                                       
        .tx_sof_out                     (crc_tx_sop                             ),
        .tx_eof_out                     (crc_tx_eop                             ), 
        .tx_valid_out                   (crc_tx_valid                           ),
        .tx_data_out                    (crc_tx_data                            )
       );
always @ (posedge sys_clk or negedge sys_rst)
  if (!sys_rst)
    begin
    	tx_data_in_delay <= 8'd0;
    	tx_data_en_delay <= 1'b0;
    end 
  else
    begin
    	tx_data_in_delay <= tx_data_in;
    	tx_data_en_delay <= tx_data_en;
    end
assign tx_data_sop = (tx_data_en ^ tx_data_en_delay) & tx_data_en;
assign tx_data_eop = (tx_data_en ^ tx_data_en_delay) & tx_data_en_delay; 
always @ (posedge sys_clk or negedge sys_rst)
  if (!sys_rst)
    tx_data_sop_delay <= 1'b0;
  else
    tx_data_sop_delay <= tx_data_sop;   
    
always@(posedge sys_clk or negedge sys_rst)
  if(!sys_rst)
    begin  
    	rx_data_delay1 <= 8'd0;
    	rx_data_delay2 <= 8'd0;
    	rx_data_delay3 <= 8'd0;
    	rx_data_delay4 <= 8'd0;
    end 
  else
    begin
    	rx_data_delay1 <= rx_data_temp;
    	rx_data_delay2 <= rx_data_delay1;
    	rx_data_delay3 <= rx_data_delay2;
    	rx_data_delay4 <= rx_data_delay3;
    end

always@(posedge sys_clk or negedge sys_rst)
  if(!sys_rst)
    begin  
    	rx_data_en_delay1 <= 1'd0;
    	rx_data_en_delay2 <= 1'd0;
    	rx_data_en_delay3 <= 1'd0;
    	rx_data_en_delay4 <= 1'd0;
    end 
  else
    begin
    	rx_data_en_delay1 <= rx_data_en_temp;
    	rx_data_en_delay2 <= rx_data_en_delay1;
    	rx_data_en_delay3 <= rx_data_en_delay2;
    	rx_data_en_delay4 <= rx_data_en_delay3;
    end
assign rx_data_out = rx_data_delay4;
assign rx_data_en  = rx_data_en_temp & rx_data_en_delay4;
endmodule