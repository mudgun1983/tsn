
//`timescale 1ns/1ps
   

   
module pcs_tb_top;

import uvm_pkg::*;
  `include "uvm_macros.svh"
  
import pcs_env_pkg::*; 
import cpu_pkg::*;
import mac_pkg::*;
/* `include "gmii_rx_vif.sv"
`include "gmii_tx_vif.sv"
`include "xgmii64_rx_vif.sv"
`include "xgmii64_tx_vif.sv" */


//`define serdes_looop
//-------------parameter begin-------------------//
parameter CLOCK_156M = 6.4ns;
parameter CLOCK_125M = 8ns;
parameter CLOCK_322M = 3.104ns;
parameter CLOCK_312M = 3.201ns;//CLOCK_322M*(66/64);
parameter CLOCK_161M = CLOCK_322M*2;  
parameter CLOCK_100M = 10ns;
parameter CLOCK_200M = 5.0ns;
parameter CLOCK_250M = 4.0ns;
parameter CLOCK_50M  = 20ns;
parameter CLOCK_25M  = 40ns;
parameter RESET_START_TIME = 100ns;
parameter RESET_HOLD_TIEM = 500ns;
parameter SUB_RESET_START_TIME = 100ns;
parameter SUB_RESET_HOLD_TIEM = 500ns;
parameter CLOCK_1us = 1000ns;

