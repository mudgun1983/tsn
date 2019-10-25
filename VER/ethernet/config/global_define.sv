//PHY_PORT_TABLE
//`define DUMMY_DUT

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
// port_stimulus_s[4].port_en = 1;
// port_stimulus_s[5].port_en = 1;
// port_stimulus_s[6].port_en = 1;
// port_stimulus_s[7].port_en = 1;
// port_stimulus_s[8].port_en = 1;
// port_stimulus_s[9].port_en = 1;
// port_stimulus_s[10].port_en = 1;
// port_stimulus_s[11].port_en = 1;
// port_stimulus_s[12].port_en = 1;
// port_stimulus_s[13].port_en = 1;
// port_stimulus_s[14].port_en = 1;
// port_stimulus_s[15].port_en = 1;
// port_stimulus_s[16].port_en = 1;
// port_stimulus_s[17].port_en = 1;
// port_stimulus_s[18].port_en = 1;
// port_stimulus_s[19].port_en = 1;

port_stimulus_s[0].packet_count = 1;  //0: forever
port_stimulus_s[1].packet_count = 1;
//port_stimulus_s[2].packet_count = 1;
port_stimulus_s[3].packet_count = 1;
port_stimulus_s[4].packet_count = 1;
port_stimulus_s[5].packet_count = 1;
port_stimulus_s[6].packet_count = 1;
port_stimulus_s[7].packet_count = 1;
port_stimulus_s[8].packet_count = 1;
port_stimulus_s[9].packet_count = 1;
port_stimulus_s[10].packet_count = 1;
port_stimulus_s[11].packet_count = 1;
port_stimulus_s[12].packet_count = 1;
port_stimulus_s[13].packet_count = 1;
port_stimulus_s[14].packet_count = 1;
port_stimulus_s[15].packet_count = 1;
port_stimulus_s[16].packet_count = 1;
port_stimulus_s[17].packet_count = 1;
port_stimulus_s[18].packet_count = 1;
port_stimulus_s[19].packet_count = 1;

endfunction
