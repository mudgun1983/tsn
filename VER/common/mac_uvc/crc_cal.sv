//FILE_HEADER------------------------------------------------------------------------------------------
// ZTE  Copyright
// ZTE Company Confidential
//-----------------------------------------------------------------------------------------------------
// FILE NAME:       crc_cal.sv
// DEPARTMENT:      Multi-Service Bearer Product ShenZhen Design&Development Dept.
// AUTHOR:          Li Xiangqiong
// AUTHOR'S EMAIL:  li.xiangqiong@zte.com.cn
//-----------------------------------------------------------------------------------------------------
// RELEASE HISTORY: N/A
// VERSION      DATE         AUTHOR       DESCRIPTION
// 1.1         2010-9-11    Li Xiangqiong   OVM
//-----------------------------------------------------------------------------------------------------
// KEYWORDS: crc_cal
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

`ifndef CRC_CAL_SV
`define CRC_CAL_SV

class crc_cal;

//const int unsigned crc8_table[256] = 
const bit[7:0] crc8_table[256] = 
'{
	8'h0, 8'h7, 8'he, 8'h9, 8'h1c,8'h1b,8'h12,8'h15,   
  8'h38,8'h3f,8'h36,8'h31,8'h24,8'h23,8'h2a,8'h2d,   
  8'h70,8'h77,8'h7e,8'h79,8'h6c,8'h6b,8'h62,8'h65,   
  8'h48,8'h4f,8'h46,8'h41,8'h54,8'h53,8'h5a,8'h5d,   
  8'he0,8'he7,8'hee,8'he9,8'hfc,8'hfb,8'hf2,8'hf5,   
  8'hd8,8'hdf,8'hd6,8'hd1,8'hc4,8'hc3,8'hca,8'hcd,   
  8'h90,8'h97,8'h9e,8'h99,8'h8c,8'h8b,8'h82,8'h85,   
  8'ha8,8'haf,8'ha6,8'ha1,8'hb4,8'hb3,8'hba,8'hbd,   
  8'hc7,8'hc0,8'hc9,8'hce,8'hdb,8'hdc,8'hd5,8'hd2,   
  8'hff,8'hf8,8'hf1,8'hf6,8'he3,8'he4,8'hed,8'hea,   
  8'hb7,8'hb0,8'hb9,8'hbe,8'hab,8'hac,8'ha5,8'ha2,   
  8'h8f,8'h88,8'h81,8'h86,8'h93,8'h94,8'h9d,8'h9a,   
  8'h27,8'h20,8'h29,8'h2e,8'h3b,8'h3c,8'h35,8'h32,   
  8'h1f,8'h18,8'h11,8'h16,8'h3, 8'h4, 8'hd, 8'ha,   
  8'h57,8'h50,8'h59,8'h5e,8'h4b,8'h4c,8'h45,8'h42,   
  8'h6f,8'h68,8'h61,8'h66,8'h73,8'h74,8'h7d,8'h7a,   
  8'h89,8'h8e,8'h87,8'h80,8'h95,8'h92,8'h9b,8'h9c,   
  8'hb1,8'hb6,8'hbf,8'hb8,8'had,8'haa,8'ha3,8'ha4,   
  8'hf9,8'hfe,8'hf7,8'hf0,8'he5,8'he2,8'heb,8'hec,   
  8'hc1,8'hc6,8'hcf,8'hc8,8'hdd,8'hda,8'hd3,8'hd4,   
  8'h69,8'h6e,8'h67,8'h60,8'h75,8'h72,8'h7b,8'h7c,   
  8'h51,8'h56,8'h5f,8'h58,8'h4d,8'h4a,8'h43,8'h44,   
  8'h19,8'h1e,8'h17,8'h10,8'h5, 8'h2, 8'hb, 8'hc,   
  8'h21,8'h26,8'h2f,8'h28,8'h3d,8'h3a,8'h33,8'h34,   
  8'h4e,8'h49,8'h40,8'h47,8'h52,8'h55,8'h5c,8'h5b,   
  8'h76,8'h71,8'h78,8'h7f,8'h6a,8'h6d,8'h64,8'h63,   
  8'h3e,8'h39,8'h30,8'h37,8'h22,8'h25,8'h2c,8'h2b,   
  8'h6, 8'h1, 8'h8, 8'hf, 8'h1a,8'h1d,8'h14,8'h13,   
  8'hae,8'ha9,8'ha0,8'ha7,8'hb2,8'hb5,8'hbc,8'hbb,   
  8'h96,8'h91,8'h98,8'h9f,8'h8a,8'h8d,8'h84,8'h83,   
  8'hde,8'hd9,8'hd0,8'hd7,8'hc2,8'hc5,8'hcc,8'hcb,   
  8'he6,8'he1,8'he8,8'hef,8'hfa,8'hfd,8'hf4,8'hf3
};

//const int unsigned crc16_table[256] = 
const bit[15:0] crc16_table[256] = 
'{
  16'h0,   16'h1021,16'h2042,16'h3063,16'h4084,16'h50a5,16'h60c6,16'h70e7,   
  16'h8108,16'h9129,16'ha14a,16'hb16b,16'hc18c,16'hd1ad,16'he1ce,16'hf1ef,   
  16'h1231,16'h210, 16'h3273,16'h2252,16'h52b5,16'h4294,16'h72f7,16'h62d6,   
  16'h9339,16'h8318,16'hb37b,16'ha35a,16'hd3bd,16'hc39c,16'hf3ff,16'he3de,   
  16'h2462,16'h3443,16'h420, 16'h1401,16'h64e6,16'h74c7,16'h44a4,16'h5485,   
  16'ha56a,16'hb54b,16'h8528,16'h9509,16'he5ee,16'hf5cf,16'hc5ac,16'hd58d,   
  16'h3653,16'h2672,16'h1611,16'h630, 16'h76d7,16'h66f6,16'h5695,16'h46b4,   
  16'hb75b,16'ha77a,16'h9719,16'h8738,16'hf7df,16'he7fe,16'hd79d,16'hc7bc,   
  16'h48c4,16'h58e5,16'h6886,16'h78a7,16'h840, 16'h1861,16'h2802,16'h3823,   
  16'hc9cc,16'hd9ed,16'he98e,16'hf9af,16'h8948,16'h9969,16'ha90a,16'hb92b,   
  16'h5af5,16'h4ad4,16'h7ab7,16'h6a96,16'h1a71,16'ha50, 16'h3a33,16'h2a12,   
  16'hdbfd,16'hcbdc,16'hfbbf,16'heb9e,16'h9b79,16'h8b58,16'hbb3b,16'hab1a,   
  16'h6ca6,16'h7c87,16'h4ce4,16'h5cc5,16'h2c22,16'h3c03,16'hc60, 16'h1c41,   
  16'hedae,16'hfd8f,16'hcdec,16'hddcd,16'had2a,16'hbd0b,16'h8d68,16'h9d49,   
  16'h7e97,16'h6eb6,16'h5ed5,16'h4ef4,16'h3e13,16'h2e32,16'h1e51,16'he70,   
  16'hff9f,16'hefbe,16'hdfdd,16'hcffc,16'hbf1b,16'haf3a,16'h9f59,16'h8f78,   
  16'h9188,16'h81a9,16'hb1ca,16'ha1eb,16'hd10c,16'hc12d,16'hf14e,16'he16f,   
  16'h1080,16'ha1,  16'h30c2,16'h20e3,16'h5004,16'h4025,16'h7046,16'h6067,   
  16'h83b9,16'h9398,16'ha3fb,16'hb3da,16'hc33d,16'hd31c,16'he37f,16'hf35e,   
  16'h2b1, 16'h1290,16'h22f3,16'h32d2,16'h4235,16'h5214,16'h6277,16'h7256,   
  16'hb5ea,16'ha5cb,16'h95a8,16'h8589,16'hf56e,16'he54f,16'hd52c,16'hc50d,   
  16'h34e2,16'h24c3,16'h14a0,16'h481, 16'h7466,16'h6447,16'h5424,16'h4405,   
  16'ha7db,16'hb7fa,16'h8799,16'h97b8,16'he75f,16'hf77e,16'hc71d,16'hd73c,   
  16'h26d3,16'h36f2,16'h691, 16'h16b0,16'h6657,16'h7676,16'h4615,16'h5634,   
  16'hd94c,16'hc96d,16'hf90e,16'he92f,16'h99c8,16'h89e9,16'hb98a,16'ha9ab,   
  16'h5844,16'h4865,16'h7806,16'h6827,16'h18c0,16'h8e1, 16'h3882,16'h28a3,   
  16'hcb7d,16'hdb5c,16'heb3f,16'hfb1e,16'h8bf9,16'h9bd8,16'habbb,16'hbb9a,   
  16'h4a75,16'h5a54,16'h6a37,16'h7a16,16'haf1, 16'h1ad0,16'h2ab3,16'h3a92,   
  16'hfd2e,16'hed0f,16'hdd6c,16'hcd4d,16'hbdaa,16'had8b,16'h9de8,16'h8dc9,   
  16'h7c26,16'h6c07,16'h5c64,16'h4c45,16'h3ca2,16'h2c83,16'h1ce0,16'hcc1,   
  16'hef1f,16'hff3e,16'hcf5d,16'hdf7c,16'haf9b,16'hbfba,16'h8fd9,16'h9ff8,   
  16'h6e17,16'h7e36,16'h4e55,16'h5e74,16'h2e93,16'h3eb2,16'hed1, 16'h1ef0	
};


