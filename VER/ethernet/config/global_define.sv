//PHY_PORT_TABLE
//`define DUMMY_DUT

//global define
`define PTP_ETYPE 16'h88F7
`define PTP_NON_PEER_MULTI_DA 48'h01_1b_19_00_00_00
`define PTP_PEER_MULTI_DA     48'h01_80_C2_00_00_0E
`define Sync                   ptp_item::Sync                 //Event  0
`define Delay_Req              ptp_item::Delay_Req            //Event  1
`define Pdelay_Req             ptp_item::Pdelay_Req           //Event  2
`define Pdelay_Resp            ptp_item::Pdelay_Resp          //Event  3
`define Follow_Up              ptp_item::Follow_Up            //General 8
`define Delay_Resp             ptp_item::Delay_Resp           //General 9
`define Pdelay_Resp_Follow_Up  ptp_item::Pdelay_Resp_Follow_Up//General A
`define Announce               ptp_item::Announce             //General B
`define Signaling              ptp_item::Signaling            //General C
`define Management             ptp_item::Management           //General D
			  
typedef struct packed
{
bit        port_en;
int        packet_count;
bit [47:0] da_index;
bit [47:0] sa_index;
} port_stimulus_t;

port_stimulus_t port_stimulus_s[20];


