library verilog;
use verilog.vl_types.all;
entity dcn_rx_top is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        shim0_rx_clk    : in     vl_logic;
        shim1_rx_clk    : in     vl_logic;
        err_o           : out    vl_logic;
        valid_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0);
        mana_sect_shim0_dat0_i: in     vl_logic_vector(65 downto 0);
        mana_sect_shim0_dat1_i: in     vl_logic_vector(65 downto 0);
        mana_sect_shim0_dat0_vld_i: in     vl_logic;
        mana_sect_shim0_dat1_vld_i: in     vl_logic;
        mana_sect_shim1_dat0_i: in     vl_logic_vector(65 downto 0);
        mana_sect_shim1_dat1_i: in     vl_logic_vector(65 downto 0);
        mana_sect_shim1_dat0_vld_i: in     vl_logic;
        mana_sect_shim1_dat1_vld_i: in     vl_logic;
        vlan_to_shim0   : in     vl_logic_vector(15 downto 0);
        vlan_to_shim1   : in     vl_logic_vector(15 downto 0);
        packet_restore_fifo_syn_rst: in     vl_logic;
        restore_packet_discard_shim0: out    vl_logic;
        restore_fifo_empty_shim0: out    vl_logic;
        restore_fifo_full_shim0: out    vl_logic;
        restore_fifo_data_cnt_shim0: out    vl_logic_vector(12 downto 0);
        restore_packet_discard_shim1: out    vl_logic;
        restore_fifo_empty_shim1: out    vl_logic;
        restore_fifo_full_shim1: out    vl_logic;
        restore_fifo_data_cnt_shim1: out    vl_logic_vector(12 downto 0);
        packet_rcv      : out    vl_logic;
        crc_ind         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end dcn_rx_top;
