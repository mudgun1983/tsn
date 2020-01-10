class CB_CONTENT extends uvm_object;
    bit        cb_valid      =1;
    bit        rec_algorithm ;  //1'b0-match_alg; 1'b1-vector_alg. 
	bit        listener_agent;  //1'b0-listener agent不使能； 1'b1-listener agent使能。 
	bit        sq_en         ;  //1'b0-不需要添加序列号； 1'b1-需要添加序列号
	bit        w_valid       ;
	bit [4:0]  w_fp_oport    ;
	bit        p_valid       ;
	bit [4:0]  p_fp_oport    ;

`uvm_object_utils_begin(CB_CONTENT);
`uvm_object_utils_end

function new( string name = "" );
super.new( name );
endfunction

endclass

class CB_CONTENT_TABLE extends uvm_object;
`uvm_object_utils( CB_CONTENT_TABLE );

int unsigned table_size=10;

CB_CONTENT table_index[];

function new( string name = "" );
super.new( name );
table_index = new[table_size];
for(int i=0;i<table_size;i++)
  table_index[i] = new();
set_config();
endfunction

function void set_config();
endfunction

endclass