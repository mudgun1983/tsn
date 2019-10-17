
`timescale 1ns/1ps
   

   
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
parameter CLOCK_156M = 6.4;
parameter CLOCK_125M = 8;
parameter CLOCK_322M = 3.104;
parameter CLOCK_312M = 3.201;//CLOCK_322M*(66/64);
parameter CLOCK_161M = CLOCK_322M*2;  
parameter CLOCK_200M = 5.0;
parameter CLOCK_50M  = 20;
parameter CLOCK_25M  = 40;
parameter RESET_START_TIME = 100;
parameter RESET_HOLD_TIEM = 500;
parameter CLOCK_1us = 1000;

parameter SELF_DEFINE_PACKET= 0;
parameter OAM_PACKET        = 1;
parameter PROTOCOL_PACKET   = 2;
parameter DSP_PACKET        = 3;
parameter GMII_PORT_NUM     = 20;
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
reg clk_100m;
reg clk_50m;
reg clk_25m;
reg reset_b;
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


pcs_xilinx_serdes_if       cgmii_rx_block_if(); 
pcs_xilinx_serdes_vif      cgmii_rx_block_vif;
pcs_xilinx_serdes_if       cgmii_tx_block_if(); 
pcs_xilinx_serdes_vif      cgmii_tx_block_vif;

gmii_rx_if gmii_rx_if0();
gmii_rx_if gmii_rx_if_array[GMII_PORT_NUM]();
gmii_tx_if gmii_tx_if0();
gmii_tx_if gmii_tx_if_array[GMII_PORT_NUM]();
gmii_rx_vif gmii_rx_vif0;
gmii_tx_vif gmii_tx_vif0;

xgmii64_rx_if xgmii64_rx_if_array[XGMII_PORT_NUM]();
xgmii64_rx_vif xgmii64_rx_vif0;
xgmii64_tx_if xgmii64_tx_if_array[XGMII_PORT_NUM]();
xgmii64_tx_vif xgmii64_tx_vif0;
//------------interface--------------------------//

//------------cpu if-----------------------------//
  reg                         sys_rst      ;
  reg                         cpu_clk      ; 
  cpu_if                      m_cpu_if(cpu_clk,~sys_rst); 
  initial begin
      uvm_config_db#(virtual cpu_if)::set(null,"*rx_env0.cpu_agent0*","vif",m_cpu_if);
  end  

  initial begin   	
             cpu_clk   = 1'b1;           
             sys_rst   = 1'b0; 
      #50ns  sys_rst   = 1'b1;  
      #100ns sys_rst   = 1'b0; 
           
  end

  always
       begin
           #8ns cpu_clk = ~cpu_clk;//62.5M
       end
//------------cpu if-----------------------------//

//------------ set interface class --------
    initial begin 
        cgmii_rx_block_vif = new(cgmii_rx_block_if);
        cgmii_tx_block_vif = new(cgmii_tx_block_if);
        set_config_object("*pcs_rx_env0*","vif",cgmii_rx_block_vif,0);
      
        
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
  	clk_322m    =1'b0;
  	clk_312m    =1'b0;
  	clk_161m    =1'b0;
  	reset_b     =1'b1;
  end

initial
   begin
   	#RESET_START_TIME;
   	  reset_b=1'b0;
   	#RESET_HOLD_TIEM;
   	  reset_b=1'b1;
   end  

always #(CLOCK_156M/2)
   clk_156m<=~clk_156m; 
   
always #(CLOCK_125M/2)
   clk_125m<=~clk_125m; 

always #(CLOCK_200M/2)
   clk_200m<=~clk_200m; 
   
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

//------------generate CLOCK_156M and reset end --------//


//--------- interface begin-----------//
initial
  begin
  	cgmii_rx_block_if.clk=1;
  	cgmii_rx_block_if.reset=0;
  	#10ns;
  	cgmii_rx_block_if.reset=1;
  	#50ns;
  	cgmii_rx_block_if.reset=0;
  	

  end     

always #(CLOCK_322M/2)  
  cgmii_rx_block_if.clk <= ~cgmii_rx_block_if.clk;
  
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
  	#10ns;
  	gmii_tx_if0.reset=1;
  	#50ns;
  	gmii_tx_if0.reset=0;
  end
  
always #(CLOCK_125M/2)  
  gmii_rx_if0.clk <= ~gmii_rx_if0.clk;

always #(CLOCK_125M/2)                
  gmii_tx_if0.clk <= ~gmii_tx_if0.clk;

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

// initial
// begin
  // $fsdbDumpfile("filename_you_want.fsdb");
  // $fsdbDumpvars;
// end
initial begin
$vcdpluson;
end   
//------------DUT connect begin---------------------//
/*
dcn_top dcn_top (   
    .reset         (gmii_rx_if0.reset), 
    .sys_clk_125   (gmii_rx_if0.clk),
    .shim_tx_clk   (clk_312m),
    .shim0_rx_clk  (clk_322m),
    .shim1_rx_clk  (clk_322m),
    //from_to IP
    .err_i   (1'b0),
    .valid_i (gmii_rx_if0.rx_dv),
    .data_i  (gmii_rx_if0.rxd),
    .err_o    (),
    .valid_o  (gmii_tx_if0.tx_en),
    .data_o   (gmii_tx_if0.txd),
    //from_to shim
    .mana_sect_shim0_dat0_ien_i(mana_sect_shim0_dat0_ien_i),
    .mana_sect_shim0_dat1_ien_i(mana_sect_shim0_dat0_ien_i),   
    .mana_sect_shim0_dat_o     (mana_sect_shim0_dat_o    ),
    .mana_sect_shim0_dat_vld_o (mana_sect_shim0_dat_vld_o),
    
    .mana_sect_shim1_dat0_ien_i(mana_sect_shim1_dat0_ien_i),
    .mana_sect_shim1_dat1_ien_i(mana_sect_shim1_dat0_ien_i),   
    .mana_sect_shim1_dat_o     (mana_sect_shim1_dat_o),
    .mana_sect_shim1_dat_vld_o (mana_sect_shim1_dat_vld_o), 
    
    .mana_sect_shim0_dat0_i     (mana_sect_shim0_dat_o),
    .mana_sect_shim0_dat1_i     (66'b0),
    .mana_sect_shim0_dat0_vld_i (mana_sect_shim0_dat_vld_o),
    .mana_sect_shim0_dat1_vld_i (1'b0),
    .mana_sect_shim1_dat0_i     (66'b0),
    .mana_sect_shim1_dat1_i     (mana_sect_shim1_dat_o),
    .mana_sect_shim1_dat0_vld_i (1'b0),
    .mana_sect_shim1_dat1_vld_i  (mana_sect_shim1_dat_vld_o), 
    
    //cpureset   
    .cpu_clk (cpu_clk),
    .cpu_rst (sys_rst),
    .cpu_addr(m_cpu_if.cpu_addr[11:0]),    
    .cpu_cs  (m_cpu_if.cpu_cs),
    .cpu_rd  (m_cpu_if.cpu_rd),
    .cpu_wr  (m_cpu_if.cpu_wr),
    .cpu_din (m_cpu_if.cpu_data_in),
    .cpu_dout(m_cpu_if.cpu_data_out)

    );

//------------DUT connect end  ---------------------//

*/

assign    gmii_tx_if0.tx_en =gmii_rx_if0.rx_dv;
assign    gmii_tx_if0.txd   =gmii_rx_if0.rxd  ; 

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
