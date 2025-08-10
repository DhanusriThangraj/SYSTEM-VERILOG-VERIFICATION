class transaction;
//   bit clk;
  bit reset;
  rand bit d;
  bit q;
  
  function void display(string flipflop);
    $display("%s",flipflop);
    $display("Time=%0t reset=%b d=%b q=%b",$time,reset,d,q);
  endfunction
endclass
