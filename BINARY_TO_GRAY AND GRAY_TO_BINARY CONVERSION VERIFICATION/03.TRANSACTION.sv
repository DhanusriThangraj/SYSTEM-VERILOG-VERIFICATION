class transaction ;
  rand bit[3:0] data_in;
  rand bit sel;
  bit[3:0] data_out;
  function void display(string d);
    $display("%s",d);
    $display("data_in=%0b sel=%0b data_out=%0b ",data_in,sel,data_out);
    endfunction 
endclass
