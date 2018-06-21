/* synthesis translate_off*/
`define SBP_SIMULATION
/* synthesis translate_on*/
`ifndef SBP_SIMULATION
`define SBP_SYNTHESIS
`endif

//
// Verific Verilog Description of module CSC
//
module CSC (colorspace_din0, colorspace_din1, colorspace_din2, colorspace_dout0, 
            colorspace_dout1, colorspace_dout2, colorspace_clk, colorspace_rstn) /* synthesis sbp_module=true */ ;
    input [11:0]colorspace_din0;
    input [11:0]colorspace_din1;
    input [11:0]colorspace_din2;
    output [11:0]colorspace_dout0;
    output [11:0]colorspace_dout1;
    output [11:0]colorspace_dout2;
    input colorspace_clk;
    input colorspace_rstn;
    
    
    colorspace_top colorspace_inst (.din0({colorspace_din0}), .din1({colorspace_din1}), 
            .din2({colorspace_din2}), .dout0({colorspace_dout0}), .dout1({colorspace_dout1}), 
            .dout2({colorspace_dout2}), .clk(colorspace_clk), .rstn(colorspace_rstn));
    
endmodule

