class generator;
  transaction trans;
  mailbox gen_to_driv;
  event dhanu;
  
  function new(mailbox gen_to_driv);
    this.trans=trans;
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task run();
    trans=new();
    repeat(100)begin
      trans.randomize();
      gen_to_driv.put(trans);
      trans.display("GENERATOR");
     
      
      @dhanu;
     end
  endtask   
endclass
