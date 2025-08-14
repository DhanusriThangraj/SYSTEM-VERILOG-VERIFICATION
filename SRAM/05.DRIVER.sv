class driver;
  transaction trans;
  mailbox gen_to_driv;
  virtual inter interf;
 
  function new (virtual inter interf,mailbox gen_to_driv);
    this.interf=interf;
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task run();
    trans=new();
   repeat(100) begin
     
     //   @(posedge interf.clk); 
      gen_to_driv.get(trans);
      trans.display("DRIVER");
      
      interf.din<=trans.din;
      interf.addr<=trans.addr;
      interf.en<=trans.en;
    
    end
  endtask
endclass
