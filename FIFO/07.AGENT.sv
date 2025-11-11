
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"

class agent;
  virtual inter interf;
  transaction trans;
  generator gen;
  driver driv;
  monitor moni;
  
  mailbox gen_to_driv;
  mailbox moni_to_score;
  
  function new(mailbox moni_to_score,virtual inter interf);
//      this.gen_to_driv=gen_to_driv;
    this.moni_to_score=moni_to_score;
     this.interf=interf;
    gen_to_driv=new();
     gen=new(gen_to_driv);
    
     driv=new(gen_to_driv,interf);
     moni=new(moni_to_score,interf);
    
  endfunction
  
  
  task run();
    
  fork
    gen.run();
    driv.run();
    moni.run();
  join
    
  endtask
  
  
endclass
