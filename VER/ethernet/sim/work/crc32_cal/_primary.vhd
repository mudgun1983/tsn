library verilog;
use verilog.vl_types.all;
entity crc32_cal is
    generic(
        CRC_PRESET      : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1);
        CRC_MASK        : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi1, Hi1, Hi0, Hi1, Hi0, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi1)
    );
    port(
        rst_b           : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        data_en         : in     vl_logic;
        crc_int         : in     vl_logic;
        crc             : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CRC_PRESET : constant is 1;
    attribute mti_svvh_generic_type of CRC_MASK : constant is 1;
end crc32_cal;
