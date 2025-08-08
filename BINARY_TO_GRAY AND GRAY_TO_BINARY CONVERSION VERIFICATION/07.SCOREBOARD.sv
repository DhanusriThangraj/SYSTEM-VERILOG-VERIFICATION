class scoreboard;
  transaction trans;
  mailbox moni_to_score;
    integer i;
  function new(mailbox moni_to_score);
    this.moni_to_score=moni_to_score;
  endfunction
  
  task run();
    transaction out;
    out=new();
    repeat(10)begin
      moni_to_score.get(trans);
      trans.display("SCOREBOARD");
      
    
      if(trans.sel==1)begin
        out.data_out[3]=trans.data_in[3];
        for(i=2; i>=0; i=i-1)
          out.data_out[i]=trans.data_in[i+1]^trans.data_in[i];
     
      
      if(out.data_out==trans.data_out)
        $display("PASS----------------binary to gray------------------PASS");
      else
        $display("FAIL----------------binary to gray------------------FAIL");
      
     end 
   
      else if (trans.sel==0)begin
        out.data_out[3]=trans.data_in[3];
        for(i=2; i>=0; i=i-1)
          out.data_out[i]=trans.data_out[i+1]^trans.data_in[i];
      
      if(out.data_out==trans.data_out)
        $display("PASS----------------gray to binary-----------------PASS");
      else
        $display("FAIL---------------gray to binary-----------------FAIL");
        
    end
    end
  endtask
  
endclass
