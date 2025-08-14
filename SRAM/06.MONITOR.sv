class monitor;
  transaction trans;
  mailbox moni_to_score;
  virtual inter interf;
  
  function new(virtual inter interf, mailbox moni_to_score);
    this.interf=interf;
    this.moni_to_score=moni_to_score;
  endfunction
  
  task run();
    trans=new();
 repeat(100) begin
   
  @(posedge interf.clk);
      
      trans.din=interf.din;
      trans.en=interf.en;
      trans.addr=interf.addr;
      trans.en=interf.en;
      trans.dout=interf.dout;
      trans.reset=interf.reset;
      
      moni_to_score.put(trans);
      trans.display("MONITOR");
      
    end
  endtask
  
endclass
