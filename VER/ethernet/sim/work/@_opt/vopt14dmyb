library verilog;
use verilog.vl_types.all;
entity mac_rx_crc32 is
    generic(
        CRC_PRESET      : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1);
        CRC_MASK        : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi1, Hi1, Hi0, Hi1, Hi0, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi1)
    );
    port(
        rst_b           : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        data_en         : in     vl_logic;
        frame_start     : in     vl_logic;
        frame_end       : in     vl_logic;
        crc_err         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CRC_PRESET : constant is 1;
    attribute mti_svvh_generic_type of CRC_MASK : constant is 1;
end mac_rx_crc32;
