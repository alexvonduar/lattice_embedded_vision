`timescale 1 ns / 100 ps
module led_15seg_drv 
    (clk,
    resetn,
    err_det,
    blink_speed,
    seg_en,
    seg
    );
    
input               clk;
input               resetn;
input               err_det;
input               blink_speed;
input               seg_en;
output  [14:0]      seg;  

reg     [14:0]      seg;
reg                 blink_speed_d;
reg     [3:0]       state;

`define		Y		`LED_ON
`define 	N		`LED_OFF

`define		IDLE	0
`define		RUN_0	1
`define		RUN_1	2
`define		RUN_2	3
`define		RUN_3	4
`define		RUN_4	5
`define		RUN_5	6
`define		RUN_6	7
`define		RUN_7	8
`define		RUN_8	9
`define		ERR_0	10
`define		ERR_1	11

					  //  DP, P,  N,  M,  L,  K,  J,  H,  G,  F,  E,  D,  C,  B,  A
					  //------------------------------------------------------------
`define		RUN_STATE_0	{`N, `N, `N, `N, `N, `N, `N, `N, `Y, `N, `N, `N, `N, `N, `N} 
`define		RUN_STATE_1	{`N, `N, `N, `N, `N, `N, `N, `Y, `Y, `N, `N, `N, `N, `N, `N} 
`define		RUN_STATE_2	{`N, `N, `N, `N, `N, `N, `Y, `Y, `Y, `N, `N, `N, `N, `N, `N} 
`define		RUN_STATE_3	{`N, `N, `N, `N, `N, `Y, `Y, `Y, `Y, `N, `N, `N, `N, `N, `N} 
`define		RUN_STATE_4	{`N, `N, `N, `N, `Y, `Y, `Y, `Y, `Y, `N, `N, `N, `N, `N, `N} 
`define		RUN_STATE_5	{`N, `N, `N, `Y, `Y, `Y, `Y, `Y, `Y, `N, `N, `N, `N, `N, `N} 
`define		RUN_STATE_6	{`N, `N, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `N, `N, `N, `N, `N, `N} 
`define		RUN_STATE_7	{`N, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `N, `N, `N, `N, `N, `N} 
`define		RUN_STATE_8	{`N, `N, `N, `N, `N, `N, `N, `N, `N, `Y, `Y, `Y, `Y, `Y, `Y} 
`define		ERR_STATE_0	{`Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y, `Y} 
`define		ERR_STATE_1	{`N, `N, `N, `N, `N, `N, `N, `N, `N, `N, `N, `N, `N, `N, `N} 

assign	next_dsply	=	blink_speed && ~blink_speed_d;

always @ (posedge clk or negedge resetn) begin
    if (resetn==0) begin
        state 			<= `IDLE;
        seg			<= `ERR_STATE_1;
        blink_speed_d	<= 1'b0;
    end
    else begin
		case (state)

		`IDLE : begin
			if (seg_en && next_dsply)
			                     state <= `RUN_0;
			else                 state <= `IDLE;
			seg		<=	`ERR_STATE_1;
		end
		
		`RUN_0 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `RUN_1;
				else             state <= `RUN_0;
			seg		<=	`RUN_STATE_0;
		end
		
		`RUN_1 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `RUN_2;
				else             state <= `RUN_1;
			seg		<=	`RUN_STATE_1;
		end
		
		`RUN_2 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `RUN_3;
				else             state <= `RUN_2;
			seg		<=	`RUN_STATE_2;
		end
		
		`RUN_3 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `RUN_4;
				else             state <= `RUN_3;
			seg		<=	`RUN_STATE_3;
		end
		
		`RUN_4 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `RUN_5;
				else             state <= `RUN_4;
			seg		<=	`RUN_STATE_4;
		end
		
		`RUN_5 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `RUN_6;
				else             state <= `RUN_5;
			seg		<=	`RUN_STATE_5;
		end
		
		`RUN_6 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `RUN_7;
				else             state <= `RUN_6;
			seg		<=	`RUN_STATE_6;
		end
		
		`RUN_7 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `RUN_8;
				else             state <= `RUN_7;
			seg		<=	`RUN_STATE_7;
		end
		
		`RUN_8 : begin
			if (err_det)         state <= `ERR_0;
			else if (next_dsply) state <= `IDLE;
				else             state <= `RUN_8;
			seg		<=	`RUN_STATE_8;
		end
		
		`ERR_0 : begin
			if (next_dsply)      state <= `ERR_1;
				else             state <= `ERR_0;
			seg		<=	`ERR_STATE_0;
		end
		
		`ERR_1 : begin
			if (next_dsply)      state <= `ERR_0;
				else             state <= `ERR_1;
			seg		<=	`ERR_STATE_1;
		end
		
		endcase
		
		blink_speed_d	<=	blink_speed;
	end
end

endmodule
