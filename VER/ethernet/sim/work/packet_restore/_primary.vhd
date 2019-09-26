library verilog;
use verilog.vl_types.all;
entity packet_restore is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        fifo_syn_rst    : in     vl_logic;
        err_i           : in     vl_logic;
        valid_i         : in     vl_logic;
        data_i          : in     vl_logic_vector(7 downto 0);
        sop_i           : in     vl_logic;
        eop_i           : in     vl_logic;
        err_o           : out    vl_logic;
        valid_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0);
        sop_o           : out    vl_logic;
        eop_o           : out    vl_logic;
        packet_rdy_o    : out    vl_logic;
        rd_packet       : out    vl_logic;
        shim_buf_empty  : in     vl_logic;
        packet_discard_o: out    vl_logic;
        fifo_empty_o    : out    vl_logic;
        fifo_full_o     : out    vl_logic;
        fifo_aempty_o   : out    vl_logic;
        fifo_afull_o    : out    vl_logic;
        fifo_data_cnt_o : out    vl_logic_vector(12 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end packet_restore;
