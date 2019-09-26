library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_0_example_checking_raw is
    port(
        gtwiz_reset_all_in: in     vl_logic;
        gtwiz_userclk_rx_usrclk2_in: in     vl_logic;
        gtwiz_userclk_rx_active_in: in     vl_logic;
        rxdata_in       : in     vl_logic_vector(79 downto 0);
        prbs_match_out  : out    vl_logic
    );
end gtwizard_ultrascale_0_example_checking_raw;
