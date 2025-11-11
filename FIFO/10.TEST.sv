`include "environment.sv"

program test(inter interf);
  initial begin
    environment env;
    env=new(interf);
    env.test(); 
  end
endprogram
