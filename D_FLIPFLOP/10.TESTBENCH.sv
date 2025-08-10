`include "interface.sv"
`include "test.sv"
module d_flipflop_tb;
  

  initial begin
  interf.clk=0;
    end
  always #5 interf.clk = ~interf.clk; 
  inter interf();
  test tst(interf);
  
  d_flipflop d (.clk(interf.clk),.reset(interf.reset),.d(interf.d),.q(interf.q));

  initial begin 
    interf.reset=1;
    #20; interf.reset=0;
  end
  

  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars();
    #200;
    $finish();
  end
  
endmodule
