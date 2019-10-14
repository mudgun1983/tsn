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
endfunction 

endclass

class PHY_PORT_TABLE extends uvm_object;
`uvm_object_utils( PHY_PORT_TABLE );


int unsigned table_size=5;

PHY_PORT_TABLE_CONTENT PHY_PORT_TABLE_CONTENT[table_size];

function new( string name = "" );
super.new( name );
PHY_PORT_TABLE_CONTENT = new[table_size];
set_config();
endfunction

function void set_config();
 PHY_PORT_TABLE_CONTENT[0].table_t.port_type	    = 2'd0  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.delay_asymmetry  = 48'd1 ;
 PHY_PORT_TABLE_CONTENT[0].table_t.phy_asymmetry	= 48'd0 ;
 PHY_PORT_TABLE_CONTENT[0].table_t.logic_port	    = 5'd0  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.ptp_en	        = 1'b1  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.i_mirror_en	    = 1'b0  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.i_mirror_to_port = 5'd0  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.key              = 5'd0  ;
 
 PHY_PORT_TABLE_CONTENT[1].table_t.port_type	    = 2'd0  ;
 PHY_PORT_TABLE_CONTENT[1].table_t.delay_asymmetry  = 48'd0 ;
 PHY_PORT_TABLE_CONTENT[1].table_t.phy_asymmetry	= 48'd0 ;
 PHY_PORT_TABLE_CONTENT[1].table_t.logic_port	    = 5'd1  ;
 PHY_PORT_TABLE_CONTENT[1].table_t.ptp_en	        = 1'b0  ;
 PHY_PORT_TABLE_CONTENT[1].table_t.i_mirror_en	    = 1'b1  ;
 PHY_PORT_TABLE_CONTENT[1].table_t.i_mirror_to_port = 5'd2  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.key              = 5'd1  ;
 
 PHY_PORT_TABLE_CONTENT[2].table_t.port_type	    = 2'd0  ;
 PHY_PORT_TABLE_CONTENT[2].table_t.delay_asymmetry  = 48'd0 ;
 PHY_PORT_TABLE_CONTENT[2].table_t.phy_asymmetry	= 48'd1 ;
 PHY_PORT_TABLE_CONTENT[2].table_t.logic_port	    = 5'd2  ;
 PHY_PORT_TABLE_CONTENT[2].table_t.ptp_en	        = 1'b0  ;
 PHY_PORT_TABLE_CONTENT[2].table_t.i_mirror_en	    = 1'b0  ;
 PHY_PORT_TABLE_CONTENT[2].table_t.i_mirror_to_port = 5'd0  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.key              = 5'd2  ;
 
 PHY_PORT_TABLE_CONTENT[3].table_t.port_type	    = 2'd3  ;
 PHY_PORT_TABLE_CONTENT[3].table_t.delay_asymmetry  = 48'd0 ;
 PHY_PORT_TABLE_CONTENT[3].table_t.phy_asymmetry	= 48'd0 ;
 PHY_PORT_TABLE_CONTENT[3].table_t.logic_port	    = 5'h1e  ;
 PHY_PORT_TABLE_CONTENT[3].table_t.ptp_en	        = 1'b0  ;
 PHY_PORT_TABLE_CONTENT[3].table_t.i_mirror_en	    = 1'b0  ;
 PHY_PORT_TABLE_CONTENT[3].table_t.i_mirror_to_port = 5'd0  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.key              = 5'h1e ;
 
 PHY_PORT_TABLE_CONTENT[4].table_t.port_type	    = 2'd2  ;
 PHY_PORT_TABLE_CONTENT[4].table_t.delay_asymmetry  = 48'd0 ;
 PHY_PORT_TABLE_CONTENT[4].table_t.phy_asymmetry	= 48'd0 ;
 PHY_PORT_TABLE_CONTENT[4].table_t.logic_port	    = 5'h1f  ;
 PHY_PORT_TABLE_CONTENT[4].table_t.ptp_en	        = 1'b0  ;
 PHY_PORT_TABLE_CONTENT[4].table_t.i_mirror_en	    = 1'b0  ;
 PHY_PORT_TABLE_CONTENT[4].table_t.i_mirror_to_port = 5'd0  ;
 PHY_PORT_TABLE_CONTENT[0].table_t.key              = 5'h1f ;
 
endfunction

endclass