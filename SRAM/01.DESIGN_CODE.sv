module sram #(parameter N=4,M=16)(input clk,
                                  input reset,
                                  input [N-1:0]din,
                                  input [$clog2(M)-1:0]addr,
                                  input en,
                                  output reg [N-1:0]dout);
  reg [N-1:0]ram[0:M-1];
  always @(posedge clk )begin
    if(reset)begin
      foreach (ram[i]) ram[i] = 0;
      dout<=0;
    end
    else begin
      if(en)
        ram[addr]<=din;
      else
        dout<=ram[addr];
    end
  end
endmodule
