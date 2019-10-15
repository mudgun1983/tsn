// configuration class
class PHY_PORT_TABLE_CONTENT extends uvm_object;

typedef struct packed
{
bit [5-1:0]  key ;
bit [2-1:0]  port_type	     ;
bit [48-1:0] delay_asymmetry ;
bit [48-1:0] phy_asymmetry	 ;
bit [5-1:0]  logic_port	     ;
bit [1-1:0]  ptp_en	         ;
bit [1-1:0]  i_mirror_en	 ;
bit [5-1:0]  i_mirror_to_port;
} table_s ;
table_s table_t;

`uvm_object_utils_begin( PHY_PORT_TABLE_CONTENT );
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

// function void pack_register();
// packed_data = {port_type	     ,
               // delay_asymmetry   ,
               // phy_asymmetry	 ,
               // logic_port	     ,
               // ptp_en	         ,
               // i_mirror_en	     ,
               // i_mirror_to_port  ,
// }
//endfunction 

endclass

class PHY_PORT_TABLE extends uvm_object;
`uvm_object_utils( PHY_PORT_TABLE );


int unsigned table_size=5;

PHY_PORT_TABLE_CONTENT phy_port_pro[];

function new( string name = "" );
super.new( name );
phy_port_pro = new[table_size];
for(int i=0;i<table_size;i++)
  phy_port_pro[i] = new();
set_config();
endfunction

function void set_config();
 phy_port_pro[0].table_t.port_type	    = 2'd0  ;
 phy_port_pro[0].table_t.delay_asymmetry  = 48'd1 ;
 phy_port_pro[0].table_t.phy_asymmetry	= 48'd0 ;
 phy_port_pro[0].table_t.logic_port	    = 5'd0  ;
 phy_port_pro[0].table_t.ptp_en	        = 1'b1  ;
 phy_port_pro[0].table_t.i_mirror_en	    = 1'b0  ;
 phy_port_pro[0].table_t.i_mirror_to_port = 5'd0  ;
 phy_port_pro[0].table_t.key              = 5'd0  ;
 
 phy_port_pro[1].table_t.port_type	    = 2'd0  ;
 phy_port_pro[1].table_t.delay_asymmetry  = 48'd0 ;
 phy_port_pro[1].table_t.phy_asymmetry	= 48'd0 ;
 phy_port_pro[1].table_t.logic_port	    = 5'd1  ;
 phy_port_pro[1].table_t.ptp_en	        = 1'b0  ;
 phy_port_pro[1].table_t.i_mirror_en	    = 1'b1  ;
 phy_port_pro[1].table_t.i_mirror_to_port = 5'd2  ;
 phy_port_pro[1].table_t.key              = 5'd1  ;
 
 phy_port_pro[2].table_t.port_type	    = 2'd0  ;
 phy_port_pro[2].table_t.delay_asymmetry  = 48'd0 ;
 phy_port_pro[2].table_t.phy_asymmetry	= 48'd1 ;
 phy_port_pro[2].table_t.logic_port	    = 5'd2  ;
 phy_port_pro[2].table_t.ptp_en	        = 1'b0  ;
 phy_port_pro[2].table_t.i_mirror_en	    = 1'b0  ;
 phy_port_pro[2].table_t.i_mirror_to_port = 5'd0  ;
 phy_port_pro[2].table_t.key              = 5'd2  ;
 
 phy_port_pro[3].table_t.port_type	    = 2'd3  ;
 phy_port_pro[3].table_t.delay_asymmetry  = 48'd0 ;
 phy_port_pro[3].table_t.phy_asymmetry	= 48'd0 ;
 phy_port_pro[3].table_t.logic_port	    = 5'h1e  ;
 phy_port_pro[3].table_t.ptp_en	        = 1'b0  ;
 phy_port_pro[3].table_t.i_mirror_en	    = 1'b0  ;
 phy_port_pro[3].table_t.i_mirror_to_port = 5'd0  ;
 phy_port_pro[3].table_t.key              = 5'h1e ;
 
 phy_port_pro[4].table_t.port_type	    = 2'd2  ;
 phy_port_pro[4].table_t.delay_asymmetry  = 48'd0 ;
 phy_port_pro[4].table_t.phy_asymmetry	= 48'd0 ;
 phy_port_pro[4].table_t.logic_port	    = 5'h1f  ;
 phy_port_pro[4].table_t.ptp_en	        = 1'b0  ;
 phy_port_pro[4].table_t.i_mirror_en	    = 1'b0  ;
 phy_port_pro[4].table_t.i_mirror_to_port = 5'd0  ;
 phy_port_pro[4].table_t.key              = 5'h1f ;
 
endfunction

endclass