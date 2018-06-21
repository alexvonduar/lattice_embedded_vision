module gammaCorrector (
   //=====INPUTS
   clk,                 // system clock  
   rstn,                // system reset
   inpvalid,            // input data valid signal
   din0,                // first  input color plane 
         din1,          // second input color plane 
         din2,          // third  input color plane 
   
   //=====OUTPUTS
   outvalid,            // output data valid signal
         dout1,         // second output color plane 
         dout2,         // third  output color plane 
   dout0                // first  output color plane 
);



// ------------ input ports
   input                                     clk;
   input                                     rstn;
   input                                     inpvalid;
   input  [12-1:0]                 din0;
         input  [12-1:0]           din1;
         input  [12-1:0]           din2;

// ------------ output ports
   output                                    outvalid;
   output [12-1:0]                 dout0;
         output  [12-1:0]          dout1;
         output  [12-1:0]          dout2;
endmodule
