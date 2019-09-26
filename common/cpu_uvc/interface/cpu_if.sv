interface cpu_if(input bit cpu_clk,rst_n);
  logic [31:0]        cpu_addr;
  logic               cpu_cs;
  logic               cpu_wr;
  logic               cpu_rd;
  logic [15:0]        cpu_data_in;
  logic [15:0]        cpu_data_out;
  wire [31:0]         cpu_data;
    
  clocking mck @(posedge cpu_clk);
    output            cpu_addr;
    output            cpu_cs;
    output            cpu_wr;
    output            cpu_rd;
    output            cpu_data_in;
    input             cpu_data_out;
    inout             cpu_data;
  endclocking: mck

  clocking sck @(posedge cpu_clk);
    input             cpu_addr;
    input             cpu_cs;
    input             cpu_wr;
    input             cpu_rd;
    inout             cpu_data;
  endclocking: sck

  clocking pck @(posedge cpu_clk);
    input             cpu_addr;
    input             cpu_cs;
    input             cpu_wr;
    input             cpu_rd;
    input             cpu_data;
  endclocking: pck

   modport master(clocking mck,input rst_n);
   modport slave(clocking sck,input rst_n);
   modport passive(clocking pck,input rst_n);

endinterface: cpu_if
