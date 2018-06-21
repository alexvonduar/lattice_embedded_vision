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
module image_pipe ( 
     input             reset_n     ,    
     input             clk         ,
	 
     input             frame_valid ,
     input             line_valid  ,
     input [11:0]      pixdata     ,
	 

     output            vsync       ,
     output            hsync       ,
     output            de          ,
     output [35:0]     rgb_data 	   
);

wire [9:0] pixel_data_fifo;
wire lv_fifo, fv_fifo;

wire [11:0] pixel_data_ab;
wire lv_ab, fv_ab;

wire vsync_deb, hsync_deb, de_deb;
wire [11:0] r_deb, g_deb, b_deb;

wire vsync_rgb, hsync_rgb, de_rgb;
wire [11:0] r_rgb, g_rgb, b_rgb;

// Input Buffer and retiming
// discard first frame
reg fv_r;

always @ (posedge clk or negedge reset_n)
	if (!reset_n)
		fv_r <= 0;
	else
		fv_r <= frame_valid;

reg fv_first_frame;
always @ (posedge clk or negedge reset_n)
	if (!reset_n)
		fv_first_frame <= 0;
	else if (!frame_valid & fv_r)
		fv_first_frame <= 1;
	
reg blanking_rstn;
always @ (posedge clk or negedge reset_n)
	if (!reset_n)
		blanking_rstn <= 0;
	else if (line_valid & fv_first_frame)
		blanking_rstn <= 1;	

blanking_adjustment #(
    .h_active('d1920),
    .h_total('d2200),
    .v_active('d1080),
    .v_total('d1125),
    .H_FRONT_PORCH('d88),    
    .H_SYNCH('d44), 
    .H_BACK_PORCH('d148),
    .V_FRONT_PORCH('d4),
    .V_SYNCH('d5)
)
U_inst1( 
    .rstn	(blanking_rstn),
    .clk  	(clk), 
    .fv   	(fv_fifo), 
    .lv   	(lv_fifo) 
); 

image_fifo dcfifo_inst (
    .sc_fifo_Clock	(clk), 
	.sc_fifo_Reset	(~frame_valid),	
	
	.sc_fifo_Data	(pixdata[11:2]),     
    .sc_fifo_WrEn	(line_valid),  

	.sc_fifo_Q		(pixel_data_fifo),
	.sc_fifo_RdEn	(lv_fifo),	

	.sc_fifo_Empty	(), 
	.sc_fifo_Full	() 
 	);	
	
reg lv_fifo_r;
reg fv_fifo_r;

always @ (posedge clk or negedge reset_n)
	if (!reset_n) begin
		lv_fifo_r <= 0;
		fv_fifo_r <= 0;
		end
	else begin
		lv_fifo_r <= lv_fifo;	
		fv_fifo_r <= fv_fifo;	
    end		

ab #(
	.horizontal('d1920),
	.vertical('d1080)
) u_ab (                    
	.rstn		(reset_n),
	.clk		(clk),

	.data_in	({pixel_data_fifo, 2'b0}),
	.fv_in		(fv_fifo_r),
	.lv_in		(lv_fifo_r),                                       
						 
	.data_out	(pixel_data_ab),
	.fv_out		(fv_ab),   
	.lv_out		(lv_ab)
);   

debayer #(
    .h_active('d1920),
    .h_total('d2200),
    .v_active('d1080),
    .v_total('d1125),
    .H_FRONT_PORCH('d88),    
    .H_SYNCH('d44), 
    .H_BACK_PORCH('d148),
    .V_FRONT_PORCH('d4),
    .V_SYNCH('d5)
) u_debayer (
	.clk     	(clk),
	.rstn     	(reset_n),

	.fv     	(fv_ab),
	.lv     	(lv_ab),
	.din     	(pixel_data_ab),

	.vsync   	(vsync_deb),
	.hsync   	(hsync_deb),
	.de      	(de_deb),
	.rout    	(r_deb),
	.gout    	(g_deb),
	.bout    	(b_deb)
);

color u_color (     
	.clk     	(clk),
	.rstn     	(reset_n),

	.R_in     	(r_deb),
	.G_in     	(g_deb),
	.B_in 		(b_deb),
	.vsync_in	(vsync_deb),
	.hsync_in	(hsync_deb),
	.de_in	    (de_deb),

	.R_out		(r_rgb),
	.G_out		(g_rgb),
	.B_out		(b_rgb),
	.vsync_out	(vsync_rgb),
	.hsync_out	(hsync_rgb),
	.de_out		(de_rgb)
);

gamma_correction u_gamma_correction (
     .clk		(clk),
     .rstn		(reset_n),
	 
     .vsync_in	(vsync_rgb),
     .hsync_in	(hsync_rgb),
     .de_in		(de_rgb),
     .r_in		(r_rgb), 
     .g_in		(g_rgb),
     .b_in		(b_rgb),
	 
     .vsync_out	(vsync),
     .hsync_out	(hsync),
     .de_out	(de),
     .r_out		(rgb_data[35:24]),
     .g_out		(rgb_data[23:12]),
     .b_out		(rgb_data[11:0])
	 );  
 
 
endmodule                     