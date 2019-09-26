library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_v1_6_5_gtwiz_userdata_tx is
    generic(
        P_TX_USER_DATA_WIDTH: integer := 32;
        P_TX_DATA_ENCODING: integer := 0;
        P_TOTAL_NUMBER_OF_CHANNELS: integer := 1
    );
    port(
        gtwiz_userdata_tx_in: in     vl_logic_vector;
        txdata_out      : out    vl_logic_vector;
        txctrl0_out     : out    vl_logic_vector;
        txctrl1_out     : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of P_TX_USER_DATA_WIDTH : constant is 2;
    attribute mti_svvh_generic_type of P_TX_DATA_ENCODING : constant is 2;
    attribute mti_svvh_generic_type of P_TOTAL_NUMBER_OF_CHANNELS : constant is 2;
end gtwizard_ultrascale_v1_6_5_gtwiz_userdata_tx;
