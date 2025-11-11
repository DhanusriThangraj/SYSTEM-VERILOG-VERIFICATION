
class generator;
  transaction trans;
  mailbox gen_to_driv;
  event dhanu;
  
  function new(mailbox gen_to_driv);
    this.gen_to_driv=gen_to_driv;
    this.trans=trans;
  endfunction
  
  task run();
    trans=new();
    
    
   forever begin
      
      assert(trans.randomize() with {!(write_en && read_en);});
    gen_to_driv.put(trans);
    trans.display("GENERATOR");
    @dhanu;
    end
  endtask
  
endclass
