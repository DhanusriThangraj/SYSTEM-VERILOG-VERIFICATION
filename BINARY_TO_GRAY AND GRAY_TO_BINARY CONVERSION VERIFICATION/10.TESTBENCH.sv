`include "interface.sv"
`include "test.sv"
module testbench;
  inter interf();
  test tst(interf);
  
  conversion CA (.data_in(interf.data_in),
                 .sel(interf.sel),
                 .data_out(interf.data_out));
  
endmodule
