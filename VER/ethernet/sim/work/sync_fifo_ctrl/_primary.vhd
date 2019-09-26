library verilog;
use verilog.vl_types.all;
entity sync_fifo_ctrl is
    generic(
        ADDR_MAX_VALUE  : integer := 31;
        ADDR_WIDTH      : integer := 5;
        ALMOST_EMPTY_VALUE: integer := 1;
        ALMOST_FULL_VALUE: integer := 1;
        WIDTH           : integer := 8
    );
    port(
        half_empty      : out    vl_logic;
        half_full       : out    vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        w_addr          : out    vl_logic_vector;
        r_addr          : out    vl_logic_vector;
        aempty          : out    vl_logic;
        afull           : out    vl_logic;
        data_count      : out    vl_logic_vector;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        fifo_syn_rst    : in     vl_logic;
        wen             : in     vl_logic;
        ren             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_MAX_VALUE : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ALMOST_EMPTY_VALUE : constant is 1;
    attribute mti_svvh_generic_type of ALMOST_FULL_VALUE : constant is 1;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end sync_fifo_ctrl;
