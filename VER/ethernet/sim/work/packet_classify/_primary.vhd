library verilog;
use verilog.vl_types.all;
entity packet_classify is
    generic(
        VERSION         : vl_logic_vector(15 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        sys_clk_125     : in     vl_logic;
        err_i           : in     vl_logic;
        valid_i         : in     vl_logic;
        data_i          : in     vl_logic_vector(7 downto 0);
        err_o           : out    vl_logic;
        valid_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0);
        sop_o           : out    vl_logic;
        eop_o           : out    vl_logic;
        shim0_shim1_ind : out    vl_logic;
        vlan_to_shim0   : in     vl_logic_vector(15 downto 0);
        vlan_to_shim1   : in     vl_logic_vector(15 downto 0);
        packet_rcv      : out    vl_logic;
        crc_ind         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VERSION : constant is 2;
end packet_classify;
