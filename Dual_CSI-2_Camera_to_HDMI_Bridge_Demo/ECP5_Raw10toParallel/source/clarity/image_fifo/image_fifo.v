/* synthesis translate_off*/
`define SBP_SIMULATION
/* synthesis translate_on*/
`ifndef SBP_SIMULATION
`define SBP_SYNTHESIS
`endif

//
// Verific Verilog Description of module image_fifo
//
module image_fifo (sc_fifo_Data, sc_fifo_Q, sc_fifo_Clock, sc_fifo_Empty, 
            sc_fifo_Full, sc_fifo_RdEn, sc_fifo_Reset, sc_fifo_WrEn) /* synthesis sbp_module=true */ ;
    input [9:0]sc_fifo_Data;
    output [9:0]sc_fifo_Q;
    input sc_fifo_Clock;
    output sc_fifo_Empty;
    output sc_fifo_Full;
    input sc_fifo_RdEn;
    input sc_fifo_Reset;
    input sc_fifo_WrEn;
    
    
    sc_fifo sc_fifo_inst (.Data({sc_fifo_Data}), .Q({sc_fifo_Q}), .Clock(sc_fifo_Clock), 
            .Empty(sc_fifo_Empty), .Full(sc_fifo_Full), .RdEn(sc_fifo_RdEn), 
            .Reset(sc_fifo_Reset), .WrEn(sc_fifo_WrEn));
    
endmodule

