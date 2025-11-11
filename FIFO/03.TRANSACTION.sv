class transaction #(parameter N=4);
  
  bit clk;   
  bit reset;
  randc bit [N-1:0]data_in;
  bit  [N-1:0]data_out;
  bit write_en;
  bit read_en;
  bit full,empty;

 
  constraint c1 {data_in inside {[1:10]};};

  
 function void display(string d);
   
   $display("%s",d);
      $display("clk=%b\treset=%b\twrite_en=%b\tread_en=%b\tdata_in=%h\tdata_out=%h\tfull=%b\tempty=%b",clk,reset,write_en,read_en,data_in,data_out,full,empty);
  endfunction
  
endclass
