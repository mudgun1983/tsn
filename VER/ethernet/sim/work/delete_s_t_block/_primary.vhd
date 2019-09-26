library verilog;
use verilog.vl_types.all;
entity delete_s_t_block is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        rst             : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        data_i          : in     vl_logic_vector(63 downto 0);
        txc_i           : in     vl_logic_vector(3 downto 0);
        valid_i         : in     vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0);
        valid_o         : out    vl_logic;
        sop_o           : out    vl_logic;
        eop_o           : out    vl_logic;
        is_t0_block_o   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end delete_s_t_block;
