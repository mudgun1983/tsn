library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_0_example_gtwiz_userclk_tx is
    generic(
        P_CONTENTS      : integer := 0;
        P_FREQ_RATIO_SOURCE_TO_USRCLK: integer := 1;
        P_FREQ_RATIO_USRCLK_TO_USRCLK2: integer := 1
    );
    port(
        gtwiz_userclk_tx_srcclk_in: in     vl_logic;
        gtwiz_userclk_tx_reset_in: in     vl_logic;
        gtwiz_userclk_tx_usrclk_out: out    vl_logic;
        gtwiz_userclk_tx_usrclk2_out: out    vl_logic;
        gtwiz_userclk_tx_active_out: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of P_CONTENTS : constant is 2;
    attribute mti_svvh_generic_type of P_FREQ_RATIO_SOURCE_TO_USRCLK : constant is 2;
    attribute mti_svvh_generic_type of P_FREQ_RATIO_USRCLK_TO_USRCLK2 : constant is 2;
end gtwizard_ultrascale_0_example_gtwiz_userclk_tx;
