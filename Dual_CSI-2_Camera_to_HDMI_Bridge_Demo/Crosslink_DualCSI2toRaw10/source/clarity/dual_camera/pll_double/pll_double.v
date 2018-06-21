/* Verilog netlist generated by SCUBA Diamond (64-bit) 3.8.0.115.3 */
/* Module Version: 5.7 */
/* C:\lscc\diamond\3.8_x64\ispfpga\bin\nt64\scuba.exe -w -n pll_double -lang verilog -synth lse -bus_exp 7 -bb -arch sn5w00 -type pll -fin 90 -fclkop 288 -fclkop_tol 0.0 -fclkos 288 -fclkos_tol 0.0 -phases 90 -bypasss2 -phase_cntl STATIC -rst -lock -fb_mode 1 -fdc D:/Project/Crosslink_Video_protocol_board/CLean/Dual_Camera_to_Parallel_Crosslink/source/clarity/dual_camera/pll_double/pll_double.fdc  */
/* Tue Apr 25 15:23:28 2017 */


`timescale 1 ns / 1 ps
module pll_double (CLKI, RST, CLKOP, CLKOS, CLKOS2, LOCK)/* synthesis NGD_DRC_MASK=1 */;
    input wire CLKI;
    input wire RST;
    output wire CLKOP;
    output wire CLKOS;
    output wire CLKOS2;
    output wire LOCK;

    wire REFCLK;
    wire CLKOS2_t;
    wire CLKOS_t;
    wire CLKOP_t;
    wire scuba_vhi;
    wire scuba_vlo;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    defparam PLLInst_0.PLLRST_ENA = "ENABLED" ;
    defparam PLLInst_0.INTFB_WAKE = "DISABLED" ;
    defparam PLLInst_0.STDBY_ENABLE = "DISABLED" ;
    defparam PLLInst_0.DPHASE_SOURCE = "DISABLED" ;
    defparam PLLInst_0.CLKOS3_FPHASE = 0 ;
    defparam PLLInst_0.CLKOS3_CPHASE = 0 ;
    defparam PLLInst_0.CLKOS2_FPHASE = 0 ;
    defparam PLLInst_0.CLKOS2_CPHASE = 0 ;
    defparam PLLInst_0.CLKOS_FPHASE = 6 ;
    defparam PLLInst_0.CLKOS_CPHASE = 2 ;
    defparam PLLInst_0.CLKOP_FPHASE = 0 ;
    defparam PLLInst_0.CLKOP_CPHASE = 2 ;
    defparam PLLInst_0.PLL_LOCK_MODE = 0 ;
    defparam PLLInst_0.CLKOS_TRIM_DELAY = 0 ;
    defparam PLLInst_0.CLKOS_TRIM_POL = "FALLING" ;
    defparam PLLInst_0.CLKOP_TRIM_DELAY = 0 ;
    defparam PLLInst_0.CLKOP_TRIM_POL = "FALLING" ;
    defparam PLLInst_0.OUTDIVIDER_MUXD = "DIVD" ;
    defparam PLLInst_0.CLKOS3_ENABLE = "DISABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXC = "REFCLK" ;
    defparam PLLInst_0.CLKOS2_ENABLE = "ENABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXB = "DIVB" ;
    defparam PLLInst_0.CLKOS_ENABLE = "ENABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXA = "DIVA" ;
    defparam PLLInst_0.CLKOP_ENABLE = "ENABLED" ;
    defparam PLLInst_0.CLKOS3_DIV = 1 ;
    defparam PLLInst_0.CLKOS2_DIV = 1 ;
    defparam PLLInst_0.CLKOS_DIV = 3 ;
    defparam PLLInst_0.CLKOP_DIV = 3 ;
    defparam PLLInst_0.CLKFB_DIV = 16 ;
    defparam PLLInst_0.CLKI_DIV = 5 ;
    defparam PLLInst_0.FEEDBK_PATH = "CLKOP" ;
    EHXPLLM PLLInst_0 (.CLKI(CLKI), .CLKFB(CLKOP_t), .PHASESEL1(scuba_vlo), 
        .PHASESEL0(scuba_vlo), .PHASEDIR(scuba_vlo), .PHASESTEP(scuba_vlo), 
        .PHASELOADREG(scuba_vlo), .USRSTDBY(scuba_vlo), .PLLWAKESYNC(scuba_vlo), 
        .RST(RST), .ENCLKOP(scuba_vlo), .ENCLKOS(scuba_vlo), .ENCLKOS2(scuba_vlo), 
        .ENCLKOS3(scuba_vlo), .CLKOP(CLKOP_t), .CLKOS(CLKOS_t), .CLKOS2(CLKOS2_t), 
        .CLKOS3(), .LOCK(LOCK), .INTLOCK(), .REFCLK(REFCLK), .CLKINTFB())
             /* synthesis FREQUENCY_PIN_CLKOS2="90.000000" */
             /* synthesis FREQUENCY_PIN_CLKOS="288.000000" */
             /* synthesis FREQUENCY_PIN_CLKOP="288.000000" */
             /* synthesis FREQUENCY_PIN_CLKI="90.000000" */
             /* synthesis ICP_CURRENT="6" */
             /* synthesis LPF_RESISTOR="16" */;

    assign CLKOS2 = CLKOS2_t;
    assign CLKOS = CLKOS_t;
    assign CLKOP = CLKOP_t;


    // exemplar begin
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKOS2 90.000000
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKOS 288.000000
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKOP 288.000000
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKI 90.000000
    // exemplar attribute PLLInst_0 ICP_CURRENT 6
    // exemplar attribute PLLInst_0 LPF_RESISTOR 16
    // exemplar end

endmodule