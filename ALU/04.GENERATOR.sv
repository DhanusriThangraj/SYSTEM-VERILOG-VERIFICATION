class generator;
  transaction trans;
  mailbox gen_to_driv;
  
  function new(mailbox gen_to_driv);
    this.gen_to_driv=gen_to_driv;
    this.trans=trans;
  endfunction
  
  task run();
    trans=new();
    repeat(12)begin
    trans.randomize();
    trans.display("GENERATOR");
    gen_to_driv.put(trans);
    #3;
    end
  endtask
  
endclass
