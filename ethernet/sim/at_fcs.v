//FILE_HEADER-------------------------------------------------------------------
// ZTE Copyright (c)
// ZTE Company Confidential
//------------------------------------------------------------------------------
// FILE NAME          : at_fcs.v
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
module at_fcs
(
 clk,
 reset_b,
 tx_valid,
 tx_data,
 tx_sop,
 tx_eop,

 tx_sof_out,
 tx_eof_out, 
 tx_valid_out,
 tx_data_out
);
parameter      TX_IDLE = 3'b001,
               TX_DATA = 3'b010,
               TX_FCS  = 3'b100;
               
input          clk;
input          reset_b;
               
input          tx_valid;
input [7:0]    tx_data;
input          tx_sop;
input          tx_eop;
               
output         tx_sof_out;
output         tx_eof_out;
output         tx_valid_out;
output[7:0]    tx_data_out;
               
               
reg            tx_sof_out;
reg            tx_eof_out;
reg            tx_valid_out;
reg     [7:0]  tx_data_out;


wire           reset_b;
wire           clk;

wire    [7:0]  tx_data;
wire           tx_valid;
wire    [31:0] crc_out;
reg[7:0]       tx_data_d1;
reg[7:0]       tx_data_d2;
reg            tx_valid_d1;

reg   [2:0]    tx_state;
reg   [2:0]    tx_state_d1;
reg   [1:0]    fcs_cnt;               

             

   
always @(posedge clk or negedge reset_b)
   if(~reset_b)
     begin
      tx_data_d1     <= 8'b0;
      tx_data_d2     <= 8'b0;     
     end
   else
     begin
      tx_data_d1     <= tx_data;
      tx_data_d2     <= tx_data_d1;     
     end
     
always @(posedge clk or negedge reset_b)
   if(~reset_b)
     begin
      tx_valid_d1<= 1'b0;   
     end
   else
     begin
      tx_valid_d1 <= tx_valid;  
     end     
     
          
//********** gmii mac transmiting *******************************
always @(posedge clk or negedge reset_b)
  if(~reset_b)
     begin
        tx_state        <= TX_IDLE;
     end
  else
     begin
        case(tx_state)
           TX_IDLE:
              begin
                 if(tx_valid == 1'b1)
                    tx_state        <= TX_DATA;
                 else
                    tx_state        <= TX_IDLE;
              end
           TX_DATA:
              begin
                 if(tx_valid == 1'b0)
                    tx_state        <= TX_FCS;
                 else
                    tx_state        <= TX_DATA;
              end
           TX_FCS:
              begin
                 if(fcs_cnt == 2'b11)
                    tx_state        <= TX_IDLE;
                 else
                    tx_state        <= TX_FCS;	
              end
           default:
              begin
                 tx_state          <= TX_IDLE;
              end
        endcase
     end

always @(posedge clk or negedge reset_b)
  if(~reset_b)
     begin
        fcs_cnt             <= 2'b00;
        tx_valid_out        <= 1'b0;
        tx_data_out         <= 8'h00;
        tx_eof_out          <= 1'b0;
     end
  else
     begin
        fcs_cnt             <= 2'b00;
        tx_valid_out        <= 1'b0;
        tx_data_out         <= 8'h00;   
        tx_eof_out          <= 1'b0;          
        case(tx_state)
           TX_IDLE:
              begin
                 tx_valid_out      <= 1'b0;
                 fcs_cnt           <= 2'b00;                 
                 tx_data_out       <= 8'h00; 
                 tx_eof_out        <= 1'b0;                             
              end
           TX_DATA:
              begin
                 fcs_cnt           <= 2'b00;
                 tx_data_out       <= tx_data_d1;
                 tx_valid_out      <= 1'b1;
                 tx_eof_out        <= 1'b0;                   
              end
           TX_FCS:                                   //added by zcc 2010.05.06
              begin
                 fcs_cnt       <=  fcs_cnt+1'b1;
                 if(fcs_cnt == 2'b00)
                    begin
                       tx_eof_out           <= 1'b0;  
                       tx_valid_out         <= 1'b1;
                       tx_data_out          <= ~{crc_out[24],crc_out[25],crc_out[26],crc_out[27],crc_out[28],crc_out[29],crc_out[30],crc_out[31]};
                    end
                 if(fcs_cnt == 2'b01)
                    begin
                       tx_eof_out           <= 1'b0;                      
                       tx_valid_out         <= 1'b1;
                       tx_data_out          <= ~{crc_out[16],crc_out[17],crc_out[18],crc_out[19],crc_out[20],crc_out[21],crc_out[22],crc_out[23]};
                    end
                 if(fcs_cnt == 2'b10)
                    begin
                       tx_eof_out           <= 1'b0;                      
                       tx_valid_out         <= 1'b1;
                       tx_data_out          <=  ~{crc_out[8],crc_out[9],crc_out[10],crc_out[11],crc_out[12],crc_out[13],crc_out[14],crc_out[15]};
                    end
                 if(fcs_cnt == 2'b11)
                    begin
                       tx_eof_out           <= 1'b1;                      
                       tx_valid_out         <= 1'b1;
                       tx_data_out          <=  ~{crc_out[0],crc_out[1],crc_out[2],crc_out[3],crc_out[4],crc_out[5],crc_out[6],crc_out[7]};
                    end
              end
        endcase
     end

always @(posedge clk or negedge reset_b)
   if(~reset_b)
     begin
      tx_state_d1 <= 3'b0;   
     end
   else
     begin
      tx_state_d1 <= tx_state;  
     end    
     
always @(posedge clk or negedge reset_b)
  if (~reset_b)
    tx_sof_out <= 1'b0;
  else
    begin
     if(tx_state == TX_DATA && tx_state_d1 == TX_IDLE)
       begin
        tx_sof_out <= 1'b1;   
       end
     else
       begin
         tx_sof_out <= 1'b0;   
       end
    end		 

crc32_cal  crc32_cal
(
  .rst_b               (reset_b             ),
  .clk                 (clk              ),
  .data                (tx_data_d1          ),
  .data_en             (tx_valid_d1         ),

  .crc_int             (tx_sop              ),

  .crc                 (crc_out             )
);


 endmodule