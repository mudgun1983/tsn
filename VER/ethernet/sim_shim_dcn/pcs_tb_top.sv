//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       pcs_tb_top.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Wang Guobing
// AUTHOR'S EMAIL:  wang.guobing@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.0         2016-4-25    wang guobing   
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: oam protocal  mac_dsp packet
//-----------------------------------------------------------------------------------------------------
// PURPOSE: 
//--------------------------------------------------------------------------------------------------
// PARAMETERS
//         PARAM  NAME    RANGE    : DESCRIPTION    :DEFAULT   :UNITS

//-----------------------------------------------------------------------------------------------------
//REUSE ISSUES
// Reset Strategy:  N/A
// Clock  Domains:  N/A
// Critical Timing: N/A
// Test   Features: N/A
// Asynchronous I/F:N/A
// Scan Methodology:N/A
// Instaniations:   N/A
// Synthesizable:   N/A
// Other:   
// END_HEADER---------------------------------------------------------------------------------------------

`timescale 1ns/1ps
                
module pcs_tb_top;

import uvm_pkg::*;
  `include "uvm_macros.svh"
  
import pcs_env_pkg::*; 

`include "gmii_rx_vif.sv"
`include "gmii_tx_vif.sv"
`include "xgmii64_rx_vif.sv"
`include "xgmii64_tx_vif.sv"

`define shim_loop
//`define loop_self_test
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
parameter PHY_NUM =2;
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


//-------------inner signal end------------------//

//------------interface--------------------------//


pcs_xilinx_serdes_if       cgmii_rx_block_if(); 
pcs_xilinx_serdes_vif      cgmii_rx_block_vif;
pcs_xilinx_serdes_if       cgmii_tx_block_if(); 
pcs_xilinx_serdes_vif      cgmii_tx_block_vif;

gmii_rx_if gmii_rx_if0();
gmii_tx_if gmii_tx_if0();
gmii_rx_vif gmii_rx_vif0;
gmii_tx_vif gmii_tx_vif0;

xgmii64_rx_if xgmii64_rx_if();
xgmii64_rx_vif xgmii64_rx_vif0;
xgmii64_tx_if xgmii64_tx_if();
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
        //set_config_object("*mac_rx_agent0*","m_gmii_rx_vif",gmii_rx_vif0,0);
        //set_config_object("*","vif",gmii_rx_vif0,0);
        uvm_config_db#(virtual gmii_rx_if)::set(null,"*mac_rx_agent0*","m_gmii_rx_if",gmii_rx_if0);
        
        gmii_tx_vif0 = new(gmii_tx_if0); 
        //set_config_object("*mac_tx_agent0*","m_gmii_tx_vif",gmii_tx_vif0,0);
        uvm_config_db#(virtual gmii_tx_if)::set(null,"*mac_tx_agent0*","m_gmii_tx_if",gmii_tx_if0);
        
        xgmii64_rx_vif0 = new(xgmii64_rx_if); 
        set_config_object("*mac_rx_agent0*","m_xgmii64_rx_vif",xgmii64_rx_vif0,0);
        xgmii64_tx_vif0 = new(xgmii64_tx_if);                                     
        set_config_object("*mac_tx_agent0*","m_xgmii64_tx_vif",xgmii64_tx_vif0,0);

        //set_config_object("*","vif",cgmii_tx_block_vif,0);               
    end  
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


logic    mana_sect_shim0_dat0_ien_i;
logic    mana_sect_shim0_dat1_ien_i;

logic    mana_sect_shim1_dat0_ien_i;
logic    mana_sect_shim1_dat1_ien_i;  

logic [65:0]mana_sect_shim0_dat_o    ;
logic       mana_sect_shim0_dat_vld_o;

logic [65:0]mana_sect_shim1_dat_o    ;
logic       mana_sect_shim1_dat_vld_o;

logic [65:0]shim0_dat0_i    ;   
logic [65:0]shim0_dat1_i    ;   
logic       shim0_dat0_vld_i;
logic       shim0_dat1_vld_i;
logic [65:0]shim1_dat0_i    ;
logic [65:0]shim1_dat1_i    ;
logic       shim1_dat0_vld_i;
logic       shim1_dat1_vld_i;


