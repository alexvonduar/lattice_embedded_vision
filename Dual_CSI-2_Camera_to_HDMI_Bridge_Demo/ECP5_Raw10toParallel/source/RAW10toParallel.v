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

module RAW10toParallel (
	input 			clk_i,
	input 			reset_n,
	
	// Raw10 input from Crosslink
	input        	CSI2_sens_clk ,
	input        	CSI2_sens_fv   ,
	input        	CSI2_sens_lv   ,   
	input [9:0]  	CSI2_sens_data ,
	
	// Parallel video to SiI1136
	output reg [11:0]    	pix_red,
	output reg [11:0]		pix_green,
	output reg [11:0]		pix_blue,
	output reg 				hsync,
	output reg 				vsync,
	output reg 				data_enable,
	output 					pixclk_out,
	
	// Sensor configuration
	inout  wire		scl,
	inout  wire		sda,
	inout  wire		scl2,
	inout  wire		sda2,
	
	// HDMI configuration
	inout 			HDMI_scl,
	inout 			HDMI_sda,
	
	output  wire 	reset_sensor,
	output  wire  	reset_crosslink,

	// blinking led
	output      	q
   );
   
//register input video
reg fv_i;
reg lv_i;
reg [9:0] data_i;

always @ (posedge CSI2_sens_clk or negedge reset_n)
	if(!reset_n) begin
		fv_i <= 0;
		lv_i <= 0;
		data_i <= 0;
	end
	else begin
   		fv_i <= CSI2_sens_fv;
		lv_i <= CSI2_sens_lv;
		data_i <= CSI2_sens_data;
	end
	
//register output video
wire [35:0] 	rgb;
wire [11:0]    	red_o, green_o, blue_o;
wire hsync_o;
wire vsync_o;
wire data_enable_o;	
	
always @ (posedge CSI2_sens_clk or negedge reset_n)
	if(!reset_n) begin
		pix_red <= 0;
		pix_green <= 0;
		pix_blue <= 0;
		hsync <= 0;
		vsync <= 0;
		data_enable <= 0;			
	end
	else begin
		pix_red <= red_o;
		pix_green <= green_o;
		pix_blue <= blue_o;
		hsync <= hsync_o;
		vsync <= vsync_o;
		data_enable <= data_enable_o;
	end
	
assign pixclk_out = ~CSI2_sens_clk;
assign red_o = rgb[35:24];
assign green_o = rgb[23:12];
assign blue_o = rgb[11:0]; 
	
image_pipe image_pipe_inst ( 
	.reset_n     (reset_n),

	.clk         	(CSI2_sens_clk),
	.frame_valid 	(fv_i),
	.line_valid  	(lv_i),
	.pixdata     	({data_i,2'b00}),

	.vsync       	(vsync_o),
	.hsync       	(hsync_o),
	.de          	(data_enable_o),
	.rgb_data		(rgb)
);

i2c_top i2c_inst (
	.clk_i 			(clk_i),
	.rst_n 			(reset_n),

	.scl			(scl),
	.sda			(sda),
	.scl2			(scl2),
	.sda2			(sda2),
	.reset_sensor	(reset_sensor),
	.reset_crosslink(reset_crosslink),
	.q				(q),
	.config_done	()
);

hdmi_i2c_top hdmi_i2c_top_inst(
	.rst_n			(reset_n),
	.clk			(clk_i),
	.scl			(HDMI_scl),
	.sda			(HDMI_sda),
	.config_done 	()
   );
   
endmodule