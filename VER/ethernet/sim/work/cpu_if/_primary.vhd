library verilog;
use verilog.vl_types.all;
entity cpu_if is
    port(
        cpu_clk         : in     vl_logic;
        rst_n           : in     vl_logic
    );
end cpu_if;
