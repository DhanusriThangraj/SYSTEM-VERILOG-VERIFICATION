class driver;
  transaction trans;
  mailbox gen_to_driv;
  virtual inter interf;
  
  function new(virtual inter interf, mailbox gen_to_driv);
      this.gen_to_driv=gen_to_driv;
      this.interf=interf;
    endfunction
  
  task run();
    trans=new();
    repeat(12)begin
      #1;
      gen_to_driv.get(trans);
      
      interf.a=trans.a;
      interf.b=trans.b;
      interf.sel=trans.sel;
      trans.display("DRIVER");
      #2;
      
    end   
  endtask
endclass
