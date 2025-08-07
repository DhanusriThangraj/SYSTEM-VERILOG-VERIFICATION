class driver;
  transaction trans;
  virtual inter interf;
  mailbox gen_to_driv;
  
  function new(virtual inter interf,mailbox gen_to_driv);
    this.interf=interf;
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task run();
    trans=new();
    repeat(5)begin
      #1;
      gen_to_driv.get(trans);
      trans.display("DRIVER");
      interf.a=trans.a;
      interf.b=trans.b;
      #2;
    end
  endtask
endclass
