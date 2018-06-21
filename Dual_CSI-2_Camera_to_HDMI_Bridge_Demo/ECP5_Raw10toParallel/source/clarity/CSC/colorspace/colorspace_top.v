`timescale 1ns/100ps

module colorspace_top (
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

colorspace u1_colorspace (
            .clk                 (clk           ),
            .din0                (din0          ),
            .din1                (din1          ),
            .din2                (din2          ),
            .dout0               (dout0         ),
            .dout1               (dout1         ),
            .dout2               (dout2         ),
            .rstn                (rstn          )
    );

endmodule
