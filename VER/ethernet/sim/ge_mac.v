//FILE_HEADER-------------------------------------------------------------------
// ZTE Copyright (c)
// ZTE Company Confidential
//------------------------------------------------------------------------------
// FILE NAME          : ge_mac.v
// DEPARTMENT         : ASIC_FPGA_R&D_Dept.
// MANUAL_PERCENT     : 100% 
// AUTHOR             : Zhou Chaocong
// AUTHOR'S EMAIL     : Zhou.chaocong@zte.com.cn
//------------------------------------------------------------------------------
// RELEASE HISTORY
// VERSION  DATE         AUTHOR           DESCRIPTION
// 0.1.00   2011-02-21   Zhou Chaocong   initial version
//------------------------------------------------------------------------------
// KEYWORDS           : FPGA, Altera ArriaII GX
//------------------------------------------------------------------------------
// PURPOSE            :
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
module ge_mac
(
 //global signals
 reset_b,
// ref_clk,
 rx_clk,
 tx_clk,
 //interface signals with the GTP_CORE.v
 gmii_txd,             // Transmit data from client MAC.
 gmii_tx_en,           // Transmit control signal from client MAC.
 gmii_tx_er,           // Transmit control signal from client MAC.
 gmii_rxd,             // Received Data to client MAC.
 gmii_rx_dv,           // Received control signal to client MAC.
 gmii_rx_er,           // Received control signal to client MAC.
 //interface signals with the mac_frm_buf.v
 rx_sop,
 rx_eop,
 //rx_frm_err,
 rx_valid,
 rx_data,
 rx_good_frm_ind,
 rx_bad_frm_ind,
 //rx_frm_len_ind,
// rx_frm_length,
 rx_crc_err,
 rx_len_nc_ind,
 rx_ssf_ind,
 rx_slf_ind,
 tx_pkt_type,

 tx_ack,
 tx_frm_err,
 tx_req,
 tx_frm_data,
 tx_pld_valid,
 tx_data_sof,
 //interface signals with ge_mac_mcu.v
 mac_rx_frm_ind,
 mac_rx_frm_err_ind,
 mac_tx_frm_ind,
 mac_tx_frm_err_ind
);
//**** definition of the interface signals *********
input          reset_b;
//input          ref_clk;
input          rx_clk;
input          tx_clk;
input          gmii_rx_er;
input          gmii_rx_dv;
input   [7:0]  gmii_rxd;
input          tx_frm_err;
input          tx_req;
input   [7:0]  tx_frm_data;
input          tx_pld_valid;
input          tx_data_sof;

output         gmii_tx_er;
output         gmii_tx_en;
output  [7:0]  gmii_txd;
//output  [7:0]  gtp_tx_data;
output         rx_sop;
output         rx_eop;
//output         rx_frm_err;
output         rx_valid;
output  [7:0]  rx_data;
output         rx_good_frm_ind;
output         rx_bad_frm_ind;
//output         rx_frm_len_ind;
//output  [15:0] rx_frm_length;
output         tx_ack;
output         mac_rx_frm_ind;
output         mac_rx_frm_err_ind;
output         mac_tx_frm_ind;
output         mac_tx_frm_err_ind;
output         rx_crc_err;
output         rx_len_nc_ind;
output         rx_ssf_ind;
output         rx_slf_ind;

output   [7:0] tx_pkt_type;

wire           reset_b;
//wire           ref_clk;
wire           rx_clk;
wire           tx_clk;
wire           gmii_rx_er;
wire           gmii_rx_dv;
wire    [7:0]  gmii_rxd;
wire           tx_frm_err;
wire           tx_req;
wire    [7:0]  tx_frm_data;
wire    [31:0] crc_out;

reg            gmii_tx_er;
reg            gmii_tx_en;
reg     [7:0]  gmii_txd;
reg            rx_sop;
reg            rx_eop;
reg            rx_valid;      
reg     [7:0]  rx_data;       
reg            rx_good_frm_ind;
reg            rx_bad_frm_ind;

reg            rx_frm_err;
reg            rx_frm_err_ind;



//reg            rx_frm_len_ind;
reg     [15:0] rx_frm_length;
reg            tx_ack;
reg            mac_rx_frm_ind;
reg            mac_rx_frm_err_ind;
reg            mac_tx_frm_ind;
reg            mac_tx_frm_err_ind;
reg            tx_frm_valid_d1;
reg            tx_frm_valid_d2;
reg            tx_frm_valid_d3;
reg            tx_frm_valid_d4;
reg            rx_fcs_init;
reg            tx_req_d1;
reg            tx_req_d2;
reg[7:0]       tx_frm_data_d1;
reg[7:0]       tx_frm_data_d2;
reg            tx_pld_valid_d1;

