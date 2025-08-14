
`include "interface.sv"
`include "test.sv"

module testbench;
  inter interf();
  test tst(interf);
  
  sram ram(.clk(interf.clk),.reset(interf.reset),.din(interf.din),.addr(interf.addr),.en(interf.en),.dout(interf.dout));
  
  initial begin
    interf.clk=0;
   forever #5 interf.clk=~interf.clk;
  end
  initial begin
     interf.reset=1;
    #40 interf.reset=0;  end
  
   initial begin
//     interf.en=0;
//    forever #40 interf.en=~interf.en;
     #700;
  $finish;
  end
  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars();
  end
  
 
  
endmodule
