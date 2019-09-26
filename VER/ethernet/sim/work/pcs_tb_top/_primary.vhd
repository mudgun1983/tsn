library verilog;
use verilog.vl_types.all;
entity pcs_tb_top is
    generic(
        CLOCK_156M      : real    := 6.400000;
        CLOCK_125M      : integer := 8;
        CLOCK_322M      : real    := 3.104000;
        CLOCK_312M      : real    := 3.201000;
        CLOCK_161M      : vl_notype;
        CLOCK_200M      : real    := 5.000000;
        CLOCK_50M       : integer := 20;
        CLOCK_25M       : integer := 40;
        RESET_START_TIME: integer := 100;
        RESET_HOLD_TIEM : integer := 500;
        CLOCK_1us       : integer := 1000;
        SELF_DEFINE_PACKET: integer := 0;
        OAM_PACKET      : integer := 1;
        PROTOCOL_PACKET : integer := 2;
        DSP_PACKET      : integer := 3
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCK_156M : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_125M : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_322M : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_312M : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_161M : constant is 3;
    attribute mti_svvh_generic_type of CLOCK_200M : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_50M : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_25M : constant is 1;
    attribute mti_svvh_generic_type of RESET_START_TIME : constant is 1;
    attribute mti_svvh_generic_type of RESET_HOLD_TIEM : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_1us : constant is 1;
    attribute mti_svvh_generic_type of SELF_DEFINE_PACKET : constant is 1;
    attribute mti_svvh_generic_type of OAM_PACKET : constant is 1;
    attribute mti_svvh_generic_type of PROTOCOL_PACKET : constant is 1;
    attribute mti_svvh_generic_type of DSP_PACKET : constant is 1;
end pcs_tb_top;
