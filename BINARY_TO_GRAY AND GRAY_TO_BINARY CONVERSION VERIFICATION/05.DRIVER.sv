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
    repeat(10)begin
      
      gen_to_driv.get(trans);
      trans.display("DRIVER");
      interf.data_in=trans.data_in;
      interf.sel=trans.sel;    
      #2;
    end
  endtask  
endclass
