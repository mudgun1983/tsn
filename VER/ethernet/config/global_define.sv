//PHY_PORT_TABLE
//`define DUMMY_DUT

//global define
`define PTP_ETYPE 16'h88F7

typedef struct packed
{
bit        port_en;
int        packet_count;
bit [47:0] da_index;
bit [47:0] sa_index;
} port_stimulus_t;

port_stimulus_t port_stimulus_s[20];

function set_port_stimulus_value();
for(int i=0; i<20;i++)
  begin
   port_stimulus_s[i] = 0;
  end
  
// port_stimulus_s[0].port_en = 1;
// port_stimulus_s[1].port_en = 1;
port_stimulus_s[2].port_en = 1;
port_stimulus_s[3].port_en = 1;
port_stimulus_s[4].port_en = 1;
port_stimulus_s[5].port_en = 1;
port_stimulus_s[6].port_en = 1;
port_stimulus_s[7].port_en = 1;
port_stimulus_s[8].port_en = 1;
port_stimulus_s[9].port_en = 1;
port_stimulus_s[10].port_en = 1;
port_stimulus_s[11].port_en = 1;
port_stimulus_s[12].port_en = 1;
port_stimulus_s[13].port_en = 1;
port_stimulus_s[14].port_en = 1;
port_stimulus_s[15].port_en = 1;
port_stimulus_s[16].port_en = 1;
port_stimulus_s[17].port_en = 1;
port_stimulus_s[18].port_en = 1;
port_stimulus_s[19].port_en = 1;

port_stimulus_s[0].packet_count = 1;  //0: forever
port_stimulus_s[1].packet_count = 1;
//port_stimulus_s[2].packet_count = 1; //comment means no limit, it will generate packet forever
//port_stimulus_s[3].packet_count = 1;
//port_stimulus_s[4].packet_count = 1;
//port_stimulus_s[5].packet_count = 1;
//port_stimulus_s[6].packet_count = 1;
//port_stimulus_s[7].packet_count = 1;
//port_stimulus_s[8].packet_count = 1;
//port_stimulus_s[9].packet_count = 1;
//port_stimulus_s[10].packet_count = 1;
//port_stimulus_s[11].packet_count = 1;
//port_stimulus_s[12].packet_count = 1;
//port_stimulus_s[13].packet_count = 1;
//port_stimulus_s[14].packet_count = 1;
//port_stimulus_s[15].packet_count = 1;
//port_stimulus_s[16].packet_count = 1;
//port_stimulus_s[17].packet_count = 1;
//port_stimulus_s[18].packet_count = 1;
//port_stimulus_s[19].packet_count = 1;

port_stimulus_s[0].sa_index = 0;   
port_stimulus_s[1].sa_index = 1;
port_stimulus_s[2].sa_index = 2;  
port_stimulus_s[3].sa_index = 3;
port_stimulus_s[4].sa_index = 4;
port_stimulus_s[5].sa_index = 5;
port_stimulus_s[6].sa_index = 6;
port_stimulus_s[7].sa_index = 7;
port_stimulus_s[8].sa_index = 8;
port_stimulus_s[9].sa_index = 9;
port_stimulus_s[10].sa_index = 10;
port_stimulus_s[11].sa_index = 11;
port_stimulus_s[12].sa_index = 12;
port_stimulus_s[13].sa_index = 13;
port_stimulus_s[14].sa_index = 14;
port_stimulus_s[15].sa_index = 15;
port_stimulus_s[16].sa_index = 16;
port_stimulus_s[17].sa_index = 17;
port_stimulus_s[18].sa_index = 18;
port_stimulus_s[19].sa_index = 19;

port_stimulus_s[0].da_index =   0;//(19- 0);   
port_stimulus_s[1].da_index =   1;//(19- 1);
port_stimulus_s[2].da_index =   2;//(19- 2);  
port_stimulus_s[3].da_index =   3;//(19- 3);
port_stimulus_s[4].da_index =   4;//(19- 4);
port_stimulus_s[5].da_index =   5;//(19- 5);
port_stimulus_s[6].da_index =   6;//(19- 6);
port_stimulus_s[7].da_index =   7;//(19- 7);
port_stimulus_s[8].da_index =   8;//(19- 8);
port_stimulus_s[9].da_index =   9;//(19- 9);
port_stimulus_s[10].da_index = 10;//(19-10);
port_stimulus_s[11].da_index = 11;//(19-11);
port_stimulus_s[12].da_index = 12;//(19-12);
port_stimulus_s[13].da_index = 13;//(19-13);
port_stimulus_s[14].da_index = 14;//(19-14);
port_stimulus_s[15].da_index = 15;//(19-15);
port_stimulus_s[16].da_index = 16;//(19-16);
port_stimulus_s[17].da_index = 17;//(19-17);
port_stimulus_s[18].da_index = 18;//(19-18);
port_stimulus_s[19].da_index = 19;//(19-19);


endfunction
