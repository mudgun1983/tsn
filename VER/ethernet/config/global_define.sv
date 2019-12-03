//PHY_PORT_TABLE
//`define DUMMY_DUT
//`define DUAL_DUT
`define test_result_file "./data/test_result.txt"
`define MAX_PORT_NUM 10
`define MAX_ENV_MAC_NUM 20
//global define
`define PTP_ETYPE 16'h88F7
`define PTP_NON_PEER_MULTI_DA 48'h01_1b_19_00_00_00
`define PTP_PEER_MULTI_DA     48'h01_80_C2_00_00_0E
`define Sync                   4'h0 //ptp_item::Sync                 //Event  0
`define Delay_Req              4'h1 //ptp_item::Delay_Req            //Event  1
`define Pdelay_Req             4'h2 //ptp_item::Pdelay_Req           //Event  2
`define Pdelay_Resp            4'h3 //ptp_item::Pdelay_Resp          //Event  3
`define Follow_Up              4'h8 //ptp_item::Follow_Up            //General 8
`define Delay_Resp             4'h9 //ptp_item::Delay_Resp           //General 9
`define Pdelay_Resp_Follow_Up  4'hA //ptp_item::Pdelay_Resp_Follow_Up//General A
`define Announce               4'hB //ptp_item::Announce             //General B
`define Signaling              4'hC //ptp_item::Signaling            //General C
`define Management             4'hD //ptp_item::Management           //General D
`define DUT_MAX_PORT 'd10	

//ITEM_CONFIG
`define INCREASE_PAYLOAD  2'b00
`define RANDOM_PAYLOAD    2'b01
`define ASSIGN_FIRST_BYTE 2'b10		  
typedef struct packed
{
bit        port_en;
int        packet_count;
bit [47:0] da_index;
bit [47:0] sa_index;
} port_stimulus_t;

port_stimulus_t port_stimulus_s[`MAX_ENV_MAC_NUM];

int port_ptp_instance_mapping_table[`MAX_ENV_MAC_NUM];

