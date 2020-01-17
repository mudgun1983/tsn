library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_v1_6_5_gtwiz_reset is
    generic(
        P_FREERUN_FREQUENCY: real    := 2.000000e+02;
        P_USE_CPLL_CAL  : integer := 0;
        P_TX_PLL_TYPE   : integer := 0;
        P_RX_PLL_TYPE   : integer := 0;
        P_RX_LINE_RATE  : real    := 1.031250e+01;
        P_CDR_TIMEOUT_FREERUN_CYC: vl_logic_vector(25 downto 0)
    );
    port(
        gtwiz_reset_clk_freerun_in: in     vl_logic;
        gtwiz_reset_all_in: in     vl_logic;
        gtwiz_reset_tx_pll_and_datapath_in: in     vl_logic;
        gtwiz_reset_tx_datapath_in: in     vl_logic;
        gtwiz_reset_rx_pll_and_datapath_in: in     vl_logic;
        gtwiz_reset_rx_datapath_in: in     vl_logic;
        gtwiz_reset_rx_cdr_stable_out: out    vl_logic;
        gtwiz_reset_tx_done_out: out    vl_logic;
        gtwiz_reset_rx_done_out: out    vl_logic;
        gtwiz_reset_userclk_tx_active_in: in     vl_logic;
        gtwiz_reset_userclk_rx_active_in: in     vl_logic;
        gtpowergood_in  : in     vl_logic;
        txusrclk2_in    : in     vl_logic;
        plllock_tx_in   : in     vl_logic;
        txresetdone_in  : in     vl_logic;
        rxusrclk2_in    : in     vl_logic;
        plllock_rx_in   : in     vl_logic;
        rxcdrlock_in    : in     vl_logic;
        rxresetdone_in  : in     vl_logic;
        pllreset_tx_out : out    vl_logic;
        txprogdivreset_out: out    vl_logic;
        gttxreset_out   : out    vl_logic;
        txuserrdy_out   : out    vl_logic;
        pllreset_rx_out : out    vl_logic;
        rxprogdivreset_out: out    vl_logic;
        gtrxreset_out   : out    vl_logic;
        rxuserrdy_out   : out    vl_logic;
        tx_enabled_tie_in: in     vl_logic;
        rx_enabled_tie_in: in     vl_logic;
        shared_pll_tie_in: in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of P_FREERUN_FREQUENCY : constant is 2;
    attribute mti_svvh_generic_type of P_USE_CPLL_CAL : constant is 2;
    attribute mti_svvh_generic_type of P_TX_PLL_TYPE : constant is 2;
    attribute mti_svvh_generic_type of P_RX_PLL_TYPE : constant is 2;
    attribute mti_svvh_generic_type of P_RX_LINE_RATE : constant is 2;
    attribute mti_svvh_generic_type of P_CDR_TIMEOUT_FREERUN_CYC : constant is 4;
end gtwizard_ultrascale_v1_6_5_gtwiz_reset;
