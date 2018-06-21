/* Verilog netlist generated by SCUBA Diamond (64-bit) 3.3.0.109 */
/* Module Version: 5.6 */
/* C:\lscc_64\diamond\3.3_x64\ispfpga\bin\nt64\scuba.exe -w -n ecp5_pll -lang verilog -synth synplify -bus_exp 7 -bb -arch sa5p00m -type pll -fin 250 -fclkop 250 -fclkop_tol 0.0 -phase_cntl STATIC -rst -lock -fb_mode 1 -fdc C:/Temp/gammatest/Clarity/coregen/ecp5_pll/ecp5_pll.fdc  */
/* Mon Dec 15 15:46:51 2014 */


`timescale 1 ns / 1 ps
module ecp5_pll (CLKI, RST, CLKOP, LOCK)/* synthesis syn_noprune=1 *//* synthesis NGD_DRC_MASK=1 */;// exemplar attribute ecp5_pll dont_touch true 
    input wire CLKI;
    input wire RST;
    output wire CLKOP;
    output wire LOCK;

    wire REFCLK;
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
    defparam PLLInst_0.CLKOS_FPHASE = 0 ;
    defparam PLLInst_0.CLKOS_CPHASE = 0 ;
    defparam PLLInst_0.CLKOP_FPHASE = 0 ;
    defparam PLLInst_0.CLKOP_CPHASE = 1 ;
    defparam PLLInst_0.PLL_LOCK_MODE = 0 ;
    defparam PLLInst_0.CLKOS_TRIM_DELAY = 0 ;
    defparam PLLInst_0.CLKOS_TRIM_POL = "FALLING" ;
    defparam PLLInst_0.CLKOP_TRIM_DELAY = 0 ;
    defparam PLLInst_0.CLKOP_TRIM_POL = "FALLING" ;
    defparam PLLInst_0.OUTDIVIDER_MUXD = "DIVD" ;
    defparam PLLInst_0.CLKOS3_ENABLE = "DISABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXC = "DIVC" ;
    defparam PLLInst_0.CLKOS2_ENABLE = "DISABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXB = "DIVB" ;
    defparam PLLInst_0.CLKOS_ENABLE = "DISABLED" ;
    defparam PLLInst_0.OUTDIVIDER_MUXA = "DIVA" ;
    defparam PLLInst_0.CLKOP_ENABLE = "ENABLED" ;
    defparam PLLInst_0.CLKOS3_DIV = 1 ;
    defparam PLLInst_0.CLKOS2_DIV = 1 ;
    defparam PLLInst_0.CLKOS_DIV = 1 ;
    defparam PLLInst_0.CLKOP_DIV = 2 ;
    defparam PLLInst_0.CLKFB_DIV = 1 ;
    defparam PLLInst_0.CLKI_DIV = 1 ;
    defparam PLLInst_0.FEEDBK_PATH = "CLKOP" ;
    EHXPLLL PLLInst_0 (.CLKI(CLKI), .CLKFB(CLKOP_t), .PHASESEL1(scuba_vlo), 
        .PHASESEL0(scuba_vlo), .PHASEDIR(scuba_vlo), .PHASESTEP(scuba_vlo), 
        .PHASELOADREG(scuba_vlo), .STDBY(scuba_vlo), .PLLWAKESYNC(scuba_vlo), 
        .RST(RST), .ENCLKOP(scuba_vlo), .ENCLKOS(scuba_vlo), .ENCLKOS2(scuba_vlo), 
        .ENCLKOS3(scuba_vlo), .CLKOP(CLKOP_t), .CLKOS(), .CLKOS2(), .CLKOS3(), 
        .LOCK(LOCK), .INTLOCK(), .REFCLK(REFCLK), .CLKINTFB())
             /* synthesis FREQUENCY_PIN_CLKOP="250.000000" */
             /* synthesis FREQUENCY_PIN_CLKI="250.000000" */
             /* synthesis ICP_CURRENT="11" */
             /* synthesis LPF_RESISTOR="36" */;

    assign CLKOP = CLKOP_t;


    // exemplar begin
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKOP 250.000000
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKI 250.000000
    // exemplar attribute PLLInst_0 ICP_CURRENT 11
    // exemplar attribute PLLInst_0 LPF_RESISTOR 36
    // exemplar end

endmodule
