/* synthesis translate_off*/
`define SBP_SIMULATION
/* synthesis translate_on*/
`ifndef SBP_SIMULATION
`define SBP_SYNTHESIS
`endif

//
// Verific Verilog Description of module Gamma
//
module Gamma (gammaCorrector_din0, gammaCorrector_din1, gammaCorrector_din2, 
            gammaCorrector_dout0, gammaCorrector_dout1, gammaCorrector_dout2, 
            gammaCorrector_clk, gammaCorrector_inpvalid, gammaCorrector_outvalid, 
            gammaCorrector_rstn) /* synthesis sbp_module=true */ ;
    input [11:0]gammaCorrector_din0;
    input [11:0]gammaCorrector_din1;
    input [11:0]gammaCorrector_din2;
    output [11:0]gammaCorrector_dout0;
    output [11:0]gammaCorrector_dout1;
    output [11:0]gammaCorrector_dout2;
    input gammaCorrector_clk;
    input gammaCorrector_inpvalid;
    output gammaCorrector_outvalid;
    input gammaCorrector_rstn;
    
    
    gammaCorrector gammaCorrector_inst (.din0({gammaCorrector_din0}), .din1({gammaCorrector_din1}), 
            .din2({gammaCorrector_din2}), .dout0({gammaCorrector_dout0}), 
            .dout1({gammaCorrector_dout1}), .dout2({gammaCorrector_dout2}), 
            .clk(gammaCorrector_clk), .inpvalid(gammaCorrector_inpvalid), 
            .outvalid(gammaCorrector_outvalid), .rstn(gammaCorrector_rstn));
    
endmodule

