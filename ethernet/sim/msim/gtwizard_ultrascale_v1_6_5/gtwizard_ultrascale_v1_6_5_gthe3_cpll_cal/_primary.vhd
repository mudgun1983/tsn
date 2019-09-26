library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_v1_6_5_gthe3_cpll_cal is
    generic(
        REVISION        : integer := 2
    );
    port(
        TXOUTCLK_PERIOD_IN: in     vl_logic_vector(17 downto 0);
        WAIT_DEASSERT_CPLLPD_IN: in     vl_logic_vector(15 downto 0);
        CNT_TOL_IN      : in     vl_logic_vector(17 downto 0);
        FREQ_COUNT_WINDOW_IN: in     vl_logic_vector(15 downto 0);
        RESET_IN        : in     vl_logic;
        CLK_IN          : in     vl_logic;
        USER_TXPROGDIVRESET_IN: in     vl_logic;
        USER_TXPRGDIVRESETDONE_OUT: out    vl_logic;
        USER_TXOUTCLKSEL_IN: in     vl_logic_vector(2 downto 0);
        USER_TXOUTCLK_BUFG_CE_IN: in     vl_logic;
        USER_TXOUTCLK_BUFG_CLR_IN: in     vl_logic;
        USER_CPLLLOCK_OUT: out    vl_logic;
        USER_CHANNEL_DRPADDR_IN: in     vl_logic_vector(8 downto 0);
        USER_CHANNEL_DRPDI_IN: in     vl_logic_vector(15 downto 0);
        USER_CHANNEL_DRPEN_IN: in     vl_logic;
        USER_CHANNEL_DRPWE_IN: in     vl_logic;
        USER_CHANNEL_DRPRDY_OUT: out    vl_logic;
        USER_CHANNEL_DRPDO_OUT: out    vl_logic_vector(15 downto 0);
        CPLL_CAL_FAIL   : out    vl_logic;
        CPLL_CAL_DONE   : out    vl_logic;
        DEBUG_OUT       : out    vl_logic_vector(15 downto 0);
        GTHE3_TXOUTCLK_IN: in     vl_logic;
        GTHE3_CPLLLOCK_IN: in     vl_logic;
        GTHE3_CPLLRESET_OUT: out    vl_logic;
        GTHE3_CPLLPD_OUT: out    vl_logic;
        GTHE3_TXPROGDIVRESET_OUT: out    vl_logic;
        GTHE3_TXOUTCLKSEL_OUT: out    vl_logic_vector(2 downto 0);
        GTHE3_TXPRGDIVRESETDONE_IN: in     vl_logic;
        GTHE3_CHANNEL_DRPADDR_OUT: out    vl_logic_vector(8 downto 0);
        GTHE3_CHANNEL_DRPDI_OUT: out    vl_logic_vector(15 downto 0);
        GTHE3_CHANNEL_DRPEN_OUT: out    vl_logic;
        GTHE3_CHANNEL_DRPWE_OUT: out    vl_logic;
        GTHE3_CHANNEL_DRPRDY_IN: in     vl_logic;
        GTHE3_CHANNEL_DRPDO_IN: in     vl_logic_vector(15 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of REVISION : constant is 1;
end gtwizard_ultrascale_v1_6_5_gthe3_cpll_cal;