initial
  begin
  	mana_sect_shim0_dat0_ien_i=1;
  	mana_sect_shim0_dat1_ien_i=1;
  	mana_sect_shim1_dat0_ien_i=1;
    mana_sect_shim1_dat1_ien_i=1;

//  	#5us;
//  	mana_sect_shim0_dat0_ien_i=1;
//  	mana_sect_shim1_dat0_ien_i=1;
//  	#10ns;
//  	mana_sect_shim1_dat0_ien_i=1;
//  	mana_sect_shim1_dat0_ien_i=0;
  end   

always #(CLOCK_1us/2)
   begin
   	mana_sect_shim0_dat0_ien_i<=0;
    #100ns;
    mana_sect_shim0_dat0_ien_i<=1;
   end

always #(CLOCK_1us/2)
   begin
   	#60ns
   	mana_sect_shim0_dat1_ien_i<=0;
    #40ns;
    mana_sect_shim0_dat1_ien_i<=1;
   end 

always #(CLOCK_1us/2)
   begin
   	mana_sect_shim1_dat0_ien_i<=0;
    #100ns;
    mana_sect_shim1_dat0_ien_i<=1;
   end
      
always #(CLOCK_1us/2)
   begin
   	#60ns
   	mana_sect_shim1_dat1_ien_i<=0;
    #40ns;
    mana_sect_shim1_dat1_ien_i<=1;
   end   	
//--------- interface end  -----------//


//------------wave store begin-----------------------//
initial
   begin
              $fsdbAutoSwitchDumpfile(500, {"sim.fsdb"},4);
              $fsdbDumpvarsToFile("dump.list");
   end
//------------wave store end------------------------//  

//=======================TEST START======================  
    initial begin
        run_test();
    end

   
//------------DUT connect begin---------------------//
wire shim0_dat0_ien_i;
wire shim0_dat1_ien_i;

wire shim1_dat0_ien_i;
wire shim1_dat1_ien_i;

wire      valid_o;
wire [7:0]data_o ;


