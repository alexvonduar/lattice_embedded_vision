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
module gamma_correction (
     clk,
     rstn,
     vsync_in,
     hsync_in,
     de_in,
     r_in,
     g_in,
     b_in,
     vsync_out,
     hsync_out,
     de_out,
     r_out,
     g_out,
     b_out
);

input clk;
input rstn;
input vsync_in, hsync_in, de_in;
input [11:0] r_in, g_in, b_in;
output vsync_out, hsync_out, de_out;
output [11:0] r_out, g_out, b_out;

parameter pixsync_delay = 4; // from Gamma Correction IP

wire [11:0] r_gamma, g_gamma, b_gamma;

Gamma gamma_inst (
	  .gammaCorrector_din0(b_in), .gammaCorrector_din1(g_in), .gammaCorrector_din2(r_in), 
      .gammaCorrector_dout0(b_gamma), .gammaCorrector_dout1(g_gamma), .gammaCorrector_dout2(r_gamma), 
      .gammaCorrector_clk(clk), .gammaCorrector_inpvalid(hsync_in), .gammaCorrector_outvalid(), 
      .gammaCorrector_rstn(rstn));
	  
assign r_out = r_gamma;
assign g_out = g_gamma;
assign b_out = b_gamma;

//------------------------------------------------------------------------------------------------
//-- Delay fv and lv appropriately
//------------------------------------------------------------------------------------------------
reg [pixsync_delay : 0]  vsync_dly, hsync_dly, de_dly;

always @(posedge clk or negedge rstn) 
begin
	if(~rstn) begin
        vsync_dly   <= 0;
		hsync_dly   <= 0;
		de_dly   <= 0;
     end
     else      begin
        vsync_dly   <= {vsync_dly[pixsync_delay-1:0], vsync_in}; 
		hsync_dly   <= {hsync_dly[pixsync_delay-1:0], hsync_in};
		de_dly   	<= {de_dly[pixsync_delay-1:0], de_in};
     end
end

assign vsync_out = vsync_dly[pixsync_delay];
assign hsync_out = hsync_dly[pixsync_delay]; 
assign de_out = de_dly[pixsync_delay]; 


endmodule  