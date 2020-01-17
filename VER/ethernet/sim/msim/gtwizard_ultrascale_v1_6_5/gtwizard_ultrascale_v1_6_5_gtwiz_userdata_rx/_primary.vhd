library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_v1_6_5_gtwiz_userdata_rx is
    generic(
        P_RX_USER_DATA_WIDTH: integer := 32;
        P_RX_DATA_DECODING: integer := 0;
        P_TOTAL_NUMBER_OF_CHANNELS: integer := 1
    );
    port(
        rxdata_in       : in     vl_logic_vector;
        rxctrl0_in      : in     vl_logic_vector;
        rxctrl1_in      : in     vl_logic_vector;
        gtwiz_userdata_rx_out: out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of P_RX_USER_DATA_WIDTH : constant is 2;
    attribute mti_svvh_generic_type of P_RX_DATA_DECODING : constant is 2;
    attribute mti_svvh_generic_type of P_TOTAL_NUMBER_OF_CHANNELS : constant is 2;
end gtwizard_ultrascale_v1_6_5_gtwiz_userdata_rx;
