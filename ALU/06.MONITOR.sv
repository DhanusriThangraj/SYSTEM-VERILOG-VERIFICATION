class monitor;
  transaction trans;
  mailbox moni_to_score;
  virtual inter interf;
  
  function new(virtual inter interf ,mailbox moni_to_score);
    this.moni_to_score=moni_to_score;
    this.interf=interf;
  endfunction
  
  task run();
    trans=new();
    repeat(12) begin
      #2;
      trans.a=interf.a;
      trans.b=interf.b;
      trans.sel=interf.sel;
      trans.sum=interf.sum;
      trans.sub=interf.sub;
      trans.mul=interf.mul;
      trans.div=interf.div;
      
      moni_to_score.put(trans);
      trans.display("MONITOR");
      #1;
    end
  endtask
endclass
