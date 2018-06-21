//------------------------------------------------
// USERNAME module instantiation template
//------------------------------------------------
gammaCorrector u1_gammaCorrector (
   //=====INPUTS
   .clk              (clk),                 // system clock  
   .rstn             (rstn),                // system reset
   .inpvalid         (inpvalid),            // input data valid signal
   .din0             (din0),                // first  input color plane 
         .din1       (din1),                // second input color plane 
         .din2       (din2),                // third  input color plane 
   
   //=====OUTPUTS
   .outvalid         (outvalid),            // output data valid signal
         .dout1      (dout1),               // second output color plane 
         .dout2      (dout2),               // third  output color plane 
   .dout0            (dout0)                // first  output color plane 
);
