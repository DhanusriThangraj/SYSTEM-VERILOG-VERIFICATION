class scoreboard;
  transaction trans;
  mailbox moni_to_score;
   transaction sum;
   transaction sub;
   transaction mul;
   transaction div;
  function new(mailbox moni_to_score);
    this.moni_to_score=moni_to_score;
  endfunction
  
  task run();
    trans=new();
    sum=new();  
    sub=new();
    mul=new();
    div=new();
      
    repeat(12)begin
      moni_to_score.get(trans);
      trans.display("SCOREBOARD");
      case(trans.sel)
        2'b00:begin sum.sum=(trans.a+trans.b);
          if(sum.sum==trans.sum)begin
            $display("SUM-----------PASS------------SUM");end
          else begin
            $display("SUM-----------FAIL------------SUM"); end
        end
        
        
        2'b01:begin 
          sub.sub=(trans.a-trans.b);
          if(sub.sub==trans.sub)begin
          $display("SUB-----------PASS------------SUB");end
          else begin
            $display("SUB-----------FAIL------------SUB"); end
        end
        
        2'b10:begin
          mul.mul=(trans.a*trans.b);
          if(mul.mul==trans.mul)begin
            
          $display("MUL-----------PASS------------MUL");end
          else begin
            $display("MUL-----------FAIL------------MUL"); end
        end
        
        2'b11:begin  
          div.div=(trans.a/trans.b);
          if(div.div==trans.div)begin
          $display("DIV-----------PASS------------DIV");end
          else begin
            $display("DIV-----------FAIL------------DIV"); end
        end
      endcase
      #2;
    end
  endtask
endclass
