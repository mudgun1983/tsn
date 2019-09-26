library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_v1_6_5_gthe4_cpll_cal_freq_counter is
    generic(
        REVISION        : integer := 1
    );
    port(
        freq_cnt_o      : out    vl_logic_vector(17 downto 0);
        done_o          : out    vl_logic;
        rst_i           : in     vl_logic;
        test_term_cnt_i : in     vl_logic_vector(15 downto 0);
        ref_clk_i       : in     vl_logic;
        test_clk_i      : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of REVISION : constant is 1;
end gtwizard_ultrascale_v1_6_5_gthe4_cpll_cal_freq_counter;
