// Code your design here
module alu(input[3:0]a,
           input[3:0]b,
           input[1:0]sel,
           output reg[5:0]sum,
           output reg[5:0]sub,
           output reg[8:0]mul,
           output reg[3:0]div);
  always @(*)begin
    case (sel)
      2'b00:sum=a+b;
      2'b01:sub=a-b;
      2'b10:mul=a*b;
      2'b11:div=a/b;
    endcase
  end
  endmodule
