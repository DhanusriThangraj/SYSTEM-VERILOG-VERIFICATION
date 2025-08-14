interface inter #(parameter N=4,M=16);
  logic clk;
  logic reset;
  logic [N-1:0]din;
  logic [$clog2(M)-1:0]addr;
  logic en;
  logic [N-1:0]dout;
endinterface
