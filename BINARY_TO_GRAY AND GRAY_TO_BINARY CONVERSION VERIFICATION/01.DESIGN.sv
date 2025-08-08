// Code your design here

module conversion(
  input  [3:0] data_in,
  input        sel,             
  output reg [3:0] data_out     
);

  integer i;
  always @(*) begin
    if (sel == 1) begin
      data_out[3] = data_in[3];
      for (i = 2; i >= 0; i = i-1)
        data_out[i] = data_in[i+1] ^ data_in[i];
    end else begin
      data_out[3] = data_in[3];
      for (i =2; i>=0; i = i-1)
        data_out[i] = data_out[i+1] ^ data_in[i];
    end
  end

endmodule
