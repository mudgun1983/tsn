//FILE_HEADER-------------------------------------------------------------------
// ZTE Copyright (c)                                                            
// ZTE Company Confidential                                                     
//------------------------------------------------------------------------------
// FILE NAME          : mac_rx_crc32.v                                    
// DEPARTMENT         : ASIC_FPGA_R&D_Dept.                                     
// MANUAL_PERCENT     : 100%                                                     
// AUTHOR             : Zhou Chaocong                                           
// AUTHOR'S EMAIL     : Zhou.chaocong@zte.com.cn                                
//------------------------------------------------------------------------------
// RELEASE HISTORY                                                              
// VERSION  DATE         AUTHOR           DESCRIPTION                           
// 0.1.00                Zhou Chaocong   initial version                        
//------------------------------------------------------------------------------
// KEYWORDS           : FPGA, Altera ArriaII GX                                 
//------------------------------------------------------------------------------
// PURPOSE            :                                                         
//------------------------------------------------------------------------------
// PARAMETERS                                                                   
//    PARAM NAME            RANGE    :DESCRIPTION         :DEFAULT      :UNITS  k,
//    N/A                                                                       
//------------------------------------------------------------------------------clolk;
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
module mac_rx_crc32
(
  rst_b,
  clk,
  data,
  data_en,

  frame_start,
  frame_end,

  crc_err
);
input            rst_b;
input            clk;

input    [7:0]   data;
input            data_en;

input            frame_start;
input            frame_end;

output           crc_err;
//---------------------------
reg              crc_err;

parameter  CRC_PRESET = 32'hffff_ffff;
parameter  CRC_MASK   = 32'hc704_dd7b;

wire     [31:0]  crc;
//   CRC checker sub-clause
//
// crc32_cal.v
crc32_cal  crc32_cal
(
  .rst_b               (rst_b               ),
  .clk                 (clk                 ),
  .data                (data                ),
  .data_en             (data_en             ),

  .crc_int             (frame_start         ),

  .crc                 (crc                 )
);

always@(posedge clk)
 	if(frame_start)
  		crc_err <= 1'b0;
 	else if(frame_end)
 			crc_err <= (crc!=CRC_MASK);

endmodule



