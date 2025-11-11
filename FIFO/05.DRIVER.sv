class driver;
  mailbox gen_to_driv;
  virtual inter interf;
  transaction trans;
  
  
  function new(mailbox gen_to_driv,virtual inter interf);
    this.gen_to_driv=gen_to_driv;
    this.interf=interf;
  endfunction
    
    task run();
       
       forever begin
        
        gen_to_driv.get(trans);
       
        
        @(posedge interf.clk)
        interf.data_in<= trans.data_in ;
    
        
        trans.display("DRIVER");
      end
     


    endtask
    endclass
