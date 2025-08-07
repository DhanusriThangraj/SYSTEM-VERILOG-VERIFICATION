class scoreboard;
  mailbox moni_to_score;
  transaction trans;
 
  function new(mailbox moni_to_score);
    this.moni_to_score=moni_to_score;
  endfunction
  task run();
    repeat(5)begin
      moni_to_score.get(trans);
      trans.display("SCOREBOARD");
      if(((trans.a^trans.b)==trans.sum)&&((trans.a&trans.b )==trans.carry))
        $display("PASS---------------------------PASS");
        else 
          $display("FAIL----------------------------FAIL");
      
    end          
  endtask
endclass
