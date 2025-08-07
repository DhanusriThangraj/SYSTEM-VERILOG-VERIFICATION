class transaction;
  rand bit a;
  rand bit b;
       bit sum;
       bit carry;
  function void display(string d);
    $display("%s",d);
    $display("Time=%0t a=%0b b=%0b sum=%0b carry=%0b",$time,a,b,sum,carry);
  endfunction 
endclass
