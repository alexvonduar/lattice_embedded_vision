/* Verilog netlist generated by SCUBA Diamond (64-bit) 3.9.0.99.2 */
/* Module Version: 6.5 */
/* C:\lscc\diamond\3.9_x64\ispfpga\bin\nt64\scuba.exe -w -n debayer_dpram -lang verilog -synth synplify -bus_exp 7 -bb -arch sa5p00m -type bram -wp 10 -rp 0011 -rdata_width 12 -data_width 12 -num_rows 4096 -outdata REGISTERED -cascade -1 -resetmode SYNC -sync_reset -mem_init0 -fdc C:/Users/crobinso/Documents/EVDK/ECP5_ISP_fifo_adv_debayer/ECP5_ISP_fifo_my_debayer/source/clarity/dp_ram/debayer_dpram/debayer_dpram.fdc  */
/* Thu Jul 06 09:40:43 2017 */


`timescale 1 ns / 1 ps
module debayer_dpram (WrAddress, RdAddress, Data, WE, RdClock, RdClockEn, 
    Reset, WrClock, WrClockEn, Q)/* synthesis NGD_DRC_MASK=1 */;
    input wire [11:0] WrAddress;
    input wire [11:0] RdAddress;
    input wire [11:0] Data;
    input wire WE;
    input wire RdClock;
    input wire RdClockEn;
    input wire Reset;
    input wire WrClock;
    input wire WrClockEn;
    output wire [11:0] Q;

    wire scuba_vhi;
    wire scuba_vlo;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    defparam debayer_dpram_0_0_2.INIT_DATA = "STATIC" ;
    defparam debayer_dpram_0_0_2.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam debayer_dpram_0_0_2.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_0_2.CSDECODE_B = "0b000" ;
    defparam debayer_dpram_0_0_2.CSDECODE_A = "0b000" ;
    defparam debayer_dpram_0_0_2.WRITEMODE_B = "NORMAL" ;
    defparam debayer_dpram_0_0_2.WRITEMODE_A = "NORMAL" ;
    defparam debayer_dpram_0_0_2.GSR = "ENABLED" ;
    defparam debayer_dpram_0_0_2.RESETMODE = "SYNC" ;
    defparam debayer_dpram_0_0_2.REGMODE_B = "OUTREG" ;
    defparam debayer_dpram_0_0_2.REGMODE_A = "OUTREG" ;
    defparam debayer_dpram_0_0_2.DATA_WIDTH_B = 4 ;
    defparam debayer_dpram_0_0_2.DATA_WIDTH_A = 4 ;
    DP16KD debayer_dpram_0_0_2 (.DIA17(scuba_vlo), .DIA16(scuba_vlo), .DIA15(scuba_vlo), 
        .DIA14(scuba_vlo), .DIA13(scuba_vlo), .DIA12(scuba_vlo), .DIA11(scuba_vlo), 
        .DIA10(scuba_vlo), .DIA9(scuba_vlo), .DIA8(scuba_vlo), .DIA7(scuba_vlo), 
        .DIA6(scuba_vlo), .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(Data[3]), 
        .DIA2(Data[2]), .DIA1(Data[1]), .DIA0(Data[0]), .ADA13(WrAddress[11]), 
        .ADA12(WrAddress[10]), .ADA11(WrAddress[9]), .ADA10(WrAddress[8]), 
        .ADA9(WrAddress[7]), .ADA8(WrAddress[6]), .ADA7(WrAddress[5]), .ADA6(WrAddress[4]), 
        .ADA5(WrAddress[3]), .ADA4(WrAddress[2]), .ADA3(WrAddress[1]), .ADA2(WrAddress[0]), 
        .ADA1(scuba_vlo), .ADA0(scuba_vlo), .CEA(WrClockEn), .OCEA(WrClockEn), 
        .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), .CSA1(scuba_vlo), .CSA0(scuba_vlo), 
        .RSTA(Reset), .DIB17(scuba_vlo), .DIB16(scuba_vlo), .DIB15(scuba_vlo), 
        .DIB14(scuba_vlo), .DIB13(scuba_vlo), .DIB12(scuba_vlo), .DIB11(scuba_vlo), 
        .DIB10(scuba_vlo), .DIB9(scuba_vlo), .DIB8(scuba_vlo), .DIB7(scuba_vlo), 
        .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), .DIB3(scuba_vlo), 
        .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), .ADB13(RdAddress[11]), 
        .ADB12(RdAddress[10]), .ADB11(RdAddress[9]), .ADB10(RdAddress[8]), 
        .ADB9(RdAddress[7]), .ADB8(RdAddress[6]), .ADB7(RdAddress[5]), .ADB6(RdAddress[4]), 
        .ADB5(RdAddress[3]), .ADB4(RdAddress[2]), .ADB3(RdAddress[1]), .ADB2(RdAddress[0]), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA17(), .DOA16(), .DOA15(), .DOA14(), 
        .DOA13(), .DOA12(), .DOA11(), .DOA10(), .DOA9(), .DOA8(), .DOA7(), 
        .DOA6(), .DOA5(), .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB17(), 
        .DOB16(), .DOB15(), .DOB14(), .DOB13(), .DOB12(), .DOB11(), .DOB10(), 
        .DOB9(), .DOB8(), .DOB7(), .DOB6(), .DOB5(), .DOB4(), .DOB3(Q[3]), 
        .DOB2(Q[2]), .DOB1(Q[1]), .DOB0(Q[0]))
             /* synthesis MEM_LPC_FILE="debayer_dpram.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;

    defparam debayer_dpram_0_1_1.INIT_DATA = "STATIC" ;
    defparam debayer_dpram_0_1_1.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam debayer_dpram_0_1_1.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_1_1.CSDECODE_B = "0b000" ;
    defparam debayer_dpram_0_1_1.CSDECODE_A = "0b000" ;
    defparam debayer_dpram_0_1_1.WRITEMODE_B = "NORMAL" ;
    defparam debayer_dpram_0_1_1.WRITEMODE_A = "NORMAL" ;
    defparam debayer_dpram_0_1_1.GSR = "ENABLED" ;
    defparam debayer_dpram_0_1_1.RESETMODE = "SYNC" ;
    defparam debayer_dpram_0_1_1.REGMODE_B = "OUTREG" ;
    defparam debayer_dpram_0_1_1.REGMODE_A = "OUTREG" ;
    defparam debayer_dpram_0_1_1.DATA_WIDTH_B = 4 ;
    defparam debayer_dpram_0_1_1.DATA_WIDTH_A = 4 ;
    DP16KD debayer_dpram_0_1_1 (.DIA17(scuba_vlo), .DIA16(scuba_vlo), .DIA15(scuba_vlo), 
        .DIA14(scuba_vlo), .DIA13(scuba_vlo), .DIA12(scuba_vlo), .DIA11(scuba_vlo), 
        .DIA10(scuba_vlo), .DIA9(scuba_vlo), .DIA8(scuba_vlo), .DIA7(scuba_vlo), 
        .DIA6(scuba_vlo), .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(Data[7]), 
        .DIA2(Data[6]), .DIA1(Data[5]), .DIA0(Data[4]), .ADA13(WrAddress[11]), 
        .ADA12(WrAddress[10]), .ADA11(WrAddress[9]), .ADA10(WrAddress[8]), 
        .ADA9(WrAddress[7]), .ADA8(WrAddress[6]), .ADA7(WrAddress[5]), .ADA6(WrAddress[4]), 
        .ADA5(WrAddress[3]), .ADA4(WrAddress[2]), .ADA3(WrAddress[1]), .ADA2(WrAddress[0]), 
        .ADA1(scuba_vlo), .ADA0(scuba_vlo), .CEA(WrClockEn), .OCEA(WrClockEn), 
        .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), .CSA1(scuba_vlo), .CSA0(scuba_vlo), 
        .RSTA(Reset), .DIB17(scuba_vlo), .DIB16(scuba_vlo), .DIB15(scuba_vlo), 
        .DIB14(scuba_vlo), .DIB13(scuba_vlo), .DIB12(scuba_vlo), .DIB11(scuba_vlo), 
        .DIB10(scuba_vlo), .DIB9(scuba_vlo), .DIB8(scuba_vlo), .DIB7(scuba_vlo), 
        .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), .DIB3(scuba_vlo), 
        .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), .ADB13(RdAddress[11]), 
        .ADB12(RdAddress[10]), .ADB11(RdAddress[9]), .ADB10(RdAddress[8]), 
        .ADB9(RdAddress[7]), .ADB8(RdAddress[6]), .ADB7(RdAddress[5]), .ADB6(RdAddress[4]), 
        .ADB5(RdAddress[3]), .ADB4(RdAddress[2]), .ADB3(RdAddress[1]), .ADB2(RdAddress[0]), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA17(), .DOA16(), .DOA15(), .DOA14(), 
        .DOA13(), .DOA12(), .DOA11(), .DOA10(), .DOA9(), .DOA8(), .DOA7(), 
        .DOA6(), .DOA5(), .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB17(), 
        .DOB16(), .DOB15(), .DOB14(), .DOB13(), .DOB12(), .DOB11(), .DOB10(), 
        .DOB9(), .DOB8(), .DOB7(), .DOB6(), .DOB5(), .DOB4(), .DOB3(Q[7]), 
        .DOB2(Q[6]), .DOB1(Q[5]), .DOB0(Q[4]))
             /* synthesis MEM_LPC_FILE="debayer_dpram.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    defparam debayer_dpram_0_2_0.INIT_DATA = "STATIC" ;
    defparam debayer_dpram_0_2_0.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam debayer_dpram_0_2_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam debayer_dpram_0_2_0.CSDECODE_B = "0b000" ;
    defparam debayer_dpram_0_2_0.CSDECODE_A = "0b000" ;
    defparam debayer_dpram_0_2_0.WRITEMODE_B = "NORMAL" ;
    defparam debayer_dpram_0_2_0.WRITEMODE_A = "NORMAL" ;
    defparam debayer_dpram_0_2_0.GSR = "ENABLED" ;
    defparam debayer_dpram_0_2_0.RESETMODE = "SYNC" ;
    defparam debayer_dpram_0_2_0.REGMODE_B = "OUTREG" ;
    defparam debayer_dpram_0_2_0.REGMODE_A = "OUTREG" ;
    defparam debayer_dpram_0_2_0.DATA_WIDTH_B = 4 ;
    defparam debayer_dpram_0_2_0.DATA_WIDTH_A = 4 ;
    DP16KD debayer_dpram_0_2_0 (.DIA17(scuba_vlo), .DIA16(scuba_vlo), .DIA15(scuba_vlo), 
        .DIA14(scuba_vlo), .DIA13(scuba_vlo), .DIA12(scuba_vlo), .DIA11(scuba_vlo), 
        .DIA10(scuba_vlo), .DIA9(scuba_vlo), .DIA8(scuba_vlo), .DIA7(scuba_vlo), 
        .DIA6(scuba_vlo), .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(Data[11]), 
        .DIA2(Data[10]), .DIA1(Data[9]), .DIA0(Data[8]), .ADA13(WrAddress[11]), 
        .ADA12(WrAddress[10]), .ADA11(WrAddress[9]), .ADA10(WrAddress[8]), 
        .ADA9(WrAddress[7]), .ADA8(WrAddress[6]), .ADA7(WrAddress[5]), .ADA6(WrAddress[4]), 
        .ADA5(WrAddress[3]), .ADA4(WrAddress[2]), .ADA3(WrAddress[1]), .ADA2(WrAddress[0]), 
        .ADA1(scuba_vlo), .ADA0(scuba_vlo), .CEA(WrClockEn), .OCEA(WrClockEn), 
        .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), .CSA1(scuba_vlo), .CSA0(scuba_vlo), 
        .RSTA(Reset), .DIB17(scuba_vlo), .DIB16(scuba_vlo), .DIB15(scuba_vlo), 
        .DIB14(scuba_vlo), .DIB13(scuba_vlo), .DIB12(scuba_vlo), .DIB11(scuba_vlo), 
        .DIB10(scuba_vlo), .DIB9(scuba_vlo), .DIB8(scuba_vlo), .DIB7(scuba_vlo), 
        .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), .DIB3(scuba_vlo), 
        .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), .ADB13(RdAddress[11]), 
        .ADB12(RdAddress[10]), .ADB11(RdAddress[9]), .ADB10(RdAddress[8]), 
        .ADB9(RdAddress[7]), .ADB8(RdAddress[6]), .ADB7(RdAddress[5]), .ADB6(RdAddress[4]), 
        .ADB5(RdAddress[3]), .ADB4(RdAddress[2]), .ADB3(RdAddress[1]), .ADB2(RdAddress[0]), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA17(), .DOA16(), .DOA15(), .DOA14(), 
        .DOA13(), .DOA12(), .DOA11(), .DOA10(), .DOA9(), .DOA8(), .DOA7(), 
        .DOA6(), .DOA5(), .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB17(), 
        .DOB16(), .DOB15(), .DOB14(), .DOB13(), .DOB12(), .DOB11(), .DOB10(), 
        .DOB9(), .DOB8(), .DOB7(), .DOB6(), .DOB5(), .DOB4(), .DOB3(Q[11]), 
        .DOB2(Q[10]), .DOB1(Q[9]), .DOB0(Q[8]))
             /* synthesis MEM_LPC_FILE="debayer_dpram.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;



    // exemplar begin
    // exemplar attribute debayer_dpram_0_0_2 MEM_LPC_FILE debayer_dpram.lpc
    // exemplar attribute debayer_dpram_0_0_2 MEM_INIT_FILE INIT_ALL_0s
    // exemplar attribute debayer_dpram_0_1_1 MEM_LPC_FILE debayer_dpram.lpc
    // exemplar attribute debayer_dpram_0_1_1 MEM_INIT_FILE INIT_ALL_0s
    // exemplar attribute debayer_dpram_0_2_0 MEM_LPC_FILE debayer_dpram.lpc
    // exemplar attribute debayer_dpram_0_2_0 MEM_INIT_FILE INIT_ALL_0s
    // exemplar end

endmodule