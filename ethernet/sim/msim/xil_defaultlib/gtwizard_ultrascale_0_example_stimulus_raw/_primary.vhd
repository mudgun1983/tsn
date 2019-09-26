library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_0_example_stimulus_raw is
    port(
        gtwiz_reset_all_in: in     vl_logic;
        gtwiz_userclk_tx_usrclk2_in: in     vl_logic;
        gtwiz_userclk_tx_active_in: in     vl_logic;
        txdata_out      : out    vl_logic_vector(79 downto 0)
    );
end gtwizard_ultrascale_0_example_stimulus_raw;
