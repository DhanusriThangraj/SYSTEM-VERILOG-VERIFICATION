class scoreboard #(parameter N=4,M=16);
  transaction trans;
  mailbox moni_to_score;
  bit [N-1:0]ram[0:M-1];
  event sri;
  
  function new(mailbox moni_to_score);
    this.moni_to_score=moni_to_score;
    endfunction
  
  task run();
    trans=new();
 repeat(100) begin
   
      moni_to_score.get(trans);
       trans.display("SCOREBOARD");
      
   if((trans.reset==1)&&(trans.dout==0))begin
      foreach (ram[i]) ram[i] = 0;
        $display("----------------RAM MEMORY IS RESETED----------------");
      end
      else begin
        if (trans.en==1) begin
           ram[trans.addr] = trans.din; 
          if (ram[trans.addr]==trans.din)
          $display("----------------DATA WRITE IS PASSED----------------");
          else
          $display("----------------DATA WRITE IS FAILED----------------");   
      end
        else begin
          
          if(trans.dout==ram[trans.addr])
              $display("----------------DATA READ IS PASSED----------------");
          else
              $display("----------------DATA READ IS FAILED----------------");    
          end
        end
       
        ->sri;
    end
  endtask
endclass

