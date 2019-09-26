library verilog;
use verilog.vl_types.all;
entity packet_reassemble is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0);
        valid_o         : out    vl_logic;
        err_o           : out    vl_logic;
        packet_rdy_0    : in     vl_logic;
        rd_packet_en_0  : out    vl_logic;
        valid_i_0       : in     vl_logic;
        is_t0_block_0   : in     vl_logic;
        sop_i_0         : in     vl_logic;
        eop_i_0         : in     vl_logic;
        data_i_0        : in     vl_logic_vector(7 downto 0);
        packet_rdy_1    : in     vl_logic;
        rd_packet_en_1  : out    vl_logic;
        valid_i_1       : in     vl_logic;
        is_t0_block_1   : in     vl_logic;
        sop_i_1         : in     vl_logic;
        eop_i_1         : in     vl_logic;
        data_i_1        : in     vl_logic_vector(7 downto 0);
        rd_packet_robin : out    vl_logic;
        shim0_vlan      : in     vl_logic_vector(15 downto 0);
        shim1_vlan      : in     vl_logic_vector(15 downto 0);
        packet_rcv      : out    vl_logic;
        crc_ind         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end packet_reassemble;
