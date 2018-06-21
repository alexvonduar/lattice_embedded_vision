// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.8.0.64.0
// Netlist written on Thu Jun 30 10:30:10 2016
//
// Verilog Description of module cross_domain_fifo
//

module cross_domain_fifo (Data, WrClock, RdClock, WrEn, RdEn, Reset, 
            RPReset, Q, Empty, Full, AlmostEmpty, AlmostFull) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(8[8:25])
    input [31:0]Data;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(10[23:27])
    input WrClock;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(11[16:23])
    input RdClock;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(12[16:23])
    input WrEn;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(13[16:20])
    input RdEn;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(14[16:20])
    input Reset;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(15[16:21])
    input RPReset;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(16[16:23])
    output [31:0]Q;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(17[24:25])
    output Empty;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(18[17:22])
    output Full;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(19[17:21])
    output AlmostEmpty;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(20[17:28])
    output AlmostFull;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(21[17:27])
    
    wire WrClock /* synthesis is_clock=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(11[16:23])
    wire RdClock /* synthesis is_clock=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(12[16:23])
    
    wire invout_1, invout_0, w_g2b_xor_cluster_1, r_g2b_xor_cluster_1, 
        w_gdata_0, w_gdata_1, w_gdata_2, w_gdata_3, w_gdata_4, w_gdata_5, 
        w_gdata_6, w_gdata_7, wptr_0, wptr_1, wptr_2, wptr_3, wptr_4, 
        wptr_5, wptr_6, wptr_7, wptr_8, r_gdata_0, r_gdata_1, r_gdata_2, 
        r_gdata_3, r_gdata_4, r_gdata_5, r_gdata_6, r_gdata_7, rptr_0, 
        rptr_1, rptr_2, rptr_3, rptr_4, rptr_5, rptr_6, rptr_7, 
        rptr_8, w_gcount_0, w_gcount_1, w_gcount_2, w_gcount_3, w_gcount_4, 
        w_gcount_5, w_gcount_6, w_gcount_7, w_gcount_8, r_gcount_0, 
        r_gcount_1, r_gcount_2, r_gcount_3, r_gcount_4, r_gcount_5, 
        r_gcount_6, r_gcount_7, r_gcount_8, w_gcount_r20, w_gcount_r0, 
        w_gcount_r21, w_gcount_r1, w_gcount_r22, w_gcount_r2, w_gcount_r23, 
        w_gcount_r3, w_gcount_r24, w_gcount_r4, w_gcount_r25, w_gcount_r5, 
        w_gcount_r26, w_gcount_r6, w_gcount_r27, w_gcount_r7, w_gcount_r28, 
        w_gcount_r8, r_gcount_w20, r_gcount_w0, r_gcount_w21, r_gcount_w1, 
        r_gcount_w22, r_gcount_w2, r_gcount_w23, r_gcount_w3, r_gcount_w24, 
        r_gcount_w4, r_gcount_w25, r_gcount_w5, r_gcount_w26, r_gcount_w6, 
        r_gcount_w27, r_gcount_w7, r_gcount_w28, r_gcount_w8, rRst, 
        ae_d, af_d, iwcount_0, iwcount_1, w_gctr_ci, iwcount_2, 
        iwcount_3, co0, iwcount_4, iwcount_5, co1, iwcount_6, iwcount_7, 
        co2, iwcount_8, co3, wcount_8, ircount_0, ircount_1, r_gctr_ci, 
        ircount_2, ircount_3, co0_1, ircount_4, ircount_5, co1_1, 
        ircount_6, ircount_7, co2_1, ircount_8, co3_1, rcount_8, 
        cmp_ci, rcount_0, rcount_1, co0_2, rcount_2, rcount_3, co1_2, 
        rcount_4, rcount_5, co2_2, rcount_6, rcount_7, co3_2, empty_cmp_clr, 
        empty_cmp_set, empty_d, empty_d_c, cmp_ci_1, wcount_0, wcount_1, 
        co0_3, wcount_2, wcount_3, co1_3, wcount_4, wcount_5, co2_3, 
        wcount_6, wcount_7, co3_3, full_cmp_clr, full_cmp_set, full_d, 
        full_d_c, iae_setcount_0, iae_setcount_1, ae_set_ctr_ci, iae_setcount_2, 
        iae_setcount_3, co0_4, iae_setcount_4, iae_setcount_5, co1_4, 
        iae_setcount_6, iae_setcount_7, co2_4, iae_setcount_8, co3_4, 
        ae_setcount_8, cmp_ci_2, ae_setcount_0, ae_setcount_1, co0_5, 
        ae_setcount_2, ae_setcount_3, co1_5, ae_setcount_4, ae_setcount_5, 
        co2_5, ae_setcount_6, ae_setcount_7, co3_5, ae_set_cmp_clr, 
        ae_set_cmp_set, ae_set_d, ae_set_d_c, iae_clrcount_0, iae_clrcount_1, 
        ae_clr_ctr_ci, iae_clrcount_2, iae_clrcount_3, co0_6, iae_clrcount_4, 
        iae_clrcount_5, co1_6, iae_clrcount_6, iae_clrcount_7, co2_6, 
        iae_clrcount_8, co3_6, ae_clrcount_8, rden_i, cmp_ci_3, wcount_r0, 
        wcount_r1, ae_clrcount_0, ae_clrcount_1, co0_7, wcount_r2, 
        wcount_r3, ae_clrcount_2, ae_clrcount_3, co1_7, wcount_r4, 
        w_g2b_xor_cluster_0, ae_clrcount_4, ae_clrcount_5, co2_7, wcount_r6, 
        wcount_r7, ae_clrcount_6, ae_clrcount_7, co3_7, ae_clr_cmp_clr, 
        ae_clr_cmp_set, ae_clr_d, ae_clr_d_c, iaf_setcount_0, iaf_setcount_1, 
        af_set_ctr_ci, iaf_setcount_2, iaf_setcount_3, co0_8, iaf_setcount_4, 
        iaf_setcount_5, co1_8, iaf_setcount_6, iaf_setcount_7, co2_8, 
        iaf_setcount_8, co3_8, af_setcount_8, cmp_ci_4, af_setcount_0, 
        af_setcount_1, co0_9, af_setcount_2, af_setcount_3, co1_9, 
        af_setcount_4, af_setcount_5, co2_9, af_setcount_6, af_setcount_7, 
        co3_9, af_set_cmp_clr, af_set_cmp_set, af_set, af_set_c, iaf_clrcount_0, 
        iaf_clrcount_1, af_clr_ctr_ci, iaf_clrcount_2, iaf_clrcount_3, 
        co0_10, iaf_clrcount_4, iaf_clrcount_5, co1_10, iaf_clrcount_6, 
        iaf_clrcount_7, co2_10, iaf_clrcount_8, co3_10, af_clrcount_8, 
        wren_i, cmp_ci_5, rcount_w0, rcount_w1, af_clrcount_0, af_clrcount_1, 
        co0_11, rcount_w2, rcount_w3, af_clrcount_2, af_clrcount_3, 
        co1_11, rcount_w4, r_g2b_xor_cluster_0, af_clrcount_4, af_clrcount_5, 
        co2_11, rcount_w6, rcount_w7, af_clrcount_6, af_clrcount_7, 
        co3_11, af_clr_cmp_clr, af_clr_cmp_set, af_clr, scuba_vhi, 
        scuba_vlo, af_clr_c;
    
    ROM16X1A LUT4_30 (.AD0(w_gcount_r24), .AD1(w_gcount_r23), .AD2(w_gcount_r22), 
            .AD3(w_gcount_r21), .DO0(w_g2b_xor_cluster_1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_30.initval = 16'b0110100110010110;
    ROM16X1A LUT4_29 (.AD0(scuba_vlo), .AD1(scuba_vlo), .AD2(w_gcount_r28), 
            .AD3(w_gcount_r27), .DO0(wcount_r7)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_29.initval = 16'b0110100110010110;
    ROM16X1A LUT4_28 (.AD0(scuba_vlo), .AD1(w_gcount_r28), .AD2(w_gcount_r27), 
            .AD3(w_gcount_r26), .DO0(wcount_r6)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_28.initval = 16'b0110100110010110;
    ROM16X1A LUT4_27 (.AD0(wcount_r7), .AD1(w_gcount_r26), .AD2(w_gcount_r25), 
            .AD3(w_gcount_r24), .DO0(wcount_r4)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_27.initval = 16'b0110100110010110;
    ROM16X1A LUT4_26 (.AD0(wcount_r6), .AD1(w_gcount_r25), .AD2(w_gcount_r24), 
            .AD3(w_gcount_r23), .DO0(wcount_r3)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_26.initval = 16'b0110100110010110;
    ROM16X1A LUT4_25 (.AD0(w_g2b_xor_cluster_0), .AD1(w_gcount_r24), .AD2(w_gcount_r23), 
            .AD3(w_gcount_r22), .DO0(wcount_r2)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_25.initval = 16'b0110100110010110;
    ROM16X1A LUT4_24 (.AD0(scuba_vlo), .AD1(scuba_vlo), .AD2(w_g2b_xor_cluster_1), 
            .AD3(w_g2b_xor_cluster_0), .DO0(wcount_r1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_24.initval = 16'b0110100110010110;
    ROM16X1A LUT4_23 (.AD0(scuba_vlo), .AD1(w_gcount_r20), .AD2(w_g2b_xor_cluster_1), 
            .AD3(w_g2b_xor_cluster_0), .DO0(wcount_r0)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_23.initval = 16'b0110100110010110;
    ROM16X1A LUT4_22 (.AD0(r_gcount_w28), .AD1(r_gcount_w27), .AD2(r_gcount_w26), 
            .AD3(r_gcount_w25), .DO0(r_g2b_xor_cluster_0)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_22.initval = 16'b0110100110010110;
    ROM16X1A LUT4_21 (.AD0(r_gcount_w24), .AD1(r_gcount_w23), .AD2(r_gcount_w22), 
            .AD3(r_gcount_w21), .DO0(r_g2b_xor_cluster_1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_21.initval = 16'b0110100110010110;
    ROM16X1A LUT4_20 (.AD0(scuba_vlo), .AD1(scuba_vlo), .AD2(r_gcount_w28), 
            .AD3(r_gcount_w27), .DO0(rcount_w7)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_20.initval = 16'b0110100110010110;
    ROM16X1A LUT4_19 (.AD0(scuba_vlo), .AD1(r_gcount_w28), .AD2(r_gcount_w27), 
            .AD3(r_gcount_w26), .DO0(rcount_w6)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_19.initval = 16'b0110100110010110;
    ROM16X1A LUT4_18 (.AD0(rcount_w7), .AD1(r_gcount_w26), .AD2(r_gcount_w25), 
            .AD3(r_gcount_w24), .DO0(rcount_w4)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_18.initval = 16'b0110100110010110;
    ROM16X1A LUT4_17 (.AD0(rcount_w6), .AD1(r_gcount_w25), .AD2(r_gcount_w24), 
            .AD3(r_gcount_w23), .DO0(rcount_w3)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_17.initval = 16'b0110100110010110;
    ROM16X1A LUT4_16 (.AD0(r_g2b_xor_cluster_0), .AD1(r_gcount_w24), .AD2(r_gcount_w23), 
            .AD3(r_gcount_w22), .DO0(rcount_w2)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_16.initval = 16'b0110100110010110;
    ROM16X1A LUT4_15 (.AD0(scuba_vlo), .AD1(scuba_vlo), .AD2(r_g2b_xor_cluster_1), 
            .AD3(r_g2b_xor_cluster_0), .DO0(rcount_w1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_15.initval = 16'b0110100110010110;
    ROM16X1A LUT4_14 (.AD0(scuba_vlo), .AD1(r_gcount_w20), .AD2(r_g2b_xor_cluster_1), 
            .AD3(r_g2b_xor_cluster_0), .DO0(rcount_w0)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_14.initval = 16'b0110100110010110;
    ROM16X1A LUT4_13 (.AD0(scuba_vlo), .AD1(w_gcount_r28), .AD2(rcount_8), 
            .AD3(rptr_8), .DO0(empty_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_13.initval = 16'b0000010000010000;
    ROM16X1A LUT4_12 (.AD0(scuba_vlo), .AD1(w_gcount_r28), .AD2(rcount_8), 
            .AD3(rptr_8), .DO0(empty_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_12.initval = 16'b0001000000000100;
    ROM16X1A LUT4_11 (.AD0(scuba_vlo), .AD1(r_gcount_w28), .AD2(wcount_8), 
            .AD3(wptr_8), .DO0(full_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_11.initval = 16'b0000000101000000;
    ROM16X1A LUT4_10 (.AD0(scuba_vlo), .AD1(r_gcount_w28), .AD2(wcount_8), 
            .AD3(wptr_8), .DO0(full_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_10.initval = 16'b0100000000000001;
    ROM16X1A LUT4_9 (.AD0(rptr_8), .AD1(w_gcount_r28), .AD2(rcount_8), 
            .AD3(ae_setcount_8), .DO0(ae_set_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_9.initval = 16'b0001001111001000;
    ROM16X1A LUT4_8 (.AD0(rptr_8), .AD1(w_gcount_r28), .AD2(rcount_8), 
            .AD3(ae_setcount_8), .DO0(ae_set_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_8.initval = 16'b0010000000000100;
    ROM16X1A LUT4_7 (.AD0(rptr_8), .AD1(w_gcount_r28), .AD2(rcount_8), 
            .AD3(ae_clrcount_8), .DO0(ae_clr_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_7.initval = 16'b0001001111001000;
    ROM16X1A LUT4_6 (.AD0(rptr_8), .AD1(w_gcount_r28), .AD2(rcount_8), 
            .AD3(ae_clrcount_8), .DO0(ae_clr_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_6.initval = 16'b0010000000000100;
    ROM16X1A LUT4_5 (.AD0(scuba_vlo), .AD1(ae_clr_d), .AD2(ae_set_d), 
            .AD3(AlmostEmpty), .DO0(ae_d)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_5.initval = 16'b0100010001010000;
    ROM16X1A LUT4_4 (.AD0(wptr_8), .AD1(r_gcount_w28), .AD2(wcount_8), 
            .AD3(af_setcount_8), .DO0(af_set_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_4.initval = 16'b0100110000110010;
    ROM16X1A LUT4_3 (.AD0(wptr_8), .AD1(r_gcount_w28), .AD2(wcount_8), 
            .AD3(af_setcount_8), .DO0(af_set_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_3.initval = 16'b1000000000000001;
    ROM16X1A LUT4_2 (.AD0(wptr_8), .AD1(r_gcount_w28), .AD2(wcount_8), 
            .AD3(af_clrcount_8), .DO0(af_clr_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_2.initval = 16'b0100110000110010;
    ROM16X1A LUT4_1 (.AD0(wptr_8), .AD1(r_gcount_w28), .AD2(wcount_8), 
            .AD3(af_clrcount_8), .DO0(af_clr_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_1.initval = 16'b1000000000000001;
    ROM16X1A LUT4_0 (.AD0(scuba_vlo), .AD1(af_clr), .AD2(af_set), .AD3(AlmostFull), 
            .DO0(af_d)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_0.initval = 16'b0100010001010000;
    PDPW8KE pdp_ram_0_0_1 (.DI0(Data[0]), .DI1(Data[1]), .DI2(Data[2]), 
            .DI3(Data[3]), .DI4(Data[4]), .DI5(Data[5]), .DI6(Data[6]), 
            .DI7(Data[7]), .DI8(Data[8]), .DI9(Data[9]), .DI10(Data[10]), 
            .DI11(Data[11]), .DI12(Data[12]), .DI13(Data[13]), .DI14(Data[14]), 
            .DI15(Data[15]), .DI16(Data[16]), .DI17(Data[17]), .ADW0(wptr_0), 
            .ADW1(wptr_1), .ADW2(wptr_2), .ADW3(wptr_3), .ADW4(wptr_4), 
            .ADW5(wptr_5), .ADW6(wptr_6), .ADW7(wptr_7), .ADW8(scuba_vlo), 
            .BE0(scuba_vhi), .BE1(scuba_vhi), .CEW(wren_i), .CLKW(WrClock), 
            .CSW0(scuba_vhi), .CSW1(scuba_vlo), .CSW2(scuba_vlo), .ADR0(scuba_vlo), 
            .ADR1(scuba_vlo), .ADR2(scuba_vlo), .ADR3(scuba_vlo), .ADR4(rptr_0), 
            .ADR5(rptr_1), .ADR6(rptr_2), .ADR7(rptr_3), .ADR8(rptr_4), 
            .ADR9(rptr_5), .ADR10(rptr_6), .ADR11(rptr_7), .ADR12(scuba_vlo), 
            .CER(rden_i), .OCER(rden_i), .CLKR(RdClock), .CSR0(scuba_vlo), 
            .CSR1(scuba_vlo), .CSR2(scuba_vlo), .RST(Reset), .DO0(Q[9]), 
            .DO1(Q[10]), .DO2(Q[11]), .DO3(Q[12]), .DO4(Q[13]), .DO5(Q[14]), 
            .DO6(Q[15]), .DO7(Q[16]), .DO8(Q[17]), .DO9(Q[0]), .DO10(Q[1]), 
            .DO11(Q[2]), .DO12(Q[3]), .DO13(Q[4]), .DO14(Q[5]), .DO15(Q[6]), 
            .DO16(Q[7]), .DO17(Q[8])) /* synthesis MEM_LPC_FILE="cross_domain_fifo.lpc", MEM_INIT_FILE="", syn_instantiated=1 */ ;
    defparam pdp_ram_0_0_1.DATA_WIDTH_W = 18;
    defparam pdp_ram_0_0_1.DATA_WIDTH_R = 18;
    defparam pdp_ram_0_0_1.REGMODE = "NOREG";
    defparam pdp_ram_0_0_1.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_1.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_1.GSR = "ENABLED";
    defparam pdp_ram_0_0_1.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_1.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_1.INIT_DATA = "STATIC";
    defparam pdp_ram_0_0_1.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_1.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    FD1P3DX FF_128 (.D(iwcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(571[13] 572[22])
    defparam FF_128.GSR = "ENABLED";
    FD1P3DX FF_127 (.D(iwcount_2), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(575[13] 576[22])
    defparam FF_127.GSR = "ENABLED";
    FD1P3DX FF_126 (.D(iwcount_3), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(579[13] 580[22])
    defparam FF_126.GSR = "ENABLED";
    FD1P3DX FF_125 (.D(iwcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(583[13] 584[22])
    defparam FF_125.GSR = "ENABLED";
    FD1P3DX FF_124 (.D(iwcount_5), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(587[13] 588[22])
    defparam FF_124.GSR = "ENABLED";
    FD1P3DX FF_123 (.D(iwcount_6), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(591[13] 592[22])
    defparam FF_123.GSR = "ENABLED";
    FD1P3DX FF_122 (.D(iwcount_7), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(595[13] 596[22])
    defparam FF_122.GSR = "ENABLED";
    FD1P3DX FF_121 (.D(iwcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(599[13] 600[22])
    defparam FF_121.GSR = "ENABLED";
    FD1P3DX FF_120 (.D(w_gdata_0), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(603[13] 604[24])
    defparam FF_120.GSR = "ENABLED";
    FD1P3DX FF_119 (.D(w_gdata_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(607[13] 608[24])
    defparam FF_119.GSR = "ENABLED";
    FD1P3DX FF_118 (.D(w_gdata_2), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(611[13] 612[24])
    defparam FF_118.GSR = "ENABLED";
    FD1P3DX FF_117 (.D(w_gdata_3), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(615[13] 616[24])
    defparam FF_117.GSR = "ENABLED";
    FD1P3DX FF_116 (.D(w_gdata_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(619[13] 620[24])
    defparam FF_116.GSR = "ENABLED";
    FD1P3DX FF_115 (.D(w_gdata_5), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(623[13] 624[24])
    defparam FF_115.GSR = "ENABLED";
    FD1P3DX FF_114 (.D(w_gdata_6), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(627[13] 628[24])
    defparam FF_114.GSR = "ENABLED";
    FD1P3DX FF_113 (.D(w_gdata_7), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(631[13] 632[24])
    defparam FF_113.GSR = "ENABLED";
    FD1P3DX FF_112 (.D(wcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(635[13] 636[24])
    defparam FF_112.GSR = "ENABLED";
    FD1P3DX FF_111 (.D(wcount_0), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(639[13] 640[20])
    defparam FF_111.GSR = "ENABLED";
    FD1P3DX FF_110 (.D(wcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(643[13] 644[20])
    defparam FF_110.GSR = "ENABLED";
    FD1P3DX FF_109 (.D(wcount_2), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(647[13] 648[20])
    defparam FF_109.GSR = "ENABLED";
    FD1P3DX FF_108 (.D(wcount_3), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(651[13] 652[20])
    defparam FF_108.GSR = "ENABLED";
    FD1P3DX FF_107 (.D(wcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(655[13] 656[20])
    defparam FF_107.GSR = "ENABLED";
    FD1P3DX FF_106 (.D(wcount_5), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(659[13] 660[20])
    defparam FF_106.GSR = "ENABLED";
    FD1P3DX FF_105 (.D(wcount_6), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(663[13] 664[20])
    defparam FF_105.GSR = "ENABLED";
    FD1P3DX FF_104 (.D(wcount_7), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(667[13] 668[20])
    defparam FF_104.GSR = "ENABLED";
    FD1P3DX FF_103 (.D(wcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(671[13] 672[20])
    defparam FF_103.GSR = "ENABLED";
    FD1P3BX FF_102 (.D(ircount_0), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(rcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(675[13] 676[22])
    defparam FF_102.GSR = "ENABLED";
    FD1P3DX FF_101 (.D(ircount_1), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(679[13] 680[22])
    defparam FF_101.GSR = "ENABLED";
    FD1P3DX FF_100 (.D(ircount_2), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(683[13] 684[22])
    defparam FF_100.GSR = "ENABLED";
    FD1P3DX FF_99 (.D(ircount_3), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(687[13] 688[22])
    defparam FF_99.GSR = "ENABLED";
    FD1P3DX FF_98 (.D(ircount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(691[13] 692[22])
    defparam FF_98.GSR = "ENABLED";
    FD1P3DX FF_97 (.D(ircount_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(695[13] 696[22])
    defparam FF_97.GSR = "ENABLED";
    FD1P3DX FF_96 (.D(ircount_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(699[13] 700[22])
    defparam FF_96.GSR = "ENABLED";
    FD1P3DX FF_95 (.D(ircount_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(703[13] 704[22])
    defparam FF_95.GSR = "ENABLED";
    FD1P3DX FF_94 (.D(ircount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(707[13] 708[22])
    defparam FF_94.GSR = "ENABLED";
    FD1P3DX FF_93 (.D(r_gdata_0), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(711[13] 712[24])
    defparam FF_93.GSR = "ENABLED";
    FD1P3DX FF_92 (.D(r_gdata_1), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(715[13] 716[24])
    defparam FF_92.GSR = "ENABLED";
    FD1P3DX FF_91 (.D(r_gdata_2), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(719[13] 720[24])
    defparam FF_91.GSR = "ENABLED";
    FD1P3DX FF_90 (.D(r_gdata_3), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(723[13] 724[24])
    defparam FF_90.GSR = "ENABLED";
    FD1P3DX FF_89 (.D(r_gdata_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(727[13] 728[24])
    defparam FF_89.GSR = "ENABLED";
    FD1P3DX FF_88 (.D(r_gdata_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(731[13] 732[24])
    defparam FF_88.GSR = "ENABLED";
    FD1P3DX FF_87 (.D(r_gdata_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(735[13] 736[24])
    defparam FF_87.GSR = "ENABLED";
    FD1P3DX FF_86 (.D(r_gdata_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(739[13] 740[24])
    defparam FF_86.GSR = "ENABLED";
    FD1P3DX FF_85 (.D(rcount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(743[13:87])
    defparam FF_85.GSR = "ENABLED";
    FD1P3DX FF_84 (.D(rcount_0), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(746[13:83])
    defparam FF_84.GSR = "ENABLED";
    FD1P3DX FF_83 (.D(rcount_1), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(749[13:83])
    defparam FF_83.GSR = "ENABLED";
    FD1P3DX FF_82 (.D(rcount_2), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(752[13:83])
    defparam FF_82.GSR = "ENABLED";
    FD1P3DX FF_81 (.D(rcount_3), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(755[13:83])
    defparam FF_81.GSR = "ENABLED";
    FD1P3DX FF_80 (.D(rcount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(758[13:83])
    defparam FF_80.GSR = "ENABLED";
    FD1P3DX FF_79 (.D(rcount_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(761[13:83])
    defparam FF_79.GSR = "ENABLED";
    FD1P3DX FF_78 (.D(rcount_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(764[13:83])
    defparam FF_78.GSR = "ENABLED";
    FD1P3DX FF_77 (.D(rcount_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(767[13:83])
    defparam FF_77.GSR = "ENABLED";
    FD1P3DX FF_76 (.D(rcount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(770[13:83])
    defparam FF_76.GSR = "ENABLED";
    FD1S3DX FF_75 (.D(w_gcount_0), .CK(RdClock), .CD(Reset), .Q(w_gcount_r0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(773[13:78])
    defparam FF_75.GSR = "ENABLED";
    FD1S3DX FF_74 (.D(w_gcount_1), .CK(RdClock), .CD(Reset), .Q(w_gcount_r1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(776[13:78])
    defparam FF_74.GSR = "ENABLED";
    FD1S3DX FF_73 (.D(w_gcount_2), .CK(RdClock), .CD(Reset), .Q(w_gcount_r2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(779[13:78])
    defparam FF_73.GSR = "ENABLED";
    FD1S3DX FF_72 (.D(w_gcount_3), .CK(RdClock), .CD(Reset), .Q(w_gcount_r3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(782[13:78])
    defparam FF_72.GSR = "ENABLED";
    FD1S3DX FF_71 (.D(w_gcount_4), .CK(RdClock), .CD(Reset), .Q(w_gcount_r4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(785[13:78])
    defparam FF_71.GSR = "ENABLED";
    FD1S3DX FF_70 (.D(w_gcount_5), .CK(RdClock), .CD(Reset), .Q(w_gcount_r5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(788[13:78])
    defparam FF_70.GSR = "ENABLED";
    FD1S3DX FF_69 (.D(w_gcount_6), .CK(RdClock), .CD(Reset), .Q(w_gcount_r6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(791[13:78])
    defparam FF_69.GSR = "ENABLED";
    FD1S3DX FF_68 (.D(w_gcount_7), .CK(RdClock), .CD(Reset), .Q(w_gcount_r7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(794[13:78])
    defparam FF_68.GSR = "ENABLED";
    FD1S3DX FF_67 (.D(w_gcount_8), .CK(RdClock), .CD(Reset), .Q(w_gcount_r8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(797[13:78])
    defparam FF_67.GSR = "ENABLED";
    FD1S3DX FF_66 (.D(r_gcount_0), .CK(WrClock), .CD(rRst), .Q(r_gcount_w0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(800[13:77])
    defparam FF_66.GSR = "ENABLED";
    FD1S3DX FF_65 (.D(r_gcount_1), .CK(WrClock), .CD(rRst), .Q(r_gcount_w1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(803[13:77])
    defparam FF_65.GSR = "ENABLED";
    FD1S3DX FF_64 (.D(r_gcount_2), .CK(WrClock), .CD(rRst), .Q(r_gcount_w2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(806[13:77])
    defparam FF_64.GSR = "ENABLED";
    FD1S3DX FF_63 (.D(r_gcount_3), .CK(WrClock), .CD(rRst), .Q(r_gcount_w3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(809[13:77])
    defparam FF_63.GSR = "ENABLED";
    FD1S3DX FF_62 (.D(r_gcount_4), .CK(WrClock), .CD(rRst), .Q(r_gcount_w4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(812[13:77])
    defparam FF_62.GSR = "ENABLED";
    FD1S3DX FF_61 (.D(r_gcount_5), .CK(WrClock), .CD(rRst), .Q(r_gcount_w5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(815[13:77])
    defparam FF_61.GSR = "ENABLED";
    FD1S3DX FF_60 (.D(r_gcount_6), .CK(WrClock), .CD(rRst), .Q(r_gcount_w6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(818[13:77])
    defparam FF_60.GSR = "ENABLED";
    FD1S3DX FF_59 (.D(r_gcount_7), .CK(WrClock), .CD(rRst), .Q(r_gcount_w7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(821[13:77])
    defparam FF_59.GSR = "ENABLED";
    FD1S3DX FF_58 (.D(r_gcount_8), .CK(WrClock), .CD(rRst), .Q(r_gcount_w8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(824[13:77])
    defparam FF_58.GSR = "ENABLED";
    FD1S3DX FF_57 (.D(w_gcount_r0), .CK(RdClock), .CD(Reset), .Q(w_gcount_r20)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(827[13:80])
    defparam FF_57.GSR = "ENABLED";
    FD1S3DX FF_56 (.D(w_gcount_r1), .CK(RdClock), .CD(Reset), .Q(w_gcount_r21)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(830[13:80])
    defparam FF_56.GSR = "ENABLED";
    FD1S3DX FF_55 (.D(w_gcount_r2), .CK(RdClock), .CD(Reset), .Q(w_gcount_r22)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(833[13:80])
    defparam FF_55.GSR = "ENABLED";
    FD1S3DX FF_54 (.D(w_gcount_r3), .CK(RdClock), .CD(Reset), .Q(w_gcount_r23)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(836[13:80])
    defparam FF_54.GSR = "ENABLED";
    FD1S3DX FF_53 (.D(w_gcount_r4), .CK(RdClock), .CD(Reset), .Q(w_gcount_r24)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(839[13:80])
    defparam FF_53.GSR = "ENABLED";
    FD1S3DX FF_52 (.D(w_gcount_r5), .CK(RdClock), .CD(Reset), .Q(w_gcount_r25)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(842[13:80])
    defparam FF_52.GSR = "ENABLED";
    FD1S3DX FF_51 (.D(w_gcount_r6), .CK(RdClock), .CD(Reset), .Q(w_gcount_r26)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(845[13:80])
    defparam FF_51.GSR = "ENABLED";
    FD1S3DX FF_50 (.D(w_gcount_r7), .CK(RdClock), .CD(Reset), .Q(w_gcount_r27)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(848[13:80])
    defparam FF_50.GSR = "ENABLED";
    FD1S3DX FF_49 (.D(w_gcount_r8), .CK(RdClock), .CD(Reset), .Q(w_gcount_r28)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(851[13:80])
    defparam FF_49.GSR = "ENABLED";
    FD1S3DX FF_48 (.D(r_gcount_w0), .CK(WrClock), .CD(rRst), .Q(r_gcount_w20)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(854[13:79])
    defparam FF_48.GSR = "ENABLED";
    FD1S3DX FF_47 (.D(r_gcount_w1), .CK(WrClock), .CD(rRst), .Q(r_gcount_w21)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(857[13:79])
    defparam FF_47.GSR = "ENABLED";
    FD1S3DX FF_46 (.D(r_gcount_w2), .CK(WrClock), .CD(rRst), .Q(r_gcount_w22)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(860[13:79])
    defparam FF_46.GSR = "ENABLED";
    FD1S3DX FF_45 (.D(r_gcount_w3), .CK(WrClock), .CD(rRst), .Q(r_gcount_w23)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(863[13:79])
    defparam FF_45.GSR = "ENABLED";
    FD1S3DX FF_44 (.D(r_gcount_w4), .CK(WrClock), .CD(rRst), .Q(r_gcount_w24)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(866[13:79])
    defparam FF_44.GSR = "ENABLED";
    FD1S3DX FF_43 (.D(r_gcount_w5), .CK(WrClock), .CD(rRst), .Q(r_gcount_w25)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(869[13:79])
    defparam FF_43.GSR = "ENABLED";
    FD1S3DX FF_42 (.D(r_gcount_w6), .CK(WrClock), .CD(rRst), .Q(r_gcount_w26)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(872[13:79])
    defparam FF_42.GSR = "ENABLED";
    FD1S3DX FF_41 (.D(r_gcount_w7), .CK(WrClock), .CD(rRst), .Q(r_gcount_w27)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(875[13:79])
    defparam FF_41.GSR = "ENABLED";
    FD1S3DX FF_40 (.D(r_gcount_w8), .CK(WrClock), .CD(rRst), .Q(r_gcount_w28)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(878[13:79])
    defparam FF_40.GSR = "ENABLED";
    FD1S3BX FF_39 (.D(empty_d), .CK(RdClock), .PD(rRst), .Q(Empty)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(881[13:70])
    defparam FF_39.GSR = "ENABLED";
    FD1S3DX FF_38 (.D(full_d), .CK(WrClock), .CD(Reset), .Q(Full)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(884[13:69])
    defparam FF_38.GSR = "ENABLED";
    FD1P3BX FF_37 (.D(iae_setcount_0), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_setcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(887[13] 888[27])
    defparam FF_37.GSR = "ENABLED";
    FD1P3BX FF_36 (.D(iae_setcount_1), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_setcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(891[13] 892[27])
    defparam FF_36.GSR = "ENABLED";
    FD1P3DX FF_35 (.D(iae_setcount_2), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(895[13] 896[27])
    defparam FF_35.GSR = "ENABLED";
    FD1P3BX FF_34 (.D(iae_setcount_3), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_setcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(899[13] 900[27])
    defparam FF_34.GSR = "ENABLED";
    FD1P3DX FF_33 (.D(iae_setcount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(903[13] 904[27])
    defparam FF_33.GSR = "ENABLED";
    FD1P3DX FF_32 (.D(iae_setcount_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(907[13] 908[27])
    defparam FF_32.GSR = "ENABLED";
    FD1P3DX FF_31 (.D(iae_setcount_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(911[13] 912[27])
    defparam FF_31.GSR = "ENABLED";
    FD1P3DX FF_30 (.D(iae_setcount_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(915[13] 916[27])
    defparam FF_30.GSR = "ENABLED";
    FD1P3DX FF_29 (.D(iae_setcount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(919[13] 920[27])
    defparam FF_29.GSR = "ENABLED";
    FD1P3BX FF_28 (.D(iae_clrcount_0), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_clrcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(923[13] 924[27])
    defparam FF_28.GSR = "ENABLED";
    FD1P3DX FF_27 (.D(iae_clrcount_1), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(927[13] 928[27])
    defparam FF_27.GSR = "ENABLED";
    FD1P3BX FF_26 (.D(iae_clrcount_2), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_clrcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(931[13] 932[27])
    defparam FF_26.GSR = "ENABLED";
    FD1P3BX FF_25 (.D(iae_clrcount_3), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_clrcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(935[13] 936[27])
    defparam FF_25.GSR = "ENABLED";
    FD1P3DX FF_24 (.D(iae_clrcount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(939[13] 940[27])
    defparam FF_24.GSR = "ENABLED";
    FD1P3DX FF_23 (.D(iae_clrcount_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(943[13] 944[27])
    defparam FF_23.GSR = "ENABLED";
    FD1P3DX FF_22 (.D(iae_clrcount_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(947[13] 948[27])
    defparam FF_22.GSR = "ENABLED";
    FD1P3DX FF_21 (.D(iae_clrcount_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(951[13] 952[27])
    defparam FF_21.GSR = "ENABLED";
    FD1P3DX FF_20 (.D(iae_clrcount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(955[13] 956[27])
    defparam FF_20.GSR = "ENABLED";
    FD1S3BX FF_19 (.D(ae_d), .CK(RdClock), .PD(rRst), .Q(AlmostEmpty)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(959[13:62])
    defparam FF_19.GSR = "ENABLED";
    FD1P3DX FF_18 (.D(iaf_setcount_0), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(962[13] 963[27])
    defparam FF_18.GSR = "ENABLED";
    FD1P3DX FF_17 (.D(iaf_setcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(966[13] 967[27])
    defparam FF_17.GSR = "ENABLED";
    FD1P3BX FF_16 (.D(iaf_setcount_2), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(970[13] 971[27])
    defparam FF_16.GSR = "ENABLED";
    FD1P3BX FF_15 (.D(iaf_setcount_3), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(974[13] 975[27])
    defparam FF_15.GSR = "ENABLED";
    FD1P3DX FF_14 (.D(iaf_setcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(978[13] 979[27])
    defparam FF_14.GSR = "ENABLED";
    FD1P3BX FF_13 (.D(iaf_setcount_5), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(982[13] 983[27])
    defparam FF_13.GSR = "ENABLED";
    FD1P3BX FF_12 (.D(iaf_setcount_6), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(986[13] 987[27])
    defparam FF_12.GSR = "ENABLED";
    FD1P3BX FF_11 (.D(iaf_setcount_7), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(990[13] 991[27])
    defparam FF_11.GSR = "ENABLED";
    FD1P3DX FF_10 (.D(iaf_setcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(994[13] 995[27])
    defparam FF_10.GSR = "ENABLED";
    FD1P3BX FF_9 (.D(iaf_clrcount_0), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(998[13] 999[27])
    defparam FF_9.GSR = "ENABLED";
    FD1P3DX FF_8 (.D(iaf_clrcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1002[13] 1003[27])
    defparam FF_8.GSR = "ENABLED";
    FD1P3BX FF_7 (.D(iaf_clrcount_2), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1006[13] 1007[27])
    defparam FF_7.GSR = "ENABLED";
    FD1P3BX FF_6 (.D(iaf_clrcount_3), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1010[13] 1011[27])
    defparam FF_6.GSR = "ENABLED";
    FD1P3BX FF_5 (.D(iaf_clrcount_4), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1014[13] 1015[27])
    defparam FF_5.GSR = "ENABLED";
    FD1P3BX FF_4 (.D(iaf_clrcount_5), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1018[13] 1019[27])
    defparam FF_4.GSR = "ENABLED";
    FD1P3BX FF_3 (.D(iaf_clrcount_6), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1022[13] 1023[27])
    defparam FF_3.GSR = "ENABLED";
    FD1P3BX FF_2 (.D(iaf_clrcount_7), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1026[13] 1027[27])
    defparam FF_2.GSR = "ENABLED";
    FD1P3DX FF_1 (.D(iaf_clrcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1030[13] 1031[27])
    defparam FF_1.GSR = "ENABLED";
    FD1S3DX FF_0 (.D(af_d), .CK(WrClock), .CD(Reset), .Q(AlmostFull)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1034[13:62])
    defparam FF_0.GSR = "ENABLED";
    CCU2C w_gctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(w_gctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1041[11] 1043[48])
    defparam w_gctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_gctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_gctr_cia.INJECT1_0 = "NO";
    defparam w_gctr_cia.INJECT1_1 = "NO";
    CCU2C w_gctr_0 (.A0(wcount_0), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_1), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(w_gctr_ci), .COUT(co0), .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1049[11] 1051[69])
    defparam w_gctr_0.INIT0 = 16'b0110011010101010;
    defparam w_gctr_0.INIT1 = 16'b0110011010101010;
    defparam w_gctr_0.INJECT1_0 = "NO";
    defparam w_gctr_0.INJECT1_1 = "NO";
    CCU2C w_gctr_1 (.A0(wcount_2), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_3), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co0), .COUT(co1), .S0(iwcount_2), .S1(iwcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1057[11] 1059[63])
    defparam w_gctr_1.INIT0 = 16'b0110011010101010;
    defparam w_gctr_1.INIT1 = 16'b0110011010101010;
    defparam w_gctr_1.INJECT1_0 = "NO";
    defparam w_gctr_1.INJECT1_1 = "NO";
    CCU2C w_gctr_2 (.A0(wcount_4), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_5), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co1), .COUT(co2), .S0(iwcount_4), .S1(iwcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1065[11] 1067[63])
    defparam w_gctr_2.INIT0 = 16'b0110011010101010;
    defparam w_gctr_2.INIT1 = 16'b0110011010101010;
    defparam w_gctr_2.INJECT1_0 = "NO";
    defparam w_gctr_2.INJECT1_1 = "NO";
    CCU2C w_gctr_3 (.A0(wcount_6), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_7), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co2), .COUT(co3), .S0(iwcount_6), .S1(iwcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1073[11] 1075[63])
    defparam w_gctr_3.INIT0 = 16'b0110011010101010;
    defparam w_gctr_3.INIT1 = 16'b0110011010101010;
    defparam w_gctr_3.INJECT1_0 = "NO";
    defparam w_gctr_3.INJECT1_1 = "NO";
    CCU2C w_gctr_4 (.A0(wcount_8), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co3), .S0(iwcount_8)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1081[11] 1083[54])
    defparam w_gctr_4.INIT0 = 16'b0110011010101010;
    defparam w_gctr_4.INIT1 = 16'b0110011010101010;
    defparam w_gctr_4.INJECT1_0 = "NO";
    defparam w_gctr_4.INJECT1_1 = "NO";
    CCU2C r_gctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(r_gctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1089[11] 1091[48])
    defparam r_gctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_gctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_gctr_cia.INJECT1_0 = "NO";
    defparam r_gctr_cia.INJECT1_1 = "NO";
    CCU2C r_gctr_0 (.A0(rcount_0), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_1), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(r_gctr_ci), .COUT(co0_1), .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1097[11] 1099[71])
    defparam r_gctr_0.INIT0 = 16'b0110011010101010;
    defparam r_gctr_0.INIT1 = 16'b0110011010101010;
    defparam r_gctr_0.INJECT1_0 = "NO";
    defparam r_gctr_0.INJECT1_1 = "NO";
    CCU2C r_gctr_1 (.A0(rcount_2), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_3), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co0_1), .COUT(co1_1), .S0(ircount_2), .S1(ircount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1105[11] 1107[67])
    defparam r_gctr_1.INIT0 = 16'b0110011010101010;
    defparam r_gctr_1.INIT1 = 16'b0110011010101010;
    defparam r_gctr_1.INJECT1_0 = "NO";
    defparam r_gctr_1.INJECT1_1 = "NO";
    CCU2C r_gctr_2 (.A0(rcount_4), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_5), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co1_1), .COUT(co2_1), .S0(ircount_4), .S1(ircount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1113[11] 1115[67])
    defparam r_gctr_2.INIT0 = 16'b0110011010101010;
    defparam r_gctr_2.INIT1 = 16'b0110011010101010;
    defparam r_gctr_2.INJECT1_0 = "NO";
    defparam r_gctr_2.INJECT1_1 = "NO";
    CCU2C r_gctr_3 (.A0(rcount_6), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_7), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co2_1), .COUT(co3_1), .S0(ircount_6), .S1(ircount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1121[11] 1123[67])
    defparam r_gctr_3.INIT0 = 16'b0110011010101010;
    defparam r_gctr_3.INIT1 = 16'b0110011010101010;
    defparam r_gctr_3.INJECT1_0 = "NO";
    defparam r_gctr_3.INJECT1_1 = "NO";
    CCU2C r_gctr_4 (.A0(rcount_8), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co3_1), .S0(ircount_8)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1129[11] 1131[58])
    defparam r_gctr_4.INIT0 = 16'b0110011010101010;
    defparam r_gctr_4.INIT1 = 16'b0110011010101010;
    defparam r_gctr_4.INJECT1_0 = "NO";
    defparam r_gctr_4.INJECT1_1 = "NO";
    CCU2C empty_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rden_i), .B1(rden_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1137[11] 1139[45])
    defparam empty_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam empty_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam empty_cmp_ci_a.INJECT1_0 = "NO";
    defparam empty_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C empty_cmp_0 (.A0(rcount_0), .B0(wcount_r0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_1), .B1(wcount_r1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci), .COUT(co0_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1145[11] 1147[50])
    defparam empty_cmp_0.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_0.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_0.INJECT1_0 = "NO";
    defparam empty_cmp_0.INJECT1_1 = "NO";
    CCU2C empty_cmp_1 (.A0(rcount_2), .B0(wcount_r2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_3), .B1(wcount_r3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_2), .COUT(co1_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1153[11] 1155[49])
    defparam empty_cmp_1.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_1.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_1.INJECT1_0 = "NO";
    defparam empty_cmp_1.INJECT1_1 = "NO";
    CCU2C empty_cmp_2 (.A0(rcount_4), .B0(wcount_r4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_5), .B1(w_g2b_xor_cluster_0), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_2), .COUT(co2_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1161[11] 1163[49])
    defparam empty_cmp_2.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_2.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_2.INJECT1_0 = "NO";
    defparam empty_cmp_2.INJECT1_1 = "NO";
    CCU2C empty_cmp_3 (.A0(rcount_6), .B0(wcount_r6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_7), .B1(wcount_r7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_2), .COUT(co3_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1169[11] 1171[49])
    defparam empty_cmp_3.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_3.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_3.INJECT1_0 = "NO";
    defparam empty_cmp_3.INJECT1_1 = "NO";
    CCU2C empty_cmp_4 (.A0(empty_cmp_set), .B0(empty_cmp_clr), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_2), .COUT(empty_d_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1177[11] 1179[69])
    defparam empty_cmp_4.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_4.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_4.INJECT1_0 = "NO";
    defparam empty_cmp_4.INJECT1_1 = "NO";
    CCU2C a0 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(empty_d_c), .S0(empty_d)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1185[11] 1187[55])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C full_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(wren_i), .B1(wren_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1193[11] 1195[47])
    defparam full_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam full_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam full_cmp_ci_a.INJECT1_0 = "NO";
    defparam full_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C full_cmp_0 (.A0(wcount_0), .B0(rcount_w0), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_1), .B1(rcount_w1), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(cmp_ci_1), .COUT(co0_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1201[11] 1203[52])
    defparam full_cmp_0.INIT0 = 16'b1001100110101010;
    defparam full_cmp_0.INIT1 = 16'b1001100110101010;
    defparam full_cmp_0.INJECT1_0 = "NO";
    defparam full_cmp_0.INJECT1_1 = "NO";
    CCU2C full_cmp_1 (.A0(wcount_2), .B0(rcount_w2), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_3), .B1(rcount_w3), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co0_3), .COUT(co1_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1209[11] 1211[49])
    defparam full_cmp_1.INIT0 = 16'b1001100110101010;
    defparam full_cmp_1.INIT1 = 16'b1001100110101010;
    defparam full_cmp_1.INJECT1_0 = "NO";
    defparam full_cmp_1.INJECT1_1 = "NO";
    CCU2C full_cmp_2 (.A0(wcount_4), .B0(rcount_w4), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_5), .B1(r_g2b_xor_cluster_0), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co1_3), .COUT(co2_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1217[11] 1219[49])
    defparam full_cmp_2.INIT0 = 16'b1001100110101010;
    defparam full_cmp_2.INIT1 = 16'b1001100110101010;
    defparam full_cmp_2.INJECT1_0 = "NO";
    defparam full_cmp_2.INJECT1_1 = "NO";
    CCU2C full_cmp_3 (.A0(wcount_6), .B0(rcount_w6), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_7), .B1(rcount_w7), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co2_3), .COUT(co3_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1225[11] 1227[49])
    defparam full_cmp_3.INIT0 = 16'b1001100110101010;
    defparam full_cmp_3.INIT1 = 16'b1001100110101010;
    defparam full_cmp_3.INJECT1_0 = "NO";
    defparam full_cmp_3.INJECT1_1 = "NO";
    CCU2C full_cmp_4 (.A0(full_cmp_set), .B0(full_cmp_clr), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_3), .COUT(full_d_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1233[11] 1235[68])
    defparam full_cmp_4.INIT0 = 16'b1001100110101010;
    defparam full_cmp_4.INIT1 = 16'b1001100110101010;
    defparam full_cmp_4.INJECT1_0 = "NO";
    defparam full_cmp_4.INJECT1_1 = "NO";
    CCU2C a1 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(full_d_c), .S0(full_d)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1241[11] 1243[53])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(ae_set_ctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1249[11] 1251[68])
    defparam ae_set_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_cia.INJECT1_0 = "NO";
    defparam ae_set_ctr_cia.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_0 (.A0(ae_setcount_0), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_1), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(ae_set_ctr_ci), .COUT(co0_4), .S0(iae_setcount_0), 
          .S1(iae_setcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1257[11] 1260[22])
    defparam ae_set_ctr_0.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_0.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_0.INJECT1_0 = "NO";
    defparam ae_set_ctr_0.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_1 (.A0(ae_setcount_2), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_3), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_4), .COUT(co1_4), .S0(iae_setcount_2), 
          .S1(iae_setcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1266[11] 1269[22])
    defparam ae_set_ctr_1.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_1.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_1.INJECT1_0 = "NO";
    defparam ae_set_ctr_1.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_2 (.A0(ae_setcount_4), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_5), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_4), .COUT(co2_4), .S0(iae_setcount_4), 
          .S1(iae_setcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1275[11] 1278[22])
    defparam ae_set_ctr_2.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_2.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_2.INJECT1_0 = "NO";
    defparam ae_set_ctr_2.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_3 (.A0(ae_setcount_6), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_7), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_4), .COUT(co3_4), .S0(iae_setcount_6), 
          .S1(iae_setcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1284[11] 1287[22])
    defparam ae_set_ctr_3.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_3.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_3.INJECT1_0 = "NO";
    defparam ae_set_ctr_3.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_4 (.A0(ae_setcount_8), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_4), .S0(iae_setcount_8)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1293[11] 1295[79])
    defparam ae_set_ctr_4.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_4.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_4.INJECT1_0 = "NO";
    defparam ae_set_ctr_4.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rden_i), .B1(rden_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1301[11] 1303[47])
    defparam ae_set_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam ae_set_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam ae_set_cmp_ci_a.INJECT1_0 = "NO";
    defparam ae_set_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_0 (.A0(ae_setcount_0), .B0(wcount_r0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_1), .B1(wcount_r1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci_2), .COUT(co0_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1309[11] 1311[68])
    defparam ae_set_cmp_0.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_0.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_0.INJECT1_0 = "NO";
    defparam ae_set_cmp_0.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_1 (.A0(ae_setcount_2), .B0(wcount_r2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_3), .B1(wcount_r3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_5), .COUT(co1_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1317[11] 1319[65])
    defparam ae_set_cmp_1.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_1.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_1.INJECT1_0 = "NO";
    defparam ae_set_cmp_1.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_2 (.A0(ae_setcount_4), .B0(wcount_r4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_5), .B1(w_g2b_xor_cluster_0), 
          .C1(scuba_vhi), .D1(scuba_vhi), .CIN(co1_5), .COUT(co2_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1325[11] 1327[65])
    defparam ae_set_cmp_2.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_2.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_2.INJECT1_0 = "NO";
    defparam ae_set_cmp_2.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_3 (.A0(ae_setcount_6), .B0(wcount_r6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_7), .B1(wcount_r7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_5), .COUT(co3_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1333[11] 1335[65])
    defparam ae_set_cmp_3.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_3.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_3.INJECT1_0 = "NO";
    defparam ae_set_cmp_3.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_4 (.A0(ae_set_cmp_set), .B0(ae_set_cmp_clr), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_5), .COUT(ae_set_d_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1341[11] 1343[70])
    defparam ae_set_cmp_4.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_4.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_4.INJECT1_0 = "NO";
    defparam ae_set_cmp_4.INJECT1_1 = "NO";
    CCU2C a2 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(ae_set_d_c), .S0(ae_set_d)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1349[11] 1351[57])
    defparam a2.INIT0 = 16'b0110011010101010;
    defparam a2.INIT1 = 16'b0110011010101010;
    defparam a2.INJECT1_0 = "NO";
    defparam a2.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(ae_clr_ctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1357[11] 1359[68])
    defparam ae_clr_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_cia.INJECT1_0 = "NO";
    defparam ae_clr_ctr_cia.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_0 (.A0(ae_clrcount_0), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_1), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(ae_clr_ctr_ci), .COUT(co0_6), .S0(iae_clrcount_0), 
          .S1(iae_clrcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1365[11] 1368[22])
    defparam ae_clr_ctr_0.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_0.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_0.INJECT1_0 = "NO";
    defparam ae_clr_ctr_0.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_1 (.A0(ae_clrcount_2), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_3), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_6), .COUT(co1_6), .S0(iae_clrcount_2), 
          .S1(iae_clrcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1374[11] 1377[22])
    defparam ae_clr_ctr_1.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_1.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_1.INJECT1_0 = "NO";
    defparam ae_clr_ctr_1.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_2 (.A0(ae_clrcount_4), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_5), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_6), .COUT(co2_6), .S0(iae_clrcount_4), 
          .S1(iae_clrcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1383[11] 1386[22])
    defparam ae_clr_ctr_2.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_2.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_2.INJECT1_0 = "NO";
    defparam ae_clr_ctr_2.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_3 (.A0(ae_clrcount_6), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_7), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_6), .COUT(co3_6), .S0(iae_clrcount_6), 
          .S1(iae_clrcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1392[11] 1395[22])
    defparam ae_clr_ctr_3.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_3.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_3.INJECT1_0 = "NO";
    defparam ae_clr_ctr_3.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_4 (.A0(ae_clrcount_8), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_6), .S0(iae_clrcount_8)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1401[11] 1403[79])
    defparam ae_clr_ctr_4.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_4.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_4.INJECT1_0 = "NO";
    defparam ae_clr_ctr_4.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rden_i), .B1(rden_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1409[11] 1411[47])
    defparam ae_clr_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam ae_clr_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam ae_clr_cmp_ci_a.INJECT1_0 = "NO";
    defparam ae_clr_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_0 (.A0(ae_clrcount_0), .B0(wcount_r0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_1), .B1(wcount_r1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci_3), .COUT(co0_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1417[11] 1419[68])
    defparam ae_clr_cmp_0.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_0.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_0.INJECT1_0 = "NO";
    defparam ae_clr_cmp_0.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_1 (.A0(ae_clrcount_2), .B0(wcount_r2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_3), .B1(wcount_r3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_7), .COUT(co1_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1425[11] 1427[65])
    defparam ae_clr_cmp_1.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_1.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_1.INJECT1_0 = "NO";
    defparam ae_clr_cmp_1.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_2 (.A0(ae_clrcount_4), .B0(wcount_r4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_5), .B1(w_g2b_xor_cluster_0), 
          .C1(scuba_vhi), .D1(scuba_vhi), .CIN(co1_7), .COUT(co2_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1433[11] 1435[65])
    defparam ae_clr_cmp_2.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_2.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_2.INJECT1_0 = "NO";
    defparam ae_clr_cmp_2.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_3 (.A0(ae_clrcount_6), .B0(wcount_r6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_7), .B1(wcount_r7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_7), .COUT(co3_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1441[11] 1443[65])
    defparam ae_clr_cmp_3.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_3.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_3.INJECT1_0 = "NO";
    defparam ae_clr_cmp_3.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_4 (.A0(ae_clr_cmp_set), .B0(ae_clr_cmp_clr), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_7), .COUT(ae_clr_d_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1449[11] 1451[70])
    defparam ae_clr_cmp_4.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_4.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_4.INJECT1_0 = "NO";
    defparam ae_clr_cmp_4.INJECT1_1 = "NO";
    CCU2C a3 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(ae_clr_d_c), .S0(ae_clr_d)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1457[11] 1459[57])
    defparam a3.INIT0 = 16'b0110011010101010;
    defparam a3.INIT1 = 16'b0110011010101010;
    defparam a3.INJECT1_0 = "NO";
    defparam a3.INJECT1_1 = "NO";
    CCU2C af_set_ctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(af_set_ctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1465[11] 1467[68])
    defparam af_set_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_cia.INJECT1_0 = "NO";
    defparam af_set_ctr_cia.INJECT1_1 = "NO";
    CCU2C af_set_ctr_0 (.A0(af_setcount_0), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_1), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(af_set_ctr_ci), .COUT(co0_8), .S0(iaf_setcount_0), 
          .S1(iaf_setcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1473[11] 1476[22])
    defparam af_set_ctr_0.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_0.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_0.INJECT1_0 = "NO";
    defparam af_set_ctr_0.INJECT1_1 = "NO";
    CCU2C af_set_ctr_1 (.A0(af_setcount_2), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_3), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_8), .COUT(co1_8), .S0(iaf_setcount_2), 
          .S1(iaf_setcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1482[11] 1485[22])
    defparam af_set_ctr_1.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_1.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_1.INJECT1_0 = "NO";
    defparam af_set_ctr_1.INJECT1_1 = "NO";
    CCU2C af_set_ctr_2 (.A0(af_setcount_4), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_5), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_8), .COUT(co2_8), .S0(iaf_setcount_4), 
          .S1(iaf_setcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1491[11] 1494[22])
    defparam af_set_ctr_2.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_2.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_2.INJECT1_0 = "NO";
    defparam af_set_ctr_2.INJECT1_1 = "NO";
    CCU2C af_set_ctr_3 (.A0(af_setcount_6), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_7), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_8), .COUT(co3_8), .S0(iaf_setcount_6), 
          .S1(iaf_setcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1500[11] 1503[22])
    defparam af_set_ctr_3.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_3.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_3.INJECT1_0 = "NO";
    defparam af_set_ctr_3.INJECT1_1 = "NO";
    CCU2C af_set_ctr_4 (.A0(af_setcount_8), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_8), .S0(iaf_setcount_8)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1509[11] 1511[79])
    defparam af_set_ctr_4.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_4.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_4.INJECT1_0 = "NO";
    defparam af_set_ctr_4.INJECT1_1 = "NO";
    CCU2C af_set_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(wren_i), .B1(wren_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_4)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1517[11] 1519[47])
    defparam af_set_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam af_set_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam af_set_cmp_ci_a.INJECT1_0 = "NO";
    defparam af_set_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C af_set_cmp_0 (.A0(af_setcount_0), .B0(rcount_w0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_1), .B1(rcount_w1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci_4), .COUT(co0_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1525[11] 1527[68])
    defparam af_set_cmp_0.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_0.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_0.INJECT1_0 = "NO";
    defparam af_set_cmp_0.INJECT1_1 = "NO";
    CCU2C af_set_cmp_1 (.A0(af_setcount_2), .B0(rcount_w2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_3), .B1(rcount_w3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_9), .COUT(co1_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1533[11] 1535[65])
    defparam af_set_cmp_1.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_1.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_1.INJECT1_0 = "NO";
    defparam af_set_cmp_1.INJECT1_1 = "NO";
    CCU2C af_set_cmp_2 (.A0(af_setcount_4), .B0(rcount_w4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_5), .B1(r_g2b_xor_cluster_0), 
          .C1(scuba_vhi), .D1(scuba_vhi), .CIN(co1_9), .COUT(co2_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1541[11] 1543[65])
    defparam af_set_cmp_2.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_2.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_2.INJECT1_0 = "NO";
    defparam af_set_cmp_2.INJECT1_1 = "NO";
    CCU2C af_set_cmp_3 (.A0(af_setcount_6), .B0(rcount_w6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_7), .B1(rcount_w7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_9), .COUT(co3_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1549[11] 1551[65])
    defparam af_set_cmp_3.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_3.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_3.INJECT1_0 = "NO";
    defparam af_set_cmp_3.INJECT1_1 = "NO";
    CCU2C af_set_cmp_4 (.A0(af_set_cmp_set), .B0(af_set_cmp_clr), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_9), .COUT(af_set_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1557[11] 1559[68])
    defparam af_set_cmp_4.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_4.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_4.INJECT1_0 = "NO";
    defparam af_set_cmp_4.INJECT1_1 = "NO";
    CCU2C a4 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(af_set_c), .S0(af_set)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1565[11] 1567[53])
    defparam a4.INIT0 = 16'b0110011010101010;
    defparam a4.INIT1 = 16'b0110011010101010;
    defparam a4.INJECT1_0 = "NO";
    defparam a4.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(af_clr_ctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1573[11] 1575[68])
    defparam af_clr_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_cia.INJECT1_0 = "NO";
    defparam af_clr_ctr_cia.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_0 (.A0(af_clrcount_0), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_1), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(af_clr_ctr_ci), .COUT(co0_10), .S0(iaf_clrcount_0), 
          .S1(iaf_clrcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1581[11] 1584[23])
    defparam af_clr_ctr_0.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_0.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_0.INJECT1_0 = "NO";
    defparam af_clr_ctr_0.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_1 (.A0(af_clrcount_2), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_3), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_10), .COUT(co1_10), .S0(iaf_clrcount_2), 
          .S1(iaf_clrcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1590[11] 1593[23])
    defparam af_clr_ctr_1.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_1.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_1.INJECT1_0 = "NO";
    defparam af_clr_ctr_1.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_2 (.A0(af_clrcount_4), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_5), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_10), .COUT(co2_10), .S0(iaf_clrcount_4), 
          .S1(iaf_clrcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1599[11] 1602[23])
    defparam af_clr_ctr_2.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_2.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_2.INJECT1_0 = "NO";
    defparam af_clr_ctr_2.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_3 (.A0(af_clrcount_6), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_7), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_10), .COUT(co3_10), .S0(iaf_clrcount_6), 
          .S1(iaf_clrcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1608[11] 1611[23])
    defparam af_clr_ctr_3.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_3.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_3.INJECT1_0 = "NO";
    defparam af_clr_ctr_3.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_4 (.A0(af_clrcount_8), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_10), .S0(iaf_clrcount_8)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1617[11] 1619[80])
    defparam af_clr_ctr_4.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_4.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_4.INJECT1_0 = "NO";
    defparam af_clr_ctr_4.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(wren_i), .B1(wren_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1625[11] 1627[47])
    defparam af_clr_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam af_clr_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam af_clr_cmp_ci_a.INJECT1_0 = "NO";
    defparam af_clr_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_0 (.A0(af_clrcount_0), .B0(rcount_w0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_1), .B1(rcount_w1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci_5), .COUT(co0_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1633[11] 1635[69])
    defparam af_clr_cmp_0.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_0.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_0.INJECT1_0 = "NO";
    defparam af_clr_cmp_0.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_1 (.A0(af_clrcount_2), .B0(rcount_w2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_3), .B1(rcount_w3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_11), .COUT(co1_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1641[11] 1643[67])
    defparam af_clr_cmp_1.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_1.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_1.INJECT1_0 = "NO";
    defparam af_clr_cmp_1.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_2 (.A0(af_clrcount_4), .B0(rcount_w4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_5), .B1(r_g2b_xor_cluster_0), 
          .C1(scuba_vhi), .D1(scuba_vhi), .CIN(co1_11), .COUT(co2_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1649[11] 1651[67])
    defparam af_clr_cmp_2.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_2.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_2.INJECT1_0 = "NO";
    defparam af_clr_cmp_2.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_3 (.A0(af_clrcount_6), .B0(rcount_w6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_7), .B1(rcount_w7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_11), .COUT(co3_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1657[11] 1659[67])
    defparam af_clr_cmp_3.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_3.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_3.INJECT1_0 = "NO";
    defparam af_clr_cmp_3.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_4 (.A0(af_clr_cmp_set), .B0(af_clr_cmp_clr), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_11), .COUT(af_clr_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1665[11] 1667[69])
    defparam af_clr_cmp_4.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_4.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_4.INJECT1_0 = "NO";
    defparam af_clr_cmp_4.INJECT1_1 = "NO";
    VHI scuba_vhi_inst (.Z(scuba_vhi));
    VLO scuba_vlo_inst (.Z(scuba_vlo));
    CCU2C a5 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(af_clr_c), .S0(af_clr)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(1677[11] 1679[53])
    defparam a5.INIT0 = 16'b0110011010101010;
    defparam a5.INIT1 = 16'b0110011010101010;
    defparam a5.INJECT1_0 = "NO";
    defparam a5.INJECT1_1 = "NO";
    GSR GSR_INST (.GSR(scuba_vhi));
    AND2 AND2_t18 (.A(WrEn), .B(invout_1), .Z(wren_i)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(341[10:55])
    INV INV_1 (.A(Full), .Z(invout_1));
    AND2 AND2_t17 (.A(RdEn), .B(invout_0), .Z(rden_i)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(345[10:55])
    INV INV_0 (.A(Empty), .Z(invout_0));
    OR2 OR2_t16 (.A(Reset), .B(RPReset), .Z(rRst)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(349[9:51])
    XOR2 XOR2_t15 (.A(wcount_0), .B(wcount_1), .Z(w_gdata_0)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(351[10:62])
    XOR2 XOR2_t14 (.A(wcount_1), .B(wcount_2), .Z(w_gdata_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(353[10:62])
    XOR2 XOR2_t13 (.A(wcount_2), .B(wcount_3), .Z(w_gdata_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(355[10:62])
    XOR2 XOR2_t12 (.A(wcount_3), .B(wcount_4), .Z(w_gdata_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(357[10:62])
    XOR2 XOR2_t11 (.A(wcount_4), .B(wcount_5), .Z(w_gdata_4)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(359[10:62])
    XOR2 XOR2_t10 (.A(wcount_5), .B(wcount_6), .Z(w_gdata_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(361[10:62])
    XOR2 XOR2_t9 (.A(wcount_6), .B(wcount_7), .Z(w_gdata_6)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(363[10:61])
    XOR2 XOR2_t8 (.A(wcount_7), .B(wcount_8), .Z(w_gdata_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(365[10:61])
    XOR2 XOR2_t7 (.A(rcount_0), .B(rcount_1), .Z(r_gdata_0)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(367[10:61])
    XOR2 XOR2_t6 (.A(rcount_1), .B(rcount_2), .Z(r_gdata_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(369[10:61])
    XOR2 XOR2_t5 (.A(rcount_2), .B(rcount_3), .Z(r_gdata_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(371[10:61])
    XOR2 XOR2_t4 (.A(rcount_3), .B(rcount_4), .Z(r_gdata_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(373[10:61])
    XOR2 XOR2_t3 (.A(rcount_4), .B(rcount_5), .Z(r_gdata_4)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(375[10:61])
    XOR2 XOR2_t2 (.A(rcount_5), .B(rcount_6), .Z(r_gdata_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(377[10:61])
    XOR2 XOR2_t1 (.A(rcount_6), .B(rcount_7), .Z(r_gdata_6)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(379[10:61])
    XOR2 XOR2_t0 (.A(rcount_7), .B(rcount_8), .Z(r_gdata_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(381[10:61])
    ROM16X1A LUT4_31 (.AD0(w_gcount_r28), .AD1(w_gcount_r27), .AD2(w_gcount_r26), 
            .AD3(w_gcount_r25), .DO0(w_g2b_xor_cluster_0)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_31.initval = 16'b0110100110010110;
    PDPW8KE pdp_ram_0_1_0 (.DI0(Data[18]), .DI1(Data[19]), .DI2(Data[20]), 
            .DI3(Data[21]), .DI4(Data[22]), .DI5(Data[23]), .DI6(Data[24]), 
            .DI7(Data[25]), .DI8(Data[26]), .DI9(Data[27]), .DI10(Data[28]), 
            .DI11(Data[29]), .DI12(Data[30]), .DI13(Data[31]), .DI14(scuba_vlo), 
            .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .ADW0(wptr_0), 
            .ADW1(wptr_1), .ADW2(wptr_2), .ADW3(wptr_3), .ADW4(wptr_4), 
            .ADW5(wptr_5), .ADW6(wptr_6), .ADW7(wptr_7), .ADW8(scuba_vlo), 
            .BE0(scuba_vhi), .BE1(scuba_vhi), .CEW(wren_i), .CLKW(WrClock), 
            .CSW0(scuba_vhi), .CSW1(scuba_vlo), .CSW2(scuba_vlo), .ADR0(scuba_vlo), 
            .ADR1(scuba_vlo), .ADR2(scuba_vlo), .ADR3(scuba_vlo), .ADR4(rptr_0), 
            .ADR5(rptr_1), .ADR6(rptr_2), .ADR7(rptr_3), .ADR8(rptr_4), 
            .ADR9(rptr_5), .ADR10(rptr_6), .ADR11(rptr_7), .ADR12(scuba_vlo), 
            .CER(rden_i), .OCER(rden_i), .CLKR(RdClock), .CSR0(scuba_vlo), 
            .CSR1(scuba_vlo), .CSR2(scuba_vlo), .RST(Reset), .DO0(Q[27]), 
            .DO1(Q[28]), .DO2(Q[29]), .DO3(Q[30]), .DO4(Q[31]), .DO9(Q[18]), 
            .DO10(Q[19]), .DO11(Q[20]), .DO12(Q[21]), .DO13(Q[22]), 
            .DO14(Q[23]), .DO15(Q[24]), .DO16(Q[25]), .DO17(Q[26])) /* synthesis MEM_LPC_FILE="cross_domain_fifo.lpc", MEM_INIT_FILE="", syn_instantiated=1 */ ;
    defparam pdp_ram_0_1_0.DATA_WIDTH_W = 18;
    defparam pdp_ram_0_1_0.DATA_WIDTH_R = 18;
    defparam pdp_ram_0_1_0.REGMODE = "NOREG";
    defparam pdp_ram_0_1_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_1_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_1_0.GSR = "ENABLED";
    defparam pdp_ram_0_1_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_1_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_1_0.INIT_DATA = "STATIC";
    defparam pdp_ram_0_1_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    FD1P3BX FF_129 (.D(iwcount_0), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(wcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/cross_domain_fifo/cross_domain_fifo.v(567[13] 568[22])
    defparam FF_129.GSR = "ENABLED";
    PUR PUR_INST (.PUR(scuba_vhi));
    defparam PUR_INST.RST_PULSE = 1;
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