const bit[31:0] crc32_table_se[256] = 
'{
  32'h00000000,32'h77073096,32'hee0e612c,32'h990951ba,32'h076dc419,32'h706af48f,32'he963a535,32'h9e6495a3,
  32'h0edb8832,32'h79dcb8a4,32'he0d5e91e,32'h97d2d988,32'h09b64c2b,32'h7eb17cbd,32'he7b82d07,32'h90bf1d91,
  32'h1db71064,32'h6ab020f2,32'hf3b97148,32'h84be41de,32'h1adad47d,32'h6ddde4eb,32'hf4d4b551,32'h83d385c7,
  32'h136c9856,32'h646ba8c0,32'hfd62f97a,32'h8a65c9ec,32'h14015c4f,32'h63066cd9,32'hfa0f3d63,32'h8d080df5,
  32'h3b6e20c8,32'h4c69105e,32'hd56041e4,32'ha2677172,32'h3c03e4d1,32'h4b04d447,32'hd20d85fd,32'ha50ab56b,
  32'h35b5a8fa,32'h42b2986c,32'hdbbbc9d6,32'hacbcf940,32'h32d86ce3,32'h45df5c75,32'hdcd60dcf,32'habd13d59,
  32'h26d930ac,32'h51de003a,32'hc8d75180,32'hbfd06116,32'h21b4f4b5,32'h56b3c423,32'hcfba9599,32'hb8bda50f,
  32'h2802b89e,32'h5f058808,32'hc60cd9b2,32'hb10be924,32'h2f6f7c87,32'h58684c11,32'hc1611dab,32'hb6662d3d,
  32'h76dc4190,32'h01db7106,32'h98d220bc,32'hefd5102a,32'h71b18589,32'h06b6b51f,32'h9fbfe4a5,32'he8b8d433,
  32'h7807c9a2,32'h0f00f934,32'h9609a88e,32'he10e9818,32'h7f6a0dbb,32'h086d3d2d,32'h91646c97,32'he6635c01,
  32'h6b6b51f4,32'h1c6c6162,32'h856530d8,32'hf262004e,32'h6c0695ed,32'h1b01a57b,32'h8208f4c1,32'hf50fc457,
  32'h65b0d9c6,32'h12b7e950,32'h8bbeb8ea,32'hfcb9887c,32'h62dd1ddf,32'h15da2d49,32'h8cd37cf3,32'hfbd44c65,
  32'h4db26158,32'h3ab551ce,32'ha3bc0074,32'hd4bb30e2,32'h4adfa541,32'h3dd895d7,32'ha4d1c46d,32'hd3d6f4fb,
  32'h4369e96a,32'h346ed9fc,32'had678846,32'hda60b8d0,32'h44042d73,32'h33031de5,32'haa0a4c5f,32'hdd0d7cc9,
  32'h5005713c,32'h270241aa,32'hbe0b1010,32'hc90c2086,32'h5768b525,32'h206f85b3,32'hb966d409,32'hce61e49f,
  32'h5edef90e,32'h29d9c998,32'hb0d09822,32'hc7d7a8b4,32'h59b33d17,32'h2eb40d81,32'hb7bd5c3b,32'hc0ba6cad,
  32'hedb88320,32'h9abfb3b6,32'h03b6e20c,32'h74b1d29a,32'head54739,32'h9dd277af,32'h04db2615,32'h73dc1683,
  32'he3630b12,32'h94643b84,32'h0d6d6a3e,32'h7a6a5aa8,32'he40ecf0b,32'h9309ff9d,32'h0a00ae27,32'h7d079eb1,
  32'hf00f9344,32'h8708a3d2,32'h1e01f268,32'h6906c2fe,32'hf762575d,32'h806567cb,32'h196c3671,32'h6e6b06e7,
  32'hfed41b76,32'h89d32be0,32'h10da7a5a,32'h67dd4acc,32'hf9b9df6f,32'h8ebeeff9,32'h17b7be43,32'h60b08ed5,
  32'hd6d6a3e8,32'ha1d1937e,32'h38d8c2c4,32'h4fdff252,32'hd1bb67f1,32'ha6bc5767,32'h3fb506dd,32'h48b2364b,
  32'hd80d2bda,32'haf0a1b4c,32'h36034af6,32'h41047a60,32'hdf60efc3,32'ha867df55,32'h316e8eef,32'h4669be79,
  32'hcb61b38c,32'hbc66831a,32'h256fd2a0,32'h5268e236,32'hcc0c7795,32'hbb0b4703,32'h220216b9,32'h5505262f,
  32'hc5ba3bbe,32'hb2bd0b28,32'h2bb45a92,32'h5cb36a04,32'hc2d7ffa7,32'hb5d0cf31,32'h2cd99e8b,32'h5bdeae1d,
  32'h9b64c2b0,32'hec63f226,32'h756aa39c,32'h026d930a,32'h9c0906a9,32'heb0e363f,32'h72076785,32'h05005713,
  32'h95bf4a82,32'he2b87a14,32'h7bb12bae,32'h0cb61b38,32'h92d28e9b,32'he5d5be0d,32'h7cdcefb7,32'h0bdbdf21,
  32'h86d3d2d4,32'hf1d4e242,32'h68ddb3f8,32'h1fda836e,32'h81be16cd,32'hf6b9265b,32'h6fb077e1,32'h18b74777,
  32'h88085ae6,32'hff0f6a70,32'h66063bca,32'h11010b5c,32'h8f659eff,32'hf862ae69,32'h616bffd3,32'h166ccf45,
  32'ha00ae278,32'hd70dd2ee,32'h4e048354,32'h3903b3c2,32'ha7672661,32'hd06016f7,32'h4969474d,32'h3e6e77db,
  32'haed16a4a,32'hd9d65adc,32'h40df0b66,32'h37d83bf0,32'ha9bcae53,32'hdebb9ec5,32'h47b2cf7f,32'h30b5ffe9,
  32'hbdbdf21c,32'hcabac28a,32'h53b39330,32'h24b4a3a6,32'hbad03605,32'hcdd70693,32'h54de5729,32'h23d967bf,
  32'hb3667a2e,32'hc4614ab8,32'h5d681b02,32'h2a6f2b94,32'hb40bbe37,32'hc30c8ea1,32'h5a05df1b,32'h2d02ef8d
};

