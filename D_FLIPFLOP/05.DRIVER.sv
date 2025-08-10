class driver;
  transaction trans;
  mailbox gen_to_driv;
  virtual inter interf;
  
  function new(virtual inter interf,mailbox gen_to_driv);
    this.interf=interf;
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task run();
    trans=new();
    repeat(50) begin
      gen_to_driv.get(trans);
      @(posedge interf.clk);
      
      //interf.clk<=trans.clk;
      //       interf.reset<=trans.reset;
      interf.d<=trans.d;
      
      trans.display("DRIVER");
      $display("reset=%0b",interf.reset);
          
    end
  endtask 
endclass
