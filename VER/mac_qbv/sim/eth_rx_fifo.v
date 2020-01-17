//FILE_HEADER-------------------------------------------------------------------
// ZTE Copyright (c)
// ZTE Company Confidential
//------------------------------------------------------------------------------
// FILE NAME          : eth_rx_fifo.v
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
module eth_rx_fifo
(
 wclk,
 rclk,
 reset_b,
 rd_reset,
 wr_reset,
 rx_valid,
 rx_data,
 rx_good_frame,
 rx_bad_frame,
 rx_sop,
 rx_eop,
 rx_sof,
 rx_eof,
// rx_frame_drop,


 rx_data_req,
 rx_valid_out,
 rx_data_out,
 rd_state,
 wr_state
  );
  
 parameter  IDLE         = 5'b00001,
            FRAME        = 5'b00010,
            WR_LEN       = 5'b00100,
            BF           = 5'b01000,
            OF_DATA      = 5'b10000;  
            
 parameter  IDLE_RD      = 8'b00000001,
            LEN_RD       = 8'b00000010,
            WAIT_RD      = 8'b00000100,
            DATA_RD      = 8'b00001000,
            PAD_RD       = 8'b00010000,
            END_RD       = 8'b00100000,
            KEEP_RD      = 8'b01000000,
            ERROR_RD     = 8'b10000000;
 parameter  ADDR_WIDTH   = 4'd12;                        
  
 input       wclk;
 input       rclk;
 input       reset_b;
 input       rd_reset;
 input       wr_reset;

 input       rx_valid;
 input [7:0] rx_data;
 input       rx_good_frame;
 input       rx_bad_frame;
 input       rx_sop;
 input       rx_eop;
// input rx_frame_drop;


 input       rx_data_req;
 output      rx_sof;
 output      rx_eof;
 output      rx_valid_out;
 output[7:0] rx_data_out;
 output[4:0] wr_state; 
 output[7:0] rd_state; 

 reg[11:0]   wdata_start_addr;
 reg         frame_in_fifo;
 reg         wr_data_full;
 reg[11:0]   wdata_end_addr;
 reg[11:0]   rd_counter;
 reg         len_rd_cnt;
 reg         rdata_en;
 reg[11:0]   rdata_addr;
 reg         rx_eop_d1;
 reg         rx_eop_d2;
 reg         rx_eop_d3;
 reg         rx_data_req_d1;
 reg         rx_data_req_d2;
 reg         rx_data_req_d3;
 reg[1:0]    wait_count;
 reg[1:0]    pad_count;
 reg[4:0]    pad_count1;
 reg         rx_sof;
 reg         rx_eof;
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
 reg         rx_valid_d1;
 reg         rx_valid_d2; 
 reg [11:0]  wdata_addr;
 reg [11:0]  wr_counter;
 reg [4:0]   wr_state; 
 reg [4:0]   wr_next; 
 reg [15:0]  data_len;
 reg         wr_len_cnt; 
 
 reg [8:0]   wr_data_bram;
 reg         wr_store_frame_tog;   
 reg [8:0]   rdata_bram_d1;
 reg [7:0]   rd_state;
 reg [7:0]   rd_next;
 reg [7:0]   rx_data_out;
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
 
 wire        rx_eop;
 wire        fifo_err_pre2;
 wire        fifo_err_rd;
 reg         fifo_err_syn;
 reg         fifo_err_wr;
 wire        rd_eof; 
 wire        rx_start; 
 wire        rx_end; 
 wire        rx_valid_out;
 wire        wdata_addr_inc;   
 wire        wdata_addr_inc2;  
 wire        wdata_addr_inc3;  
 wire        wdata_addr_start; 
 wire        wdata_addr_reload;
 wire[8:0]   rdata_bram;  
 wire        rdata_addr_inc; 
 wire        rd_frame_flag;  
 wire[11:0]  wr_rdata_addr;   
 wire        wdata_addr_end; 
 wire        wdata_addr_reload2;
 wire        wdata_en;
 
 reg         wr_data_full_d1;
 reg         wr_data_full_pre_syn2;
 reg         wr_data_full_pre_syn1;
 wire        wr_data_full_pre; 
 
 
 reg         rx_good_frame_dly1;
 reg         rx_bad_frame_dly1;
 
 always @(posedge  wclk  or negedge reset_b)
 if(!reset_b)
   begin
     rx_good_frame_dly1      <= 1'b0;
   end
 else
   begin
     rx_good_frame_dly1      <= rx_good_frame;
   end
  
 
 always @(posedge  wclk  or negedge reset_b)
 if(!reset_b)
   begin
     rx_bad_frame_dly1      <= 1'b0;
   end
 else
   begin
     rx_bad_frame_dly1      <= rx_bad_frame;
   end
 
 always @(posedge  wclk  or negedge reset_b)
 if(!reset_b)
   begin
   rx_eop_d1      <= 1'b0;
   rx_eop_d2      <= 1'b0;
   rx_eop_d3      <= 1'b0;
   rx_data_req_d1 <= 1'b0;
   rx_data_req_d2 <= 1'b0;
   rx_data_req_d3 <= 1'b0;
   end
 else
   begin
   rx_eop_d1      <= rx_eop;
   rx_eop_d2      <= rx_eop_d1;
   rx_eop_d3      <= rx_eop_d2;
   rx_data_req_d1 <= rx_data_req;
   rx_data_req_d2 <= rx_data_req_d1;
   rx_data_req_d3 <= rx_data_req_d2;
   end

 always @(posedge  wclk  or negedge reset_b)
 if(!reset_b)
   begin
     rx_valid_d1      <= 1'b0;
     rx_valid_d2      <= 1'b0;
   end
 else
   begin
     rx_valid_d1      <= rx_valid;
     rx_valid_d2      <= rx_valid_d1;
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
          else if(rx_sop)
            wr_next = FRAME;
          else
            wr_next = IDLE;
        end
        FRAME:
        begin
          if(wr_data_full)
            wr_next = OF_DATA;
          else if(rx_good_frame_dly1)
            wr_next = WR_LEN;
          else if(rx_bad_frame_dly1)
            wr_next = BF;
          else if(!rx_valid)
            wr_next = WR_LEN;            
          else
            wr_next = FRAME;
        end
        WR_LEN:
        begin
          if(wr_data_full)
            wr_next = OF_DATA;        
          else if(rx_eop_d3)
            wr_next = IDLE;
          else
            wr_next = WR_LEN;
        end
        BF:
            wr_next = IDLE;
        OF_DATA:
        begin
          if(rx_eop)
            wr_next = IDLE;
          else
            wr_next = OF_DATA;
        end
        default:
            wr_next = IDLE;               
 endcase
 end


// assign  wdata_addr_start = ((wr_state == FRAME) && (wr_next == WR_LEN)) ? 1'b1 : 1'b0;

 assign  wdata_addr_start = (wr_next == IDLE) ? 1'b1 : 1'b0;

 assign  wdata_addr_end = ((wr_state == FRAME)&&(wr_next == WR_LEN)) ? 1'b1 : 1'b0;

 assign  wdata_addr_reload2 = ((wr_state == WR_LEN)&&(wr_next == IDLE)) ? 1'b1 : 1'b0;

 assign  wdata_addr_reload = ((wr_state == OF_DATA) || (wr_state == BF)||((wr_state == FRAME)&&(wr_next == WR_LEN))) ? 1'b1 : 1'b0;

// assign  wdata_addr_reload = ((wr_state == OF_DATA) || (wr_state == BF)) ? 1'b1 : 1'b0; 

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
    else if( rx_eop )
      wr_data_bram <= {rx_data,1'b1};
    else
      wr_data_bram <= {rx_data,1'b0};
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
          if((frame_in_fifo == 1'b1)&&(rx_data_req == 1'b1) && (pad_count1 == 5'h0b))
//          if(frame_in_fifo)
            rd_next = LEN_RD;
          else
            rd_next = IDLE_RD;
        end
        LEN_RD:
        begin
          if(len_rd_cnt == 1'b0)
            rd_next = LEN_RD;
          if(len_rd_cnt == 2'b1)
            rd_next = WAIT_RD;
        end
        WAIT_RD:
        begin
          if((rx_data_req == 1'b1) &&(wait_count == 2'b10))
//          if(rx_data_req == 1'b1)
            rd_next = DATA_RD;
          else
            rd_next = WAIT_RD;
        end
        DATA_RD:
        begin
         if(!rx_data_req)
            rd_next = KEEP_RD;
         else if((rx_data_req==1'b1)&&(rd_counter == 12'b1))
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
        KEEP_RD:
        begin
          if(rx_data_req)
            rd_next = DATA_RD;
          else
            rd_next = KEEP_RD;
        end
        END_RD:
        begin
          if (!rd_eof)
            rd_next = ERROR_RD;
//          else if (frame_in_fifo)
//            rd_next = LEN_RD;
          else
            rd_next = IDLE_RD;
        end
        ERROR_RD:
        begin
//          if (frame_in_fifo)
//            rd_next = LEN_RD;
//          else
            rd_next = IDLE_RD;
        end
        default:
        rd_next = IDLE_RD;
 endcase
 end


 assign rd_frame_flag =(rd_state == WAIT_RD && rd_next == DATA_RD)?1'b1:1'b0;


 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    len_rd_cnt <= 1'b0;
 else if(rd_state == LEN_RD)
    len_rd_cnt <= len_rd_cnt +1'b1;
 else
    len_rd_cnt <= 1'b0;

 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    wait_count <= 2'b0;
 else if(rd_state == WAIT_RD)
    wait_count <= wait_count +1'b1;
 else
    wait_count <= 2'b0;


 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    pad_count <= 2'b0;
 else if(rd_state == PAD_RD)
    pad_count <= pad_count +1'b1;
 else
    pad_count <= 2'b0;
    
 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    pad_count1 <= 5'h00;
 else if(rd_state == IDLE_RD && pad_count1 <5'h0b)
    pad_count1 <= pad_count1 +1'b1;
 else if(rd_state == IDLE_RD && pad_count1 == 5'h0b)
    pad_count1 <= pad_count1;    
 else
    pad_count1 <= 5'h00;    


 always @(posedge  rclk  or negedge reset_b)
 if(!reset_b)
    rdata_en   <= 1'b0;
 else if(rd_state == LEN_RD)
    rdata_en   <= 1'b1;
// else if((rd_state == DATA_RD)||(rd_state == END_RD))
 else if(rd_state == DATA_RD)
    rdata_en   <= rx_data_req;
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
   rd_counter<= 12'b0;
  else if (fifo_err_rd)
   rd_counter<= 12'b0;
  else if ((rd_state == WAIT_RD)&&(wait_count==2'b10))
   rd_counter <= {rdata_bram_d1[4:1],rdata_bram[8:1]};
  else if ( (rd_state == DATA_RD)&& rx_data_req)
   rd_counter <= rd_counter - 1'b1;
  else
   rd_counter <= rd_counter;
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

assign rx_start =  ((rd_state == WAIT_RD)&&(rd_next == DATA_RD)) ? 1'b1 : 1'b0;

 always @(posedge  rclk  or negedge reset_b)
 begin
    if(!reset_b)
      begin
      rx_start_d1    <= 1'b0;
      rx_start_d2    <= 1'b0;
      rx_start_d3    <= 1'b0;
      rx_start_d4    <= 1'b0;
      rx_sof         <= 1'b0;
      end
    else
      begin
      rx_start_d1    <= rx_start;
      rx_start_d2    <= rx_start_d1;
      rx_start_d3    <= rx_start_d2;
      rx_start_d4    <= rx_start_d3;
      rx_sof         <= rx_start_d4;
      end
    end

 always @(posedge  rclk  or negedge reset_b)
 begin
    if(!reset_b)
      begin
      rx_end_d1    <= 1'b0;
      rx_end_d2    <= 1'b0;
      rx_end_d3    <= 1'b0;
      rx_eof       <= 1'b0;
      end
    else
      begin
      rx_end_d1    <= rx_end;
      rx_end_d2    <= rx_end_d1;
      rx_end_d3    <= rx_end_d2;
      rx_eof       <= rx_end_d3;
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


assign rx_valid_out = rdata_en_d3;//重新计算延迟时间
// assign rx_valid_out = ((rd_state == DATA_RD) || (rd_state == END_RD ))? rx_data_req_d3 : 1'b0;//重新计算延迟时间

 

 always @(posedge  rclk  or negedge reset_b)
 begin
    if(!reset_b)
      rx_data_out <= 8'b0;
    else if (fifo_err_rd)
      rx_data_out <= 8'b0;
    else
      rx_data_out <= rdata_bram[8:1];
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



 function [ADDR_WIDTH-1:0] bin_to_gray;
   input [ADDR_WIDTH-1:0] bin;
   begin
     bin_to_gray = bin ^ (bin>>1);
   end
 endfunction


 function [ADDR_WIDTH-1:0] gray_to_bin;
 input [ADDR_WIDTH-1:0] gray;
 integer i;
  begin
   for (i=ADDR_WIDTH-1;i>=0;i=i-1)
        begin
          if (i == ADDR_WIDTH-1)
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