// configuration class
//----------------------------------- PHY_PORT_TABLE ---------------------------//
class PHY_PORT_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
bit [5-1:0]  key ;
} table_key_s;

typedef struct packed
{
bit [2-1:0]  port_type	     ;
bit [48-1:0] delay_asymmetry ;
bit [48-1:0] phy_asymmetry	 ;
bit [5-1:0]  logic_port	     ;
bit [1-1:0]  ptp_en	         ;
bit [1-1:0]  i_mirror_en	 ;
bit [5-1:0]  i_mirror_to_port;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( PHY_PORT_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class PHY_PORT_TABLE extends uvm_object;
`uvm_object_utils( PHY_PORT_TABLE );


int unsigned table_size=5;

PHY_PORT_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[4:0]       = 5'd0;
 table_index[0].table_t    [109:0] = {2'd0,48'd1,48'd0,5'd0,1'b1,1'b0,5'd0};
 table_index[1].table_key_t[4:0]       = 5'd1;
 table_index[1].table_t    [109:0] = {2'd0,48'd0,48'd0,5'd1,1'b0,1'b1,5'd2};
 table_index[2].table_key_t[4:0]       = 5'h2;
 table_index[2].table_t    [109:0] = {2'd0,48'd0,48'd1,5'd2,1'b0,1'b0,5'd0};
 table_index[3].table_key_t[4:0]       = 5'h1e;
 table_index[3].table_t    [109:0] = {2'd3,48'd0,48'd0,5'h1e,1'b0,1'b0,5'd0};
 table_index[4].table_key_t[4:0]       = 5'h1f;
 table_index[4].table_t    [109:0] = {2'd2,48'd0,48'd0,5'h1f,1'b0,1'b0,5'd0};

 
endfunction

endclass
//----------------------------------- PHY_PORT_TABLE ---------------------------//


//----------------------------------- LOGIC_PORT_TABLE ---------------------------//
class LOGIC_PORT_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
bit [5 -1:0]   key                  ;
} table_key_s;

typedef struct packed
{
bit [4 -1:0]   out_tpid_en          ;
bit [1 -1:0]   mac_binding_en       ;
bit [48-1:0]   binding_mac_addr     ;
bit [1 -1:0]   ip_binding_en        ;
bit [32-1:0]   binding_ip_addr      ;
bit [16-1:0]   port_vlan            ;
bit [8 -1:0]   storm_control_index  ;
bit [4 -1:0]   iphb_ptr             ;
bit [1 -1:0]   l2_learn_dis         ;
bit [1 -1:0]   vt_en                ;
bit [1 -1:0]   vt_mis_drop          ;
bit [1 -1:0]   ing_filtering_en     ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( LOGIC_PORT_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class LOGIC_PORT_TABLE extends uvm_object;
`uvm_object_utils( LOGIC_PORT_TABLE );


int unsigned table_size=8;

LOGIC_PORT_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[4:0]       = 5'd0;
 table_index[0].table_t    [117:0] = {4'hf,1'b0,48'h10,1'b0,32'h0,16'h0010,8'h01,4'h0,1'b0,1'b1,1'b0,1'b1};
 table_index[1].table_key_t[4:0]       = 5'd1;
 table_index[1].table_t    [117:0] = {4'h1,1'b0,48'h10,1'b0,32'h0,16'h0010,8'h02,4'h0,1'b0,1'b0,1'b1,1'b0};
 table_index[2].table_key_t[4:0]       = 5'h2;
 table_index[2].table_t    [117:0] = {4'h3,1'b0,48'h10,1'b0,32'h0,16'h0020,8'h01,4'h1,1'b1,1'b1,1'b0,1'b1};
 table_index[3].table_key_t[4:0]       = 5'h3;
 table_index[3].table_t    [117:0] = {4'hf,1'b0,48'h10,1'b0,32'h0,16'h0020,8'h02,4'h0,1'b0,1'b0,1'b0,1'b1};
 table_index[4].table_key_t[4:0]       = 5'h4;
 table_index[4].table_t    [117:0] = {4'hf,1'b0,48'h10,1'b1,32'h01,16'h0012,8'h02,4'h0,1'b0,1'b1,1'b0,1'b0};
 table_index[5].table_key_t[4:0]       = 5'h5;
 table_index[5].table_t    [117:0] = {4'hf,1'b0,48'h10,1'b0,32'h01,16'h0000,8'h01,4'h0,1'b0,1'b1,1'b0,1'b0};
 table_index[6].table_key_t[4:0]       = 5'h6;
 table_index[6].table_t    [117:0] = {4'hf,1'b0,48'h10,1'b0,32'h01,16'h0000,8'h00,4'h0,1'b0,1'b1,1'b0,1'b1};
 table_index[7].table_key_t[4:0]       = 5'h7;
 table_index[7].table_t    [117:0] = {4'hf,1'b0,48'h10,1'b0,32'h01,16'h0000,8'h01,4'h0,1'b0,1'b0,1'b0,1'b1};

endfunction

endclass
//----------------------------------- LOGIC_PORT_TABLE ---------------------------//

//----------------------------------- L2_PROTOCOL_TABLE ---------------------------//
class L2_PROTOCOL_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
    bit [5 -1:0]   key                  ;
}table_key_s;

typedef struct packed
{	
	bit [1 -1:0]   rsv0                  ; 
    bit [1 -1:0]   rsv1                  ;
    bit [1 -1:0]   drop_bpdu            ;  
    bit [1 -1:0]   copy2cpu_bpdu        ;      
    bit [1 -1:0]   drop_gmrp            ;
    bit [1 -1:0]   copy2cpu_gmrp        ;
    bit [1 -1:0]   drop_gvrp            ;
    bit [1 -1:0]   copy2cpu_gvrp        ;
    bit [1 -1:0]   drop_lacp            ;
    bit [1 -1:0]   copy2cpu_lacp        ;
    bit [1 -1:0]   drop_efm             ;
    bit [1 -1:0]   copy2cpu_efm         ;
    bit [1 -1:0]   drop_essm            ;
    bit [1 -1:0]   copy2cpu_essm        ;
    bit [1 -1:0]   drop_lamp            ;
    bit [1 -1:0]   copy2cpu_lamp        ;
    bit [1 -1:0]   drop_lldp            ;
    bit [1 -1:0]   copy2cpu_lldp        ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( L2_PROTOCOL_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class L2_PROTOCOL_TABLE extends uvm_object;
`uvm_object_utils( L2_PROTOCOL_TABLE );


int unsigned table_size=2;

L2_PROTOCOL_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[4:0]       = 5'd1;
  table_index[0].table_t    [17:0]  = 18'b00_1100_0011_1100_0000;
  table_index[1].table_key_t[4:0]       = 5'd3;
  table_index[1].table_t    [17:0]  = 18'b00_0010_0100_0000_0000;
endfunction

endclass
//----------------------------------- L2_PROTOCOL_TABLE ---------------------------//

//----------------------------------- IPHB_TABLE ---------------------------//
class IPHB_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
bit [4-1:0] key0_iphb_ptr ;
bit [3-1:0] key1_ovlan_pri;
} table_key_s;

typedef struct packed
{
bit [3-1:0] table_index          ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( IPHB_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class IPHB_TABLE extends uvm_object;
`uvm_object_utils( IPHB_TABLE );


int unsigned table_size=8;

IPHB_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[6:0]     = {4'd0,3'd0};  
  table_index[0].table_t    [2:0] = 3'd1;
  table_index[1].table_key_t[6:0]     = {4'd0,3'd1};
  table_index[1].table_t    [2:0] = 3'd0;
  table_index[2].table_key_t[6:0]     = {4'd0,3'd2};
  table_index[2].table_t    [2:0] = 3'd6;
  table_index[3].table_key_t[6:0]     = {4'd0,3'd3};
  table_index[3].table_t    [2:0] = 3'd7;
  table_index[4].table_key_t[6:0]     = {4'd0,3'd4};
  table_index[4].table_t    [2:0] = 3'd2;
  table_index[5].table_key_t[6:0]     = {4'd0,3'd5};
  table_index[5].table_t    [2:0] = 3'd3;
  table_index[6].table_key_t[6:0]     = {4'd0,3'd6};
  table_index[6].table_t    [2:0] = 3'd4;
  table_index[7].table_key_t[6:0]     = {4'd0,3'd7};
  table_index[7].table_t    [2:0] = 3'd5;
endfunction
endclass	
//----------------------------------- IPHB_TABLE ---------------------------//

//-----------------------------------IVLAN_XLATE_TABLE---------------------------//
class IVLAN_XLATE_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
bit [5 -1:0] key0_spp_port       ;
bit [12-1:0] key1_vlan_id        ;
} table_key_s;

typedef struct packed
{
bit [1 -1:0] valid               ;
bit [8 -1:0] rsv0                 ;
bit [3 -1:0] new_pri             ;
bit [1 -1:0] new_cfi             ;
bit [12-1:0] new_vlan_id         ;
bit [4 -1:0] itag_action_pro_ptr ;
bit [3 -1:0] rsv1                 ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( IVLAN_XLATE_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class IVLAN_XLATE_TABLE extends uvm_object;
`uvm_object_utils( IVLAN_XLATE_TABLE );


int unsigned table_size=2;

IVLAN_XLATE_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[16:0]     = {5'd5,12'h100};
  table_index[0].table_t    [30:0] = {1'b1,7'd0,3'd0,1'd0,12'h010,4'd1,3'd0};
  table_index[1].table_key_t[16:0]     = {5'd5,12'h200};
  table_index[1].table_t    [30:0] = {1'b1,7'd0,3'd1,1'd0,12'h020,4'd1,3'd0};

endfunction

endclass
//-----------------------------------IVLAN_XLATE_TABLE---------------------------//

//----------------------------------- IVLAN_PROPERTY_TABLE ---------------------------//
class IVLAN_PROPERTY_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
bit [11:0]      i_vlan_id        ;
} table_key_s;

typedef struct packed
{
bit [52-52:0]   valid            ;
bit [51-43:0]   rsv              ;
bit [42-42:0]   learn_disable    ;
bit [41-41:0]   l2_miss_drop     ;
bit [40-40:0]   stg_valid        ;
bit [39-32:0]   stg_id           ;
bit [31-0 :0]   vlan_port_bitmap ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( IVLAN_PROPERTY_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class IVLAN_PROPERTY_TABLE extends uvm_object;
`uvm_object_utils( IVLAN_PROPERTY_TABLE );


int unsigned table_size=4;

IVLAN_PROPERTY_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[11:0]     = 12'h10;
 table_index[0].table_t    [52:0] = {1'b1,9'd0,1'b0,1'b0,1'b1,8'd0,32'b0000_0000_0000_0000_0000_0000_0010_0011};
 table_index[1].table_key_t[11:0]     = 12'h20;
 table_index[1].table_t    [52:0] = {1'b1,9'd0,1'b0,1'b0,1'b1,8'd1,32'b0000_0000_0000_0000_0000_0000_0010_1100};
 table_index[2].table_key_t[11:0]     = 12'h300;
 table_index[2].table_t    [52:0] = {1'b1,9'd0,1'b0,1'b0,1'b0,8'd1,32'b0000_0000_0000_0000_0000_0001_1110_0000};
 table_index[3].table_key_t[11:0]     = 12'h400;
 table_index[3].table_t    [52:0] = {1'b1,9'd0,1'b0,1'b0,1'b0,8'd1,32'b0000_0000_0000_0000_0000_0001_1010_0000};

endfunction

endclass
//----------------------------------- IVLAN_PROPERTY_TABLE ---------------------------//

//----------------------------------- IVLAN_ACTION_TABLE ---------------------------//
class IVLAN_ACTION_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  bit [3 -0 :0]  tag_action_ptr;
} table_key_s;
  
typedef struct packed
{ 
  bit [17-16:0]  dt_ocfi_action;
  bit [15-14:0]  dt_opri_action;
  bit [13-12:0]  dt_otag_action;
  bit [11-10:0]  st_cfi_action ;
  bit [9 -8 :0]  st_pri_action ;
  bit [7 -6 :0]  st_tag_action ;
  bit [5 -4 :0]  ut_ocfi_action;
  bit [3 -2 :0]  ut_opri_action;
  bit [1 -0 :0]  ut_otag_action;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( IVLAN_ACTION_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class IVLAN_ACTION_TABLE extends uvm_object;
`uvm_object_utils( IVLAN_ACTION_TABLE );


int unsigned table_size=2;

IVLAN_ACTION_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[3:0]      = 4'd1;
  table_index[0].table_t    [17:0] = {2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b00,2'b00,2'b00};
  table_index[1].table_key_t[3:0]      = 4'd0;
  table_index[1].table_t    [17:0] = {2'b00,2'b00,2'b00,2'b00,2'b00,2'b00,2'b01,2'b01,2'b01};

endfunction

endclass
//----------------------------------- IVLAN_ACTION_TABLE ---------------------------//

//----------------------------------- IVLAN_STG_TABLE ---------------------------//
class IVLAN_STG_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
bit [7 -0 :0] stg_id         ;
} table_key_s;

typedef struct packed
{
bit [63:0] sp_tree_port ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( IVLAN_STG_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class IVLAN_STG_TABLE extends uvm_object;
`uvm_object_utils( IVLAN_STG_TABLE );


int unsigned table_size=2;

IVLAN_STG_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[7:0]      = 8'd0;
  table_index[0].table_t    [63:0] = 64'h0000_0000_0000_0c0f;
  table_index[1].table_key_t[7:0]      = 8'd1;
  table_index[1].table_t    [63:0] = 64'h0000_0000_0000_0cf0;

endfunction

endclass
//----------------------------------- IVLAN_STG_TABLE ---------------------------//

//----------------------------------- L2_MAC_TABLE ---------------------------//
class L2_MAC_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [11-0 :0 ] vid    ;
  bit [47-0 :0 ] sa_da  ;
  //--------
}table_key_s;

typedef struct packed
{  
  //resaunlt---
  bit [19-19:0]    valid      ;
  bit [18-14:0]    rsv        ;
  bit [13-13:0]    static_reg ;
  bit [12-12:0]    src_discard;
  bit [11-11:0]    dst_discard;
  bit [10 -9:0]    dst_type   ;
  bit [8  -0:0]    destination; 
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( L2_MAC_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class L2_MAC_TABLE extends uvm_object;
`uvm_object_utils( L2_MAC_TABLE );


int unsigned table_size=3;

L2_MAC_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[59:0]     = {12'h300,48'h0000_0100_0100};
  table_index[0].table_t    [19:0] = {1'b1,5'd0,1'b0,1'b0,1'b1,2'd0,9'd0};
  table_index[1].table_key_t[59:0]     = {12'h300,48'h0100_0100_0100};
  table_index[1].table_t    [19:0] = {1'b1,5'd0,1'b1,1'b0,1'b0,2'd2,9'd1};
  table_index[2].table_key_t[59:0]     = {12'h010,48'h0100_0000_0333};
  table_index[2].table_t    [19:0] = {1'b1,5'd0,1'b1,1'b0,1'b0,2'd1,9'd200};

endfunction

endclass

//----------------------------------- L2_MAC_TABLE ---------------------------//

//----------------------------------- STORM_POLICER_ID_TABLE ---------------------------//
class STORM_POLICER_ID_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [1-0:0] rx_storm_fw_type ;
  bit [7-0:0] storm_ctl_index  ;
  //--------
} table_key_s;

typedef struct packed
{  
  //resaunlt---
  bit [17-17:0]   valid      ;
  bit [16-9 :0]   rsv        ;
  bit [8-0  :0]   policer_id ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( STORM_POLICER_ID_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class STORM_POLICER_ID_TABLE extends uvm_object;
`uvm_object_utils( STORM_POLICER_ID_TABLE );


int unsigned table_size=3;

STORM_POLICER_ID_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[9:0]      = {2'b11,8'd1};//ubc
  table_index[0].table_t    [17:0] = {1'b1,8'd0,9'd1};
  table_index[1].table_key_t[9:0]      = {2'b10,8'd1};//umc
  table_index[1].table_t    [17:0] = {1'b1,8'd0,9'd2};                                                                       
  table_index[2].table_key_t[9:0]      = {2'b01,8'd1};//uuc
  table_index[2].table_t    [17:0] = {1'b1,8'd0,9'd3};
endfunction

endclass
//----------------------------------- STORM_POLICER_ID_TABLE ---------------------------//

//----------------------------------- ING_FLOW_TABLE ---------------------------//
class ING_FLOW_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [4 -0:0]  sport  ;
  bit [11-0:0]  vlan_id; 
  bit [47-0:0]  da     ;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [79-79 :0 ]   valid       ;
  bit [78-75 :0 ]   rsv         ;
  bit [74-65 :0 ]   ing_flow_id ;
  bit [64-60 :0 ]   sport       ;
  bit [59-48 :0 ]   vlan_id     ;
  bit [47-0  :0 ]   da          ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( ING_FLOW_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class ING_FLOW_TABLE extends uvm_object;
`uvm_object_utils( ING_FLOW_TABLE );


int unsigned table_size=13;

ING_FLOW_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[64:0]     = {5'd0,12'h010,48'h0000_0000_0103};
 table_index[0].table_t    [14:0] = {1'b1,4'd0,10'd0};
 table_index[1].table_key_t[64:0]     = {5'd1,12'h010,48'h0000_0000_0103};
 table_index[1].table_t    [14:0] = {1'b1,4'd0,10'd1};                  
 table_index[2].table_key_t[64:0]     = {5'd2,12'h020,48'h0000_0000_0203};
 table_index[2].table_t    [14:0] = {1'b1,4'd0,10'd2};
 table_index[3].table_key_t[64:0]     = {5'd3,12'h020,48'h0000_0000_0203};
 table_index[3].table_t    [14:0] = {1'b1,4'd0,10'd3};
 table_index[4].table_key_t[64:0]     = {5'd5,12'h010,48'h0000_0000_0101};
 table_index[4].table_t    [14:0] = {1'b1,4'd0,10'd4};
 table_index[5].table_key_t[64:0]     = {5'd5,12'h010,48'h0000_0000_0102};
 table_index[5].table_t    [14:0] = {1'b1,4'd0,10'd5};
 table_index[6].table_key_t[64:0]     = {5'd5,12'h020,48'h0000_0000_0201};
 table_index[6].table_t    [14:0] = {1'b1,4'd0,10'd6};
 table_index[7].table_key_t[64:0]     = {5'd5,12'h020,48'h0000_0000_0202};
 table_index[7].table_t    [14:0] = {1'b1,4'd0,10'd7};
 table_index[8].table_key_t[64:0]     = {5'd7,12'h300,48'h0100_0100_0100};
 table_index[8].table_t    [14:0] = {1'b1,4'd0,10'd8};
 table_index[9].table_key_t[64:0]     = {5'd5,12'h300,48'h0000_0000_0223};
 table_index[9].table_t    [14:0] = {1'b1,4'd0,10'd9};
 table_index[10].table_key_t[64:0]     = {5'd8,12'h300,48'h0000_0000_0223};
 table_index[10].table_t    [14:0] = {1'b1,4'd0,10'd9};
 table_index[11].table_key_t[64:0]     = {5'd5,12'h400,48'h0000_0000_0223};
 table_index[11].table_t    [14:0] = {1'b1,4'd0,10'd10};
 table_index[12].table_key_t[64:0]     = {5'd8,12'h400,48'h0000_0000_0223};
 table_index[12].table_t    [14:0] = {1'b1,4'd0,10'd10};
endfunction

endclass
//----------------------------------- ING_FLOW_TABLE ---------------------------//

//----------------------------------- ING_FLOW_PRO_TABLE ---------------------------//
class ING_FLOW_PRO_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [2-0:0]  table_index        ;
  bit [9-0:0]  ing_flow_id ;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [19-19:0]    gate_id_valid   ;
  bit [18-10:0]    ing_gate_id     ;
  bit [9-9  :0]    policer_id_valid;
  bit [8-0  :0]    policer_id      ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( ING_FLOW_PRO_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class ING_FLOW_PRO_TABLE extends uvm_object;
`uvm_object_utils( ING_FLOW_PRO_TABLE );


int unsigned table_size=10;

ING_FLOW_PRO_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[12:0]     = {3'd0,10'd0};
  table_index[0].table_t    [19:0] = {1'b1,9'd1,1'b0,9'd0};
  table_index[1].table_key_t[12:0]     = {3'd1,10'd0};
  table_index[1].table_t    [19:0] = {1'b1,9'd1,1'b0,9'd0};
  table_index[2].table_key_t[12:0]     = {3'd0,10'd1};
  table_index[2].table_t    [19:0] = {1'b1,9'd1,1'b0,9'd0};
  table_index[3].table_key_t[12:0]     = {3'd1,10'd1};
  table_index[3].table_t    [19:0] = {1'b1,9'd1,1'b0,9'd0};
  table_index[4].table_key_t[12:0]     = {3'd0,10'd2};
  table_index[4].table_t    [19:0] = {1'b1,9'd2,1'b0,9'd0};
  table_index[5].table_key_t[12:0]     = {3'd1,10'd2};
  table_index[5].table_t    [19:0] = {1'b1,9'd2,1'b0,9'd0};
  table_index[6].table_key_t[12:0]     = {3'd0,10'd3};
  table_index[6].table_t    [19:0] = {1'b1,9'd2,1'b0,9'd0};
  table_index[7].table_key_t[12:0]     = {3'd1,10'd3};
  table_index[7].table_t    [19:0] = {1'b1,9'd2,1'b0,9'd0};
  table_index[8].table_key_t[12:0]     = {3'd0,10'd8};
  table_index[8].table_t    [19:0] = {1'b0,9'd2,1'b1,9'd1};
  table_index[9].table_key_t[12:0]     = {3'd1,10'd8};
  table_index[9].table_t    [19:0] = {1'b0,9'd2,1'b1,9'd1};
endfunction

endclass
//----------------------------------- ING_FLOW_PRO_TABLE ---------------------------//

//----------------------------------- ING_GATE_TABLE ---------------------------//
class ING_GATE_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [3-0:0] time_slot  ;
  bit [8-0:0] ing_gate_id; 
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [19-19:0]   valid           ;
  bit [18-12:0]   rsv             ;
  bit [11-4 :0]   ing_gate_stat   ;
  bit [3-3  :0]   regen_ipv_valid ;
  bit [2-0  :0]   regen_ipv       ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( ING_GATE_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class ING_GATE_TABLE extends uvm_object;
`uvm_object_utils( ING_GATE_TABLE );


int unsigned table_size=4;

ING_GATE_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[12:0]     = {4'd0,9'd1};
 table_index[0].table_t    [19:0] = {1'b1,7'd0,8'hff,1'b0,3'd5};
 table_index[1].table_key_t[12:0]     = {4'd1,9'd1};
 table_index[1].table_t    [19:0] = {1'b1,7'd0,8'h00,1'b1,3'd3};
 table_index[2].table_key_t[12:0]     = {4'd0,9'd2};
 table_index[2].table_t    [19:0] = {1'b1,7'd0,8'h00,1'b1,3'd3};
 table_index[3].table_key_t[12:0]     = {4'd1,9'd2};
 table_index[3].table_t    [19:0] = {1'b1,7'd0,8'hff,1'b0,3'd3};
endfunction

endclass
//----------------------------------- ING_GATE_TABLE ---------------------------//

//----------------------------------- POLICER_TOKEN_TABLE ---------------------------//
class POLICER_TOKEN_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [8-0:0] policer_id;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [31-31:0]    valid            ;
  bit [30-24:0]    rsv              ;
  bit [23-22:0]    token_granularity; 
  bit [21-0 :0]    token            ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( POLICER_TOKEN_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class POLICER_TOKEN_TABLE extends uvm_object;
`uvm_object_utils( POLICER_TOKEN_TABLE );


int unsigned table_size=2;

POLICER_TOKEN_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[8:0]      = 9'd1;
  table_index[0].table_t    [31:0] = {1'b1,7'd0,2'b01,22'd0};    
  table_index[1].table_key_t[8:0]      = 9'd2;
  table_index[1].table_t    [31:0] = {1'b1,7'd0,2'b10,22'd0};
endfunction

endclass
//----------------------------------- POLICER_TOKEN_TABLE ---------------------------//

//----------------------------------- POLICER_CONF_TABLE ---------------------------//
class POLICER_CONF_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [8-0:0] policer_id;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [35-35:0]    valid  ;
  bit [34-21:0]    cir    ;
  bit [20-0 :0]    cbs    ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( POLICER_CONF_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass


class POLICER_CONF_TABLE extends uvm_object;
`uvm_object_utils( POLICER_CONF_TABLE );


int unsigned table_size=2;

POLICER_CONF_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[8:0]      = 9'd1;
 table_index[0].table_t    [35:0] = {1'b1,14'd512,21'd16000};  
 table_index[1].table_key_t[8:0]      = 9'd2;
 table_index[1].table_t    [35:0] = {1'b1,14'd256,21'd2000};
endfunction

endclass
//----------------------------------- POLICER_CONF_TABLE ---------------------------//

//----------------------------------- FRER_REC_TABLE ---------------------------//
class FRER_REC_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [9-0:0] flow_id;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [143-143:0]     valid           ;
  bit [142-138:0]     rsv             ;
  bit [137-137:0]     rec_algorithm   ;
  bit [136-136:0]     listener_agent  ;
  bit [135-0  :0]     sq_valid        ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( FRER_REC_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class FRER_REC_TABLE extends uvm_object;
`uvm_object_utils( FRER_REC_TABLE );


int unsigned table_size=2;

FRER_REC_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[9:0]       = 10'd9;
  table_index[0].table_t    [143:0] = {1'b1,5'd0,1'b1,1'b1,136'd0};
  table_index[1].table_key_t[9:0]       = 10'd10;
  table_index[1].table_t    [143:0] = {1'b1,5'd0,1'b0,1'b0,136'd0};
endfunction

endclass
//----------------------------------- FRER_REC_TABLE ---------------------------//

//----------------------------------- RX_PTP_FORWARD_TABLE ---------------------------//
class RX_PTP_FORWARD_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [3:0] message_type;
  bit [4:0] phy_port    ;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit  [35-2 :0 ] rsv           ;
  bit  [1 -0 :0 ] fw_destination;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( RX_PTP_FORWARD_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class RX_PTP_FORWARD_TABLE extends uvm_object;
`uvm_object_utils( RX_PTP_FORWARD_TABLE );


int unsigned table_size=2;

RX_PTP_FORWARD_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[8:0]      = {4'd0,5'd0};
 table_index[0].table_t    [35:0] = {34'd0,2'd2};
 table_index[1].table_key_t[8:0]      = {4'ha,5'd0};
 table_index[1].table_t    [35:0] = {34'd0,2'd3};
endfunction

endclass
//----------------------------------- RX_PTP_FORWARD_TABLE ---------------------------//

//----------------------------------- OUT_FP_TABLE ---------------------------//
class OUT_FP_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [9:0] dvp_id;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [71-71:0]   valid     ;
  bit [70-65:0]   rsv0       ;
  bit [64-64:0]   sq_en     ;
  bit [63-63:0]   w_valid   ;
  bit [62-53:0]   rsv1       ;
  bit [52-48:0]   w_fp_oport; 
  bit [47-36:0]   rsv2       ;
  bit [35-33:0]   rsv3       ;
  bit [32-32:0]   rsv4       ;
  bit [31-31:0]   p_valid   ;
  bit [30-21:0]   rsv       ;
  bit [20-16:0]   p_fp_oport; 
  bit [15-4 :0]   rsv5       ; 
  bit [3 -1 :0]   rsv6       ; 
  bit [0    :0]   rsv7       ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( OUT_FP_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class OUT_FP_TABLE extends uvm_object;
`uvm_object_utils( OUT_FP_TABLE );


int unsigned table_size=1;

OUT_FP_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[9:0]      = 10'd1;
 table_index[0].table_t    [71:0] = {1'b1,6'd0,1'b1,1'b1,10'd0,5'd5,16'd0,1'b1,10'd0,5'd8,16'd0};
endfunction

endclass
//----------------------------------- OUT_FP_TABLE ---------------------------//

//----------------------------------- L2_MC_TABLE ---------------------------//
class L2_MC_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [7:0] mc_index;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [32-32:0]    valid         ;
  bit [31-0 :0]    mc_port_bitmap;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin( L2_MC_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class L2_MC_TABLE extends uvm_object;
`uvm_object_utils( L2_MC_TABLE );


int unsigned table_size=1;

L2_MC_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[7:0]      = 8'd200;
 table_index[0].table_t    [32:0] = {1'b1,32'h00f0_f0f0}; 
endfunction

endclass

//----------------------------------- L2_MC_TABLE ---------------------------//

//----------------------------------- TIME_SLOT_TABLE ---------------------------//
class TIME_SLOT_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [3:0] time_slot;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [31:0] time_slot_length;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(TIME_SLOT_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class TIME_SLOT_TABLE extends uvm_object;
`uvm_object_utils( TIME_SLOT_TABLE );


int unsigned table_size=2;

TIME_SLOT_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[3:0]      = 4'd0;
 table_index[0].table_t    [31:0] = 32'd126;
 table_index[1].table_key_t[3:0]      = 4'd1;
 table_index[1].table_t    [31:0] = 32'd100;
endfunction

endclass
//----------------------------------- TIME_SLOT_TABLE ---------------------------//

//----------------------------------- EVLAN_XLATE_TABLE ---------------------------//
class EVLAN_XLATE_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [4 -0:0] oport ;
  bit [11-0:0] vt_vid;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [47-47:0]   valid           ;
  bit [46-37:0]   rsv             ;
  bit [36-25:0]   evxlt_vid       ;
  bit [24-22:0]   evxlt_pri       ;
  bit [21-21:0]   evxlt_cfi       ;
  bit [20-17:0]   evlan_action_ptr; 
  bit [16-12:0]   key_oport       ;
  bit [11-0 :0]   key_vid         ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(EVLAN_XLATE_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class EVLAN_XLATE_TABLE extends uvm_object;
`uvm_object_utils( EVLAN_XLATE_TABLE );


int unsigned table_size=2;

EVLAN_XLATE_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[16:0] = {5'd5,12'h010};
 table_index[0].table_t    [30:0] = {1'b1,10'd0,12'h100,3'h0,1'b0,4'd0};
 table_index[1].table_key_t[16:0] = {5'd5,12'h020};
 table_index[1].table_t    [30:0] = {1'b1,10'd0,12'h200,3'h1,1'b0,4'd1};

endfunction

endclass
//----------------------------------- EVLAN_XLATE_TABLE ---------------------------//

//----------------------------------- EVLAN_ACTION_TABLE ---------------------------//
class EVLAN_ACTION_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [3:0]  evlan_action_ptr;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [17-16:0]  dt_ocfi_action ;
  bit [15-14:0]  dt_opri_action ;
  bit [13-12:0]  dt_otag_action ;
  bit [11-10:0]  st_cfi_action ;
  bit [9 -8 :0]  st_pri_action ;
  bit [7 -6 :0]  st_tag_action ;
  bit [5 -4 :0]  ut_ocfi_action ;
  bit [3 -2 :0]  ut_opri_action ;
  bit [1 -0 :0]  ut_otag_action ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(EVLAN_ACTION_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class EVLAN_ACTION_TABLE extends uvm_object;
`uvm_object_utils( EVLAN_ACTION_TABLE );


int unsigned table_size=2;

EVLAN_ACTION_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[3:0] = {4'd0};
 table_index[0].table_t    [17:0] = {2'b11,2'b11,2'b10,2'b00,2'b00,2'b10,2'b00,2'b00,2'b01};
 table_index[1].table_key_t[3:0] = {4'd1};
 table_index[1].table_t    [17:0] = {2'b10,2'b00,2'b10,2'b01,2'b10,2'b10,2'b01,2'b01,2'b01};
endfunction

endclass
//----------------------------------- EVLAN_ACTION_TABLE ---------------------------// 

//----------------------------------- EVLAN_PROPERTY_TABLE ---------------------------// 
class EVLAN_PROPERTY_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [11:0] vt_vid;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [52-52:0]    valid            ;
  bit [51-46:0]    rsv              ;
  bit [45-45:0]    remark_dot1p     ;
  bit [44-41:0]    dot1p_mapping_ptr; 
  bit [40-40:0]    stg_id_valid     ;
  bit [39-32:0]    stg_id           ;
  bit [31-0 :0]    port_membership  ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(EVLAN_PROPERTY_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class EVLAN_PROPERTY_TABLE extends uvm_object;
`uvm_object_utils( EVLAN_PROPERTY_TABLE );


int unsigned table_size=2;

EVLAN_PROPERTY_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[11:0] = {12'h010};
  table_index[0].table_t    [52:0] = {1'b1,6'd0,1'b1,4'd1,1'b1,8'h10,32'h0000_0023};
  table_index[1].table_key_t[11:0] = {12'h020};
  table_index[1].table_t    [52:0] = {1'b1,6'd0,1'b1,4'd2,1'b0,8'h10,32'h0000_002c};

endfunction

endclass
//----------------------------------- EVLAN_PROPERTY_TABLE ---------------------------// 

//----------------------------------- EVLAN_STG_TABLE ---------------------------//
class EVLAN_STG_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [7:0] stg_id;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [63:0] sp_tree_port;
  //[63:62]:sp_tree_port32[1:0]
  //[61:60]:sp_tree_port31[1:0]
  //[59:58]:sp_tree_port30[1:0]
  // ……
  //[17:16]:sp_tree_port9[1:0]
  //[15:14]:sp_tree_port8[1:0]
  //[13:12]:sp_tree_port7[1:0]
  //[11:10]:sp_tree_port6[1:0]
  //[9:8]  :sp_tree_port5[1:0]
  //[7:6]  :sp_tree_port3[1:0]
  //[5:4]  :sp_tree_port2[1:0]
  //[3:2]  :sp_tree_port1[1:0]
  //[1:0]  :sp_tree_port0[1:0]
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(EVLAN_STG_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class EVLAN_STG_TABLE extends uvm_object;
`uvm_object_utils( EVLAN_STG_TABLE );


int unsigned table_size=2;

EVLAN_STG_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
table_index[0].table_key_t[7:0] = {8'h10};
table_index[0].table_t    [63:0] = {32'h0000_0000,32'h0000_0c0b};
table_index[1].table_key_t[7:0] = {8'h20};
table_index[1].table_t    [63:0] = {32'h0000_0000,32'h0000_0008};
endfunction

endclass
//----------------------------------- EVLAN_STG_TABLE ---------------------------//

//----------------------------------- OPORT_PRO_TABLE ---------------------------//
class OPORT_PRO_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [4:0] oport;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit  [17-16:0]   out_tpid_sel   ;
  bit  [15-15:0]   ophb_map_valid ;
  bit  [14-11:0]   ophb_map_ptr   ;
  bit  [10-10:0]   e_filter_en    ;
  bit  [9-9  :0]   lag_port       ;
  bit  [8-6  :0]   lag_index      ;
  bit  [5-4  :0]   num_of_member  ;
  bit  [3-2  :0]   hash_fac       ;
  bit  [1-0  :0]   rsv            ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(OPORT_PRO_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class OPORT_PRO_TABLE extends uvm_object;
`uvm_object_utils( OPORT_PRO_TABLE );


int unsigned table_size=3;

OPORT_PRO_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[4:0] = {5'd0};
 table_index[0].table_t    [17:0] = {2'b00,1'b1,4'd2,1'b1,1'b0,3'd0,2'd0,2'd0,2'd0};
 table_index[1].table_key_t[4:0] = {5'd1};
 table_index[1].table_t    [17:0] = {2'b00,1'b1,4'd2,1'b1,1'b1,3'd1,2'd3,2'd0,2'd0};
 table_index[2].table_key_t[4:0] = {5'd5};
 table_index[2].table_t    [17:0] = {2'b11,1'b1,4'd3,1'b1,1'b0,3'd0,2'd0,2'd0,2'd0};

endfunction

endclass
//----------------------------------- OPORT_PRO_TABLE ---------------------------//

//----------------------------------- DOT1P_MAP_TABLE ---------------------------//
class DOT1P_MAP_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [6-3:0]  dot1p_mapping_ptr ;
  bit [2-0:0]  ophb              ;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [17-17:0]    valid  ;
  bit [16-4 :0]    rsv    ;
  bit [3 -1 :0]    map_pri; 
  bit [0 -0 :0]    map_c  ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(DOT1P_MAP_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class DOT1P_MAP_TABLE extends uvm_object;
`uvm_object_utils( DOT1P_MAP_TABLE );


int unsigned table_size=3;

DOT1P_MAP_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
 table_index[0].table_key_t[6:0] = {4'd1,3'd0};
 table_index[0].table_t    [17:0] = {1'b1,13'd0,3'd1,1'b0};
 table_index[1].table_key_t[6:0] = {4'd2,3'd0};
 table_index[1].table_t    [17:0] = {1'b1,13'd0,3'd2,1'b0};
 table_index[2].table_key_t[6:0] = {4'd3,3'd0};
 table_index[2].table_t    [17:0] = {1'b1,13'd0,3'd3,1'b1};

endfunction

endclass
//----------------------------------- DOT1P_MAP_TABLE ---------------------------//

//----------------------------------- LAG_SEL_PORT_TABLE ---------------------------//
class LAG_SEL_PORT_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [6-4:0]  lag_index;
  bit [3-0:0]  mem_index;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [17-5:0]   rsv      ;
  bit [4 -0:0]   phy_port ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(LAG_SEL_PORT_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class LAG_SEL_PORT_TABLE extends uvm_object;
`uvm_object_utils( LAG_SEL_PORT_TABLE );


int unsigned table_size=3;

LAG_SEL_PORT_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[6:0] = {3'd1,4'd0};
  table_index[0].table_t    [17:0] = {13'd0,5'd1};
  table_index[1].table_key_t[6:0] = {3'd1,4'd1};
  table_index[1].table_t    [17:0] = {13'd0,5'd10};
  table_index[2].table_key_t[6:0] = {3'd1,4'd2};
  table_index[2].table_t    [17:0] = {13'd0,5'd11};
endfunction

endclass
//----------------------------------- LAG_SEL_PORT_TABLE ---------------------------//


//----------------------------------- O_PHY_PORT_PRO_TABLE ---------------------------//
class O_PHY_PORT_PRO_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
  //key----
  bit [4:0] o_phy_port;
  //--------
} table_key_s;
typedef struct packed
{  
  //resaunlt---
  bit [117-104:0]   rsv0               ;
  bit [103-56 :0]   link_asymmetry    ;
  bit [55 -8  :0]   phy_asymmetry     ;
  bit [7  -7  :0]   rsv1               ;
  bit [6  -6  :0]   ptp_en            ;
  bit [5  -5  :0]   o_mirror_en       ;
  bit [4  -0  :0]   o_mirror_port     ;
} table_s ;

table_key_s table_key_t;
table_s table_t;

`uvm_object_utils_begin(O_PHY_PORT_PRO_TABLE_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class O_PHY_PORT_PRO_TABLE extends uvm_object;
`uvm_object_utils( O_PHY_PORT_PRO_TABLE );


int unsigned table_size=1;

O_PHY_PORT_PRO_TABLE_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
  table_index[0].table_key_t[4:0] = 4'd5;
  table_index[0].table_t    [117:0] = {112'd0,1'b1,5'd0};
endfunction

endclass
//----------------------------------- O_PHY_PORT_PRO_TABLE ---------------------------//
