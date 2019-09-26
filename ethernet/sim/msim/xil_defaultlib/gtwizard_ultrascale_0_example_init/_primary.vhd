library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_0_example_init is
    generic(
        P_FREERUN_FREQUENCY: real    := 2.500000e+02;
        P_TX_TIMER_DURATION_US: real    := 3.000000e+04;
        P_RX_TIMER_DURATION_US: real    := 1.300000e+05
    );
    port(
        clk_freerun_in  : in     vl_logic;
        reset_all_in    : in     vl_logic;
        tx_init_done_in : in     vl_logic;
        rx_init_done_in : in     vl_logic;
        rx_data_good_in : in     vl_logic;
        reset_all_out   : out    vl_logic;
        reset_rx_out    : out    vl_logic;
        init_done_out   : out    vl_logic;
        retry_ctr_out   : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of P_FREERUN_FREQUENCY : constant is 2;
    attribute mti_svvh_generic_type of P_TX_TIMER_DURATION_US : constant is 2;
    attribute mti_svvh_generic_type of P_RX_TIMER_DURATION_US : constant is 2;
end gtwizard_ultrascale_0_example_init;
