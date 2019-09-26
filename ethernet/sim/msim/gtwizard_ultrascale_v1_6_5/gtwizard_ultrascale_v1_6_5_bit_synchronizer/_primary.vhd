library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_v1_6_5_bit_synchronizer is
    generic(
        INITIALIZE      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        FREQUENCY       : integer := 512
    );
    port(
        clk_in          : in     vl_logic;
        i_in            : in     vl_logic;
        o_out           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INITIALIZE : constant is 1;
    attribute mti_svvh_generic_type of FREQUENCY : constant is 1;
end gtwizard_ultrascale_v1_6_5_bit_synchronizer;
