module colorspace (
               clk,
               din0,
               din1,
               din2,
               dout0,
               dout1,
               dout2,
               rstn
        );

   input                         rstn ;
   input                         clk ;
   input  [12-1:0]  din0;
   input  [12-1:0]  din1;
   input  [12-1:0]  din2;
   output [12-1:0] dout0; 
   output [12-1:0] dout1; 
   output [12-1:0] dout2; 

endmodule
