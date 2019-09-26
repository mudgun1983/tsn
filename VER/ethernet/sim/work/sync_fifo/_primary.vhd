library verilog;
use verilog.vl_types.all;
entity sync_fifo is
    generic(
        FIFO_DATA_WIDTH : integer := 16;
        FIFO_ADDR_WIDTH : integer := 1;
        FIFO_DEPTH      : integer := 2;
        ALMOST_EMPTY_VALUE: integer := 1;
        ALMOST_FULL_VALUE: integer := 1
    );
    port(
        rd_data         : out    vl_logic_vector;
        half_empty      : out    vl_logic;
        half_full       : out    vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        aempty          : out    vl_logic;
        afull           : out    vl_logic;
        data_count      : out    vl_logic_vector;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wr_data         : in     vl_logic_vector;
        fifo_syn_rst    : in     vl_logic;
        wen             : in     vl_logic;
        ren             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of FIFO_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of FIFO_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of FIFO_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of ALMOST_EMPTY_VALUE : constant is 1;
    attribute mti_svvh_generic_type of ALMOST_FULL_VALUE : constant is 1;
end sync_fifo;
