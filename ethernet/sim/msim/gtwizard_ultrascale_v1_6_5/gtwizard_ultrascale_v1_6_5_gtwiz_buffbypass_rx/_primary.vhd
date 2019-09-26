library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_v1_6_5_gtwiz_buffbypass_rx is
    generic(
        P_BUFFER_BYPASS_MODE: integer := 0;
        P_TOTAL_NUMBER_OF_CHANNELS: integer := 1;
        P_MASTER_CHANNEL_POINTER: integer := 0
    );
    port(
        gtwiz_buffbypass_rx_clk_in: in     vl_logic;
        gtwiz_buffbypass_rx_reset_in: in     vl_logic;
        gtwiz_buffbypass_rx_start_user_in: in     vl_logic;
        gtwiz_buffbypass_rx_resetdone_in: in     vl_logic;
        gtwiz_buffbypass_rx_done_out: out    vl_logic;
        gtwiz_buffbypass_rx_error_out: out    vl_logic;
        rxphaligndone_in: in     vl_logic_vector;
        rxdlysresetdone_in: in     vl_logic_vector;
        rxsyncout_in    : in     vl_logic_vector;
        rxsyncdone_in   : in     vl_logic_vector;
        rxphdlyreset_out: out    vl_logic_vector;
        rxphalign_out   : out    vl_logic_vector;
        rxphalignen_out : out    vl_logic_vector;
        rxphdlypd_out   : out    vl_logic_vector;
        rxphovrden_out  : out    vl_logic_vector;
        rxdlysreset_out : out    vl_logic_vector;
        rxdlybypass_out : out    vl_logic_vector;
        rxdlyen_out     : out    vl_logic_vector;
        rxdlyovrden_out : out    vl_logic_vector;
        rxsyncmode_out  : out    vl_logic_vector;
        rxsyncallin_out : out    vl_logic_vector;
        rxsyncin_out    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of P_BUFFER_BYPASS_MODE : constant is 2;
    attribute mti_svvh_generic_type of P_TOTAL_NUMBER_OF_CHANNELS : constant is 2;
    attribute mti_svvh_generic_type of P_MASTER_CHANNEL_POINTER : constant is 2;
end gtwizard_ultrascale_v1_6_5_gtwiz_buffbypass_rx;
