class monitor;
  transaction trans;
  mailbox moni_to_score;
  virtual inter interf;
  
  function new(virtual inter interf,mailbox moni_to_score);
    this.moni_to_score=moni_to_score;
    this.interf=interf;
    endfunction
  task run();
    trans=new();
    repeat(10)begin
      #2
     trans.data_in=interf.data_in;
     trans.sel=interf.sel;
     trans.data_out=interf.data_out;
      
     moni_to_score.put(trans);
     trans.display("MONITOR");
      #1;    
    end
  endtask 
endclass
