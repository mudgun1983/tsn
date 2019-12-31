//FILE_HEADER-------------------------------------------------------------------
// ZTE Copyright (c)
// ZTE Company Confidential
//------------------------------------------------------------------------------
// FILE NAME          : eth_tx_fifo.v
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
module eth_tx_fifo
(
 wclk,
 rclk,
 reset_b,
 rd_reset,
 wr_reset,
 tx_valid,
 tx_data,
 tx_sop,
 tx_eop,


 tx_ack,
 tx_req,
 tx_sof_out,
 tx_eof_out, 
 tx_valid_out,
 tx_data_out,
 wr_sig,
 rd_sig,
 wr_data_full,
 frame_in_fifo
  );
  
 parameter  IDLE         = 4'b0001,
            FRAME        = 4'b0010,
            WR_LEN       = 4'b0100,
            OF_DATA      = 4'b1000;  
            
 parameter  IDLE_RD      = 7'b0000001,
            LEN_RD       = 7'b0000010,
            WAIT_RD      = 7'b0000100,
            DATA_RD      = 7'b0001000,
            PAD_RD       = 7'b0010000,
            END_RD       = 7'b0100000,
            ERROR_RD     = 7'b1000000;
 parameter  addr_width   = 4'd12;                        
  
 input       wclk;
 input       rclk;
 input       reset_b;
 input       rd_reset;
 input       wr_reset;

 input       tx_valid;
 input [7:0] tx_data;
 input       tx_sop;
 input       tx_eop;
 
 input       tx_ack;     
 output      tx_req;
 output      tx_sof_out;
 output      tx_eof_out;
 output      tx_valid_out;
 output[7:0] tx_data_out;
 output[15:0]wr_sig;  
 output[15:0]rd_sig;  
 output      wr_data_full;
 output      frame_in_fifo;

 reg[11:0]   wdata_start_addr;
 reg         frame_in_fifo;
 reg         wr_data_full;
 reg[11:0]   wdata_end_addr;
 reg[11:0]   rd_length;
 reg         len_rd_cnt;
 reg         rdata_en;
 reg[11:0]   rdata_addr;
 reg         tx_eop_d1;
 reg         tx_eop_d2;
 reg         tx_eop_d3;

 reg[11:0]   rd_count;
 reg[1:0]    pad_count;
 reg         tx_sof_out;
 reg         tx_eof_out;
 reg         rdata_valid;
 reg         rdata_en_d1;
 reg         rdata_en_d2;
 reg         rdata_en_d3;
 reg         rx_start_d1;
 reg         rx_start_d2;
 reg         rx_start_d3;
 reg         rx_start_d4;
 reg         rx_end_d1;
 reg         rx_end_d2;
 reg         rx_end_d3;
 reg         tx_valid_d1;
 reg         tx_valid_d2; 
 reg [11:0]  wdata_addr;
 reg [11:0]  wr_counter;
 reg [3:0]   wr_state; 
 reg [3:0]   wr_next; 
 reg [15:0]  data_len;
 reg         wr_len_cnt; 
 
 reg [8:0]   wr_data_bram;
 reg         wr_store_frame_tog;   
 reg [8:0]   rdata_bram_d1;
 reg [6:0]   rd_state;
 reg [6:0]   rd_next;

 reg [7:0]   tx_data_out;
 reg         rd_store_frame_tog;
 reg         rd_store_frame_sync;
 reg         rd_store_frame_delay;
 reg         rd_store_frame;
 reg [11:0]  rdata_addr_gray;
 reg [11:0]  wr_rdata_addr_gray_sync;
 reg [11:0]  wr_rdata_addr_gray;
 reg [11:0]  wdata_addr_diff;
 reg [7:0]   rd_frames; 
 reg         fifo_err_pre1; 
 reg         fifo_err_pre;
 
 wire        tx_eop;
 wire        fifo_err_pre2;
 wire        fifo_err_rd;
 reg         fifo_err_syn;
 reg         fifo_err_wr;
 wire        rd_eof; 
 wire        rx_start; 
 wire        rx_end; 
 wire        tx_valid_out;
 wire        wdata_addr_inc;   
 wire        wdata_addr_inc2;  
 wire        wdata_addr_inc3;  
 wire        wdata_addr_start; 
 wire        wdata_addr_reload;
 wire[8:0]   rdata_bram;  
 wire        rdata_addr_inc; 
 wire        rd_frame_flag;  
 wire[11:0]  wr_rdata_addr; 

 wire        tx_req;  
 wire        wdata_addr_end; 
 wire        wdata_addr_reload2;
 wire        wdata_en;
 
 reg         wr_data_full_d1;
 reg         wr_data_full_pre_syn2;
 reg         wr_data_full_pre_syn1;
 wire        wr_data_full_pre;
 wire[15:0]  wr_sig;  
 wire[15:0]  rd_sig;
 
 assign      wr_sig = {11'b0,wr_data_full,wr_state};
 
 assign      rd_sig = {rd_frames,frame_in_fifo,rd_state};
 
 
 always @(posedge  wclk  or negedge reset_b)
 if(!reset_b)
   begin
   tx_eop_d1      <= 1'b0;
   tx_eop_d2      <= 1'b0;
   tx_eop_d3      <= 1'b0;
   end
 else
   begin
   tx_eop_d1      <= tx_eop;
   tx_eop_d2      <= tx_eop_d1;
   tx_eop_d3      <= tx_eop_d2;
   end

 always @(posedge  wclk  or negedge reset_b)
 if(!reset_b)
   begin
     tx_valid_d1      <= 1'b0;
     tx_valid_d2      <= 1'b0;
   end
 else
   begin
     tx_valid_d1      <= tx_valid;
     tx_valid_d2      <= tx_valid_d1;
   end


 always @(posedge  wclk  or negedge reset_b)
 if(!reset_b)
        wr_state      <= IDLE;
 else if(fifo_err_wr)
        wr_state      <= IDLE;
 else
        wr_state      <= wr_next;


 always @(*)
 begin
       wr_next = IDLE;
 case(wr_state)
        IDLE:
        begin
          if(wr_data_full)
            wr_next = OF_DATA;        
          else if(tx_sop)
            wr_next = FRAME;
          else
            wr_next = IDLE;
        end
        FRAME:
        begin
          if(wr_data_full)
            wr_next = OF_DATA;
          else if(tx_eop_d1)
            wr_next = WR_LEN;
          else if(!tx_valid)
            wr_next = WR_LEN;
          else
            wr_next = FRAME;
        end
        WR_LEN:
        begin
          if(wr_data_full)
            wr_next = OF_DATA;        
          else if(tx_eop_d3)
            wr_next = IDLE;
          else
            wr_next = WR_LEN;
        end
        OF_DATA:
        begin
          if(tx_eop_d3)
            wr_next = IDLE;
          else
            wr_next = OF_DATA;
        end
        default:
          wr_next = IDLE;
 endcase
 end



 assign  wdata_addr_start = (wr_next == IDLE) ? 1'b1 : 1'b0;

 assign  wdata_addr_end = ((wr_state == FRAME)&&(wr_next == WR_LEN)) ? 1'b1 : 1'b0;

 assign  wdata_addr_reload2 = ((wr_state == WR_LEN)&&(wr_next == IDLE)) ? 1'b1 : 1'b0;

 assign  wdata_addr_reload = ((wr_next == OF_DATA) ||((wr_state == FRAME)&&(wr_next == WR_LEN))) ? 1'b1 : 1'b0;


 assign  wdata_addr_inc = ((wr_state == FRAME)||(wr_state == WR_LEN)) ? 1'b1 : 1'b0;

 assign  wdata_addr_inc2= ((wr_state == IDLE)&&(wr_next == FRAME)) ? 1'b1 : 1'b0;

 assign  wdata_addr_inc3 = (wr_next == FRAME) ? 1'b1 : 1'b0;

 assign  wdata_en = ((wr_state == FRAME)||(wr_state == WR_LEN)) ? 1'b1 : 1'b0;



 always @(posedge wclk or negedge reset_b)
  begin
      if ( !reset_b)
          wdata_addr <= 12'b0;
      else if (fifo_err_wr)
          wdata_addr <= 12'b0;
      else if (wdata_addr_reload)
          wdata_addr <= wdata_start_addr;
      else if (wdata_addr_reload2)
          wdata_addr <= wdata_end_addr+1'b1;
      else if (wdata_addr_inc2)
          wdata_addr <= wdata_addr+2'd2;
      else if (wdata_addr_inc)
          wdata_addr <= wdata_addr + 1'b1;
      else
          wdata_addr <= wdata_addr;
  end


 always @(posedge wclk or negedge reset_b)
    begin
      if(!reset_b)
          wdata_start_addr <= 12'b0;
      else if( fifo_err_wr)
          wdata_start_addr <= 12'b0;
      else if( wdata_addr_start)
          wdata_start_addr <= wdata_addr;
      else
          wdata_start_addr <= wdata_start_addr;
    end


  always @(posedge wclk or negedge reset_b)
     begin
       if(!reset_b)
           wdata_end_addr <= 12'b0;
       else if( fifo_err_wr)
           wdata_end_addr <= 12'b0;
       else if( wdata_addr_end)
           wdata_end_addr <= wdata_addr;
       else
           wdata_end_addr <= wdata_end_addr;
     end

 always @(posedge wclk or negedge reset_b)
    begin
     if(!reset_b)
      wr_counter <= 12'b0;
     else if (fifo_err_wr)
      wr_counter <= 12'b0;
     else if (wdata_addr_start)
      wr_counter <= 12'b0;
     else if (wdata_addr_inc3)
      wr_counter <= wr_counter + 1'b1;
     else
      wr_counter <= wr_counter;
  end


 always @(posedge wclk or negedge reset_b)
    begin
      if(!reset_b)
      data_len <= 16'b0;
      else if(fifo_err_wr)
      data_len <= 16'b0;
      else if (wr_state == FRAME)
      data_len <= wr_counter;
      else
      data_len <= data_len;
    end


 always @(posedge wclk or negedge reset_b)
    begin
      if(!reset_b)
      wr_len_cnt <= 1'b0;
      else if(fifo_err_wr)
      wr_len_cnt <= 1'b0;
      else if (wr_next == WR_LEN)
      wr_len_cnt <= wr_len_cnt+ 1'b1;
      else
      wr_len_cnt <= 1'b0;
    end
 
 always @(posedge wclk or negedge reset_b)
  begin
    if(!reset_b)
      wr_data_bram <= 9'b0;
    else if(fifo_err_wr)
      wr_data_bram <= 9'b0;
    else if((wr_next == WR_LEN )&& (wr_len_cnt == 1'b0))
      wr_data_bram <= {4'b0,wr_counter[11:8],1'b0};
    else if((wr_next == WR_LEN )&& (wr_len_cnt == 1'b1))
      wr_data_bram <= {wr_counter[7:0],1'b0};
    else if( tx_eop )
      wr_data_bram <= {tx_data,1'b1};
    else
      wr_data_bram <= {tx_data,1'b0};
  end


 always @(posedge wclk  or negedge reset_b)
   begin
    if (!reset_b)
       wr_store_frame_tog <= 1'b0;
    else if (fifo_err_wr)
//       wr_store_frame_tog <= wr_store_frame_tog;
       wr_store_frame_tog <= 1'b0;
    else if (wr_state == FRAME && wr_next == WR_LEN)
       wr_store_frame_tog <= !wr_store_frame_tog;
    else
       wr_store_frame_tog <= wr_store_frame_tog;   
   end


 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
        rdata_bram_d1         <= 9'b0;
 else if(fifo_err_rd)
        rdata_bram_d1         <= 9'b0;        
 else
        rdata_bram_d1         <= rdata_bram;



 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
        rd_state         <= IDLE_RD;
 else if(fifo_err_rd)
        rd_state         <= IDLE_RD;
 else
        rd_state         <= rd_next;


 always @(*)
 begin
       rd_next = IDLE_RD;
 case(rd_state)
        IDLE_RD:
        begin
//          if(frame_in_fifo == 1'b1)
        if(tx_ack == 1'b1)
            rd_next = LEN_RD;
          else
            rd_next = IDLE_RD;
        end
        LEN_RD:
        begin
          if(len_rd_cnt == 1'b0)
            rd_next = LEN_RD;
          if(len_rd_cnt == 2'b1)
            rd_next = DATA_RD;
        end
//        WAIT_RD:
//        begin
//          if(wait_count == 2'b10)
//            rd_next = DATA_RD;
//          else
//            rd_next = WAIT_RD;
//        end
        DATA_RD:
        begin
          if(rd_count == rd_length - 12'b1)
            rd_next = PAD_RD;
          else
            rd_next = DATA_RD;
        end
        PAD_RD:
        begin
         if(pad_count == 2'b01)
            rd_next = END_RD;
         else
            rd_next = PAD_RD;
        end
        END_RD:
        begin
          if (!rd_eof)
            rd_next = ERROR_RD;
//          else if (frame_in_fifo)
            else if(tx_ack == 1'b1)
            rd_next = LEN_RD;
          else
            rd_next = IDLE_RD;
        end
        ERROR_RD:
        begin
//          if(frame_in_fifo == 1'b1)
          if (tx_ack == 1'b1)
            rd_next = LEN_RD;
          else
            rd_next = IDLE_RD;
        end
        default:
            rd_next = IDLE_RD;
 endcase
 end


// assign rd_frame_flag =(rd_state == WAIT_RD && rd_next == DATA_RD)?1'b1:1'b0;
assign rd_frame_flag =(rd_state == DATA_RD && rd_next == PAD_RD)?1'b1:1'b0;


 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    len_rd_cnt <= 1'b0;
 else if(rd_state == LEN_RD)
    len_rd_cnt <= len_rd_cnt +1'b1;
 else
    len_rd_cnt <= 1'b0;

// always @(posedge  rclk  or negedge reset_b)
// if(!reset_b)
//    wait_count <= 2'b0;
// else if(rd_state == WAIT_RD)
//    wait_count <= wait_count +1'b1;
// else
//    wait_count <= 2'b0;

 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    rd_count   <= 12'b0;
 else if(rd_state == DATA_RD)
    rd_count   <= rd_count +1'b1;
 else
    rd_count   <= 12'b0;


 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    pad_count <= 2'b0;
 else if(rd_state == PAD_RD)
    pad_count <= pad_count +1'b1;
 else
    pad_count <= 2'b0;


 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    rdata_en   <= 1'b0;
 else if(rd_state == LEN_RD)
    rdata_en   <= 1'b1;
// else if((rd_state == DATA_RD)||(rd_state == END_RD))
 else if(rd_state == DATA_RD)
    rdata_en   <= 1'b1;
 else
    rdata_en   <= 1'b0;

 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    rdata_valid   <= 1'b0;
// else if((rd_state == DATA_RD)||(rd_state == END_RD))
 else if(rd_state == DATA_RD)
    rdata_valid   <= 1'b1;
 else
    rdata_valid   <= 1'b0;



 always @(posedge  rclk  or negedge reset_b)
 begin
  if(!reset_b)
   rd_length <= 12'h0;
  else if (fifo_err_rd)
   rd_length <= 12'h0;
  else if ((rd_state == DATA_RD)&&(rd_count==12'h02))
   rd_length <= {rdata_bram_d1[4:1],rdata_bram[8:1]};
//  else if ( rd_state == DATA_RD)
//   rd_length <= rd_length - 1'b1;                       
  else                   
   rd_length <= rd_length;
 end


 
 assign rdata_addr_inc = rdata_en;


 always @(posedge  rclk  or negedge reset_b)
 begin
     if(!reset_b)
       rdata_addr <= 12'b0;
     else if (fifo_err_rd)
       rdata_addr <= 12'b0;
     else if(rdata_addr_inc)
      begin
        if(&rdata_addr)
         rdata_addr <= 12'b0;
        else
         rdata_addr <= rdata_addr + 1'b1;
      end
     else
       rdata_addr <= rdata_addr;      
 end


assign rx_end =  ((rd_state == DATA_RD)&&(rd_next == PAD_RD)) ? 1'b1 : 1'b0;

assign rx_start =  ((rd_state == LEN_RD)&&(rd_next == DATA_RD)) ? 1'b1 : 1'b0;

 always @(posedge  rclk  or negedge reset_b)
 begin
    if(!reset_b)
      begin
      rx_start_d1    <= 1'b0;
      rx_start_d2    <= 1'b0;
      rx_start_d3    <= 1'b0;
      rx_start_d4    <= 1'b0;
      tx_sof_out     <= 1'b0;
      end
    else
      begin
      rx_start_d1    <= rx_start;
      rx_start_d2    <= rx_start_d1;
      rx_start_d3    <= rx_start_d2;
      rx_start_d4    <= rx_start_d3;
      tx_sof_out     <= rx_start_d4;
      end
    end

 always @(posedge  rclk  or negedge reset_b)
 begin
    if(!reset_b)
      begin
      rx_end_d1    <= 1'b0;
      rx_end_d2    <= 1'b0;
      rx_end_d3    <= 1'b0;
      tx_eof_out   <= 1'b0;
      end
    else
      begin
      rx_end_d1    <= rx_end;
      rx_end_d2    <= rx_end_d1;
      rx_end_d3    <= rx_end_d2;
      tx_eof_out   <= rx_end_d3;
      end
    end


 always @(posedge  rclk  or negedge reset_b)
 begin
    if(!reset_b)
      begin
      rdata_en_d1    <= 1'b0;
      rdata_en_d2    <= 1'b0;
      rdata_en_d3    <= 1'b0;
      end
    else
      begin
      rdata_en_d1    <= rdata_valid;
      rdata_en_d2    <= rdata_en_d1;
      rdata_en_d3    <= rdata_en_d2;
      end
    end


assign tx_valid_out = rdata_en_d3;//重新计算延迟时间

 

 always @(posedge  rclk  or negedge reset_b)
 begin
    if(!reset_b)
      tx_data_out <= 8'b0;
    else if (fifo_err_rd)
      tx_data_out <= 8'b0;
    else
      tx_data_out <= rdata_bram[8:1];
    end


 assign rd_eof =  rdata_bram[0];


 assign fifo_err_pre2 = ((rd_state == ERROR_RD)||((wr_data_full_pre_syn2 == 1'b1)&&( frame_in_fifo == 1'b0 )))? 1'b1:1'b0;

 always @(posedge  rclk  or negedge reset_b)
    if(!reset_b)
      begin
        fifo_err_pre1 <= 1'b0;
        fifo_err_pre  <= 1'b0;
      end
    else
      begin
        fifo_err_pre1 <= fifo_err_pre2;
        fifo_err_pre  <= fifo_err_pre1;
      end
      
 assign fifo_err_rd =  fifo_err_pre1 | fifo_err_pre2 | fifo_err_pre ; 
 
 always @(posedge  wclk  or negedge reset_b)
    if(!reset_b)
      begin
      fifo_err_syn <= 1'b0;
      fifo_err_wr  <= 1'b0;      
      end
    else
      begin
      fifo_err_syn <= fifo_err_rd;
      fifo_err_wr  <= fifo_err_syn;      
      end 
 

 always @(posedge  rclk  or negedge reset_b)
  begin
     if (!reset_b)
        begin
           rd_store_frame_tog  <= 1'b0;
           rd_store_frame_sync <= 1'b0;
           rd_store_frame_delay<= 1'b0;
           rd_store_frame      <= 1'b0;
	      end
     else if(fifo_err_rd)
      begin
           rd_store_frame_tog  <= 1'b0;
           rd_store_frame_sync <= 1'b0;
           rd_store_frame_delay<= 1'b0;
           rd_store_frame      <= 1'b0;
	    end
     else
     begin
           rd_store_frame_tog  <= wr_store_frame_tog;
           rd_store_frame_sync <= rd_store_frame_tog;
           rd_store_frame_delay<= rd_store_frame_sync;

      if ((rd_store_frame_delay ^ rd_store_frame_sync) == 1'b1)
           rd_store_frame    <= 1'b1;
      else
           rd_store_frame    <= 1'b0;
      end
  end



 always @(posedge  rclk  or negedge reset_b)
 begin
    if (!reset_b)
       rd_frames <= 8'b0;
    else if (fifo_err_rd)
       rd_frames <= 8'b0;
    else
       begin
       if (rd_store_frame == 1'b1 && rd_frame_flag == 1'b0)
          rd_frames <= rd_frames + 1'b1;
       else if (rd_store_frame == 1'b0 && rd_frame_flag == 1'b1)
          rd_frames <= rd_frames - 1'b1;
       else 
          rd_frames <= rd_frames;
       end   
 end


 always @(posedge  rclk  or negedge reset_b)
 begin
    if (!reset_b)
       frame_in_fifo <= 1'b0;
    else if (fifo_err_rd)
       frame_in_fifo <= 1'b0;
    else 
      begin
       if (rd_frames != 8'b0)
          frame_in_fifo <= 1'b1;
       else
          frame_in_fifo <= 1'b0;
      end
 end
 
assign   tx_req = frame_in_fifo;

 always @(posedge  rclk  or negedge reset_b)
 begin
   if(!reset_b)
     rdata_addr_gray  <= 12'b0;
   else if (fifo_err_rd)
     rdata_addr_gray  <= 12'b0;
   else
     rdata_addr_gray  <= bin_to_gray(rdata_addr);
  end

 always @(posedge  wclk  or negedge reset_b)
  begin
   if(!reset_b)
    begin
     wr_rdata_addr_gray_sync <= 12'b0;
     wr_rdata_addr_gray      <= 12'b0;
    end
   else if (fifo_err_wr)
    begin
     wr_rdata_addr_gray_sync <= 12'b0;
     wr_rdata_addr_gray      <= 12'b0;
    end
   else
     begin
     wr_rdata_addr_gray_sync <= rdata_addr_gray;
     wr_rdata_addr_gray      <= wr_rdata_addr_gray_sync;
     end
   end

  assign wr_rdata_addr = gray_to_bin (wr_rdata_addr_gray);
  
  always @(posedge wclk or negedge reset_b)
  begin
     if(!reset_b)
        wdata_addr_diff <= 12'b0;
     else if (fifo_err_wr)
        wdata_addr_diff <= 12'b0;
     else //if (wdata_en == 1'b1)
        wdata_addr_diff <= wr_rdata_addr - wdata_addr;
  end



  always @(posedge wclk or negedge reset_b)
  begin
     if(!reset_b)
        wr_data_full <= 1'b0;
     else if (fifo_err_wr)
        wr_data_full <= 1'b0;
     else
       begin
         if (wdata_addr_diff[11:4] == 8'b0 && wdata_addr_diff[3:2] != 2'b0)
           wr_data_full <= 1'b1;
         else
           wr_data_full <= 1'b0;
       end
  end

  always @(posedge wclk or negedge reset_b)
  begin
     if(!reset_b)
        wr_data_full_d1 <= 1'b0;
     else if (fifo_err_wr)
        wr_data_full_d1 <= 1'b0;        
     else
        wr_data_full_d1 <= wr_data_full;
  end  
  
  assign wr_data_full_pre = wr_data_full_d1 | wr_data_full;
  
  
  always @(posedge rclk or negedge reset_b)
  begin
     if(!reset_b)
        wr_data_full_pre_syn1 <= 1'b0;
     else
        wr_data_full_pre_syn1 <= wr_data_full_pre;
  end 
  
  always @(posedge rclk or negedge reset_b)
  begin
     if(!reset_b)
        wr_data_full_pre_syn2 <= 1'b0;
     else
        wr_data_full_pre_syn2 <= wr_data_full_pre_syn1;
  end    


 function [addr_width-1:0] bin_to_gray;
   input [addr_width-1:0] bin;
   begin
     bin_to_gray = bin ^ (bin>>1);
   end
 endfunction


 function [addr_width-1:0] gray_to_bin;
 input [addr_width-1:0] gray;
 integer i;
  begin
   for (i=addr_width-1;i>=0;i=i-1)
        begin
          if (i == addr_width-1)
            gray_to_bin[i] = gray[i];
          else
            gray_to_bin[i] = gray_to_bin[i+1] ^ gray[i];
        end
  end
 endfunction

 DPRAM4KX9b	dpram4Kx9b_inst1 (                 //mac receiver buffer
	.data                     (wr_data_bram ),
	.rdaddress                (rdata_addr   ),
	.rdclock                  (rclk         ),
	.rden                     (rdata_en     ),
	.wraddress                (wdata_addr   ),
	.wrclock                  (wclk         ),
	.wren                     (wdata_en     ),
	.q                        (rdata_bram   )
	);

 endmodule