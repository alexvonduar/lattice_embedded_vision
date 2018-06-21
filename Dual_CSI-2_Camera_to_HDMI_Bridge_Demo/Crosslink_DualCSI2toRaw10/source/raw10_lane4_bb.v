module raw10_lane4 #(
		parameter bus_width = 10,
		parameter lane_width = 4
)
(
        input                    rstn,
        input                    clk,
        input                    pixclk, 
		input [8*lane_width-1:0] din, 
		input                    fv_8bit, 
		input                    lv_8bit, 
		output [bus_width-1:0]   pixdata, 
		output                   fv, 
		output reg               lv
);

endmodule