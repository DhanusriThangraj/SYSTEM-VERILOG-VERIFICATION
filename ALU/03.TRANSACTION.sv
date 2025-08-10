class transaction;
  rand bit [3:0]a;
  rand bit [3:0]b;
  rand bit [1:0]sel;
  bit [5:0]sum;
 bit signed  [5:0]sub;
  bit [8:0]mul;
  bit [3:0]div;
  function void display(string d);
    $display("%s",d);
    $display("Time=%0t a=%0d b=%0d sel=%0d sum=%0d sub=%0d mul=%0d div=%0d",$time,a,b,sel,sum,sub,mul,div);
  endfunction 
endclass