const bit[31:0] crc32_table_be[256] = 
'{
  32'h00000000,32'h04c11db7,32'h09823b6e,32'h0d4326d9,32'h130476dc,32'h17c56b6b,32'h1a864db2,32'h1e475005,   
  32'h2608edb8,32'h22c9f00f,32'h2f8ad6d6,32'h2b4bcb61,32'h350c9b64,32'h31cd86d3,32'h3c8ea00a,32'h384fbdbd,   
  32'h4c11db70,32'h48d0c6c7,32'h4593e01e,32'h4152fda9,32'h5f15adac,32'h5bd4b01b,32'h569796c2,32'h52568b75,   
  32'h6a1936c8,32'h6ed82b7f,32'h639b0da6,32'h675a1011,32'h791d4014,32'h7ddc5da3,32'h709f7b7a,32'h745e66cd,   
  32'h9823b6e0,32'h9ce2ab57,32'h91a18d8e,32'h95609039,32'h8b27c03c,32'h8fe6dd8b,32'h82a5fb52,32'h8664e6e5,   
  32'hbe2b5b58,32'hbaea46ef,32'hb7a96036,32'hb3687d81,32'had2f2d84,32'ha9ee3033,32'ha4ad16ea,32'ha06c0b5d,   
  32'hd4326d90,32'hd0f37027,32'hddb056fe,32'hd9714b49,32'hc7361b4c,32'hc3f706fb,32'hceb42022,32'hca753d95,   
  32'hf23a8028,32'hf6fb9d9f,32'hfbb8bb46,32'hff79a6f1,32'he13ef6f4,32'he5ffeb43,32'he8bccd9a,32'hec7dd02d,   
  32'h34867077,32'h30476dc0,32'h3d044b19,32'h39c556ae,32'h278206ab,32'h23431b1c,32'h2e003dc5,32'h2ac12072,   
  32'h128e9dcf,32'h164f8078,32'h1b0ca6a1,32'h1fcdbb16,32'h018aeb13,32'h054bf6a4,32'h0808d07d,32'h0cc9cdca,   
  32'h7897ab07,32'h7c56b6b0,32'h71159069,32'h75d48dde,32'h6b93dddb,32'h6f52c06c,32'h6211e6b5,32'h66d0fb02,   
  32'h5e9f46bf,32'h5a5e5b08,32'h571d7dd1,32'h53dc6066,32'h4d9b3063,32'h495a2dd4,32'h44190b0d,32'h40d816ba,   
  32'haca5c697,32'ha864db20,32'ha527fdf9,32'ha1e6e04e,32'hbfa1b04b,32'hbb60adfc,32'hb6238b25,32'hb2e29692,   
  32'h8aad2b2f,32'h8e6c3698,32'h832f1041,32'h87ee0df6,32'h99a95df3,32'h9d684044,32'h902b669d,32'h94ea7b2a,   
  32'he0b41de7,32'he4750050,32'he9362689,32'hedf73b3e,32'hf3b06b3b,32'hf771768c,32'hfa325055,32'hfef34de2,   
  32'hc6bcf05f,32'hc27dede8,32'hcf3ecb31,32'hcbffd686,32'hd5b88683,32'hd1799b34,32'hdc3abded,32'hd8fba05a,   
  32'h690ce0ee,32'h6dcdfd59,32'h608edb80,32'h644fc637,32'h7a089632,32'h7ec98b85,32'h738aad5c,32'h774bb0eb,   
  32'h4f040d56,32'h4bc510e1,32'h46863638,32'h42472b8f,32'h5c007b8a,32'h58c1663d,32'h558240e4,32'h51435d53,   
  32'h251d3b9e,32'h21dc2629,32'h2c9f00f0,32'h285e1d47,32'h36194d42,32'h32d850f5,32'h3f9b762c,32'h3b5a6b9b,   
  32'h0315d626,32'h07d4cb91,32'h0a97ed48,32'h0e56f0ff,32'h1011a0fa,32'h14d0bd4d,32'h19939b94,32'h1d528623,   
  32'hf12f560e,32'hf5ee4bb9,32'hf8ad6d60,32'hfc6c70d7,32'he22b20d2,32'he6ea3d65,32'heba91bbc,32'hef68060b,   
  32'hd727bbb6,32'hd3e6a601,32'hdea580d8,32'hda649d6f,32'hc423cd6a,32'hc0e2d0dd,32'hcda1f604,32'hc960ebb3,   
  32'hbd3e8d7e,32'hb9ff90c9,32'hb4bcb610,32'hb07daba7,32'hae3afba2,32'haafbe615,32'ha7b8c0cc,32'ha379dd7b,   
  32'h9b3660c6,32'h9ff77d71,32'h92b45ba8,32'h9675461f,32'h8832161a,32'h8cf30bad,32'h81b02d74,32'h857130c3,   
  32'h5d8a9099,32'h594b8d2e,32'h5408abf7,32'h50c9b640,32'h4e8ee645,32'h4a4ffbf2,32'h470cdd2b,32'h43cdc09c,   
  32'h7b827d21,32'h7f436096,32'h7200464f,32'h76c15bf8,32'h68860bfd,32'h6c47164a,32'h61043093,32'h65c52d24,   
  32'h119b4be9,32'h155a565e,32'h18197087,32'h1cd86d30,32'h029f3d35,32'h065e2082,32'h0b1d065b,32'h0fdc1bec,   
  32'h3793a651,32'h3352bbe6,32'h3e119d3f,32'h3ad08088,32'h2497d08d,32'h2056cd3a,32'h2d15ebe3,32'h29d4f654,   
  32'hc5a92679,32'hc1683bce,32'hcc2b1d17,32'hc8ea00a0,32'hd6ad50a5,32'hd26c4d12,32'hdf2f6bcb,32'hdbee767c,   
  32'he3a1cbc1,32'he760d676,32'hea23f0af,32'heee2ed18,32'hf0a5bd1d,32'hf464a0aa,32'hf9278673,32'hfde69bc4,   
  32'h89b8fd09,32'h8d79e0be,32'h803ac667,32'h84fbdbd0,32'h9abc8bd5,32'h9e7d9662,32'h933eb0bb,32'h97ffad0c,   
  32'hafb010b1,32'hab710d06,32'ha6322bdf,32'ha2f33668,32'hbcb4666d,32'hb8757bda,32'hb5365d03,32'hb1f740b4  	
};

function bit[7:0] do_crc8(const ref bit[7:0] data[], input bit[7:0] crc8_ini);//bit7~bit0
  bit[7:0] crc8 = crc8_ini;
  for(int i=0;i<data.size();i++) 
  	crc8 = crc8_table[data[i]^crc8];
  return crc8;
endfunction : do_crc8



