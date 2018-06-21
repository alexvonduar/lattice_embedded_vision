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
module debayer #(
    parameter h_active      = 'd1920     ,
    parameter h_total       = 'd2200     ,
    parameter v_active      = 'd1080     ,
    parameter v_total       = 'd1125    ,
    parameter H_FRONT_PORCH =   'd88     ,
    parameter H_SYNCH       =   'd44     ,
    parameter H_BACK_PORCH  =  'd148     ,
    parameter V_FRONT_PORCH =    'd4     ,
    parameter V_SYNCH       =    'd5
)(
     input                    clk      ,
     input                    rstn     ,
     input                    fv      ,
     input                    lv      ,
     input         [11:0]     din      ,
	 
     output  reg              vsync,
     output  reg              hsync,
     output  reg              de,
     output wire   [11:0]     rout     ,
     output wire   [11:0]     gout     ,
     output wire   [11:0]     bout
);

reg vsync_0, vsync_1;
reg hsync_0, hsync_1;
reg de_0, de_1;

reg [11:0] pixcnt;
reg [11:0] linecnt;

reg start;
reg fv_r;
reg lv_r;

always @(posedge clk or negedge rstn)
   if (!rstn)  
	   fv_r <= 0;
   else 
	   fv_r <= fv;
	   
always @ (posedge clk or negedge rstn)
   if (!rstn) begin  
	  lv_r    <= 0;         
   end 
   else begin
	   lv_r  <= lv;
	end	

always @(posedge clk or negedge rstn)
   if (!rstn)  
	   start <= 0;
   else if (!lv_r & lv)
	   start <= 1;
//  else if (!fv_r & fv)
//	   start <= 0;
 
reg [11:0] din_r;

always @(posedge clk or negedge rstn)
   if (!rstn) begin  
	  din_r <= 0; 
   end
   else begin
	   din_r <= din;
   end
  
	   	   
