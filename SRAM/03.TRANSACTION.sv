class transaction #(parameter N=4,M=16);
  bit reset;
  rand bit  [N-1:0]din;
  rand bit  [$clog2(M)-1:0]addr;
   bit en;
  bit [N-1:0]dout;

  function void display(string d);
    $display("%s",d);
    $display("TIME=%0t reset=%0b din=%0d addr=%0d en=%0b dout=%0d",$time,reset,din,addr,en,dout);
  endfunction
endclass
