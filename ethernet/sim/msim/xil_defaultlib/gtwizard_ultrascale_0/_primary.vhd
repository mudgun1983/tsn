library verilog;
use verilog.vl_types.all;
entity gtwizard_ultrascale_0 is
    port(
        gtwiz_userclk_tx_active_in: in     vl_logic_vector(0 downto 0);
        gtwiz_userclk_rx_active_in: in     vl_logic_vector(0 downto 0);
        gtwiz_reset_clk_freerun_in: in     vl_logic_vector(0 downto 0);
        gtwiz_reset_all_in: in     vl_logic_vector(0 downto 0);
        gtwiz_reset_tx_pll_and_datapath_in: in     vl_logic_vector(0 downto 0);
        gtwiz_reset_tx_datapath_in: in     vl_logic_vector(0 downto 0);
        gtwiz_reset_rx_pll_and_datapath_in: in     vl_logic_vector(0 downto 0);
        gtwiz_reset_rx_datapath_in: in     vl_logic_vector(0 downto 0);
        gtwiz_reset_rx_cdr_stable_out: out    vl_logic_vector(0 downto 0);
        gtwiz_reset_tx_done_out: out    vl_logic_vector(0 downto 0);
        gtwiz_reset_rx_done_out: out    vl_logic_vector(0 downto 0);
        gtwiz_userdata_tx_in: in     vl_logic_vector(255 downto 0);
        gtwiz_userdata_rx_out: out    vl_logic_vector(319 downto 0);
        gtrefclk00_in   : in     vl_logic_vector(0 downto 0);
        qpll0outclk_out : out    vl_logic_vector(0 downto 0);
        qpll0outrefclk_out: out    vl_logic_vector(0 downto 0);
        gtyrxn_in       : in     vl_logic_vector(3 downto 0);
        gtyrxp_in       : in     vl_logic_vector(3 downto 0);
        rxusrclk_in     : in     vl_logic_vector(3 downto 0);
        rxusrclk2_in    : in     vl_logic_vector(3 downto 0);
        txheader_in     : in     vl_logic_vector(23 downto 0);
        txsequence_in   : in     vl_logic_vector(27 downto 0);
        txusrclk_in     : in     vl_logic_vector(3 downto 0);
        txusrclk2_in    : in     vl_logic_vector(3 downto 0);
        gtytxn_out      : out    vl_logic_vector(3 downto 0);
        gtytxp_out      : out    vl_logic_vector(3 downto 0);
        rxoutclk_out    : out    vl_logic_vector(3 downto 0);
        rxpmaresetdone_out: out    vl_logic_vector(3 downto 0);
        txoutclk_out    : out    vl_logic_vector(3 downto 0);
        txpmaresetdone_out: out    vl_logic_vector(3 downto 0);
        txprgdivresetdone_out: out    vl_logic_vector(3 downto 0)
    );
end gtwizard_ultrascale_0;
