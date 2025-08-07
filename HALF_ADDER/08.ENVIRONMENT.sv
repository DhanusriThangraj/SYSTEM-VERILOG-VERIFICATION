
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  transaction trans;
  generator gen;
  driver driv;
  monitor moni;
  scoreboard score;
  
  mailbox gen_to_driv;
  mailbox moni_to_score;
  virtual inter interf;
  
  function new(virtual inter interf );
    gen_to_driv=new();
    moni_to_score=new();
    this.interf=interf;
    
    gen=new(gen_to_driv);
    driv=new(interf,gen_to_driv);
    moni=new(interf,moni_to_score);
    score=new(moni_to_score);
  endfunction
    
    task test();
      fork
        gen.run();
        driv.run();
        moni.run();
        score.run();
      join
    endtask 
endclass
