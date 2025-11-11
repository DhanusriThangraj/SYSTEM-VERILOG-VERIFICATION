class score;
  mailbox moni_to_score;
  transaction trans;
  event sri;
  
  function new(mailbox moni_to_score);
    this.moni_to_score=moni_to_score;
  endfunction
  
  bit [15:0]que[$];
  bit [7:0]temp;
  
  task run();
    forever begin
      
    moni_to_score.get(trans);
   
    
      fork
        rst();
        write();
        read();
     join

      
    trans.display("SCOREBOARD");
            verify();
      ->sri;
    end
  endtask
  
  
  
  
  
 task rst();
  if(trans.reset)
    foreach(que[i])
      que[i]=0;
  endtask
  
  
  task write();
    if(trans.write_en&&!trans.reset&&!trans.full)
      que.push_back(trans.data_in);
    
  endtask
  
  
  task read();
    if(!trans.reset&&trans.read_en&&!trans.empty)
      temp=que.pop_front();
  endtask
  
  task verify();
    if(trans.data_out==temp)
      $display("----------------------FIFO PASSED----------------------");
    else
      $display("----------------------FIFO FAILED----------------------");

  endtask
  
endclass
