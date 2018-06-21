//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
//   ------------------------------------------------------------------
//   Copyright (c) 2017 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement. 
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
//   --------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02 
//                  Singapore 307591
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   --------------------------------------------------------------------
//
module color (
    input rstn,
    input clk,
	
    input [11:0] R_in, 
	input [11:0] G_in,
	input [11:0] B_in,
    input        hsync_in,
    input        vsync_in,
	input        de_in,

    output   [11:0] R_out,
	output   [11:0] G_out,
	output   [11:0] B_out,
    output          hsync_out,
    output          vsync_out,
	output 			de_out
	);

parameter pixsync_delay = 9; // from CSC IP

CSC csc_inst (
.colorspace_din0(R_in), .colorspace_din1(G_in), .colorspace_din2(B_in), 
.colorspace_dout0(R_out), .colorspace_dout1(G_out), .colorspace_dout2(B_out), 
.colorspace_clk(clk), .colorspace_rstn(rstn)
);

//------------------------------------------------------------------------------------------------
//-- Delay hsync and vsync appropriately
//------------------------------------------------------------------------------------------------
reg [pixsync_delay : 0]  hsync_dly, vsync_dly, de_dly;

always @(posedge clk or negedge rstn) 
begin
	if(~rstn) begin
        hsync_dly   <= 0; 
		vsync_dly   <= 0;
		de_dly		<= 0;
     end
     else begin
        hsync_dly   <= {hsync_dly[pixsync_delay-1:0], hsync_in}; 
		vsync_dly   <= {vsync_dly[pixsync_delay-1:0], vsync_in};
		de_dly   	<= {de_dly[pixsync_delay-1:0], de_in};
     end
end

assign hsync_out 	= hsync_dly[pixsync_delay];
assign vsync_out 	= vsync_dly[pixsync_delay]; 
assign de_out 		= de_dly[pixsync_delay]; 
     
endmodule 