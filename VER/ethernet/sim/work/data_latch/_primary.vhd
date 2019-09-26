library verilog;
use verilog.vl_types.all;
entity data_latch is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        shim_rx_clk     : in     vl_logic;
        block_data_i    : in     vl_logic_vector(65 downto 0);
        block_valid_i   : in     vl_logic;
        block_data_o    : out    vl_logic_vector(65 downto 0);
        block_valid_o   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end data_latch;
