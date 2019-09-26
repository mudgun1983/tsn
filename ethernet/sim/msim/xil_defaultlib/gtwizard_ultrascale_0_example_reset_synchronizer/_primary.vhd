library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_0_example_reset_synchronizer is
    generic(
        FREQUENCY       : integer := 512
    );
    port(
        clk_in          : in     vl_logic;
        rst_in          : in     vl_logic;
        rst_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of FREQUENCY : constant is 1;
end gtwizard_ultrascale_0_example_reset_synchronizer;
