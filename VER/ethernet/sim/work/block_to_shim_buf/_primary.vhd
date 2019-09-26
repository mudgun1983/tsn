library verilog;
use verilog.vl_types.all;
entity block_to_shim_buf is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        shim_tx_clk     : in     vl_logic;
        fifo_syn_rst    : in     vl_logic;
        block_data_i    : in     vl_logic_vector(65 downto 0);
        block_valid_i   : in     vl_logic;
        block_req       : in     vl_logic;
        block_data_o    : out    vl_logic_vector(65 downto 0);
        block_valid_o   : out    vl_logic;
        buf_empty_o     : out    vl_logic;
        fifo_empty_o    : out    vl_logic;
        fifo_full_o     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end block_to_shim_buf;
