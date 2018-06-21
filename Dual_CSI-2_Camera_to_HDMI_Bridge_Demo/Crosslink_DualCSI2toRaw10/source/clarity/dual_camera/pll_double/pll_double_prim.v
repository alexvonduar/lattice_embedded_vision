// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.8.0.115.3
// Netlist written on Tue Apr 25 15:23:24 2017
//
// Verilog Description of module pll_double
//

module pll_double (CLKI, RST, CLKOP, CLKOS, CLKOS2, LOCK) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(8[8:18])
    input CLKI;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(9[16:20])
    input RST;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(10[16:19])
    output CLKOP;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(11[17:22])
    output CLKOS;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(12[17:22])
    output CLKOS2;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(13[17:23])
    output LOCK;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(14[17:21])
    
    wire CLKI /* synthesis is_clock=1 */ ;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(9[16:20])
    wire CLKOP /* synthesis is_clock=1 */ ;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(11[17:22])
    wire CLKOS /* synthesis is_clock=1 */ ;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(12[17:22])
    wire CLKOS2 /* synthesis is_clock=1 */ ;   // d:/project/crosslink_video_protocol_board/clean/dual_camera_to_parallel_crosslink/source/clarity/dual_camera/pll_double/pll_double.v(13[17:23])
    
    wire scuba_vlo, VCC_net;
    
    VLO scuba_vlo_inst (.Z(scuba_vlo));
    EHXPLLM PLLInst_0 (.CLKI(CLKI), .CLKFB(CLKOP), .PHASESEL0(scuba_vlo), 
            .PHASESEL1(scuba_vlo), .PHASEDIR(scuba_vlo), .PHASESTEP(scuba_vlo), 
            .PHASELOADREG(scuba_vlo), .USRSTDBY(scuba_vlo), .PLLWAKESYNC(scuba_vlo), 
            .RST(RST), .ENCLKOP(scuba_vlo), .ENCLKOS(scuba_vlo), .ENCLKOS2(scuba_vlo), 
            .ENCLKOS3(scuba_vlo), .CLKOP(CLKOP), .CLKOS(CLKOS), .CLKOS2(CLKOS2), 
            .LOCK(LOCK)) /* synthesis FREQUENCY_PIN_CLKOS2="90.000000", FREQUENCY_PIN_CLKOS="288.000000", FREQUENCY_PIN_CLKOP="288.000000", FREQUENCY_PIN_CLKI="90.000000", ICP_CURRENT="6", LPF_RESISTOR="16", syn_instantiated=1 */ ;
    defparam PLLInst_0.FIN = "100.0000";
    defparam PLLInst_0.CLKI_DIV = 5;
    defparam PLLInst_0.CLKFB_DIV = 16;
    defparam PLLInst_0.CLKOP_DIV = 3;
    defparam PLLInst_0.CLKOS_DIV = 3;
    defparam PLLInst_0.CLKOS2_DIV = 1;
    defparam PLLInst_0.CLKOS3_DIV = 1;
    defparam PLLInst_0.CLKOP_ENABLE = "ENABLED";
    defparam PLLInst_0.CLKOS_ENABLE = "ENABLED";
    defparam PLLInst_0.CLKOS2_ENABLE = "ENABLED";
    defparam PLLInst_0.CLKOS3_ENABLE = "DISABLED";
    defparam PLLInst_0.CLKOP_CPHASE = 2;
    defparam PLLInst_0.CLKOS_CPHASE = 2;
    defparam PLLInst_0.CLKOS2_CPHASE = 0;
    defparam PLLInst_0.CLKOS3_CPHASE = 0;
    defparam PLLInst_0.CLKOP_FPHASE = 0;
    defparam PLLInst_0.CLKOS_FPHASE = 6;
    defparam PLLInst_0.CLKOS2_FPHASE = 0;
    defparam PLLInst_0.CLKOS3_FPHASE = 0;
    defparam PLLInst_0.FEEDBK_PATH = "CLKOP";
    defparam PLLInst_0.CLKOP_TRIM_POL = "FALLING";
    defparam PLLInst_0.CLKOP_TRIM_DELAY = 0;
    defparam PLLInst_0.CLKOS_TRIM_POL = "FALLING";
    defparam PLLInst_0.CLKOS_TRIM_DELAY = 0;
    defparam PLLInst_0.OUTDIVIDER_MUXA = "DIVA";
    defparam PLLInst_0.OUTDIVIDER_MUXB = "DIVB";
    defparam PLLInst_0.OUTDIVIDER_MUXC = "REFCLK";
    defparam PLLInst_0.OUTDIVIDER_MUXD = "DIVD";
    defparam PLLInst_0.PLL_LOCK_MODE = 0;
    defparam PLLInst_0.PLL_LOCK_DELAY = 200;
    defparam PLLInst_0.REFIN_RESET = "DISABLED";
    defparam PLLInst_0.SYNC_ENABLE = "DISABLED";
    defparam PLLInst_0.INT_LOCK_STICKY = "ENABLED";
    defparam PLLInst_0.DPHASE_SOURCE = "DISABLED";
    defparam PLLInst_0.STDBY_ENABLE = "DISABLED";
    defparam PLLInst_0.PLLRST_ENA = "ENABLED";
    defparam PLLInst_0.INTFB_WAKE = "DISABLED";
    GSR GSR_INST (.GSR(VCC_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VHI i85 (.Z(VCC_net));
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