always @(posedge clk or negedge rstn)
   if (!rstn) begin  
	  pixcnt    <= 12'd0; 
	  linecnt   <= 12'd0; 
	  de_0        <= 0;   
	  hsync_0     <= 0;
	  vsync_0     <= 0;         
   end                                   
   else if (start) begin 
	  pixcnt    <= (pixcnt < (h_total-1)) ? pixcnt+1 : 0;  
				
	  linecnt   <= (linecnt == (v_total-1)) && (pixcnt == (h_total-1))  ? 0         :  
				   (linecnt < (v_total-1)) && (pixcnt == (h_total-1))  ? linecnt+1 : linecnt; 
				
	  de_0     	<= (pixcnt > 12'd0) & (pixcnt <= h_active) & ((linecnt > 0) & (linecnt <= v_active)); 		  
	  hsync_0   <= (pixcnt > (h_active + H_FRONT_PORCH))  & (pixcnt <= (h_active + H_FRONT_PORCH + H_SYNCH)); 
	  vsync_0   <= (linecnt > (v_active + V_FRONT_PORCH)) & (linecnt <= (v_active + V_FRONT_PORCH + V_SYNCH)); 
   end
   else begin  
	  pixcnt    <= 12'd0; 
	  linecnt   <= 12'd0; 
	  de_0      <= 0;   
	  hsync_0   <= 0;
	  vsync_0   <= 0;         
   end 
 
wire [1:0] line;
assign line = linecnt[1:0];

wire [11:0] pix_in;
assign pix_in = pixcnt;
	  
wire [11:0] data_out00, data_out01, data_out10, data_out11;

wire wr00, wr01, wr10, wr11;
assign wr00 = (line == 2'b00) ? lv_r : 1'b0;
assign wr01 = (line == 2'b01) ? lv_r : 1'b0;
assign wr10 = (line == 2'b10) ? lv_r : 1'b0;
assign wr11 = (line == 2'b11) ? lv_r : 1'b0;

debayer_dpram inst00 (
	.WrAddress(pix_in[11:0]), .Data(din_r), .WE(wr00),  .WrClock(clk ), .WrClockEn(1'b1 ),
	.RdAddress(pixcnt[11:0]), .Q(data_out00), .RdClock(clk ), .RdClockEn(1'b1),
    .Reset(!rstn));
debayer_dpram inst01 (
	.WrAddress(pix_in[11:0]), .Data(din_r), .WE(wr01),  .WrClock(clk ), .WrClockEn(1'b1 ),
	.RdAddress(pixcnt[11:0]), .Q(data_out01), .RdClock(clk ), .RdClockEn(1'b1),
    .Reset(!rstn));
	
debayer_dpram inst10 (
	.WrAddress(pix_in[11:0]), .Data(din_r), .WE(wr10),  .WrClock(clk ), .WrClockEn(1'b1 ),
	.RdAddress(pixcnt[11:0]), .Q(data_out10), .RdClock(clk ), .RdClockEn(1'b1),
    .Reset(!rstn));
	
debayer_dpram inst11 (
	.WrAddress(pix_in[11:0]), .Data(din_r), .WE(wr11),  .WrClock(clk ), .WrClockEn(1'b1 ),
	.RdAddress(pixcnt[11:0]), .Q(data_out11), .RdClock(clk ), .RdClockEn(1'b1),
    .Reset(!rstn));
	
// storing pixel in 3 x 3 pattern, load W's from ram and pass through on subsequent clocks
// NW  N  NE
//  W  C   E
// SW  S  SE
reg [13:0] C, N, S, E, W, NW, NE, SW, SE;	

always @ (posedge clk or negedge rstn)
	if (!rstn) begin
		NW <= 0;
		W  <= 0;
		SW <= 0;
	end
	else if (de == 0) begin
		NW <= 0;
		W  <= 0;
		SW <= 0;
	end
	else if(linecnt[1:0] == 2'b00) begin
		NW <= data_out11;
		W  <= data_out10;
		SW <= data_out01;
	end
	else if(linecnt[1:0] == 2'b01) begin
		NW <= data_out00;
		W  <= data_out11;
		SW <= data_out10;
	end
	else if(linecnt[1:0] == 2'b10) begin
		NW <= data_out01;
		W  <= data_out00;
		SW <= data_out11;
	end
	else begin //line == 2'b11
		NW <= data_out10;
		W  <= data_out01;
		SW <= data_out00;
	end
   
always @ (posedge clk or negedge rstn)
   if (!rstn) begin
	   N  <= 0;
	   C  <= 0;
	   S  <= 0;
	   NE <= 0;
	   E  <= 0;
	   SE <= 0;
   end
   else if (de == 0) begin
	   N  <= 0;
	   C  <= 0;
	   S  <= 0;
	   NE <= 0;
	   E  <= 0;
	   SE <= 0;
   end
   else begin
	   N  <= NW;
	   C  <= W;
	   S  <= SW;
	   NE <= N;
	   E  <= C;
	   SE <= S;	 
	end

// Using line and pixcnt to figure out how to calculate RGBwire [1:0] select;
reg [1:0] select1, select2, select3, select4;
assign select = {linecnt[0], pixcnt[0]};

always @ (posedge clk or negedge rstn)
	if (!rstn) begin
		select1 <= 0;
		select2 <= 0;
		select3 <= 0;
		select4 <= 0;
	end
	else  begin
		select1 <= {linecnt[0], pixcnt[0]};
		select2 <= select1;
		select3 <= select2;
		select4 <= select3;
	end

reg  [13:0] r_data_out_r, g_data_out_r, b_data_out_r;

always @ (posedge clk or negedge rstn)
	if (!rstn) begin
		r_data_out_r <= 0;
		g_data_out_r <= 0;
		b_data_out_r <= 0;
	end
	else if(select3 == 2'b00) begin
		r_data_out_r <= C << 2;
		g_data_out_r <= N + S + E + W;
		b_data_out_r <= NE + NW + SE + SW;
	end
	else if(select3 == 2'b01) begin
		r_data_out_r <= (E+W) << 1;
		g_data_out_r <= C << 2;
		b_data_out_r <= (N+S) << 1;
	end   
	else if(select3 == 2'b10) begin
		r_data_out_r <= (N+S) << 1;
		g_data_out_r <= C << 2;
		b_data_out_r <= (E+W) << 1;
	end
	else begin  // 2'b11
		r_data_out_r <= NE + NW + SE + SW;
		g_data_out_r <= N + S + E + W;
		b_data_out_r <= C << 2;
	end

//need to ignore first two pixels of each line

always @(posedge clk or negedge rstn)
   if (!rstn) begin 
	   de_1    <= 0;
	   de      <= 0;
	   vsync_1 <= 0;
	   vsync   <= 0;
	   hsync_1 <= 0;
	   hsync   <= 0;
	end
	else begin
	   de_1    <= de_0;
	   de      <= de_1;
	   vsync_1 <= vsync_0;
	   vsync   <= vsync_1;
	   hsync_1 <= hsync_0;
	   hsync   <= hsync_1;		
	end
		
assign rout = de ? r_data_out_r[13:2] : 12'b0;
assign gout = de ? g_data_out_r[13:2] : 12'b0;
assign bout = de ? b_data_out_r[13:2] : 12'b0;

endmodule