parameter SELF_DEFINE_PACKET= 0;
parameter OAM_PACKET        = 1;
parameter PROTOCOL_PACKET   = 2;
parameter DSP_PACKET        = 3;
parameter GMII_PORT_NUM     = `MAX_ENV_MAC_NUM;//20;
parameter XGMII_PORT_NUM     = 2;
//***************************************************************************
   // The following parameters refer to width of various ports
   //***************************************************************************
  
//-------------parameter end  -------------------//

//-------------inner signal begin----------------//
reg clk_156m;
reg clk_125m;
reg clk_322m;
reg clk_312m;
reg clk_161m;
reg clk_200m;
reg clk_250m;
reg clk_100m;
reg clk_50m;
reg clk_25m;
reg reset_b;
reg rst,sub_rst;
reg    [63:0]    xgmii_64_rd;
reg    [7:0]     xgmii_64_rxc  ;

wire    [63:0]    xgmii_64_rd_private;
wire    [7:0]     xgmii_64_rxc_private;
wire              xgmii_64_rxd_en;
wire              xgmii_64_sop;
wire              xgmii_64_eop;
wire              xgmii_64_err;

reg    [7:0]     gmii_rd;
reg              gmii_dv;
reg              gmii_err;

string index,index1;
int key;
//-------------inner signal end------------------//

//------------interface--------------------------//

assign rst = ~reset_b;

gmii_rx_if gmii_rx_if0();
gmii_rx_if gmii_rx_if_array[GMII_PORT_NUM]();
gmii_tx_if gmii_tx_if0();
gmii_tx_if gmii_tx_if_array[GMII_PORT_NUM]();
gmii_rx_vif gmii_rx_vif0;
gmii_tx_vif gmii_tx_vif0;

gmii_rx_if gmii_ptp_rx_if();
gmii_tx_if gmii_ptp_tx_if();

xgmii64_rx_if xgmii64_rx_if_array[XGMII_PORT_NUM]();
xgmii64_rx_vif xgmii64_rx_vif0;
xgmii64_tx_if xgmii64_tx_if_array[XGMII_PORT_NUM]();
xgmii64_tx_vif xgmii64_tx_vif0;

//connect the dut signal to uvm
dut_if dut_if0();
//------------interface--------------------------//

//------------cpu if-----------------------------//
  reg                         sys_rst      ;
  reg                         cpu_clk      ; 
  cpu_if                      m_cpu_if(cpu_clk,~sys_rst); 
  initial begin
      uvm_config_db#(virtual cpu_if)::set(null,"*rx_env0.cpu_agent0*","vif",m_cpu_if);
	  uvm_config_db#(virtual dut_if)::set(null,"*","dut_vif",dut_if0);
  end  

  initial begin   	
             cpu_clk   = 1'b1;           
             sys_rst   = 1'b0; 
      #50ns  sys_rst   = 1'b1;  
      #100ns sys_rst   = 1'b0; 
           
  end

  always
       begin
           #(CLOCK_100M/2) cpu_clk = ~cpu_clk;//62.5M
       end
//------------cpu if-----------------------------//

//------------ set interface class --------
    initial begin  
        
        gmii_rx_vif0 = new(gmii_rx_if0); 
        uvm_config_db#(virtual gmii_rx_if)::set(null,"*mac_env_dbg*mac_rx_agent0*","m_gmii_rx_if",gmii_rx_if0);
        
        gmii_tx_vif0 = new(gmii_tx_if0); 
        uvm_config_db#(virtual gmii_tx_if)::set(null,"*mac_env_dbg*mac_tx_agent0*","m_gmii_tx_if",gmii_tx_if0);
        
		  
        // xgmii64_rx_vif0 = new(xgmii64_rx_if); 
		// xgmii64_tx_vif0 = new(xgmii64_tx_if);   
		
        // set_config_object("*mac_env0[0]*mac_rx_agent0*","m_xgmii64_rx_vif",xgmii64_rx_vif0,0);                                 
        // set_config_object("*mac_env0[0]*mac_tx_agent0*","m_xgmii64_tx_vif",xgmii64_tx_vif0,0);

        //set_config_object("*","vif",cgmii_tx_block_vif,0);               
    end 
	
genvar i;
generate
  for(i=2;i<GMII_PORT_NUM;i++)
 initial
  begin
  begin
    		index = $sformatf("%0d",i);//string'(i);
			uvm_config_db#(virtual gmii_rx_if)::set(null,{"*mac_env0[",index,"]*mac_rx_agent0*"},"m_gmii_rx_if",gmii_rx_if_array[i-2]);
			uvm_config_db#(virtual gmii_tx_if)::set(null,{"*mac_env0[",index,"]*mac_tx_agent0*"},"m_gmii_tx_if",gmii_tx_if_array[i-2]);
  end
  end
endgenerate

genvar k;
generate
  for(k=0;k<XGMII_PORT_NUM;k++)
 initial
  begin
  begin
    		index1 = $sformatf("%0d",k);//string'(i);
			//uvm_config_db#(virtual gmii_rx_if)::set(null,{"mac_env0[",index,"]*mac_rx_agent0*"},"m_gmii_rx_if",gmii_rx_if[0]);
			uvm_config_db#(virtual xgmii64_rx_if)::set(null,{"*mac_env0[",index1,"]*mac_rx_agent0*"},"m_xgmii64_rx_if",xgmii64_rx_if_array[k]);
			uvm_config_db#(virtual xgmii64_tx_if)::set(null,{"*mac_env0[",index1,"]*mac_tx_agent0*"},"m_xgmii64_tx_if",xgmii64_tx_if_array[k]);
  end
  end
endgenerate
	
//------------ 
//------------generate CLOCK_156M and reset begin-------//
initial
  begin
  	clk_156m    =1'b0;
  	clk_125m    =1'b0;
  	clk_100m    =1'b0;
  	clk_200m    =1'b0;
	clk_250m    =1'b0;
  	clk_322m    =1'b0;
  	clk_312m    =1'b0;
  	clk_161m    =1'b0;
  	reset_b     =1'b1;
	sub_rst     =1'b0;
  end

initial
   begin
   	#RESET_START_TIME;
   	  reset_b=1'b0;
   	#RESET_HOLD_TIEM;
   	  reset_b=1'b1;
   end  

initial
   begin
   	#SUB_RESET_START_TIME;
	  sub_rst=1'b1;
   	#SUB_RESET_HOLD_TIEM;
	  sub_rst=1'b0;
   end
   
always #(CLOCK_156M/2)
   clk_156m<=~clk_156m; 
   
always #(CLOCK_125M/2)
   clk_125m<=~clk_125m; 

always #(CLOCK_200M/2)
   clk_200m<=~clk_200m; 

always #(CLOCK_250M/2)
   clk_250m<=~clk_250m;   
   
always #(CLOCK_50M/2)
   clk_50m<=~clk_50m; 
   
always #(CLOCK_25M/2)
   clk_25m<=~clk_25m; 

always #(CLOCK_322M/2)
   clk_322m<=~clk_322m;

always #(CLOCK_312M/2)
   clk_312m<=~clk_312m;

always #(CLOCK_161M/2)
   clk_161m<=~clk_161m;       

always #(CLOCK_100M/2)
   clk_100m<=~clk_100m;
//------------generate CLOCK_156M and reset end --------//


//--------- interface begin-----------//
  
initial
  begin
  	gmii_rx_if0.clk=1;
  	gmii_rx_if0.reset=0;
  	#10ns;
  	gmii_rx_if0.reset=1;
  	#50ns;
  	gmii_rx_if0.reset=0;
  end

initial
  begin
  	gmii_tx_if0.clk=1;
  	gmii_tx_if0.reset=0;
	gmii_ptp_rx_if.clk=1;
  	gmii_ptp_rx_if.reset=0;
	gmii_ptp_tx_if.clk=1;
  	gmii_ptp_tx_if.reset=0;
	
  	#10ns;
  	gmii_tx_if0.reset=1;
	gmii_ptp_rx_if.reset=1;
	gmii_ptp_tx_if.reset=1;
  	#50ns;
  	gmii_tx_if0.reset=0;
	gmii_ptp_rx_if.reset=0;
	gmii_ptp_tx_if.reset=1;
  end
  
always #(CLOCK_125M/2)  
  gmii_rx_if0.clk <= ~gmii_rx_if0.clk;

always #(CLOCK_125M/2)                
  gmii_tx_if0.clk <= ~gmii_tx_if0.clk;

always #(CLOCK_125M/2)                
  gmii_ptp_rx_if.clk <= ~gmii_ptp_rx_if.clk;

always #(CLOCK_125M/2)                
  gmii_ptp_tx_if.clk <= ~gmii_ptp_tx_if.clk;
  
genvar j;
generate
 for(j=0;j<GMII_PORT_NUM;j++)
   begin
    initial
      begin
	    gmii_rx_if_array[j].clk=1;
      	gmii_rx_if_array[j].reset=0;
      	gmii_tx_if_array[j].clk=1;
      	gmii_tx_if_array[j].reset=0;
      	#10ns;
		gmii_rx_if_array[j].reset=1;
      	gmii_tx_if_array[j].reset=1;
      	#50ns;
		gmii_rx_if_array[j].reset=0;
      	gmii_tx_if_array[j].reset=0;
      end
  
    always #(CLOCK_125M/2)  
      begin
	   gmii_rx_if_array[j].clk <= ~gmii_rx_if_array[j].clk;
	   gmii_tx_if_array[j].clk <= ~gmii_tx_if_array[j].clk;
	  end
   end
endgenerate

genvar j1;
generate
 for(j1=0;j1<XGMII_PORT_NUM;j1++)
   begin
    initial
      begin
	    xgmii64_rx_if_array[j1].clk=1;
      	xgmii64_rx_if_array[j1].reset=0;
      	xgmii64_tx_if_array[j1].clk=1;
      	xgmii64_tx_if_array[j1].reset=0;
      	#10ns;
		xgmii64_rx_if_array[j1].reset=1;
      	xgmii64_tx_if_array[j1].reset=1;
      	#50ns;
		xgmii64_rx_if_array[j1].reset=0;
      	xgmii64_tx_if_array[j1].reset=0;
      end
  
    always #(CLOCK_156M/2)  
      begin
	   xgmii64_rx_if_array[j1].clk <= ~xgmii64_rx_if_array[j1].clk;
	   xgmii64_tx_if_array[j1].clk <= ~xgmii64_tx_if_array[j1].clk;
	  end
   end
endgenerate  	
//--------- interface end  -----------//


//------------wave store begin-----------------------//
// initial
   // begin
              // $fsdbAutoSwitchDumpfile(500, {"sim.fsdb"},4);
              // $fsdbDumpvarsToFile("dump.list");
   // end
//------------wave store end------------------------//  

//=======================TEST START======================  
    initial begin
	$display("test start");
        run_test();
    end
`ifdef BOTH
 initial
 begin
   $fsdbDumpfile("tb_top.fsdb");
   $fsdbDumpvars(0,pcs_tb_top);
   
   $vcdpluson;
 end
