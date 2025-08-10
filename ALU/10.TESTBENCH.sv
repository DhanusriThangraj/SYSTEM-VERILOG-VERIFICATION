// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"

module testbench;
  inter interf();
  test tst(interf);
 
  alu fg(.a   (interf.a),
         .b   (interf.b),
         .sel (interf.sel), 
         .sum (interf.sum),
         .sub (interf.sub),
         .mul (interf.mul),
         .div (interf.div)
        );
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
