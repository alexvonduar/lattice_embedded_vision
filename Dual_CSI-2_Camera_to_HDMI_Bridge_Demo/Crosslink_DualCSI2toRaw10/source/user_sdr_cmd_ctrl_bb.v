`timescale 1 ns/ 1 ns

`define half 
//`include "compiler_directives.v"
module SDR_user_ctrl(
	input 				i_rst_n,
	input 				i_clk,
	input 				i_clk_2,
	input               i_clk_x2,
	
// Ch #1 
	input 				ia_fv,
	input 				ia_lv,
	input [9:0]			ia_data,
	
// Ch #2
	input 				ib_fv,
	input 				ib_lv,
	input 	[9:0]		ib_data,
	
	output	wire 		o_vsync,
	output 	wire 		o_hsync,
	output 	wire [9:0]	o_data
);

endmodule