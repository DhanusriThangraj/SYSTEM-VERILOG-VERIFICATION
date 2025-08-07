`include "test.sv"
`include "interface.sv"
module testbench;
  inter interf();
  test tst(interf);
  half_adder HA (.a(interf.a),
                 .b(interf.b),
                 .sum(interf.sum),
                 .carry(interf.carry));
  
endmodule
