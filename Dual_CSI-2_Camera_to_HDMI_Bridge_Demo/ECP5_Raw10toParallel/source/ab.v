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
module ab #(
	parameter horizontal = 'd1920,
	parameter vertical   = 'd1080,
// 12-bit average
    parameter UPPER      = 'd1200,
    parameter LOWER      = 'd1100,
	parameter max_Gain   = 13'h500,
	parameter min_Gain   = 13'h040,
    parameter ADJUST     = 'h004     
)(
    input rstn          ,
    input clk           ,
    input [11:0] data_in,
    input        fv_in  ,
    input        lv_in  ,

    output reg [11:0] data_out,
    output            fv_out,
    output            lv_out
    );

reg [11:0] q_data_in;
reg [11:0] q_data_gain;
reg [24:0] q_data_gain_clip;
reg [24:0] q_data_gain_shift;
reg [4:0]  fv_dly, lv_dly;

reg [35:0] lumination_calc, lumination;

always @(posedge clk or negedge rstn) 
	if(!rstn) begin
		lumination_calc <= 0;
	end
	else if (lv_in == 1) begin
		lumination_calc <= lumination_calc + data_out;
	end	
	else if (fv_dly[4] == 0) begin
		lumination_calc <= 0;
	end 

	
always @(posedge clk or negedge rstn) 
	if(!rstn) begin
		lumination <= 0;
	end	
	else if(fv_dly[3] && !fv_dly[2]) begin
		lumination <= lumination_calc;	
	end
	
reg[12:0] Gain;

always @(posedge clk or negedge rstn) 
	if(!rstn) begin
		Gain <= 0;
	end	
	else if(fv_dly[4] && !fv_dly[3]) begin
		if ((lumination > (horizontal * vertical * UPPER)) && (Gain > min_Gain))
			Gain <= Gain - ADJUST;
		else if ((lumination < (horizontal * vertical * LOWER)) && (Gain < max_Gain))
			Gain <= Gain + ADJUST;			
	end

//inital register set for inputs
always @(posedge clk or negedge rstn)
begin 
     if(~rstn) begin
        q_data_in    <= 0      ;
     end
     else      begin
        q_data_in    <= data_in; 
     end  
end

//offset + clip  
always @(posedge clk or negedge rstn) 
begin
     if(~rstn) begin
		q_data_gain    <= 0 ; 
     end
     else begin
        q_data_gain    <= 	q_data_in;
     end       
end

always @(posedge clk or negedge rstn)
begin 
     if(~rstn) begin
        q_data_gain_clip    <= 0; 
     end
     else begin
        q_data_gain_clip    <= q_data_gain * Gain;
	end  
end

// Clippling at 12'hfff << 9
wire [24:0] data_gain_clip;
assign data_gain_clip = (q_data_gain_clip > 25'h1FFE00) ? 25'h1FFE00 : q_data_gain_clip; 

// data shifting
always@(posedge clk or negedge rstn)
begin
	if(~rstn) begin
		q_data_gain_shift <= 0;
	end
	else begin
		q_data_gain_shift <= (data_gain_clip >> 9);
	end
end
     
// clip
always@(posedge clk or negedge rstn)
begin
	if(~rstn)
		data_out <= 0;
	else
		data_out <= q_data_gain_shift;

end

//delay fv and lv appropriately
always @(posedge clk or negedge rstn) 
begin
     if(~rstn) begin
        fv_dly     <= 0; lv_dly    <= 0;
     end
     else      begin
        fv_dly[4:0]    <= {fv_dly[3:0], fv_in};
		lv_dly[4:0]    <= {lv_dly[3:0], lv_in};
     end
end
     
assign fv_out = fv_dly[4];
assign lv_out = lv_dly[4];
     
     
endmodule 