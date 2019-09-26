library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_v1_6_5_gtwiz_buffbypass_tx is
    generic(
        P_BUFFER_BYPASS_MODE: integer := 0;
        P_TOTAL_NUMBER_OF_CHANNELS: integer := 1;
        P_MASTER_CHANNEL_POINTER: integer := 0
    );
    port(
        gtwiz_buffbypass_tx_clk_in: in     vl_logic;
        gtwiz_buffbypass_tx_reset_in: in     vl_logic;
        gtwiz_buffbypass_tx_start_user_in: in     vl_logic;
        gtwiz_buffbypass_tx_resetdone_in: in     vl_logic;
        gtwiz_buffbypass_tx_done_out: out    vl_logic;
        gtwiz_buffbypass_tx_error_out: out    vl_logic;
        txphaligndone_in: in     vl_logic_vector;
        txphinitdone_in : in     vl_logic_vector;
        txdlysresetdone_in: in     vl_logic_vector;
        txsyncout_in    : in     vl_logic_vector;
        txsyncdone_in   : in     vl_logic_vector;
        txphdlyreset_out: out    vl_logic_vector;
        txphalign_out   : out    vl_logic_vector;
        txphalignen_out : out    vl_logic_vector;
        txphdlypd_out   : out    vl_logic_vector;
        txphinit_out    : out    vl_logic_vector;
        txphovrden_out  : out    vl_logic_vector;
        txdlysreset_out : out    vl_logic_vector;
        txdlybypass_out : out    vl_logic_vector;
        txdlyen_out     : out    vl_logic_vector;
        txdlyovrden_out : out    vl_logic_vector;
        txphdlytstclk_out: out    vl_logic_vector;
        txdlyhold_out   : out    vl_logic_vector;
        txdlyupdown_out : out    vl_logic_vector;
        txsyncmode_out  : out    vl_logic_vector;
        txsyncallin_out : out    vl_logic_vector;
        txsyncin_out    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of P_BUFFER_BYPASS_MODE : constant is 2;
    attribute mti_svvh_generic_type of P_TOTAL_NUMBER_OF_CHANNELS : constant is 2;
    attribute mti_svvh_generic_type of P_MASTER_CHANNEL_POINTER : constant is 2;
end gtwizard_ultrascale_v1_6_5_gtwiz_buffbypass_tx;