`else
`ifdef VERDI
 initial
 begin
   $fsdbDumpfile("tb_top.fsdb");
   $fsdbDumpvars(0,pcs_tb_top);
 end
 `else
initial begin
$vcdpluson;
//$vcdplusmemon;
end 
`endif 
`endif
//ptp_time
reg      [63:0]        timestamp_ptp;
reg      [63:0]        timestamp_tc;
wire                   mact_age_counter_pulse;
wire                   policer_timer_pulse;
wire                   frer_age_counter_pulse;

always @(posedge clk_250m or posedge rst)
  if(rst)
    begin
      timestamp_ptp[63:0]<= 64'd0;
    end
  else
    begin
      timestamp_ptp[31:0]<= timestamp_ptp[31:0] + 32'd4;
      if(timestamp_ptp[31:0]==32'h3B9ACA00)
        begin
          timestamp_ptp[31:0] <= 32'd0;
          timestamp_ptp[63:32] <= timestamp_ptp[63:32] + 32'd1;
        end
    end

always @(posedge clk_250m or posedge rst)
  if(rst)
    begin
      timestamp_tc[63:0]<= 64'd0;
    end
  else
    begin
      timestamp_tc[63:0]<= timestamp_tc[63:0] + 64'd4;
    end 
//------------DUT connect begin---------------------//

logic [15:0] dut_cpu_data_out_0;
logic [15:0] dut_cpu_data_out_1;

`ifdef DUAL_DUT
 assign  m_cpu_if.cpu_data_out = (m_cpu_if.cpu_addr[31])? dut_cpu_data_out_1:dut_cpu_data_out_0;
`else
 assign  m_cpu_if.cpu_data_out = dut_cpu_data_out_0;
`endif

