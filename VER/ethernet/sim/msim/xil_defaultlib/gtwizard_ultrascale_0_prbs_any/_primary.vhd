library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_0_prbs_any is
    generic(
        CHK_MODE        : integer := 0;
        INV_PATTERN     : integer := 0;
        POLY_LENGHT     : integer := 31;
        POLY_TAP        : integer := 3;
        NBITS           : integer := 16
    );
    port(
        RST             : in     vl_logic;
        CLK             : in     vl_logic;
        DATA_IN         : in     vl_logic_vector;
        EN              : in     vl_logic;
        DATA_OUT        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CHK_MODE : constant is 1;
    attribute mti_svvh_generic_type of INV_PATTERN : constant is 1;
    attribute mti_svvh_generic_type of POLY_LENGHT : constant is 1;
    attribute mti_svvh_generic_type of POLY_TAP : constant is 1;
    attribute mti_svvh_generic_type of NBITS : constant is 1;
end gtwizard_ultrascale_0_prbs_any;
