module control_capture_lane4 #(
		parameter bus_width = 10,
		parameter lane_width = 4,
		parameter format = "RAW10"		
)
(
     input                               rstn    ,
     input                               clk     ,
     input  [8*lane_width-1:0]           din     ,   
     //output reg                      sot     ,
     //output [8*lane_width-1:0]       dout    ,  //dout is din but
     output                              fv      , 
     output                              lv      ,
     output [8*lane_width-1:0]           dout    , 
     output reg [1:0]                    vc      , //virtual channel identifier (2-bit)
     output reg [5:0]                    dt      , //data type (6-bit)
     output reg [15:0]                   wc      , //word count
     output reg [7:0]                    ecc     ,  //Error correction code
	 output reg                          error   ,
	 output dt_correct,
	 output wc_correct,
	 input                               line_length_detect,
	 input  [15:0]                       line_length
);

endmodule