dcn_top dcn_top (   
    .reset         (gmii_rx_if0.reset), 
    .sys_clk_125   (gmii_rx_if0.clk),
    .shim_tx_clk   (clk_312m),
    .shim0_rx_clk  (clk_322m),
    .shim1_rx_clk  (clk_322m),
    //from_to IP
    .err_i   (1'b0),
    .valid_i  (gmii_rx_if0.rx_dv),//(valid_o),//(gmii_rx_if0.rx_dv),
    .data_i   (gmii_rx_if0.rxd),  //(data_o ),//(gmii_rx_if0.rxd),
    .err_o    (),                   //(),//(),
    .valid_o  (gmii_tx_if0.tx_en),//(valid_o),//(gmii_tx_if0.tx_en),
    .data_o   (gmii_tx_if0.txd),  //(data_o ),//(gmii_tx_if0.txd),
    //from_to shim
    `ifdef loop_self_test
    .mana_sect_shim0_dat0_ien_i(mana_sect_shim0_dat0_ien_i),//(1'b1),//(mana_sect_shim0_dat0_ien_i),
    .mana_sect_shim0_dat1_ien_i(mana_sect_shim0_dat1_ien_i),//(1'b1),//(mana_sect_shim0_dat1_ien_i),   
    `else
    .mana_sect_shim0_dat0_ien_i(shim0_dat0_ien_i),
    .mana_sect_shim0_dat1_ien_i(shim0_dat1_ien_i),
    `endif
    
    .mana_sect_shim0_dat_o     (mana_sect_shim0_dat_o    ),
    .mana_sect_shim0_dat_vld_o (mana_sect_shim0_dat_vld_o),
    .mana_sect_shim0_sect_data_0_1_ind(mana_sect_shim0_sect_data_0_1_ind),
    
    `ifdef loop_self_test
    .mana_sect_shim1_dat0_ien_i(mana_sect_shim1_dat0_ien_i),
    .mana_sect_shim1_dat1_ien_i(mana_sect_shim1_dat1_ien_i),   
    `else
    .mana_sect_shim1_dat0_ien_i(shim1_dat0_ien_i),
    .mana_sect_shim1_dat1_ien_i(shim1_dat1_ien_i), 
    `endif
    
    .mana_sect_shim1_dat_o     (mana_sect_shim1_dat_o),
    .mana_sect_shim1_dat_vld_o (mana_sect_shim1_dat_vld_o), 
    .mana_sect_shim1_sect_data_0_1_ind(mana_sect_shim1_sect_data_0_1_ind),
    
    `ifdef loop_self_test
    .mana_sect_shim0_dat0_i     (mana_sect_shim0_dat_o),
    .mana_sect_shim0_dat1_i     (66'b0),
    .mana_sect_shim0_dat0_vld_i (mana_sect_shim0_dat_vld_o),
    .mana_sect_shim0_dat1_vld_i (1'b0),
    .mana_sect_shim1_dat0_i     (66'b0),
    .mana_sect_shim1_dat1_i     (mana_sect_shim1_dat_o),
    .mana_sect_shim1_dat0_vld_i (1'b0),
    .mana_sect_shim1_dat1_vld_i  (mana_sect_shim1_dat_vld_o), 
    `else
    .mana_sect_shim0_dat0_i      (shim0_dat0_i     ),
    .mana_sect_shim0_dat1_i      (shim0_dat1_i     ),
    .mana_sect_shim0_dat0_vld_i  (shim0_dat0_vld_i ),
    .mana_sect_shim0_dat1_vld_i  (shim0_dat1_vld_i ),
    .mana_sect_shim1_dat0_i      (shim1_dat0_i     ),
    .mana_sect_shim1_dat1_i      (shim1_dat1_i     ),
    .mana_sect_shim1_dat0_vld_i  (shim1_dat0_vld_i ),
    .mana_sect_shim1_dat1_vld_i  (shim1_dat1_vld_i ), 
    `endif
    
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

//signal
wire [5*PHY_NUM-1:0]   mana_txd_en_o;
wire [330*PHY_NUM-1:0] mana_txd_i   ;
wire [  5*PHY_NUM-1:0] mana_tx_dv_i ;
wire [330*PHY_NUM-1:0] mana_rxd_o   ;
wire [  5*PHY_NUM-1:0] mana_rx_dv_o ;

//=================== shim ===================//
shim_top #(.PHY_NUM(PHY_NUM),
           .VCP_NUM(1),
           .VEP_NUM(1))
shim_top
(
        .reset_in_clk_312m         (gmii_rx_if0.reset),
        .clk_312m                  (clk_312m),

        .reset_in_cpu_clk          (gmii_rx_if0.reset),
//        input  wire                   cpu_clk                   ,
//        input  wire                   cpu_we                    ,
//        input  wire                   cpu_cs                    ,
//        input  wire [           21:0] cpu_addr                  ,
//        input  wire [           15:0] cpu_din                   ,
//        output wire [           15:0] cpu_dout                  ,

//        output wire [  5*PHY_NUM
//                        *VCP_NUM-1:0] vcp_blk_bitmap_array_o    (),
        .vcp_txd_i                 ({320'h0,320'h0}),
        .vcp_txc_i                 ({20'h0 ,20'h0 }),
                                                                
//        output wire [  5*PHY_NUM                                
//                        *VEP_NUM-1:0] vep_blk_bitmap_array_o    (),
        .vep_txd_i                 ({320'h0,320'h0}),
        .vep_txc_i                 ({20'h0 ,20'h0 }),
                                                                
        .bg_tc_tx_en_i             ({1'b0,1'b0}),
        .bg_tc_tx_mode_i           ({1'b0,1'b0}),
        //output wire [  3*PHY_NUM-1:0] bg_tc_tx_blk_no_o         (),
        .bg_tc_tx_data_i           ({275'h0,275'h0}),
                                                                
//        output wire [330*PHY_NUM-1:0] tx_data_66b_o             (),
//        output wire [  1*PHY_NUM-1:0] tx_am_pos_ind_o           (),
                                                                
        .reset_in_cdr_clk_322m     ({gmii_rx_if0.reset,gmii_rx_if0.reset}),
        .cdr_clk_322m              ({clk_322m,clk_322m}),
        .rx_data_66b_i             ({330'h0,330'h0}),
        .rx_data_66b_vld_i         ({1'b1,1'b1}),
//        output wire [  6*PHY_NUM-1:0] oh_err_ind_o              (),
        .pcs_link                  ({1'b1,1'b1}),
        .phy_lf_i                  ({1'b0,1'b0}),
        .flexe_lf_o                ({1'b0,1'b0}),
        
        .mana_txd_i    (mana_txd_i   ),//input  wire [330*PHY_NUM-1:0] mana_txd_i                ,
        .mana_tx_dv_i  (mana_tx_dv_i ),//input  wire [  5*PHY_NUM-1:0] mana_tx_dv_i              ,
        .mana_txd_en_o (mana_txd_en_o),//output wire [  5*PHY_NUM-1:0] mana_txd_en_o             ,
        .mana_tx_done_o(),//output wire [  5*PHY_NUM-1:0] mana_tx_done_o            ,
        .mana_rxd_o  (mana_rxd_o  ),//output wire [330*PHY_NUM-1:0] mana_rxd_o                ,
        .mana_rx_dv_o(mana_rx_dv_o)//output wire [  5*PHY_NUM-1:0] mana_rx_dv_o              ,
                                                       
//        output wire [  5*PHY_NUM-1:0] bg_tc_rx_dv_o             (),
//                                                                
//        output wire [  3*PHY_NUM                                
//                        *CRS_NUM-1:0] crs_rx_vld_blk_no_array_o (),
//        output wire [320*PHY_NUM                                
//                        *CRS_NUM-1:0] crs_rxd_array_o           (),
//        output wire [ 20*PHY_NUM                                
//                        *CRS_NUM-1:0] crs_rxc_array_o           (),
//        output wire [  5*PHY_NUM                                ()
//                        *CRS_NUM-1:0] crs_rx_idle_bitmap_array_o(),
                                                                
//        input  wire [  1*PHY_NUM-1:0] crs_rst                   (),
//        input  wire [  1*PHY_NUM-1:0] crs_clk                   (),
//        input  wire [  3*PHY_NUM                                
//                        *CRS_NUM-1:0] crs_tx_vld_blk_no_array_i (),
//        input  wire [320*PHY_NUM                                
//                        *CRS_NUM-1:0] crs_txd_array_i           (),
//        input  wire [ 20*PHY_NUM                                
//                        *CRS_NUM-1:0] crs_txc_array_i           (),
//        input  wire [  5*PHY_NUM                                
//                        *CRS_NUM-1:0] crs_tx_idle_bitmap_array_i(),
//                                                                
//        output wire [320*PHY_NUM-1:0] rxd_o                     (),
//        output wire [ 20*PHY_NUM-1:0] rxc_o                     (),
//        output wire [  5*PHY_NUM-1:0] rx_idle_bitmap_o          (),
//        output wire [  5*PHY_NUM-1:0] rx_oam_blk_bitmap_o       (),
//        output wire [  5*PHY_NUM                                
//                        *VCP_NUM-1:0] vcp_vld_blk_bitmap_array_o(),
//        output wire [  5*PHY_NUM                                
//                        *VEP_NUM-1:0] vep_vld_blk_bitmap_array_o()
);

initial
  begin
  	force pcs_tb_top.shim_top.ch[0].shim_loopback_i.loopback_en = 1'b1;
  	force pcs_tb_top.shim_top.ch[1].shim_loopback_i.loopback_en = 1'b1; 
  end

`define SHIM pcs_tb_top.shim_top
initial
  begin
  	 //1. for flex overheader generate
      begin
        force `SHIM.flexe_in_pcs_frm_gen_i.flx_oh_ind_pre2 = 0;
        #1us;
        release `SHIM.flexe_in_pcs_frm_gen_i.flx_oh_ind_pre2;
      end
      begin
        force `SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0] = 0;
        force `SHIM.flexe_in_pcs_frm_gen_i.flx_oh_pos_pre1[4:0] = 0;
        #1us;
        //@(negedge `SHIM.ch[0].shim_tx_i.overhead_send_pro_top_u0.cpu_interfac_se_u0.func_reg0[15]);
        release `SHIM.flexe_in_pcs_frm_gen_i.flx_oh_pos_pre1[4:0];
        release `SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0];
      end
      begin
        wait(`SHIM.flexe_in_pcs_frm_gen_i.flx_oh_cnt[2:0]==1);
        force `SHIM.flexe_in_pcs_frm_gen_i.flx_oh_cnt[2:0] = 0;
        #1us;
        release `SHIM.flexe_in_pcs_frm_gen_i.flx_oh_cnt[2:0];
      end
      //2. for speedup OH: X16/X8/X4 
      begin
        while(1) begin 
          case(`SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0]) ///<20460           //---X16------X8--------X4
            15'd100 : force `SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0]=19300+5;//19300+5;//18010+5;//15445+5;
            15'd101 : force `SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0]=19301+5;//19301+5;//18011+5;//15446+5;
            15'd102 : force `SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0]=19302+5;//19302+5;//18012+5;//15447+5;
            15'd103 : force `SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0]=19303+5;//19303+5;//18013+5;//15448+5;
            15'd104 : force `SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0]=19304+5;//19304+5;//18014+5;//15449+5;
          endcase
          @(posedge clk_312m)
          release `SHIM.flexe_in_pcs_frm_gen_i.flx_pos_cnt_pre2[14:0];
        end
      end
  end 

//assign pcs_tb_top.shim_top.ch[0].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat0_vld    =  mana_sect_shim0_dat_vld_o&(~mana_sect_shim0_sect_data_0_1_ind);                                            
//assign pcs_tb_top.shim_top.ch[0].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat0[65:0]  =  mana_sect_shim0_dat_o; 
//assign pcs_tb_top.shim_top.ch[1].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat0_vld    =  mana_sect_shim1_dat_vld_o&(~mana_sect_shim1_sect_data_0_1_ind);                                            
//assign pcs_tb_top.shim_top.ch[1].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat0[65:0]  =  mana_sect_shim1_dat_o; 
//
//assign pcs_tb_top.shim_top.ch[0].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat1_vld    =  mana_sect_shim0_dat_vld_o&mana_sect_shim0_sect_data_0_1_ind;                                            
//assign pcs_tb_top.shim_top.ch[0].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat1[65:0]  =  mana_sect_shim0_dat_o;
//assign pcs_tb_top.shim_top.ch[1].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat1_vld    =  mana_sect_shim1_dat_vld_o&mana_sect_shim1_sect_data_0_1_ind;                                            
//assign pcs_tb_top.shim_top.ch[1].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat1[65:0]  =  mana_sect_shim1_dat_o;
//
//assign shim0_dat0_ien_i    =  pcs_tb_top.shim_top.ch[0].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat0_ien;
//assign shim0_dat1_ien_i    =  pcs_tb_top.shim_top.ch[0].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat1_ien;
//assign shim1_dat0_ien_i    =  pcs_tb_top.shim_top.ch[1].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat0_ien;
//assign shim1_dat1_ien_i    =  pcs_tb_top.shim_top.ch[1].shim_tx_i.overhead_send_pro_top_u0.mana_sect_dat1_ien;
//
//
//assign shim0_dat0_i     = pcs_tb_top.shim_top.ch[0].shim_rx_i.overhead_receive_pro_top_i.oh_info_man_u0.mana_sect_dat0[65:0];
//assign shim0_dat1_i     = pcs_tb_top.shim_top.ch[0].shim_rx_i.overhead_receive_pro_top_i.oh_info_man_u0.mana_sect_dat1[65:0];
//assign shim0_dat0_vld_i = pcs_tb_top.shim_top.ch[0].shim_rx_i.overhead_receive_pro_top_i.oh_info_man_u0.mana_sect_dat0_vld ;
//assign shim0_dat1_vld_i = pcs_tb_top.shim_top.ch[0].shim_rx_i.overhead_receive_pro_top_i.oh_info_man_u0.mana_sect_dat1_vld ;
//assign shim1_dat0_i     = pcs_tb_top.shim_top.ch[1].shim_rx_i.overhead_receive_pro_top_i.oh_info_man_u0.mana_sect_dat0[65:0];
//assign shim1_dat1_i     = pcs_tb_top.shim_top.ch[1].shim_rx_i.overhead_receive_pro_top_i.oh_info_man_u0.mana_sect_dat1[65:0];
//assign shim1_dat0_vld_i = pcs_tb_top.shim_top.ch[1].shim_rx_i.overhead_receive_pro_top_i.oh_info_man_u0.mana_sect_dat0_vld ; 
//assign shim1_dat1_vld_i = pcs_tb_top.shim_top.ch[1].shim_rx_i.overhead_receive_pro_top_i.oh_info_man_u0.mana_sect_dat1_vld ; 

//TO SHIM
//    assign {mana_shim_dat2     ,mana_shim_dat1     ,mana_shim_dat0     ,mana_sect_dat1     ,mana_sect_dat0     } = mana_txd_i    ;
//    assign {mana_shim_dat2_vld ,mana_shim_dat1_vld ,mana_shim_dat0_vld ,mana_sect_dat1_vld ,mana_sect_dat0_vld } = mana_tx_dv_i  ;
//    assign mana_txd_en_o  = {mana_shim_dat2_ien ,mana_shim_dat1_ien ,mana_shim_dat0_ien ,mana_sect_dat1_ien ,mana_sect_dat0_ien };  
//FROM SHIM
//    assign mana_rxd_o   = {mana_shim_dat2    ,mana_shim_dat1    ,mana_shim_dat0    ,mana_sect_dat1    ,mana_sect_dat0    };
//    assign mana_rx_dv_o = {mana_shim_dat2_vld,mana_shim_dat1_vld,mana_shim_dat0_vld,mana_sect_dat1_vld,mana_sect_dat0_vld};


//shim0
    //to shim
assign shim0_dat0_ien_i = mana_txd_en_o[0]          ;
assign shim0_dat1_ien_i = mana_txd_en_o[1]          ;
assign mana_txd_i[65-:66] = mana_sect_shim0_dat_o;
assign mana_txd_i[(1*66+65)-:66] = mana_sect_shim0_dat_o;
assign mana_tx_dv_i[0] = mana_sect_shim0_dat_vld_o&(~mana_sect_shim0_sect_data_0_1_ind);
assign mana_tx_dv_i[1] = mana_sect_shim0_dat_vld_o&(mana_sect_shim0_sect_data_0_1_ind);
    //from shim
assign shim0_dat0_i     = mana_rxd_o[65-:66];
assign shim0_dat0_vld_i = mana_rx_dv_o[0];
assign shim0_dat1_i     = mana_rxd_o[(1*66+65)-:66];
assign shim0_dat1_vld_i = mana_rx_dv_o[1];

//shim1
    //to shim
assign shim1_dat0_ien_i = mana_txd_en_o[5*1+0]          ;
assign shim1_dat1_ien_i = mana_txd_en_o[5*1+1]          ;
assign mana_txd_i[(330*1+65)-:66] = mana_sect_shim1_dat_o;
assign mana_txd_i[(330*1+1*66+65)-:66] = mana_sect_shim1_dat_o;
assign mana_tx_dv_i[5*1+0] = mana_sect_shim1_dat_vld_o&(~mana_sect_shim1_sect_data_0_1_ind);
assign mana_tx_dv_i[5*1+1] = mana_sect_shim1_dat_vld_o&(mana_sect_shim1_sect_data_0_1_ind);
    //from shim
assign shim1_dat0_i     = mana_rxd_o[(330*1+65)-:66];
assign shim1_dat0_vld_i = mana_rx_dv_o[5*1+0];
assign shim1_dat1_i     = mana_rxd_o[(330*1+1*66+65)-:66];
assign shim1_dat1_vld_i = mana_rx_dv_o[5*1+1];

assign mana_tx_dv_i[4:2] = 1'b0;





endmodule
