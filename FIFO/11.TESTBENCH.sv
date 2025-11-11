`include "test.sv"
module testbench;
  
  inter interf();
  test tst(interf);
  

  
  syn_fifo dut (.clk(interf.clk),
                .reset(interf.reset),
                .write_en(interf.write_en),
                .read_en(interf.read_en),
                .data_in(interf.data_in),
                .data_out(interf.data_out),
                .full(interf.full),
                .empty(interf.empty));
  
  initial begin
    interf.clk=0;
    forever #5 interf.clk=~interf.clk;
   
  end
  initial begin
     interf.reset=1;
     #10 interf.reset=0;
    
     interf.write_en=1;interf.read_en=0;
    
    
     #200 interf.read_en=1;
     interf.write_en=0;
    
    

        #200 interf.read_en=0;          interf.write_en=1;

    
     #300 interf.read_en=1;
     interf.write_en=0;
    
    
    #1000 $finish;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule
