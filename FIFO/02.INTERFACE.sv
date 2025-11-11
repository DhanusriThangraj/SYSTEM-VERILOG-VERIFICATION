interface inter #(parameter N=4);
  
  logic clk;
  logic reset;
  logic write_en;
  logic read_en;
  logic [N-1:0]data_in;
  logic [N-1:0]data_out;
  logic full;
  logic empty;
  
  endinterface
