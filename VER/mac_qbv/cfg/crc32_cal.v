//FILE_HEADER-------------------------------------------------------------------
// ZTE Copyright (c)
// ZTE Company Confidential
//------------------------------------------------------------------------------
// FILE NAME          : crc32_cal.v
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
module crc32_cal
(
  rst_b,
  clk,
  data,
  data_en,

  crc_int,

  crc
);
input            rst_b;
input            clk;

input    [7:0]   data;
input            data_en;

input            crc_int;
output   [31:0]  crc;
//
reg      [31:0]  crc;

parameter  CRC_PRESET = 32'hffff_ffff;
parameter  CRC_MASK   = 32'hc704_dd7b;

//   CRC checker sub-clause
//
//wire             crc_init;
//wire             crc_enable_rx;
//assign  crc_init = eof;
//assign  crc_enable_rx = crc_enable&rx_paradata_valid;

//reg      [31:0]  crc;
wire 	   [31:0] 	crcnext;
wire     [7:0]   crc_data;



assign  crc_data = data;

assign crcnext[0] = crc[30] ^ crc_data[7] ^ crc[24] ^ crc_data[1];
assign crcnext[1] = crc[30] ^ crc[31] ^ crc_data[6] ^ crc_data[7] ^ crc[24] ^ crc_data[0] ^ crc[25] ^ crc_data[1];
assign crcnext[2] = crc[30] ^ crc[31] ^ crc_data[5] ^ crc_data[6] ^ crc_data[7] ^ crc[24] ^ crc[25] ^ crc[26] ^ crc_data[0] ^ crc_data[1];
assign crcnext[3] = crc_data[4] ^ crc[31] ^ crc_data[5] ^ crc_data[6] ^ crc[25] ^ crc[26] ^ crc[27] ^ crc_data[0];
assign crcnext[4] = crc[30] ^ crc_data[4] ^ crc_data[5] ^ crc_data[7] ^ crc[24] ^ crc[26] ^ crc[27] ^ crc[28] ^ crc_data[1] ^ crc_data[3];
assign crcnext[5] = crc[30] ^ crc_data[4] ^ crc[31] ^ crc_data[6] ^ crc_data[7] ^ crc[24] ^ crc[25] ^ crc[27] ^ crc[28] ^ crc[29] ^ crc_data[0] ^ crc_data[1] ^ crc_data[2] ^ crc_data[3];
assign crcnext[6] = crc[30] ^ crc[31] ^ crc_data[5] ^ crc_data[6] ^ crc[25] ^ crc[26] ^ crc[28] ^ crc[29] ^ crc_data[0] ^ crc_data[1] ^ crc_data[2] ^ crc_data[3];
assign crcnext[7] = crc_data[4] ^ crc_data[5] ^ crc[31] ^ crc_data[7] ^ crc[24] ^ crc[26] ^ crc[27] ^ crc[29] ^ crc_data[0] ^ crc_data[2];
assign crcnext[8] = crc_data[4] ^ crc_data[6] ^ crc_data[7] ^ crc[24] ^ crc[25] ^ crc[27] ^ crc[28] ^ crc[0] ^ crc_data[3];
assign crcnext[9] = crc_data[5] ^ crc_data[6] ^ crc[25] ^ crc[26] ^ crc[28] ^ crc[29] ^ crc_data[2] ^ crc[1] ^ crc_data[3];
assign crcnext[10] = crc_data[4] ^ crc_data[5] ^ crc_data[7] ^ crc[24] ^ crc[26] ^ crc[27] ^ crc[29] ^ crc_data[2] ^ crc[2];
assign crcnext[11] = crc_data[4] ^ crc[3] ^ crc_data[6] ^ crc_data[7] ^ crc[24] ^ crc[25] ^ crc[27] ^ crc[28] ^ crc_data[3];
assign crcnext[12] = crc[30] ^ crc_data[5] ^ crc[4] ^ crc_data[6] ^ crc_data[7] ^ crc[24] ^ crc[25] ^ crc[26] ^ crc[28] ^ crc[29] ^ crc_data[1] ^ crc_data[2] ^ crc_data[3];
assign crcnext[13] = crc_data[4] ^ crc[30] ^ crc[31] ^ crc_data[5] ^ crc_data[6] ^ crc[5] ^ crc[25] ^ crc[26] ^ crc[27] ^ crc[29] ^ crc_data[0] ^ crc_data[1] ^ crc_data[2];
assign crcnext[14] = crc_data[4] ^ crc[30] ^ crc_data[5] ^ crc[31] ^ crc[6] ^ crc[26] ^ crc[27] ^ crc[28] ^ crc_data[0] ^ crc_data[1] ^ crc_data[3];
assign crcnext[15] = crc_data[4] ^ crc[31] ^ crc[7] ^ crc[27] ^ crc[28] ^ crc[29] ^ crc_data[0] ^ crc_data[2] ^ crc_data[3];
assign crcnext[16] = crc_data[7] ^ crc[24] ^ crc[8] ^ crc[28] ^ crc[29] ^ crc_data[2] ^ crc_data[3];
assign crcnext[17] = crc[30] ^ crc_data[6] ^ crc[25] ^ crc[9] ^ crc[29] ^ crc_data[1] ^ crc_data[2];
assign crcnext[18] = crc[30] ^ crc_data[5] ^ crc[31] ^ crc[26] ^ crc_data[0] ^ crc_data[1] ^ crc[10];
assign crcnext[19] = crc_data[4] ^ crc[31] ^ crc[27] ^ crc_data[0] ^ crc[11];
assign crcnext[20] = crc[12] ^ crc[28] ^ crc_data[3];
assign crcnext[21] = crc[13] ^ crc[29] ^ crc_data[2];
assign crcnext[22] = crc[14] ^ crc_data[7] ^ crc[24];
assign crcnext[23] = crc[30] ^ crc_data[6] ^ crc_data[7] ^ crc[24] ^ crc[15] ^ crc[25] ^ crc_data[1];
assign crcnext[24] = crc[31] ^ crc_data[5] ^ crc_data[6] ^ crc[25] ^ crc[16] ^ crc[26] ^ crc_data[0];
assign crcnext[25] = crc_data[4] ^ crc_data[5] ^ crc[26] ^ crc[17] ^ crc[27];
assign crcnext[26] = crc[30] ^ crc_data[4] ^ crc_data[7] ^ crc[24] ^ crc[27] ^ crc[18] ^ crc[28] ^ crc_data[1] ^ crc_data[3];
assign crcnext[27] = crc[31] ^ crc_data[6] ^ crc[25] ^ crc[28] ^ crc[19] ^ crc[29] ^ crc_data[0] ^ crc_data[2] ^ crc_data[3];
assign crcnext[28] = crc[30] ^ crc_data[5] ^ crc[26] ^ crc[29] ^ crc_data[1] ^ crc_data[2] ^ crc[20];
assign crcnext[29] = crc_data[4] ^ crc[30] ^ crc[21] ^ crc[31] ^ crc[27] ^ crc_data[0] ^ crc_data[1];
assign crcnext[30] = crc[31] ^ crc[22] ^ crc[28] ^ crc_data[0] ^ crc_data[3];
assign crcnext[31] = crc[23] ^ crc[29] ^ crc_data[2];

//always@(negedge clk)// or negedge rst_bposedge
always@(posedge clk or negedge rst_b)
 	if(!rst_b)
  		crc <= CRC_PRESET;
 	else if(crc_int)//frame_start//frame_end
 			crc <= CRC_PRESET;//32'hffffffff;
 	else if(data_en)
 			crc <= crcnext;

endmodule