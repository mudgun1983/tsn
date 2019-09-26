library verilog;
use verilog.vl_types.all;
entity decode_64b66b_dcn is
    generic(
        NUM             : integer := 5;
        DATA_WIDTH      : integer := 68;
        BLOCK_WIDTH     : integer := 66
    );
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        decode_mode     : in     vl_logic;
        decode_rxd_in   : in     vl_logic_vector;
        decode_rxdv_in  : in     vl_logic;
        decode_rxd_out  : out    vl_logic_vector;
        decode_rxdv_out : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NUM : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BLOCK_WIDTH : constant is 1;
end decode_64b66b_dcn;
