library verilog;
use verilog.vl_types.all;
entity ge_mac is
    generic(
        MAC_RX_IDLE     : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        MAC_RX_PRE      : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        MAC_RX_SOP      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        MAC_RX_DATA     : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        MAC_TX_IDLE     : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi1);
        MAC_TX_PRE      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi1, Hi0);
        MAC_TX_DATA     : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        MAC_TX_FCS      : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi0);
        MAC_TX_IFG      : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        reset_b         : in     vl_logic;
        rx_clk          : in     vl_logic;
        tx_clk          : in     vl_logic;
        gmii_txd        : out    vl_logic_vector(7 downto 0);
        gmii_tx_en      : out    vl_logic;
        gmii_tx_er      : out    vl_logic;
        gmii_rxd        : in     vl_logic_vector(7 downto 0);
        gmii_rx_dv      : in     vl_logic;
        gmii_rx_er      : in     vl_logic;
        rx_sop          : out    vl_logic;
        rx_eop          : out    vl_logic;
        rx_valid        : out    vl_logic;
        rx_data         : out    vl_logic_vector(7 downto 0);
        rx_good_frm_ind : out    vl_logic;
        rx_bad_frm_ind  : out    vl_logic;
        rx_crc_err      : out    vl_logic;
        rx_len_nc_ind   : out    vl_logic;
        rx_ssf_ind      : out    vl_logic;
        rx_slf_ind      : out    vl_logic;
        tx_pkt_type     : out    vl_logic_vector(7 downto 0);
        tx_ack          : out    vl_logic;
        tx_frm_err      : in     vl_logic;
        tx_req          : in     vl_logic;
        tx_frm_data     : in     vl_logic_vector(7 downto 0);
        tx_pld_valid    : in     vl_logic;
        tx_data_sof     : in     vl_logic;
        mac_rx_frm_ind  : out    vl_logic;
        mac_rx_frm_err_ind: out    vl_logic;
        mac_tx_frm_ind  : out    vl_logic;
        mac_tx_frm_err_ind: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MAC_RX_IDLE : constant is 1;
    attribute mti_svvh_generic_type of MAC_RX_PRE : constant is 1;
    attribute mti_svvh_generic_type of MAC_RX_SOP : constant is 1;
    attribute mti_svvh_generic_type of MAC_RX_DATA : constant is 1;
    attribute mti_svvh_generic_type of MAC_TX_IDLE : constant is 1;
    attribute mti_svvh_generic_type of MAC_TX_PRE : constant is 1;
    attribute mti_svvh_generic_type of MAC_TX_DATA : constant is 1;
    attribute mti_svvh_generic_type of MAC_TX_FCS : constant is 1;
    attribute mti_svvh_generic_type of MAC_TX_IFG : constant is 1;
end ge_mac;
