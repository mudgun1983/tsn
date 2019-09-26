library verilog;
use verilog.vl_types.all;
entity dcn_top is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        shim_tx_clk     : in     vl_logic;
        shim0_rx_clk    : in     vl_logic;
        shim1_rx_clk    : in     vl_logic;
        err_i           : in     vl_logic;
        valid_i         : in     vl_logic;
        data_i          : in     vl_logic_vector(7 downto 0);
        err_o           : out    vl_logic;
        valid_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0);
        mana_sect_shim0_dat0_ien_i: in     vl_logic;
        mana_sect_shim0_dat1_ien_i: in     vl_logic;
        mana_sect_shim0_dat_o: out    vl_logic_vector(65 downto 0);
        mana_sect_shim0_dat_vld_o: out    vl_logic;
        mana_sect_shim0_sect_data_0_1_ind: out    vl_logic;
        mana_sect_shim1_dat0_ien_i: in     vl_logic;
        mana_sect_shim1_dat1_ien_i: in     vl_logic;
        mana_sect_shim1_dat_o: out    vl_logic_vector(65 downto 0);
        mana_sect_shim1_dat_vld_o: out    vl_logic;
        mana_sect_shim1_sect_data_0_1_ind: out    vl_logic;
        mana_sect_shim0_dat0_i: in     vl_logic_vector(65 downto 0);
        mana_sect_shim0_dat1_i: in     vl_logic_vector(65 downto 0);
        mana_sect_shim0_dat0_vld_i: in     vl_logic;
        mana_sect_shim0_dat1_vld_i: in     vl_logic;
        mana_sect_shim1_dat0_i: in     vl_logic_vector(65 downto 0);
        mana_sect_shim1_dat1_i: in     vl_logic_vector(65 downto 0);
        mana_sect_shim1_dat0_vld_i: in     vl_logic;
        mana_sect_shim1_dat1_vld_i: in     vl_logic;
        cpu_clk         : in     vl_logic;
        cpu_rst         : in     vl_logic;
        cpu_addr        : in     vl_logic_vector(11 downto 0);
        cpu_cs          : in     vl_logic;
        cpu_rd          : in     vl_logic;
        cpu_wr          : in     vl_logic;
        cpu_din         : in     vl_logic_vector(15 downto 0);
        cpu_dout        : out    vl_logic_vector(15 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end dcn_top;
