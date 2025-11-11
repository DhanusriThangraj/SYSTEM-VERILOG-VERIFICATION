`include "agent.sv"
`include "interface.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  agent agen;
  score score;
  virtual inter interf;
  mailbox moni_to_score;
  event dhanusri;
  
  
  function new(virtual inter interf);
    this.interf=interf;
    moni_to_score=new();
    score=new(moni_to_score);
    agen=new(moni_to_score,interf);
    
    agen.gen.dhanu=this.dhanusri;
    score.sri=this.dhanusri;
    
  endfunction
  
  task test();
    fork
    agen.run();
    score.run();
    join
  endtask
  
endclass