function bit[15:0] do_crc16(const ref bit[7:0] data[], input bit[15:0] crc16_ini);//bit7~bit0
  bit[15:0] crc16 = crc16_ini;
  for(int i=0;i<data.size();i++) 
    crc16 = (crc16<<8)^crc16_table[data[i]^((crc16>>8)&8'hff)];
  return crc16;
endfunction : do_crc16

//---------------------------------------------------------------------------------------------
//function:do_crc32_be
//This function is for CRC32 calculation in mode of big end
//crc32[31...0] = x31x30...x1x0
//---------------------------------------------------------------------------------------------
function bit[31:0] do_crc32_be(const ref bit[7:0] data[], input bit[31:0] crc32_ini);//bit7~bit0,big end
  bit[31:0] crc32 = crc32_ini;
  for(int i=0;i<data.size();i++) 
    crc32 = (crc32<<8)^crc32_table_be[data[i]^((crc32>>24)&8'hff)];
  return crc32;
endfunction : do_crc32_be

//---------------------------------------------------------------------------------------------
//function:do_crc32_se
//This function is for CRC32 calculation in mode of small end
//crc32[31...0] = x0x1...x30x31
//---------------------------------------------------------------------------------------------
function bit[31:0] do_crc32_se(const ref bit[7:0] data[], input bit[31:0] crc32_ini);//bit0~bit7,small end
  bit[31:0] crc32 = crc32_ini;
  for(int i=0;i<data.size();i++)
    crc32 = (crc32>>8)^crc32_table_se[(data[i]^crc32)&8'hff];
  return crc32;
endfunction : do_crc32_se



  function bit[15:0] CRC16_D16_FUNC(const ref bit[15:0] data,const ref bit[15:0] Crc_in);
//    input [CRCWID-1:0]    Data;
//    input [CRCWID-1:0]    Crc_in;
//
//    reg   [CRCWID-1:0]    D;
//    reg   [CRCWID-1:0]    C;
//    reg   [CRCWID-1:0]    NewCRC;
//    bit[15:0] Crc_in = 16'h0000;
    bit[15:0] D = data;
    bit[15:0] C = Crc_in;
    bit[15:0] NewCRC;
    begin
//      D = Data      ;
//      C = Crc_in    ;
      NewCRC[0] = D[12] ^ D[11] ^ D[8] ^ D[4] ^ D[0] ^ C[0] ^ C[4] ^ 
                  C[8] ^ C[11] ^ C[12];
      NewCRC[1] = D[13] ^ D[12] ^ D[9] ^ D[5] ^ D[1] ^ C[1] ^ C[5] ^ 
                  C[9] ^ C[12] ^ C[13];
      NewCRC[2] = D[14] ^ D[13] ^ D[10] ^ D[6] ^ D[2] ^ C[2] ^ C[6] ^ 
                  C[10] ^ C[13] ^ C[14];
      NewCRC[3] = D[15] ^ D[14] ^ D[11] ^ D[7] ^ D[3] ^ C[3] ^ C[7] ^ 
                  C[11] ^ C[14] ^ C[15];
      NewCRC[4] = D[15] ^ D[12] ^ D[8] ^ D[4] ^ C[4] ^ C[8] ^ C[12] ^ 
                  C[15];
      NewCRC[5] = D[13] ^ D[12] ^ D[11] ^ D[9] ^ D[8] ^ D[5] ^ D[4] ^ 
                  D[0] ^ C[0] ^ C[4] ^ C[5] ^ C[8] ^ C[9] ^ C[11] ^ C[12] ^ 
                  C[13];
      NewCRC[6] = D[14] ^ D[13] ^ D[12] ^ D[10] ^ D[9] ^ D[6] ^ D[5] ^ 
                  D[1] ^ C[1] ^ C[5] ^ C[6] ^ C[9] ^ C[10] ^ C[12] ^ 
                  C[13] ^ C[14];
      NewCRC[7] = D[15] ^ D[14] ^ D[13] ^ D[11] ^ D[10] ^ D[7] ^ D[6] ^ 
                  D[2] ^ C[2] ^ C[6] ^ C[7] ^ C[10] ^ C[11] ^ C[13] ^ 
                  C[14] ^ C[15];
      NewCRC[8] = D[15] ^ D[14] ^ D[12] ^ D[11] ^ D[8] ^ D[7] ^ D[3] ^ 
                  C[3] ^ C[7] ^ C[8] ^ C[11] ^ C[12] ^ C[14] ^ C[15];
      NewCRC[9] = D[15] ^ D[13] ^ D[12] ^ D[9] ^ D[8] ^ D[4] ^ C[4] ^ 
                  C[8] ^ C[9] ^ C[12] ^ C[13] ^ C[15];
      NewCRC[10] = D[14] ^ D[13] ^ D[10] ^ D[9] ^ D[5] ^ C[5] ^ C[9] ^ 
                   C[10] ^ C[13] ^ C[14];
      NewCRC[11] = D[15] ^ D[14] ^ D[11] ^ D[10] ^ D[6] ^ C[6] ^ C[10] ^ 
                   C[11] ^ C[14] ^ C[15];
      NewCRC[12] = D[15] ^ D[8] ^ D[7] ^ D[4] ^ D[0] ^ C[0] ^ C[4] ^ C[7] ^ 
                   C[8] ^ C[15];
      NewCRC[13] = D[9] ^ D[8] ^ D[5] ^ D[1] ^ C[1] ^ C[5] ^ C[8] ^ C[9];
      NewCRC[14] = D[10] ^ D[9] ^ D[6] ^ D[2] ^ C[2] ^ C[6] ^ C[9] ^ C[10];
      NewCRC[15] = D[11] ^ D[10] ^ D[7] ^ D[3] ^ C[3] ^ C[7] ^ C[10] ^ 
                   C[11];
//      CRC16_D16_FUNC = NewCRC;
      return NewCRC;
    end
  endfunction
  
  
    function bit[31:0] crc32_d32_func(const ref bit[31:0] data,const ref  bit[31:0] crc);
    
//    input [31:0] data;
//    input [31:0] crc;
//    
//    reg [31:0] d;
//    reg [31:0] c;
//    reg [31:0] crc_next;
//    bit [31:0] crc = 32'h0000_0000;
    bit [31:0] d = data;
    bit [31:0] c = crc;
    bit [31:0] crc_next;
    begin
      
//      d = data;
//      c = crc;
      
    crc_next[0] = c[0]^c[6]^c[9]^c[10]^c[12]^c[16]^c[24]^c[25]^c[26]^c[28]^c[29]^c[30]^c[31]^d[0]^d[6]^d[9]^d[10]^d[12]^d[16]^d[24]^d[25]^d[26]^d[28]^d[29]^d[30]^d[31];
    crc_next[1] = c[0]^c[1]^c[6]^c[7]^c[9]^c[11]^c[12]^c[13]^c[16]^c[17]^c[24]^c[27]^c[28]^d[0]^d[1]^d[6]^d[7]^d[9]^d[11]^d[12]^d[13]^d[16]^d[17]^d[24]^d[27]^d[28];
    crc_next[2] = c[0]^c[1]^c[2]^c[6]^c[7]^c[8]^c[9]^c[13]^c[14]^c[16]^c[17]^c[18]^c[24]^c[26]^c[30]^c[31]^d[0]^d[1]^d[2]^d[6]^d[7]^d[8]^d[9]^d[13]^d[14]^d[16]^d[17]^d[18]^d[24]^d[26]^d[30]^d[31];
    crc_next[3] = c[1]^c[2]^c[3]^c[7]^c[8]^c[9]^c[10]^c[14]^c[15]^c[17]^c[18]^c[19]^c[25]^c[27]^c[31]^d[1]^d[2]^d[3]^d[7]^d[8]^d[9]^d[10]^d[14]^d[15]^d[17]^d[18]^d[19]^d[25]^d[27]^d[31];
    crc_next[4] = c[0]^c[2]^c[3]^c[4]^c[6]^c[8]^c[11]^c[12]^c[15]^c[18]^c[19]^c[20]^c[24]^c[25]^c[29]^c[30]^c[31]^d[0]^d[2]^d[3]^d[4]^d[6]^d[8]^d[11]^d[12]^d[15]^d[18]^d[19]^d[20]^d[24]^d[25]^d[29]^d[30]^d[31];
    crc_next[5] = c[0]^c[1]^c[3]^c[4]^c[5]^c[6]^c[7]^c[10]^c[13]^c[19]^c[20]^c[21]^c[24]^c[28]^c[29]^d[0]^d[1]^d[3]^d[4]^d[5]^d[6]^d[7]^d[10]^d[13]^d[19]^d[20]^d[21]^d[24]^d[28]^d[29];
    crc_next[6] = c[1]^c[2]^c[4]^c[5]^c[6]^c[7]^c[8]^c[11]^c[14]^c[20]^c[21]^c[22]^c[25]^c[29]^c[30]^d[1]^d[2]^d[4]^d[5]^d[6]^d[7]^d[8]^d[11]^d[14]^d[20]^d[21]^d[22]^d[25]^d[29]^d[30];
    crc_next[7] = c[0]^c[2]^c[3]^c[5]^c[7]^c[8]^c[10]^c[15]^c[16]^c[21]^c[22]^c[23]^c[24]^c[25]^c[28]^c[29]^d[0]^d[2]^d[3]^d[5]^d[7]^d[8]^d[10]^d[15]^d[16]^d[21]^d[22]^d[23]^d[24]^d[25]^d[28]^d[29];
    crc_next[8] = c[0]^c[1]^c[3]^c[4]^c[8]^c[10]^c[11]^c[12]^c[17]^c[22]^c[23]^c[28]^c[31]^d[0]^d[1]^d[3]^d[4]^d[8]^d[10]^d[11]^d[12]^d[17]^d[22]^d[23]^d[28]^d[31];
    crc_next[9] = c[1]^c[2]^c[4]^c[5]^c[9]^c[11]^c[12]^c[13]^c[18]^c[23]^c[24]^c[29]^d[1]^d[2]^d[4]^d[5]^d[9]^d[11]^d[12]^d[13]^d[18]^d[23]^d[24]^d[29];
    crc_next[10] = c[0]^c[2]^c[3]^c[5]^c[9]^c[13]^c[14]^c[16]^c[19]^c[26]^c[28]^c[29]^c[31]^d[0]^d[2]^d[3]^d[5]^d[9]^d[13]^d[14]^d[16]^d[19]^d[26]^d[28]^d[29]^d[31];
    crc_next[11] = c[0]^c[1]^c[3]^c[4]^c[9]^c[12]^c[14]^c[15]^c[16]^c[17]^c[20]^c[24]^c[25]^c[26]^c[27]^c[28]^c[31]^d[0]^d[1]^d[3]^d[4]^d[9]^d[12]^d[14]^d[15]^d[16]^d[17]^d[20]^d[24]^d[25]^d[26]^d[27]^d[28]^d[31];
    crc_next[12] = c[0]^c[1]^c[2]^c[4]^c[5]^c[6]^c[9]^c[12]^c[13]^c[15]^c[17]^c[18]^c[21]^c[24]^c[27]^c[30]^c[31]^d[0]^d[1]^d[2]^d[4]^d[5]^d[6]^d[9]^d[12]^d[13]^d[15]^d[17]^d[18]^d[21]^d[24]^d[27]^d[30]^d[31];
    crc_next[13] = c[1]^c[2]^c[3]^c[5]^c[6]^c[7]^c[10]^c[13]^c[14]^c[16]^c[18]^c[19]^c[22]^c[25]^c[28]^c[31]^d[1]^d[2]^d[3]^d[5]^d[6]^d[7]^d[10]^d[13]^d[14]^d[16]^d[18]^d[19]^d[22]^d[25]^d[28]^d[31];
    crc_next[14] = c[2]^c[3]^c[4]^c[6]^c[7]^c[8]^c[11]^c[14]^c[15]^c[17]^c[19]^c[20]^c[23]^c[26]^c[29]^d[2]^d[3]^d[4]^d[6]^d[7]^d[8]^d[11]^d[14]^d[15]^d[17]^d[19]^d[20]^d[23]^d[26]^d[29];
    crc_next[15] = c[3]^c[4]^c[5]^c[7]^c[8]^c[9]^c[12]^c[15]^c[16]^c[18]^c[20]^c[21]^c[24]^c[27]^c[30]^d[3]^d[4]^d[5]^d[7]^d[8]^d[9]^d[12]^d[15]^d[16]^d[18]^d[20]^d[21]^d[24]^d[27]^d[30];
    crc_next[16] = c[0]^c[4]^c[5]^c[8]^c[12]^c[13]^c[17]^c[19]^c[21]^c[22]^c[24]^c[26]^c[29]^c[30]^d[0]^d[4]^d[5]^d[8]^d[12]^d[13]^d[17]^d[19]^d[21]^d[22]^d[24]^d[26]^d[29]^d[30];
    crc_next[17] = c[1]^c[5]^c[6]^c[9]^c[13]^c[14]^c[18]^c[20]^c[22]^c[23]^c[25]^c[27]^c[30]^c[31]^d[1]^d[5]^d[6]^d[9]^d[13]^d[14]^d[18]^d[20]^d[22]^d[23]^d[25]^d[27]^d[30]^d[31];
    crc_next[18] = c[2]^c[6]^c[7]^c[10]^c[14]^c[15]^c[19]^c[21]^c[23]^c[24]^c[26]^c[28]^c[31]^d[2]^d[6]^d[7]^d[10]^d[14]^d[15]^d[19]^d[21]^d[23]^d[24]^d[26]^d[28]^d[31];
    crc_next[19] = c[3]^c[7]^c[8]^c[11]^c[15]^c[16]^c[20]^c[22]^c[24]^c[25]^c[27]^c[29]^d[3]^d[7]^d[8]^d[11]^d[15]^d[16]^d[20]^d[22]^d[24]^d[25]^d[27]^d[29];
    crc_next[20] = c[4]^c[8]^c[9]^c[12]^c[16]^c[17]^c[21]^c[23]^c[25]^c[26]^c[28]^c[30]^d[4]^d[8]^d[9]^d[12]^d[16]^d[17]^d[21]^d[23]^d[25]^d[26]^d[28]^d[30];
    crc_next[21] = c[5]^c[9]^c[10]^c[13]^c[17]^c[18]^c[22]^c[24]^c[26]^c[27]^c[29]^c[31]^d[5]^d[9]^d[10]^d[13]^d[17]^d[18]^d[22]^d[24]^d[26]^d[27]^d[29]^d[31];
    crc_next[22] = c[0]^c[9]^c[11]^c[12]^c[14]^c[16]^c[18]^c[19]^c[23]^c[24]^c[26]^c[27]^c[29]^c[31]^d[0]^d[9]^d[11]^d[12]^d[14]^d[16]^d[18]^d[19]^d[23]^d[24]^d[26]^d[27]^d[29]^d[31];
    crc_next[23] = c[0]^c[1]^c[6]^c[9]^c[13]^c[15]^c[16]^c[17]^c[19]^c[20]^c[26]^c[27]^c[29]^c[31]^d[0]^d[1]^d[6]^d[9]^d[13]^d[15]^d[16]^d[17]^d[19]^d[20]^d[26]^d[27]^d[29]^d[31];
    crc_next[24] = c[1]^c[2]^c[7]^c[10]^c[14]^c[16]^c[17]^c[18]^c[20]^c[21]^c[27]^c[28]^c[30]^d[1]^d[2]^d[7]^d[10]^d[14]^d[16]^d[17]^d[18]^d[20]^d[21]^d[27]^d[28]^d[30];
    crc_next[25] = c[2]^c[3]^c[8]^c[11]^c[15]^c[17]^c[18]^c[19]^c[21]^c[22]^c[28]^c[29]^c[31]^d[2]^d[3]^d[8]^d[11]^d[15]^d[17]^d[18]^d[19]^d[21]^d[22]^d[28]^d[29]^d[31];
    crc_next[26] = c[0]^c[3]^c[4]^c[6]^c[10]^c[18]^c[19]^c[20]^c[22]^c[23]^c[24]^c[25]^c[26]^c[28]^c[31]^d[0]^d[3]^d[4]^d[6]^d[10]^d[18]^d[19]^d[20]^d[22]^d[23]^d[24]^d[25]^d[26]^d[28]^d[31];
    crc_next[27] = c[1]^c[4]^c[5]^c[7]^c[11]^c[19]^c[20]^c[21]^c[23]^c[24]^c[25]^c[26]^c[27]^c[29]^d[1]^d[4]^d[5]^d[7]^d[11]^d[19]^d[20]^d[21]^d[23]^d[24]^d[25]^d[26]^d[27]^d[29];
    crc_next[28] = c[2]^c[5]^c[6]^c[8]^c[12]^c[20]^c[21]^c[22]^c[24]^c[25]^c[26]^c[27]^c[28]^c[30]^d[2]^d[5]^d[6]^d[8]^d[12]^d[20]^d[21]^d[22]^d[24]^d[25]^d[26]^d[27]^d[28]^d[30];
    crc_next[29] = c[3]^c[6]^c[7]^c[9]^c[13]^c[21]^c[22]^c[23]^c[25]^c[26]^c[27]^c[28]^c[29]^c[31]^d[3]^d[6]^d[7]^d[9]^d[13]^d[21]^d[22]^d[23]^d[25]^d[26]^d[27]^d[28]^d[29]^d[31];
    crc_next[30] = c[4]^c[7]^c[8]^c[10]^c[14]^c[22]^c[23]^c[24]^c[26]^c[27]^c[28]^c[29]^c[30]^d[4]^d[7]^d[8]^d[10]^d[14]^d[22]^d[23]^d[24]^d[26]^d[27]^d[28]^d[29]^d[30];
    crc_next[31] = c[5]^c[8]^c[9]^c[11]^c[15]^c[23]^c[24]^c[25]^c[27]^c[28]^c[29]^c[30]^c[31]^d[5]^d[8]^d[9]^d[11]^d[15]^d[23]^d[24]^d[25]^d[27]^d[28]^d[29]^d[30]^d[31];

//      crc32_d32_func = crc_next;
    return  crc_next;
    end
  endfunction  
  
  
function bit[31:0] FCS32(const ref bit[7:0] Data_In2,const ref bit[31:0] Pre_Fcs32);
bit [31:0] Cur_Fcs32;

begin		
   Cur_Fcs32[0] = ( Pre_Fcs32[24]^Pre_Fcs32[30] ) ^ ( Data_In2[6]^Data_In2[0] );
 		Cur_Fcs32[1] = ( ( Pre_Fcs32[24]^Pre_Fcs32[30] ) ^ ( Data_In2[6]^Data_In2[0] ) )
	                ^( ( Data_In2[1]^Pre_Fcs32[25] ) ^ ( Data_In2[7]^Pre_Fcs32[31] ) );
		 Cur_Fcs32[2] = ( ( ( Pre_Fcs32[24]^Pre_Fcs32[30] ) ^( Data_In2[6]^Data_In2[0] ) )
		                 ^( ( Pre_Fcs32[26]^Data_In2[2] ) ^ ( Data_In2[1]^Pre_Fcs32[25] ) ) )
		                 ^( ( Data_In2[7]^Pre_Fcs32[31] ) );
	  Cur_Fcs32[3] = ( ( Pre_Fcs32[27]^Data_In2[3] ) ^ ( Data_In2[2]^Data_In2[1] ) )
 		              ^( ( Pre_Fcs32[25]^Data_In2[7] ) ^ ( Pre_Fcs32[31]^Pre_Fcs32[26] ) );
	  Cur_Fcs32[4] = ( ( ( Pre_Fcs32[24]^Pre_Fcs32[30] ) ^ ( Data_In2[6]^Data_In2[0] ) )
	   	              ^( ( Pre_Fcs32[28]^Data_In2[4] ) ^ ( Pre_Fcs32[27]^Data_In2[3] ) ) )
	     	              ^( Data_In2[2]^Pre_Fcs32[26] );
		 Cur_Fcs32[5] = ( ( ( Pre_Fcs32[24]^Pre_Fcs32[30] )^ ( Data_In2[6]^Data_In2[0]   ) )
		            			  ^( ( Pre_Fcs32[29]^Data_In2[5]   )^ ( Data_In2[4]^Pre_Fcs32[28] ) ) )
          					  ^( ( ( Data_In2[3]^Pre_Fcs32[27] ) ^ ( Data_In2[1]^Pre_Fcs32[25] ) )
              					  ^( Pre_Fcs32[31]^Data_In2[7] ) );
	  Cur_Fcs32[6] = ( ( ( Pre_Fcs32[31]^Pre_Fcs32[30] )^( Pre_Fcs32[29]^Pre_Fcs32[28] ) )
            					  ^( ( Pre_Fcs32[26]^Pre_Fcs32[25] )^( Data_In2[1]^Data_In2[2] ) ) )
            					  ^( ( Data_In2[4]^Data_In2[5] )^ ( Data_In2[6]^Data_In2[7] ) );
   Cur_Fcs32[7] = ( ( ( Pre_Fcs32[24]^Data_In2[0] )^( Pre_Fcs32[31]^Data_In2[7] ) )
	   	              ^( ( Data_In2[5]^Pre_Fcs32[29] )^( Data_In2[3]^Pre_Fcs32[27] ) ) )
		                   ^( Data_In2[2]^Pre_Fcs32[26] ); 
		 Cur_Fcs32[8] = ( ( ( Pre_Fcs32[24]^Data_In2[0] )^( Pre_Fcs32[0]^Data_In2[4]  ) )
		                 ^( ( Pre_Fcs32[28]^Data_In2[3] )^( Pre_Fcs32[27]^Data_In2[1] ) ) )
		                    ^ Pre_Fcs32[25];
	  Cur_Fcs32[9] = ( ( ( Pre_Fcs32[1]^Pre_Fcs32[25] )^( Pre_Fcs32[26]^Pre_Fcs32[28] ) )
	   	              ^( ( Pre_Fcs32[29]^Data_In2[5] )^( Data_In2[4]^Data_In2[2] ) ) )
		                    ^ Data_In2[1];
	  Cur_Fcs32[10]= ( ( ( Pre_Fcs32[24]^Pre_Fcs32[2] )^( Data_In2[5]^Data_In2[0]  ) )
	   	              ^( ( Pre_Fcs32[29]^Data_In2[3] )^( Pre_Fcs32[27]^Data_In2[2] ) ) )
		                    ^ Pre_Fcs32[26];
		 Cur_Fcs32[11]= ( ( ( Pre_Fcs32[24]^Data_In2[0] )^( Pre_Fcs32[3]^Data_In2[4]  ) )
		                 ^( ( Pre_Fcs32[28]^Data_In2[3] )^( Pre_Fcs32[27]^Data_In2[1] ) ) )
		                    ^ Pre_Fcs32[25];
	  Cur_Fcs32[12]= ( ( ( Pre_Fcs32[24]^Pre_Fcs32[30] )^( Data_In2[6]^Data_In2[0] ) )
	            				  ^( ( Pre_Fcs32[4]^Data_In2[5] )^( Pre_Fcs32[29]^Data_In2[4] ) ) )
          					  ^( ( ( Pre_Fcs32[28]^Data_In2[2] )^( Pre_Fcs32[26]^Data_In2[1] ) )
               					  ^ Pre_Fcs32[25] );
	  Cur_Fcs32[13]= ( ( ( Data_In2[5]^Pre_Fcs32[29] )^( Data_In2[3]^Pre_Fcs32[27] ) )
            					  ^( ( Data_In2[2]^Pre_Fcs32[26] )^( Data_In2[1]^Pre_Fcs32[25] ) ) )
          					  ^( ( ( Data_In2[7]^Pre_Fcs32[31] )^( Pre_Fcs32[5]^Data_In2[6] ) )
					                 ^ Pre_Fcs32[30] );
   Cur_Fcs32[14]= ( ( Pre_Fcs32[6]^Data_In2[7] )^( Pre_Fcs32[31]^Data_In2[6] ) )
	 	              ^( ( Pre_Fcs32[30]^Data_In2[4] )^( Pre_Fcs32[28]^Data_In2[3] ) )
		               ^( ( Pre_Fcs32[27]^Data_In2[2] )^ Pre_Fcs32[26] );
		 Cur_Fcs32[15]= ( ( Pre_Fcs32[7]^Data_In2[7] )^( Pre_Fcs32[31]^Data_In2[5] ) )
                 ^( ( Pre_Fcs32[29]^Data_In2[4] )^( Pre_Fcs32[28]^Data_In2[3] ) )
    		              ^ Pre_Fcs32[27];
	  Cur_Fcs32[16]= ( ( Pre_Fcs32[8]^Data_In2[5] )^ ( Pre_Fcs32[29]^Data_In2[4] ) )
	 	              ^( ( Pre_Fcs32[28]^Pre_Fcs32[24] )^ Data_In2[0] );
		 Cur_Fcs32[17]= ( ( Pre_Fcs32[9]^Data_In2[6] )^ ( Pre_Fcs32[30]^Data_In2[5] ) )
		               ^( ( Pre_Fcs32[29]^Data_In2[1] )^ Pre_Fcs32[25] ); 
		 Cur_Fcs32[18]= ( ( Pre_Fcs32[10]^Data_In2[7] )^ ( Pre_Fcs32[31]^Data_In2[6] ) )
		               ^( ( Pre_Fcs32[30]^Data_In2[2] )^ Pre_Fcs32[26] );
		 Cur_Fcs32[19]= ( ( Pre_Fcs32[11]^Data_In2[7] )^ ( Pre_Fcs32[31]^Data_In2[3] ) )
		                  ^ Pre_Fcs32[27];
	  Cur_Fcs32[20]= ( Pre_Fcs32[12]^Data_In2[4] )^ Pre_Fcs32[28];
	  Cur_Fcs32[21]= ( Pre_Fcs32[13]^Data_In2[5] )^ Pre_Fcs32[29];
	  Cur_Fcs32[22]= ( Pre_Fcs32[14]^Pre_Fcs32[24] )^ Data_In2[0];
	  Cur_Fcs32[23]= ( ( Pre_Fcs32[24]^Pre_Fcs32[30] )^( Data_In2[6]^Data_In2[0] ) )
 		              ^( ( Pre_Fcs32[15]^Data_In2[1] )^ Pre_Fcs32[25] );
	  Cur_Fcs32[24]= ( ( Pre_Fcs32[16]^Data_In2[2] )^ ( Pre_Fcs32[26]^Data_In2[1] ) )
 		              ^( ( Pre_Fcs32[25]^Data_In2[7] )^ Pre_Fcs32[31] );
	  Cur_Fcs32[25]= ( ( Pre_Fcs32[17]^Data_In2[3] )^ ( Pre_Fcs32[27]^Data_In2[2] ) )
	    	              ^ Pre_Fcs32[26];
	  Cur_Fcs32[26]= ( ( Pre_Fcs32[24]^Pre_Fcs32[30] )^( Data_In2[6]^Data_In2[0] ) )
	                ^( ( Pre_Fcs32[18]^Data_In2[4] )^( Pre_Fcs32[28]^Data_In2[3] ) )
		                  ^ Pre_Fcs32[27];
	  Cur_Fcs32[27]= ( ( Pre_Fcs32[19]^Data_In2[5] )^( Pre_Fcs32[29]^Data_In2[4] ) )
	 	              ^( ( Pre_Fcs32[28]^Data_In2[1] )^( Pre_Fcs32[25]^Data_In2[7] ) )
		                  ^ Pre_Fcs32[31];
	  Cur_Fcs32[28]= ( ( Pre_Fcs32[20]^Data_In2[6] )^( Pre_Fcs32[30]^Data_In2[2] ) )
	 	              ^( ( Pre_Fcs32[26]^Pre_Fcs32[29] )^Data_In2[5] );
		 Cur_Fcs32[29]= ( ( Pre_Fcs32[21]^Data_In2[7] )^( Pre_Fcs32[31]^Data_In2[6] ) )
		               ^( ( Pre_Fcs32[30]^Data_In2[3] )^ Pre_Fcs32[27] );
		 Cur_Fcs32[30]= ( ( Pre_Fcs32[22]^Data_In2[7] )^( Pre_Fcs32[31]^Data_In2[4] ) )
		                  ^ Pre_Fcs32[28];
		 Cur_Fcs32[31]= ( Pre_Fcs32[23]^Data_In2[5] )^Pre_Fcs32[29];	
  	FCS32 = Cur_Fcs32;
end
endfunction : FCS32

function bit[31:0] FCS32_8(const ref bit[7:0] Data_In2,const ref bit[31:0] Pre_Fcs32);//from SEE GFP_ENCAP
bit [31:0] Cur_Fcs32;

begin		
  Cur_Fcs32[0] = ( Pre_Fcs32[24]^Pre_Fcs32[30] ) ^ ( Data_In2[1]^Data_In2[7] );
  Cur_Fcs32[1] = ( ( Pre_Fcs32[24]^Pre_Fcs32[30] ) ^ ( Data_In2[1]^Data_In2[7] ) )
                  ^( ( Data_In2[6]^Pre_Fcs32[25] ) ^ ( Data_In2[0]^Pre_Fcs32[31] ) );
  Cur_Fcs32[2] = ( ( ( Pre_Fcs32[24]^Pre_Fcs32[30] ) ^( Data_In2[1]^Data_In2[7] ) )
                  ^( (Pre_Fcs32[26]^Data_In2[5] ) ^ ( Data_In2[6]^Pre_Fcs32[25] ) ) )
                  ^( ( Data_In2[0]^Pre_Fcs32[31] ) );
  Cur_Fcs32[3] = ( ( Pre_Fcs32[27]^Data_In2[4] ) ^ ( Data_In2[5]^Data_In2[6] ) )
                  ^( ( Pre_Fcs32[25]^Data_In2[0] ) ^ ( Pre_Fcs32[31]^Pre_Fcs32[26] ) );
  Cur_Fcs32[4] = ( ( ( Pre_Fcs32[24]^Pre_Fcs32[30] ) ^ ( Data_In2[1]^Data_In2[7] ) )
                  ^( ( Pre_Fcs32[28]^Data_In2[3] ) ^ ( Pre_Fcs32[27]^Data_In2[4] ) ) )
                  ^( Data_In2[5]^Pre_Fcs32[26] );
  Cur_Fcs32[5] = ( ( ( Pre_Fcs32[24]^Pre_Fcs32[30] )^ ( Data_In2[1]^Data_In2[7]   ) )
                  ^( ( Pre_Fcs32[29]^Data_In2[2]   )^ ( Data_In2[3]^Pre_Fcs32[28] ) ) )
                  ^( ( ( Data_In2[4]^Pre_Fcs32[27] ) ^ ( Data_In2[6]^Pre_Fcs32[25] ) )
                  ^( Pre_Fcs32[31]^Data_In2[0] ) );
  Cur_Fcs32[6] = ( ( ( Pre_Fcs32[31]^Pre_Fcs32[30] )^( Pre_Fcs32[29]^Pre_Fcs32[28] ) )
                  ^( ( Pre_Fcs32[26]^Pre_Fcs32[25] )^( Data_In2[6]^Data_In2[5] ) ) )
                  ^( ( Data_In2[3]^Data_In2[2] )^ ( Data_In2[1]^Data_In2[0] ) );
  Cur_Fcs32[7] = ( ( ( Pre_Fcs32[24]^Data_In2[7] )^( Pre_Fcs32[31]^Data_In2[0] ) )
                  ^( ( Data_In2[2]^Pre_Fcs32[29] )^( Data_In2[4]^Pre_Fcs32[27] ) ) )
                  ^( Data_In2[5]^Pre_Fcs32[26] );
  Cur_Fcs32[8] = ( ( ( Pre_Fcs32[24]^Data_In2[7] )^( Pre_Fcs32[0]^Data_In2[3]  ) )
                  ^( ( Pre_Fcs32[28]^Data_In2[4] )^( Pre_Fcs32[27]^Data_In2[6] ) ) )
                  ^ Pre_Fcs32[25];
  Cur_Fcs32[9] = ( ( ( Pre_Fcs32[1]^Pre_Fcs32[25] )^( Pre_Fcs32[26]^Pre_Fcs32[28] ) )
                  ^( ( Pre_Fcs32[29]^Data_In2[2] )^( Data_In2[3]^Data_In2[5] ) ) )
                  ^ Data_In2[6];
  Cur_Fcs32[10]= ( ( ( Pre_Fcs32[24]^Pre_Fcs32[2] )^( Data_In2[2]^Data_In2[7]  ) )
                  ^( ( Pre_Fcs32[29]^Data_In2[4] )^( Pre_Fcs32[27]^Data_In2[5] ) ) )
                  ^ Pre_Fcs32[26];
  Cur_Fcs32[11]= ( ( ( Pre_Fcs32[24]^Data_In2[7] )^( Pre_Fcs32[3]^Data_In2[3]  ) )
                  ^( ( Pre_Fcs32[28]^Data_In2[4] )^( Pre_Fcs32[27]^Data_In2[6] ) ) )
                  ^ Pre_Fcs32[25];
  Cur_Fcs32[12]= ( ( ( Pre_Fcs32[24]^Pre_Fcs32[30] )^( Data_In2[1]^Data_In2[7] ) )
                  ^( ( Pre_Fcs32[4]^Data_In2[2] )^( Pre_Fcs32[29]^Data_In2[3] ) ) )
                  ^( ( ( Pre_Fcs32[28]^Data_In2[5] )^( Pre_Fcs32[26]^Data_In2[6] ) )
                  ^ Pre_Fcs32[25] );
  Cur_Fcs32[13]= ( ( ( Data_In2[2]^Pre_Fcs32[29] )^( Data_In2[4]^Pre_Fcs32[27] ) )
                  ^( ( Data_In2[5]^Pre_Fcs32[26] )^( Data_In2[6]^Pre_Fcs32[25] ) ) )
                  ^( ( ( Data_In2[0]^Pre_Fcs32[31] )^( Pre_Fcs32[5]^Data_In2[1] ) )
                  ^ Pre_Fcs32[30] );
  Cur_Fcs32[14]= ( ( Pre_Fcs32[6]^Data_In2[0] )^( Pre_Fcs32[31]^Data_In2[1] ) )
                  ^( ( Pre_Fcs32[30]^Data_In2[3] )^( Pre_Fcs32[28]^Data_In2[4] ) )
                  ^( ( Pre_Fcs32[27]^Data_In2[5] )^ Pre_Fcs32[26] );
  Cur_Fcs32[15]= ( ( Pre_Fcs32[7]^Data_In2[0] )^( Pre_Fcs32[31]^Data_In2[2] ) )
                  ^( ( Pre_Fcs32[29]^Data_In2[3] )^( Pre_Fcs32[28]^Data_In2[4] ) )
                  ^ Pre_Fcs32[27];
  Cur_Fcs32[16]= ( ( Pre_Fcs32[8]^Data_In2[2] )^ ( Pre_Fcs32[29]^Data_In2[3] ) )
                  ^( ( Pre_Fcs32[28]^Pre_Fcs32[24] )^ Data_In2[7] );
  Cur_Fcs32[17]= ( ( Pre_Fcs32[9]^Data_In2[1] )^ ( Pre_Fcs32[30]^Data_In2[2] ) )
                  ^( ( Pre_Fcs32[29]^Data_In2[6] )^ Pre_Fcs32[25] ); 
  Cur_Fcs32[18]= ( ( Pre_Fcs32[10]^Data_In2[0] )^ ( Pre_Fcs32[31]^Data_In2[1] ) )
                  ^( ( Pre_Fcs32[30]^Data_In2[5] )^ Pre_Fcs32[26] );
  Cur_Fcs32[19]= ( ( Pre_Fcs32[11]^Data_In2[0] )^ ( Pre_Fcs32[31]^Data_In2[4] ) )
                  ^ Pre_Fcs32[27];
  Cur_Fcs32[20]= ( Pre_Fcs32[12]^Data_In2[3] )^ Pre_Fcs32[28];
  Cur_Fcs32[21]= ( Pre_Fcs32[13]^Data_In2[2] )^ Pre_Fcs32[29];
  Cur_Fcs32[22]= ( Pre_Fcs32[14]^Pre_Fcs32[24] )^ Data_In2[7];
  Cur_Fcs32[23]= ( ( Pre_Fcs32[24]^Pre_Fcs32[30] )^( Data_In2[1]^Data_In2[7] ) )
                  ^( ( Pre_Fcs32[15]^Data_In2[6] )^ Pre_Fcs32[25] );
  Cur_Fcs32[24]= ( ( Pre_Fcs32[16]^Data_In2[5] )^ ( Pre_Fcs32[26]^Data_In2[6] ) )
                  ^( ( Pre_Fcs32[25]^Data_In2[0] )^ Pre_Fcs32[31] );
  Cur_Fcs32[25]= ( ( Pre_Fcs32[17]^Data_In2[4] )^ ( Pre_Fcs32[27]^Data_In2[5] ) )
                  ^ Pre_Fcs32[26];
  Cur_Fcs32[26]= ( ( Pre_Fcs32[24]^Pre_Fcs32[30] )^( Data_In2[1]^Data_In2[7] ) )
                  ^( ( Pre_Fcs32[18]^Data_In2[3] )^( Pre_Fcs32[28]^Data_In2[4] ) )
                  ^ Pre_Fcs32[27];
  Cur_Fcs32[27]= ( ( Pre_Fcs32[19]^Data_In2[2] )^( Pre_Fcs32[29]^Data_In2[3] ) )
                  ^( ( Pre_Fcs32[28]^Data_In2[6] )^( Pre_Fcs32[25]^Data_In2[0] ) )
                  ^ Pre_Fcs32[31];
  Cur_Fcs32[28]= ( ( Pre_Fcs32[20]^Data_In2[1] )^( Pre_Fcs32[30]^Data_In2[5] ) )
                  ^( ( Pre_Fcs32[26]^Pre_Fcs32[29] )^Data_In2[2] );
  Cur_Fcs32[29]= ( ( Pre_Fcs32[21]^Data_In2[0] )^( Pre_Fcs32[31]^Data_In2[1] ) )
                  ^( ( Pre_Fcs32[30]^Data_In2[4] )^ Pre_Fcs32[27] );
  Cur_Fcs32[30]= ( ( Pre_Fcs32[22]^Data_In2[0] )^( Pre_Fcs32[31]^Data_In2[3] ) )
                  ^ Pre_Fcs32[28];
  Cur_Fcs32[31]= ( Pre_Fcs32[23]^Data_In2[2] )^Pre_Fcs32[29];
  FCS32_8 = Cur_Fcs32;
end
endfunction : FCS32_8		

endclass : crc_cal

`endif//CRC_CAL_SV