`ifdef DUMMY_DUT
assign    gmii_tx_if0.tx_en =gmii_rx_if0.rx_dv;
assign    gmii_tx_if0.txd   =gmii_rx_if0.rxd  ; 

generate
 for(i=0;i<GMII_PORT_NUM;i++)
   begin
    assign    gmii_tx_if_array[i].tx_en =gmii_rx_if_array[i].rx_dv;
    assign    gmii_tx_if_array[i].txd   =gmii_rx_if_array[i].rxd  ; 
   end

 for(i=0;i<XGMII_PORT_NUM;i++)
   begin
    assign    xgmii64_tx_if_array[i].txc   =xgmii64_rx_if_array[i].rxc;
    assign    xgmii64_tx_if_array[i].txd   =xgmii64_rx_if_array[i].rxd  ; 
   end   
endgenerate
`else
tsn_sw_chip_top UUT
           (
           .sys_reset             (rst           ), 	
           .syc_clk_250m          (clk_125m      ),//(clk_250m      ),
           .clk_cpu                    (clk_100m                     ),
           .rx_clk_0                   (xgmii64_rx_if_array[0].clk),
           .rx_mii_d_0                 (xgmii64_rx_if_array[0].rxd),
           .rx_mii_c_0                 (xgmii64_rx_if_array[0].rxc),
           .tx_clk_0                   (xgmii64_tx_if_array[0].clk),
           .tx_mii_d_0                 (xgmii64_tx_if_array[0].txd),
           .tx_mii_c_0                 (xgmii64_tx_if_array[0].txc),
           .rx_clk_1                   (xgmii64_rx_if_array[1].clk),
           .rx_mii_d_1                 (xgmii64_rx_if_array[1].rxd),
           .rx_mii_c_1                 (xgmii64_rx_if_array[1].rxc),
           .tx_clk_1                   (xgmii64_tx_if_array[1].clk),
           .tx_mii_d_1                 (xgmii64_tx_if_array[1].txd),
           .tx_mii_c_1                 (xgmii64_tx_if_array[1].txc),
           .rx_clk_2                   (gmii_rx_if_array[0].clk  ),
           .rx_er_2                    (gmii_rx_if_array[0].rx_er),
           .rx_dv_2                    (gmii_rx_if_array[0].rx_dv),
           .rxd_2                      (gmii_rx_if_array[0].rxd  ),
           .gtx_clk_2                  (gmii_tx_if_array[0].clk  ),
           .tx_er_2                    (gmii_tx_if_array[0].tx_er),
           .tx_en_2                    (gmii_tx_if_array[0].tx_en),
           .txd_2                      (gmii_tx_if_array[0].txd  ),
           .rx_clk_3                   (gmii_rx_if_array[1].clk  ),
           .rx_er_3                    (gmii_rx_if_array[1].rx_er),
           .rx_dv_3                    (gmii_rx_if_array[1].rx_dv),
           .rxd_3                      (gmii_rx_if_array[1].rxd  ),
           .gtx_clk_3                  (gmii_tx_if_array[1].clk  ),
           .tx_er_3                    (gmii_tx_if_array[1].tx_er),
           .tx_en_3                    (gmii_tx_if_array[1].tx_en),
           .txd_3                      (gmii_tx_if_array[1].txd  ),
           .rx_clk_4                   (gmii_rx_if_array[2].clk  ),
           .rx_er_4                    (gmii_rx_if_array[2].rx_er),
           .rx_dv_4                    (gmii_rx_if_array[2].rx_dv),
           .rxd_4                      (gmii_rx_if_array[2].rxd  ),
           .gtx_clk_4                  (gmii_tx_if_array[2].clk  ),
           .tx_er_4                    (gmii_tx_if_array[2].tx_er),
           .tx_en_4                    (gmii_tx_if_array[2].tx_en),
           .txd_4                      (gmii_tx_if_array[2].txd  ),
           .rx_clk_5                   (gmii_rx_if_array[3].clk  ),
           .rx_er_5                    (gmii_rx_if_array[3].rx_er),
           .rx_dv_5                    (gmii_rx_if_array[3].rx_dv),
           .rxd_5                      (gmii_rx_if_array[3].rxd  ),
           .gtx_clk_5                  (gmii_tx_if_array[3].clk  ),
           .tx_er_5                    (gmii_tx_if_array[3].tx_er),
           .tx_en_5                    (gmii_tx_if_array[3].tx_en),
           .txd_5                      (gmii_tx_if_array[3].txd  ),
		  `ifdef DUAL_DUT
           .rx_clk_6                   (gmii_ptp_tx_if.clk  ),
           .rx_er_6                    (gmii_ptp_tx_if.tx_er),
           .rx_dv_6                    (gmii_ptp_tx_if.tx_en),
           .rxd_6                      (gmii_ptp_tx_if.txd  ),
		   .gtx_clk_6                  (gmii_ptp_rx_if.clk  ),
           .tx_er_6                    (gmii_ptp_rx_if.rx_er),
           .tx_en_6                    (gmii_ptp_rx_if.rx_dv),
           .txd_6                      (gmii_ptp_rx_if.rxd  ),
		  `else
		   .rx_clk_6                   (gmii_rx_if_array[4].clk  ),
           .rx_er_6                    (gmii_rx_if_array[4].rx_er),
           .rx_dv_6                    (gmii_rx_if_array[4].rx_dv),
           .rxd_6                      (gmii_rx_if_array[4].rxd  ),
           .gtx_clk_6                  (gmii_tx_if_array[4].clk  ),
           .tx_er_6                    (gmii_tx_if_array[4].tx_er),
           .tx_en_6                    (gmii_tx_if_array[4].tx_en),
           .txd_6                      (gmii_tx_if_array[4].txd  ),
		   `endif
           .rx_clk_7                   (gmii_rx_if_array[5].clk  ),
           .rx_er_7                    (gmii_rx_if_array[5].rx_er),
           .rx_dv_7                    (gmii_rx_if_array[5].rx_dv),
           .rxd_7                      (gmii_rx_if_array[5].rxd  ),
           .gtx_clk_7                  (gmii_tx_if_array[5].clk  ),
           .tx_er_7                    (gmii_tx_if_array[5].tx_er),
           .tx_en_7                    (gmii_tx_if_array[5].tx_en),
           .txd_7                      (gmii_tx_if_array[5].txd  ),
           .rx_clk_8                   (gmii_rx_if_array[6].clk  ),
           .rx_er_8                    (gmii_rx_if_array[6].rx_er),
           .rx_dv_8                    (gmii_rx_if_array[6].rx_dv),
           .rxd_8                      (gmii_rx_if_array[6].rxd  ),
           .gtx_clk_8                  (gmii_tx_if_array[6].clk  ),
           .tx_er_8                    (gmii_tx_if_array[6].tx_er),
           .tx_en_8                    (gmii_tx_if_array[6].tx_en),
           .txd_8                      (gmii_tx_if_array[6].txd  ),
           .rx_clk_9                   (gmii_rx_if_array[7].clk  ),
           .rx_er_9                    (gmii_rx_if_array[7].rx_er),
           .rx_dv_9                    (gmii_rx_if_array[7].rx_dv),
           .rxd_9                      (gmii_rx_if_array[7].rxd  ),
           .gtx_clk_9                  (gmii_tx_if_array[7].clk  ),
           .tx_er_9                    (gmii_tx_if_array[7].tx_er),
           .tx_en_9                    (gmii_tx_if_array[7].tx_en),
           .txd_9                      (gmii_tx_if_array[7].txd  ),
		   .rx_clk_10                  (gmii_rx_if_array[8].clk  ),
           .rx_er_10                   (gmii_rx_if_array[8].rx_er),
           .rx_dv_10                   (gmii_rx_if_array[8].rx_dv),
           .rxd_10                     (gmii_rx_if_array[8].rxd  ),
           .gtx_clk_10                 (gmii_tx_if_array[8].clk  ),
           .tx_er_10                   (gmii_tx_if_array[8].tx_er),
           .tx_en_10                   (gmii_tx_if_array[8].tx_en),
           .txd_10                     (gmii_tx_if_array[8].txd  ),
           .rx_clk_11                  (gmii_rx_if_array[9].clk   ),
           .rx_er_11                   (gmii_rx_if_array[9].rx_er ),
           .rx_dv_11                   (gmii_rx_if_array[9].rx_dv ),
           .rxd_11                     (gmii_rx_if_array[9].rxd   ),
           .gtx_clk_11                 (gmii_tx_if_array[9].clk   ),
           .tx_er_11                   (gmii_tx_if_array[9].tx_er ),
           .tx_en_11                   (gmii_tx_if_array[9].tx_en ),
           .txd_11                     (gmii_tx_if_array[9].txd   ),
           .rx_clk_12                  (gmii_rx_if_array[10].clk  ),
           .rx_er_12                   (gmii_rx_if_array[10].rx_er),
           .rx_dv_12                   (gmii_rx_if_array[10].rx_dv),
           .rxd_12                     (gmii_rx_if_array[10].rxd  ),
           .gtx_clk_12                 (gmii_tx_if_array[10].clk  ),
           .tx_er_12                   (gmii_tx_if_array[10].tx_er),
           .tx_en_12                   (gmii_tx_if_array[10].tx_en),
           .txd_12                     (gmii_tx_if_array[10].txd  ),
           .rx_clk_13                  (gmii_rx_if_array[11].clk   ),
           .rx_er_13                   (gmii_rx_if_array[11].rx_er ),
           .rx_dv_13                   (gmii_rx_if_array[11].rx_dv ),
           .rxd_13                     (gmii_rx_if_array[11].rxd   ),
           .gtx_clk_13                 (gmii_tx_if_array[11].clk   ),
           .tx_er_13                   (gmii_tx_if_array[11].tx_er ),
           .tx_en_13                   (gmii_tx_if_array[11].tx_en ),
           .txd_13                     (gmii_tx_if_array[11].txd   ),
           .rx_clk_14                  (gmii_rx_if_array[12].clk   ),
           .rx_er_14                   (gmii_rx_if_array[12].rx_er ),
           .rx_dv_14                   (gmii_rx_if_array[12].rx_dv ),
           .rxd_14                     (gmii_rx_if_array[12].rxd   ),
           .gtx_clk_14                 (gmii_tx_if_array[12].clk   ),
           .tx_er_14                   (gmii_tx_if_array[12].tx_er ),
           .tx_en_14                   (gmii_tx_if_array[12].tx_en ),
           .txd_14                     (gmii_tx_if_array[12].txd   ),
           .rx_clk_15                  (gmii_rx_if_array[13].clk   ),
           .rx_er_15                   (gmii_rx_if_array[13].rx_er ),
           .rx_dv_15                   (gmii_rx_if_array[13].rx_dv ),
           .rxd_15                     (gmii_rx_if_array[13].rxd   ),
           .gtx_clk_15                 (gmii_tx_if_array[13].clk   ),
           .tx_er_15                   (gmii_tx_if_array[13].tx_er ),
           .tx_en_15                   (gmii_tx_if_array[13].tx_en ),
           .txd_15                     (gmii_tx_if_array[13].txd   ),
           .rx_clk_16                  (gmii_rx_if_array[14].clk   ),
           .rx_er_16                   (gmii_rx_if_array[14].rx_er ),
           .rx_dv_16                   (gmii_rx_if_array[14].rx_dv ),
           .rxd_16                     (gmii_rx_if_array[14].rxd   ),
           .gtx_clk_16                 (gmii_tx_if_array[14].clk   ),
           .tx_er_16                   (gmii_tx_if_array[14].tx_er ),
           .tx_en_16                   (gmii_tx_if_array[14].tx_en ),
           .txd_16                     (gmii_tx_if_array[14].txd   ),
           .rx_clk_17                  (gmii_rx_if_array[15].clk   ),
           .rx_er_17                   (gmii_rx_if_array[15].rx_er ),
           .rx_dv_17                   (gmii_rx_if_array[15].rx_dv ),
           .rxd_17                     (gmii_rx_if_array[15].rxd   ),
           .gtx_clk_17                 (gmii_tx_if_array[15].clk   ),
           .tx_er_17                   (gmii_tx_if_array[15].tx_er ),
           .tx_en_17                   (gmii_tx_if_array[15].tx_en ),
           .txd_17                     (gmii_tx_if_array[15].txd   ),
           .rx_clk_30                  (gmii_rx_if_array[16].clk  ),
           .rx_er_30                   (gmii_rx_if_array[16].rx_er),
           .rx_dv_30                   (gmii_rx_if_array[16].rx_dv),
           .rxd_30                     (gmii_rx_if_array[16].rxd  ),
           .gtx_clk_30                 (gmii_tx_if_array[16].clk  ),
           .tx_er_30                   (gmii_tx_if_array[16].tx_er),
           .tx_en_30                   (gmii_tx_if_array[16].tx_en),
           .txd_30                     (gmii_tx_if_array[16].txd  ),
           .cpu_cs_b                   (~(m_cpu_if.cpu_cs   && (~m_cpu_if.cpu_addr[31]))),
           .cpu_rd_b                   (~m_cpu_if.cpu_rd                     ),
           .cpu_wr_b                   (~m_cpu_if.cpu_wr                     ),
           .cpu_addr                   (m_cpu_if.cpu_addr               [15:0]),
           .cpu_data_in                (m_cpu_if.cpu_data_in            [15:0]),
           .cpu_data_out               (dut_cpu_data_out_0                    )//(m_cpu_if.cpu_data_out           [15:0])
           
           //.timestamp_ptp              (timestamp_ptp          [63:0]),
           //.timestamp_tc               (timestamp_tc           [63:0]),
           //.mact_age_counter_pulse     (mact_age_counter_pulse       ),
           //.policer_timer_pulse        (policer_timer_pulse          ),
           //.frer_age_counter_pulse     (frer_age_counter_pulse       )
    );      
  `ifdef DUAL_DUT	
  initial
    begin
	    //pcs_tb_top.SUB_UUT.sys_reset = dut_if0.sys_reset ;
	end
	
  tsn_sw_chip_top SUB_UUT
           (
           .sys_reset             (sub_rst       ), 	
           .syc_clk_250m          (clk_125m      ),//(clk_250m      ),
           .clk_cpu                    (clk_100m                     ),
           .rx_clk_0                   (xgmii64_rx_if_array[0].clk),
           .rx_mii_d_0                 (0),
           .rx_mii_c_0                 (0),
           .tx_clk_0                   (xgmii64_tx_if_array[0].clk),
           .tx_mii_d_0                 ( ),
           .tx_mii_c_0                 ( ),
           .rx_clk_1                   (xgmii64_rx_if_array[1].clk),
           .rx_mii_d_1                 (0),
           .rx_mii_c_1                 (0),
           .tx_clk_1                   (xgmii64_tx_if_array[1].clk),
           .tx_mii_d_1                 ( ),
           .tx_mii_c_1                 ( ),
           .rx_clk_2                   (gmii_rx_if_array[0].clk  ),
           .rx_er_2                    (0),
           .rx_dv_2                    (0),
           .rxd_2                      (0),
           .gtx_clk_2                  (gmii_tx_if_array[0].clk  ),
           .tx_er_2                    ( ),
           .tx_en_2                    ( ),
           .txd_2                      ( ),
           .rx_clk_3                   (gmii_rx_if_array[1].clk  ),
           .rx_er_3                    (0),
           .rx_dv_3                    (0),
           .rxd_3                      (0),
           .gtx_clk_3                  (gmii_tx_if_array[1].clk  ),
           .tx_er_3                    (),
           .tx_en_3                    (),
           .txd_3                      (),
           .rx_clk_4                   (gmii_rx_if_array[2].clk  ),
           .rx_er_4                    (0),
           .rx_dv_4                    (0),
           .rxd_4                      (0),
           .gtx_clk_4                  (gmii_tx_if_array[2].clk  ),
           .tx_er_4                    (),
           .tx_en_4                    (),
           .txd_4                      (),
           .rx_clk_5                   (gmii_rx_if_array[3].clk  ),
           .rx_er_5                    (0),
           .rx_dv_5                    (0),
           .rxd_5                      (0),
           .gtx_clk_5                  (gmii_tx_if_array[3].clk  ),
           .tx_er_5                    (),
           .tx_en_5                    (),
           .txd_5                      (),
           .rx_clk_6                   (gmii_ptp_rx_if.clk       ),   //receive ptp packet from master node
           .rx_er_6                    (gmii_ptp_rx_if.rx_er     ),
           .rx_dv_6                    (gmii_ptp_rx_if.rx_dv     ),
           .rxd_6                      (gmii_ptp_rx_if.rxd       ),
           .gtx_clk_6                  (gmii_ptp_tx_if.clk       ),
           .tx_er_6                    (gmii_ptp_tx_if.tx_er     ),
           .tx_en_6                    (gmii_ptp_tx_if.tx_en     ),
           .txd_6                      (gmii_ptp_tx_if.txd       ),
           .rx_clk_7                   (gmii_rx_if_array[5].clk  ),
           .rx_er_7                    (0),
           .rx_dv_7                    (0),
           .rxd_7                      (0),
           .gtx_clk_7                  (gmii_tx_if_array[5].clk  ),
           .tx_er_7                    (),
           .tx_en_7                    (),
           .txd_7                      (),
           .rx_clk_8                   (gmii_rx_if_array[6].clk  ),
           .rx_er_8                    (0),
           .rx_dv_8                    (0),
           .rxd_8                      (0),
           .gtx_clk_8                  (gmii_tx_if_array[6].clk  ),
           .tx_er_8                    (),
           .tx_en_8                    (),
           .txd_8                      (),
           .rx_clk_9                   (gmii_rx_if_array[7].clk  ),
           .rx_er_9                    (0),
           .rx_dv_9                    (0),
           .rxd_9                      (0),
           .gtx_clk_9                  (gmii_tx_if_array[7].clk  ),
           .tx_er_9                    (),
           .tx_en_9                    (),
           .txd_9                      (),
		   .rx_clk_10                  (gmii_rx_if_array[8].clk  ),
           .rx_er_10                   (0),
           .rx_dv_10                   (0),
           .rxd_10                     (0),
           .gtx_clk_10                 (gmii_tx_if_array[8].clk  ),
           .tx_er_10                   (),
           .tx_en_10                   (),
           .txd_10                     (),
           .rx_clk_11                  (gmii_rx_if_array[9].clk   ),
           .rx_er_11                   (0),
           .rx_dv_11                   (0),
           .rxd_11                     (0),
           .gtx_clk_11                 (gmii_tx_if_array[9].clk   ),
           .tx_er_11                   (),
           .tx_en_11                   (),
           .txd_11                     (),
           .rx_clk_12                  (gmii_rx_if_array[10].clk  ),
           .rx_er_12                   (0),
           .rx_dv_12                   (0),
           .rxd_12                     (0),
           .gtx_clk_12                 (gmii_tx_if_array[10].clk  ),
           .tx_er_12                   (),
           .tx_en_12                   (),
           .txd_12                     (),
           .rx_clk_13                  (gmii_rx_if_array[11].clk   ),
           .rx_er_13                   (0),
           .rx_dv_13                   (0),
           .rxd_13                     (0),
           .gtx_clk_13                 (gmii_tx_if_array[11].clk   ),
           .tx_er_13                   (),
           .tx_en_13                   (),
           .txd_13                     (),
           .rx_clk_14                  (gmii_rx_if_array[12].clk   ),
           .rx_er_14                   (0),
           .rx_dv_14                   (0),
           .rxd_14                     (0),
           .gtx_clk_14                 (gmii_tx_if_array[12].clk   ),
           .tx_er_14                   (),
           .tx_en_14                   (),
           .txd_14                     (),
           .rx_clk_15                  (gmii_rx_if_array[13].clk   ),
           .rx_er_15                   (0),
           .rx_dv_15                   (0),
           .rxd_15                     (0),
           .gtx_clk_15                 (gmii_tx_if_array[13].clk   ),
           .tx_er_15                   (),
           .tx_en_15                   (),
           .txd_15                     (),
           .rx_clk_16                  (gmii_rx_if_array[14].clk   ),
           .rx_er_16                   (0),
           .rx_dv_16                   (0),
           .rxd_16                     (0),
           .gtx_clk_16                 (gmii_tx_if_array[14].clk   ),
           .tx_er_16                   (),
           .tx_en_16                   (),
           .txd_16                     (),
           .rx_clk_17                  (gmii_rx_if_array[15].clk   ),
           .rx_er_17                   (0),
           .rx_dv_17                   (0),
           .rxd_17                     (0),
           .gtx_clk_17                 (gmii_tx_if_array[15].clk   ),
           .tx_er_17                   (),
           .tx_en_17                   (),
           .txd_17                     (),
           .rx_clk_30                  (gmii_rx_if_array[16].clk  ),
           .rx_er_30                   (0),
           .rx_dv_30                   (0),
           .rxd_30                     (0),
           .gtx_clk_30                 (gmii_tx_if_array[16].clk  ),
           .tx_er_30                   (),
           .tx_en_30                   (),
           .txd_30                     (),
           .cpu_cs_b                   (~(m_cpu_if.cpu_cs  &&     m_cpu_if.cpu_addr[31])),
           .cpu_rd_b                   (~m_cpu_if.cpu_rd                     ),
           .cpu_wr_b                   (~m_cpu_if.cpu_wr                     ),
           .cpu_addr                   (m_cpu_if.cpu_addr               [15:0]),
           .cpu_data_in                (m_cpu_if.cpu_data_in            [15:0]),
           .cpu_data_out               (dut_cpu_data_out_1                    )
           
           //.timestamp_ptp              (timestamp_ptp          [63:0]),
           //.timestamp_tc               (timestamp_tc           [63:0]),
           //.mact_age_counter_pulse     (mact_age_counter_pulse       ),
           //.policer_timer_pulse        (policer_timer_pulse          ),
           //.frer_age_counter_pulse     (frer_age_counter_pulse       )
    );  
    `else    
	`endif
`endif
//------------DUT connect begin---------------------//



ge_mac   ge_mac0
(
 //global signals
 .reset_b(~gmii_rx_if0.reset),
 // ref_clk,
 .rx_clk(gmii_rx_if0.clk),
 .tx_clk(gmii_rx_if0.clk),
 //interface signals with the GTP_CORE.v
 .gmii_txd  (),             // Transmit data from client MAC.
 .gmii_tx_en(),           // Transmit control signal from client MAC.
 .gmii_tx_er(),           // Transmit control signal from client MAC.
 .gmii_rxd  (gmii_rx_if0.rxd),             // Received Data to client MAC.
 .gmii_rx_dv(gmii_rx_if0.rx_dv),           // Received control signal to client MAC.
 .gmii_rx_er(1'b0),           // Received control signal to client MAC.
 //interface signals with the mac_frm_buf.v
 .rx_sop(),
 .rx_eop(),
 //rx_frm_err,
 .rx_valid(),
 .rx_data (),
 .rx_good_frm_ind(),
 .rx_bad_frm_ind (),
 //rx_frm_len_ind,
 // rx_frm_length,
 .rx_crc_err     (),
 .rx_len_nc_ind  (),
 .rx_ssf_ind     (),
 .rx_slf_ind     (),
 .tx_pkt_type    (),
 
 .tx_ack    (),
 .tx_frm_err(),
 .tx_req    (),
 .tx_frm_data (),
 .tx_pld_valid(),
 .tx_data_sof (),
 //interface signals with ge_mac_mcu.v
 .mac_rx_frm_ind    (),
 .mac_rx_frm_err_ind(),
 .mac_tx_frm_ind    (),
 .mac_tx_frm_err_ind()
);

//=================== assert =========================//

// initial
  // begin
  	// force pcs_tb_top.dcn_top.dcn_tx_top.packet_classify.new_crc_out_latch[31:0] = 32'h0; //force crc err
  // end

endmodule
