library verilog;
use verilog.vl_types.all;
entity insert_s_t_block is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        err_i           : in     vl_logic;
        valid_i         : in     vl_logic;
        data_i          : in     vl_logic_vector(7 downto 0);
        sop_i           : in     vl_logic;
        eop_i           : in     vl_logic;
        valid_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(63 downto 0);
        txc_o           : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end insert_s_t_block;