//reg[7:0]       sw_data_in;


//******* definition of the internal varies **************
parameter  MAC_RX_IDLE = 4'b0001,
           MAC_RX_PRE  = 4'b0010,
           MAC_RX_SOP  = 4'b0100,
           MAC_RX_DATA = 4'b1000;         // mac receiving state

parameter  MAC_TX_IDLE = 5'b00001,
           MAC_TX_PRE  = 5'b00010,
           MAC_TX_DATA = 5'b00100,
           MAC_TX_FCS  = 5'b01000,
           MAC_TX_IFG  = 5'b10000;        // mac transmiting state

reg   [3:0]  mac_rx_state;
reg   [4:0]  mac_tx_state;

reg          gmii_rx_dv_dly1;

//reg   [2:0]  mac_pfd_cnt;
reg   [3:0]  mac_ifg_cnt;
reg   [1:0]  mac_fcs_cnt;

reg          rx_frm_eop_dly1;
reg          rx_frm_eop_dly2;
reg   [15:0] eth_frm_cnt;
reg          rx_fcs_end;
reg          rx_len_nc_ind;
reg          rx_ssf_ind;
reg          rx_slf_ind;
reg   [15:0] length_get;
reg   [15:0] length_all_get;
reg   [15:0] ex_len_cnt;
reg   [7:0]  tx_pkt_type;
reg   [7:0]  rx_data_pre3;   
reg   [7:0]  rx_data_pre2;
reg   [7:0]  rx_data_pre1;

reg          rx_frm_valid;
wire         rx_frm_eop;
reg          rx_frm_sop;
reg   [7:0]  rx_frm_data;

reg          rx_sop_pre3;
reg          rx_sop_pre2;
reg          rx_sop_pre1;
reg          rx_eop_pre3;
reg          rx_eop_pre2;
reg          rx_eop_pre1;

reg          rx_valid_pre3;
reg          rx_valid_pre2;
reg          rx_valid_pre1;

wire         rx_crc_err;

//******* gmii_mac receiving ******************************
always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_frm_data       <= 8'h00;
     end
  else
     begin
        rx_frm_data       <= gmii_rxd;
     end
     
always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_data_pre3      <= 8'h00;
        rx_data_pre2      <= 8'h00;   
        rx_data_pre1      <= 8'h00; 
        rx_data           <= 8'h00;              
     end
  else
     begin
        rx_data_pre3      <= rx_frm_data;
        rx_data_pre2      <= rx_data_pre3;   
        rx_data_pre1      <= rx_data_pre2; 
        rx_data           <= rx_data_pre1;             
     end  
     
always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_sop_pre3       <= 1'b0;
        rx_sop_pre2       <= 1'b0;   
        rx_sop_pre1       <= 1'b0;  
        rx_sop            <= 1'b0;                     
     end
  else
     begin
        rx_sop_pre3       <= rx_frm_sop;
        rx_sop_pre2       <= rx_sop_pre3;   
        rx_sop_pre1       <= rx_sop_pre2; 
        rx_sop            <= rx_sop_pre1;            
     end  
     
always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_eop_pre3       <= 1'b0;
        rx_eop_pre2       <= 1'b0;   
        rx_eop_pre1       <= 1'b0; 
        rx_eop            <= 1'b0;                      
     end
  else
     begin
        rx_eop_pre3       <= rx_frm_eop;
        rx_eop_pre2       <= rx_eop_pre3;   
        rx_eop_pre1       <= rx_eop_pre2;
        rx_eop            <= rx_eop_pre1;
            
     end    
     
always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_valid_pre3       <= 1'b0;
        rx_valid_pre2       <= 1'b0;   
        rx_valid_pre1       <= 1'b0;  
        rx_valid            <= 1'b0;                     
     end
  else
     begin
        rx_valid_pre3       <= rx_frm_valid;
        rx_valid_pre2       <= rx_valid_pre3;   
        rx_valid_pre1       <= rx_valid_pre2; 
        rx_valid            <= rx_valid_pre1;            
     end  
   
            

always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_frm_err        <= 1'b0;
     end
  else
     begin
        rx_frm_err        <= (gmii_rx_er & gmii_rx_dv)| rx_crc_err ;  // modified by zcc 2010.04.01
     end



