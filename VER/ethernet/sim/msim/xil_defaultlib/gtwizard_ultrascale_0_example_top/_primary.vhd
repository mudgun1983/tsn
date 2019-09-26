library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_0_example_top is
    port(
        mgtrefclk0_x0y1_p: in     vl_logic;
        mgtrefclk0_x0y1_n: in     vl_logic;
        ch0_gtyrxn_in   : in     vl_logic;
        ch0_gtyrxp_in   : in     vl_logic;
        ch0_gtytxn_out  : out    vl_logic;
        ch0_gtytxp_out  : out    vl_logic;
        ch1_gtyrxn_in   : in     vl_logic;
        ch1_gtyrxp_in   : in     vl_logic;
        ch1_gtytxn_out  : out    vl_logic;
        ch1_gtytxp_out  : out    vl_logic;
        ch2_gtyrxn_in   : in     vl_logic;
        ch2_gtyrxp_in   : in     vl_logic;
        ch2_gtytxn_out  : out    vl_logic;
        ch2_gtytxp_out  : out    vl_logic;
        ch3_gtyrxn_in   : in     vl_logic;
        ch3_gtyrxp_in   : in     vl_logic;
        ch3_gtytxn_out  : out    vl_logic;
        ch3_gtytxp_out  : out    vl_logic;
        hb_gtwiz_reset_clk_freerun_in: in     vl_logic;
        hb_gtwiz_reset_all_in: in     vl_logic;
        link_down_latched_reset_in: in     vl_logic;
        link_status_out : out    vl_logic;
        link_down_latched_out: out    vl_logic
    );
end gtwizard_ultrascale_0_example_top;
