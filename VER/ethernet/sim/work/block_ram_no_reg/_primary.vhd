library verilog;
use verilog.vl_types.all;
entity block_ram_no_reg is
    generic(
        ADDR_WIDTH      : integer := 8;
        DATA_WIDTH      : integer := 8;
        DATA_DEPTH      : vl_notype
    );
    port(
        clka            : in     vl_logic;
        addra           : in     vl_logic_vector;
        dia             : in     vl_logic_vector;
        wea             : in     vl_logic;
        clkb            : in     vl_logic;
        addrb           : in     vl_logic_vector;
        enb             : in     vl_logic;
        dob             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_DEPTH : constant is 3;
end block_ram_no_reg;
