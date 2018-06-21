/* synthesis translate_off*/
`define SBP_SIMULATION
/* synthesis translate_on*/
`ifndef SBP_SIMULATION
`define SBP_SYNTHESIS
`endif

//
// Verific Verilog Description of module dual_camera
//
module dual_camera (LUT_FIFO_Data, LUT_FIFO_Q, cross_domain_fifo_Data, 
            cross_domain_fifo_Q, LUT_FIFO_AlmostEmpty, LUT_FIFO_AlmostFull, 
            LUT_FIFO_Empty, LUT_FIFO_Full, LUT_FIFO_RPReset, LUT_FIFO_RdClock, 
            LUT_FIFO_RdEn, LUT_FIFO_Reset, LUT_FIFO_WrClock, LUT_FIFO_WrEn, 
            cross_domain_fifo_AlmostEmpty, cross_domain_fifo_AlmostFull, 
            cross_domain_fifo_Empty, cross_domain_fifo_Full, cross_domain_fifo_RPReset, 
            cross_domain_fifo_RdClock, cross_domain_fifo_RdEn, cross_domain_fifo_Reset, 
            cross_domain_fifo_WrClock, cross_domain_fifo_WrEn, pll_double_CLKI, 
            pll_double_CLKOP, pll_double_CLKOS, pll_double_CLKOS2, pll_double_LOCK, 
            pll_double_RST) /* synthesis sbp_module=true */ ;
    input [9:0]LUT_FIFO_Data;
    output [9:0]LUT_FIFO_Q;
    input [31:0]cross_domain_fifo_Data;
    output [31:0]cross_domain_fifo_Q;
    output LUT_FIFO_AlmostEmpty;
    output LUT_FIFO_AlmostFull;
    output LUT_FIFO_Empty;
    output LUT_FIFO_Full;
    input LUT_FIFO_RPReset;
    input LUT_FIFO_RdClock;
    input LUT_FIFO_RdEn;
    input LUT_FIFO_Reset;
    input LUT_FIFO_WrClock;
    input LUT_FIFO_WrEn;
    output cross_domain_fifo_AlmostEmpty;
    output cross_domain_fifo_AlmostFull;
    output cross_domain_fifo_Empty;
    output cross_domain_fifo_Full;
    input cross_domain_fifo_RPReset;
    input cross_domain_fifo_RdClock;
    input cross_domain_fifo_RdEn;
    input cross_domain_fifo_Reset;
    input cross_domain_fifo_WrClock;
    input cross_domain_fifo_WrEn;
    input pll_double_CLKI;
    output pll_double_CLKOP;
    output pll_double_CLKOS;
    output pll_double_CLKOS2;
    output pll_double_LOCK;
    input pll_double_RST;
    
    
    LUT_FIFO LUT_FIFO_inst (.Data({LUT_FIFO_Data}), .Q({LUT_FIFO_Q}), .AlmostEmpty(LUT_FIFO_AlmostEmpty), 
            .AlmostFull(LUT_FIFO_AlmostFull), .Empty(LUT_FIFO_Empty), .Full(LUT_FIFO_Full), 
            .RPReset(LUT_FIFO_RPReset), .RdClock(LUT_FIFO_RdClock), .RdEn(LUT_FIFO_RdEn), 
            .Reset(LUT_FIFO_Reset), .WrClock(LUT_FIFO_WrClock), .WrEn(LUT_FIFO_WrEn));
    cross_domain_fifo cross_domain_fifo_inst (.Data({cross_domain_fifo_Data}), 
            .Q({cross_domain_fifo_Q}), .AlmostEmpty(cross_domain_fifo_AlmostEmpty), 
            .AlmostFull(cross_domain_fifo_AlmostFull), .Empty(cross_domain_fifo_Empty), 
            .Full(cross_domain_fifo_Full), .RPReset(cross_domain_fifo_RPReset), 
            .RdClock(cross_domain_fifo_RdClock), .RdEn(cross_domain_fifo_RdEn), 
            .Reset(cross_domain_fifo_Reset), .WrClock(cross_domain_fifo_WrClock), 
            .WrEn(cross_domain_fifo_WrEn));
    pll_double pll_double_inst (.CLKI(pll_double_CLKI), .CLKOP(pll_double_CLKOP), 
            .CLKOS(pll_double_CLKOS), .CLKOS2(pll_double_CLKOS2), .LOCK(pll_double_LOCK), 
            .RST(pll_double_RST));
    
endmodule

