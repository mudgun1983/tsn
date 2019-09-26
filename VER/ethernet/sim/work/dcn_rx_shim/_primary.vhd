library verilog;
use verilog.vl_types.all;
entity dcn_rx_shim is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        shim_rx_clk     : in     vl_logic;
        packet_restore_fifo_syn_rst: in     vl_logic;
        is_t0_block_o   : out    vl_logic;
        valid_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0);
        sop_o           : out    vl_logic;
        eop_o           : out    vl_logic;
        packet_rdy_o    : out    vl_logic;
        rd_packet_en_i  : in     vl_logic;
        block_data_i    : in     vl_logic_vector(65 downto 0);
        block_valid_i   : in     vl_logic;
        restore_packet_discard_o: out    vl_logic;
        restore_fifo_empty_o: out    vl_logic;
        restore_fifo_full_o: out    vl_logic;
        restore_fifo_data_cnt_o: out    vl_logic_vector(12 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end dcn_rx_shim;