always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        gmii_rx_dv_dly1     <= 1'b0;
     end
  else
     begin
        gmii_rx_dv_dly1     <= gmii_rx_dv;
     end

assign rx_frm_eop = (!gmii_rx_dv) && gmii_rx_dv_dly1;


always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_fcs_end      <= 1'b0;
     end
  else
     begin
        rx_fcs_end      <= rx_frm_eop;
     end


always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_frm_sop     <= 1'b0;
        rx_frm_valid   <= 1'b0;
        mac_rx_state   <= MAC_RX_IDLE;
        mac_rx_frm_err_ind  <= 1'b0;
        rx_fcs_init     <= 1'b0;
     end
  else
     begin
        case(mac_rx_state)
           MAC_RX_IDLE:
              begin
                 rx_frm_sop     <= 1'b0;
                 rx_frm_valid   <= 1'b0;
                 mac_rx_frm_err_ind  <= 1'b0;

                 if(gmii_rx_dv)
                    begin
                       if(gmii_rxd == 8'h55)
                          begin
                             mac_rx_state    <= MAC_RX_PRE;
                             rx_fcs_init     <= 1'b0;
                          end
                       else if(gmii_rxd == 8'hd5)
                          begin
                             mac_rx_state    <= MAC_RX_SOP;
                             rx_fcs_init     <= 1'b1;
                          end
                       else
                          begin
                             mac_rx_state    <= MAC_RX_IDLE;
                             rx_fcs_init     <= 1'b0;
                          end
                    end
                 else
                    begin
                       mac_rx_state    <= MAC_RX_IDLE;
                    end
              end
           MAC_RX_PRE:
              begin
                 if(gmii_rx_dv)
                    begin
                       if(gmii_rxd == 8'h55)
                          begin
                             mac_rx_state    <= MAC_RX_PRE;
                             rx_fcs_init     <= 1'b0;
                          end
                       else if(gmii_rxd == 8'hd5)
                          begin
                             mac_rx_state    <= MAC_RX_SOP;
                             rx_fcs_init     <= 1'b1;
                          end
                       else
                          begin
                             mac_rx_state    <= MAC_RX_IDLE;
                             rx_fcs_init     <= 1'b0;
                          end
                    end
                 else
                    begin
                       mac_rx_state    <= MAC_RX_IDLE;
                    end
              end
           MAC_RX_SOP:
              begin
                 rx_fcs_init       <= 1'b0;
                 if(gmii_rx_dv)
                    begin
                       rx_frm_sop        <= 1'b1;
                       rx_frm_valid      <= 1'b1;
                       mac_rx_state      <= MAC_RX_DATA;
                    end
                 else
                    begin
                       mac_rx_state      <= MAC_RX_IDLE;
                    end
              end
           MAC_RX_DATA:
              begin
                 rx_frm_sop        <= 1'b0;

                 if(gmii_rx_er)
                    begin
                       rx_frm_valid       <= 1'b0;
                       mac_rx_frm_err_ind <= 1'b1;
                       mac_rx_state       <= MAC_RX_IDLE;
                    end

                 if(rx_frm_eop)
                    begin
                       rx_frm_valid       <= 1'b0;
                       mac_rx_state       <= MAC_RX_IDLE;
                    end
              end
           default:
              begin
                 mac_rx_state         <= MAC_RX_IDLE;
              end
        endcase
     end

//calculate ethernet frame length
always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        eth_frm_cnt      <= 16'h0000;
     end
  else
     begin
        if(rx_frm_valid)
           begin
              eth_frm_cnt     <= eth_frm_cnt + 1'b1;
           end
        else
           begin
              eth_frm_cnt     <= 16'h0000;
           end
     end

always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_frm_eop_dly1      <= 1'b0;
     end
  else
     begin
        rx_frm_eop_dly1      <= rx_frm_eop;
     end

always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        rx_frm_eop_dly2      <= 1'b0;
     end
  else
     begin
        rx_frm_eop_dly2      <= rx_frm_eop_dly1;
     end

always @(posedge rx_clk or negedge reset_b)  //rx_frm_length is delayed for 1 clocks referring to the rx_frm_eop
  if(~reset_b)
     begin
        rx_frm_length        <= 16'h0000;
     end
  else if(rx_frm_eop_dly1)
     begin
        rx_frm_length        <= eth_frm_cnt;
     end
  else
     begin
        rx_frm_length        <= rx_frm_length;
     end


always @(posedge rx_clk or negedge reset_b)    //超短帧统计 rx_ssf_ind is delayed for 2 clocks referring to the rx_frm_eop
  if(~reset_b)
     begin
        rx_ssf_ind           <= 1'b0;
     end
  else
     begin
     if(rx_frm_eop_dly2 && rx_frm_length <16'h0010)
       begin
          rx_ssf_ind           <= 1'b1;
       end
      else
       begin
          rx_ssf_ind           <= 1'b0;
       end
     end

always @(posedge rx_clk or negedge reset_b)    //超长帧统计 rx_slf_ind is delayed for 2 clocks referring to the rx_frm_eop
  if(~reset_b)
     begin
        rx_slf_ind           <= 1'b0;
     end
  else
     begin
     if(rx_frm_eop_dly2 && rx_frm_length >16'h0800)
       begin
          rx_slf_ind           <= 1'b1;
       end
      else
       begin
          rx_slf_ind           <= 1'b0;
       end
     end



always @(posedge rx_clk or negedge reset_b)  //rx_frm_length is delayed for 1 clocks referring to the rx_frm_eop
  if(~reset_b)
     begin
        length_get        <= 16'h0000;
     end
  else if(eth_frm_cnt==16'h0014)
     begin
        length_get[15:8]  <= gmii_rxd;
     end
  else if(eth_frm_cnt==16'h0015)
     begin
        length_get[7:0]   <= gmii_rxd;
     end
  else
        length_get        <= length_get;

always @(posedge rx_clk or negedge reset_b)  //rx_frm_length is delayed for 1 clocks referring to the rx_frm_eop
  if(~reset_b)
     begin
        length_all_get        <= 16'h0000;
     end
  else if(rx_frm_eop_dly1==1'b1)
     begin
        length_all_get        <= length_get+16'h001B;
     end
  else
     begin
        length_all_get        <= length_all_get;
     end

always @(posedge rx_clk or negedge reset_b)  //rx_frm_length is delayed for 1 clocks referring to the rx_frm_eop
  if(~reset_b)
     begin
        rx_len_nc_ind            <= 1'b0;
     end
  else if(rx_frm_eop_dly2==1'b1)
     begin
     if(length_all_get == rx_frm_length)
        begin
        rx_len_nc_ind            <= 1'b0;
        end
     else
        begin
        rx_len_nc_ind            <= 1'b1;
        end
     end
   else
      begin
        rx_len_nc_ind            <= 1'b0;
      end


//frame status indicator           //marked by zcc  2010.05.11
//always @(posedge ref_clk or negedge reset_b)
//  if(~reset_b)
//     begin
//        rx_frm_err_ind    <= 1'b0;
//     end
//  else if(rx_frm_err)
//     begin
//        rx_frm_err_ind    <= 1'b1;
//     end
//  else if(rx_frm_eop_dly1)
//     begin
//        rx_frm_err_ind    <= 1'b0;
//     end
//
//always @(posedge ref_clk or negedge reset_b)
//  if(~reset_b)
//     begin
//        rx_good_frm_ind   <= 1'b0;
//        rx_bad_frm_ind    <= 1'b0;
//     end
//  else if(rx_frm_eop_dly1)
//     begin
//        if(rx_frm_err_ind)
//           begin
//              rx_bad_frm_ind    <= 1'b1;
//           end
//        else
//           begin
//              rx_good_frm_ind   <= 1'b1;
//           end
//     end
//  else
//     begin
//        rx_good_frm_ind   <= 1'b0;
//        rx_bad_frm_ind    <= 1'b0;
//     end



 always @(posedge rx_clk or negedge reset_b)
   if(~reset_b)
      begin
         rx_good_frm_ind   <= 1'b0;
         rx_bad_frm_ind    <= 1'b0;
      end
   else if(rx_eop_pre1)
      begin
         if(rx_frm_err)
            begin
               rx_bad_frm_ind    <= 1'b1;
            end
         else
            begin
               rx_good_frm_ind   <= 1'b1;
            end
      end
   else
      begin
         rx_good_frm_ind   <= 1'b0;
         rx_bad_frm_ind    <= 1'b0;
      end



//mac receives ethernet frame for statistic
always @(posedge rx_clk or negedge reset_b)
  if(~reset_b)
     begin
        mac_rx_frm_ind       <= 1'b0;
     end
  else
     begin
        if(rx_frm_eop && rx_frm_valid)
           begin
              mac_rx_frm_ind        <= 1'b1;
           end
        else
           begin
              mac_rx_frm_ind        <= 1'b0;
           end
     end


always @(posedge tx_clk or negedge reset_b)
   if(~reset_b)
     begin
      tx_req_d1 <= 1'b0;
      tx_req_d2 <= 1'b0;     
     end
   else
     begin
      tx_req_d1 <= tx_req;
      tx_req_d2 <= tx_req_d1;      
     end
     
always @(posedge tx_clk or negedge reset_b)
   if(~reset_b)
     begin
      tx_frm_data_d1 <= 8'b0;
      tx_frm_data_d2 <= 8'b0;     
     end
   else
     begin
      tx_frm_data_d1 <= tx_frm_data;
      tx_frm_data_d2 <= tx_frm_data_d1;     
     end
     
always @(posedge tx_clk or negedge reset_b)
   if(~reset_b)
     begin
      tx_pld_valid_d1<= 1'b0;   
     end
   else
     begin
      tx_pld_valid_d1 <= tx_pld_valid;  
     end     
     
          
//********** gmii mac transmiting *******************************
always @(posedge tx_clk or negedge reset_b)
  if(~reset_b)
     begin
        mac_tx_state        <= MAC_TX_IDLE;
     end
  else
     begin
        case(mac_tx_state)
           MAC_TX_IDLE:
              begin
                 if(tx_req_d2)
                    begin
                       mac_tx_state        <= MAC_TX_PRE;
                    end
              end
           MAC_TX_PRE:
              begin
                 if(tx_frm_err)
                    begin
                       mac_tx_state        <= MAC_TX_IDLE;
                    end
                 if(mac_ifg_cnt == 4'b0111)
                    begin
                       mac_tx_state        <= MAC_TX_DATA;
                    end
              end
           MAC_TX_DATA:
              begin
                 if(tx_frm_err)
                    begin
//                       mac_tx_state        <= MAC_TX_FCS;
                       mac_tx_state        <= MAC_TX_IDLE;                       
                    end
                 if(!tx_pld_valid)    //11.06.03
                    begin
//                       mac_tx_state        <= MAC_TX_FCS;
                       mac_tx_state        <= MAC_TX_IDLE;                       
                    end
              end
           MAC_TX_FCS:
              begin
                 if(tx_frm_err == 1'b1 &&  mac_fcs_cnt == 2'b11)
                    begin
                       mac_tx_state        <= MAC_TX_IFG;
                    end
                 if(mac_fcs_cnt == 2'b11)
                    begin
                       mac_tx_state        <= MAC_TX_IFG;
                    end		
              end
           MAC_TX_IFG:
              begin
                 if(mac_ifg_cnt == 4'b1001)           //jc: set IFG=10;
                    begin
                       mac_tx_state        <= MAC_TX_IDLE;
                    end
              end
           default:
              begin
                 mac_tx_state          <= MAC_TX_IDLE;
              end
        endcase
     end

always @(posedge tx_clk or negedge reset_b)
  if(~reset_b)
     begin
        tx_ack            <= 1'b0;
        //mac_pfd_cnt       <= 3'b000;
        mac_ifg_cnt       <= 4'b0000;
        mac_fcs_cnt       <= 2'b00;
        gmii_tx_en        <= 1'b0;
        gmii_txd          <= 8'h00;
        mac_tx_frm_ind    <= 1'b0;
        mac_tx_frm_err_ind <= 1'b0;
     end
  else
     begin
        case(mac_tx_state)
           MAC_TX_IDLE:
              begin
                 tx_ack            <= tx_req_d2;
                 gmii_tx_en        <= 1'b0;
                 mac_ifg_cnt       <= 4'b0000;
                 mac_fcs_cnt       <= 2'b00;                 
                 gmii_tx_en        <= 1'b0;
                 gmii_txd          <= 8'h00;
                 mac_tx_frm_ind    <= 1'b0;
                 mac_tx_frm_err_ind<= 1'b0;                 
              end
           MAC_TX_PRE:
              begin
                 mac_ifg_cnt       <= mac_ifg_cnt + 1'b1;
                    if(mac_ifg_cnt <= 4'b0110)
                        begin
                            gmii_txd  <= 8'h55;
                            gmii_tx_en<= 1'b1;
                        end
                    else if(mac_ifg_cnt == 4'b0111)
                        begin
                            gmii_txd  <= 8'hd5;
                            gmii_tx_en<= 1'b1;
                        end 
                    else if(mac_ifg_cnt == 4'b1000)
                        begin
                            gmii_txd  <= tx_frm_data_d1;
                            gmii_tx_en<= 1'b1;
                        end   
                    else
                        begin
                            gmii_txd  <= gmii_txd;
                            gmii_tx_en<= gmii_tx_en;
                        end                                                                                  
                   if(mac_ifg_cnt == 4'b0000)
                        begin
                            tx_ack    <= 1'b1;
                        end
                   else
                        begin
                            tx_ack    <= 1'b0;
                        end
              end
           MAC_TX_DATA:
              begin
                 mac_ifg_cnt       <= 4'b0000;
                 mac_fcs_cnt       <= 2'b00;
                 gmii_txd          <= tx_frm_data_d1;
                 gmii_tx_en        <= 1'b1;
              end
           MAC_TX_FCS:                                   //added by zcc 2010.05.06
              begin
                 mac_fcs_cnt       <=  mac_fcs_cnt+1'b1;
                 if(mac_fcs_cnt == 2'b00)
                    begin
                        gmii_tx_en         <= 1'b1;
                        gmii_txd           <= ~{crc_out[24],crc_out[25],crc_out[26],crc_out[27],crc_out[28],crc_out[29],crc_out[30],crc_out[31]};
                    end
                 if(mac_fcs_cnt == 2'b01)
                    begin
                        gmii_tx_en         <= 1'b1;
                        gmii_txd           <= ~{crc_out[16],crc_out[17],crc_out[18],crc_out[19],crc_out[20],crc_out[21],crc_out[22],crc_out[23]};
                    end
                 if(mac_fcs_cnt == 2'b10)
                    begin
                        gmii_tx_en         <= 1'b1;
                        gmii_txd           <=  ~{crc_out[8],crc_out[9],crc_out[10],crc_out[11],crc_out[12],crc_out[13],crc_out[14],crc_out[15]};
                    end
                 if(mac_fcs_cnt == 2'b11)
                    begin
                        gmii_tx_en         <= 1'b1;
                        gmii_txd           <=  ~{crc_out[0],crc_out[1],crc_out[2],crc_out[3],crc_out[4],crc_out[5],crc_out[6],crc_out[7]};
                    end
              end
           MAC_TX_IFG:
              begin
                 gmii_tx_en         <= 1'b0;
                 mac_tx_frm_ind     <= 1'b0;
                 mac_tx_frm_err_ind <= 1'b0;
                 mac_ifg_cnt        <= mac_ifg_cnt + 1'b1;
              end
        endcase
     end


always @(posedge tx_clk or negedge reset_b)
  if(~reset_b)
     begin
        gmii_tx_er      <= 1'b0;
     end
  else
     begin
        gmii_tx_er      <= tx_frm_err;
     end



//calculate output ethernet frame length
always @(posedge tx_clk or negedge reset_b)
  if(~reset_b)
     begin
        ex_len_cnt      <= 16'h0000;
     end
  else
     begin
        if(tx_pld_valid)
           begin
              ex_len_cnt     <= ex_len_cnt + 16'h0001;
           end
        else
           begin
              ex_len_cnt     <= 16'h0000;
           end
     end


//calculate output ethernet frame length
always @(posedge tx_clk or negedge reset_b)
  if(~reset_b)
     begin
        tx_pkt_type          <= 8'h01;
     end
  else
     begin
        if(ex_len_cnt==16'h0013)
           begin
              tx_pkt_type     <= tx_frm_data;
           end
        else
           begin
              tx_pkt_type     <= tx_pkt_type;
           end
     end


//---------------------------                              //added by zcc  2010.04.01
//CRC模块OK;

//wire             rx_err_ack;

// mac_rx_crc32.v
mac_rx_crc32  mac_rx_crc32
(
  .rst_b               (reset_b             ),
  .clk                 (rx_clk              ),
  .data                (rx_frm_data         ),
  .data_en             (rx_frm_valid        ),

  .frame_start         (rx_fcs_init         ),
  .frame_end           (rx_fcs_end          ),

  .crc_err             (rx_crc_err             )
);

//


crc32_cal  crc32_cal
(
  .rst_b               (reset_b             ),
  .clk                 (tx_clk              ),
  .data                (tx_frm_data_d1      ),
  .data_en             (tx_pld_valid_d1     ),

  .crc_int             (tx_data_sof         ),

  .crc                 (crc_out             )
);




//initial
//    sw_data_in = $fopen("sw_data_in.txt");



//always @ (posedge tx_clk )
//    if (gmii_tx_en)
//        $fdisplay (sw_data_in,"%h",gmii_txd);



endmodule








