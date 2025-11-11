class monitor;
  
  mailbox moni_to_score;
  virtual inter interf;
  transaction trans;
  
  function new(mailbox moni_to_score,virtual inter interf);
    this.moni_to_score=moni_to_score;
    this.interf=interf;
  endfunction

task run();
   forever begin
    trans=new();
    @(posedge interf.clk);
  #1;
   trans.clk = interf.clk   ;
   trans.reset=  interf.reset;
   trans.write_en=interf.write_en;
   trans.read_en = interf.read_en;
   trans.data_in = interf.data_in;
   trans.data_out= interf.data_out;
   trans.full = interf.full;
   trans.empty=interf.empty;
    
    moni_to_score.put(trans);
    trans.display("MONITOR");

  end
endtask
  
endclass
