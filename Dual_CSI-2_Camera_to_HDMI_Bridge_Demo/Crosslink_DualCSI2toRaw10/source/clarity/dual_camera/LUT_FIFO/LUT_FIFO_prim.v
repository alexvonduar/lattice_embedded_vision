// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.8.0.64.0
// Netlist written on Fri Jul 01 12:18:01 2016
//
// Verilog Description of module LUT_FIFO
//

module LUT_FIFO (Data, WrClock, RdClock, WrEn, RdEn, Reset, RPReset, 
            Q, Empty, Full, AlmostEmpty, AlmostFull) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(8[8:16])
    input [9:0]Data;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(10[22:26])
    input WrClock;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(11[16:23])
    input RdClock;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(12[16:23])
    input WrEn;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(13[16:20])
    input RdEn;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(14[16:20])
    input Reset;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(15[16:21])
    input RPReset;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(16[16:23])
    output [9:0]Q;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(17[23:24])
    output Empty;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(18[17:22])
    output Full;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(19[17:21])
    output AlmostEmpty;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(20[17:28])
    output AlmostFull;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(21[17:27])
    
    wire WrClock /* synthesis is_clock=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(11[16:23])
    wire RdClock /* synthesis is_clock=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(12[16:23])
    
    wire invout_1, invout_0, w_g2b_xor_cluster_2_1, w_g2b_xor_cluster_2, 
        w_g2b_xor_cluster_1, r_g2b_xor_cluster_2_1, r_g2b_xor_cluster_2, 
        r_g2b_xor_cluster_1, w_gdata_0, w_gdata_1, w_gdata_2, w_gdata_3, 
        w_gdata_4, w_gdata_5, w_gdata_6, w_gdata_7, w_gdata_8, w_gdata_9, 
        w_gdata_10, wptr_0, wptr_1, wptr_2, wptr_3, wptr_4, wptr_5, 
        wptr_6, wptr_7, wptr_8, wptr_9, wptr_10, wptr_11, r_gdata_0, 
        r_gdata_1, r_gdata_2, r_gdata_3, r_gdata_4, r_gdata_5, r_gdata_6, 
        r_gdata_7, r_gdata_8, r_gdata_9, r_gdata_10, rptr_0, rptr_1, 
        rptr_2, rptr_3, rptr_4, rptr_5, rptr_6, rptr_7, rptr_8, 
        rptr_9, rptr_10, rptr_11, w_gcount_0, w_gcount_1, w_gcount_2, 
        w_gcount_3, w_gcount_4, w_gcount_5, w_gcount_6, w_gcount_7, 
        w_gcount_8, w_gcount_9, w_gcount_10, w_gcount_11, r_gcount_0, 
        r_gcount_1, r_gcount_2, r_gcount_3, r_gcount_4, r_gcount_5, 
        r_gcount_6, r_gcount_7, r_gcount_8, r_gcount_9, r_gcount_10, 
        r_gcount_11, w_gcount_r20, w_gcount_r0, w_gcount_r21, w_gcount_r1, 
        w_gcount_r22, w_gcount_r2, w_gcount_r23, w_gcount_r3, w_gcount_r24, 
        w_gcount_r4, w_gcount_r25, w_gcount_r5, w_gcount_r26, w_gcount_r6, 
        w_gcount_r27, w_gcount_r7, w_gcount_r28, w_gcount_r8, w_gcount_r29, 
        w_gcount_r9, w_gcount_r210, w_gcount_r10, w_gcount_r211, w_gcount_r11, 
        r_gcount_w20, r_gcount_w0, r_gcount_w21, r_gcount_w1, r_gcount_w22, 
        r_gcount_w2, r_gcount_w23, r_gcount_w3, r_gcount_w24, r_gcount_w4, 
        r_gcount_w25, r_gcount_w5, r_gcount_w26, r_gcount_w6, r_gcount_w27, 
        r_gcount_w7, r_gcount_w28, r_gcount_w8, r_gcount_w29, r_gcount_w9, 
        r_gcount_w210, r_gcount_w10, r_gcount_w211, r_gcount_w11, rRst, 
        ae_d, af_d, iwcount_0, iwcount_1, w_gctr_ci, iwcount_2, 
        iwcount_3, co0, iwcount_4, iwcount_5, co1, iwcount_6, iwcount_7, 
        co2, iwcount_8, iwcount_9, co3, iwcount_10, iwcount_11, 
        co4, wcount_11, ircount_0, ircount_1, r_gctr_ci, ircount_2, 
        ircount_3, co0_1, ircount_4, ircount_5, co1_1, ircount_6, 
        ircount_7, co2_1, ircount_8, ircount_9, co3_1, ircount_10, 
        ircount_11, co4_1, rcount_11, cmp_ci, rcount_0, rcount_1, 
        co0_2, rcount_2, rcount_3, co1_2, rcount_4, rcount_5, co2_2, 
        rcount_6, rcount_7, co3_2, rcount_8, rcount_9, co4_2, empty_cmp_clr, 
        rcount_10, empty_cmp_set, empty_d, empty_d_c, cmp_ci_1, wcount_0, 
        wcount_1, co0_3, wcount_2, wcount_3, co1_3, wcount_4, wcount_5, 
        co2_3, wcount_6, wcount_7, co3_3, wcount_8, wcount_9, co4_3, 
        full_cmp_clr, wcount_10, full_cmp_set, full_d, full_d_c, iae_setcount_0, 
        iae_setcount_1, ae_set_ctr_ci, iae_setcount_2, iae_setcount_3, 
        co0_4, iae_setcount_4, iae_setcount_5, co1_4, iae_setcount_6, 
        iae_setcount_7, co2_4, iae_setcount_8, iae_setcount_9, co3_4, 
        iae_setcount_10, iae_setcount_11, co4_4, ae_setcount_11, cmp_ci_2, 
        ae_setcount_0, ae_setcount_1, co0_5, ae_setcount_2, ae_setcount_3, 
        co1_5, ae_setcount_4, ae_setcount_5, co2_5, ae_setcount_6, 
        ae_setcount_7, co3_5, ae_setcount_8, ae_setcount_9, co4_5, 
        ae_set_cmp_clr, ae_setcount_10, ae_set_cmp_set, ae_set_d, ae_set_d_c, 
        iae_clrcount_0, iae_clrcount_1, ae_clr_ctr_ci, iae_clrcount_2, 
        iae_clrcount_3, co0_6, iae_clrcount_4, iae_clrcount_5, co1_6, 
        iae_clrcount_6, iae_clrcount_7, co2_6, iae_clrcount_8, iae_clrcount_9, 
        co3_6, iae_clrcount_10, iae_clrcount_11, co4_6, ae_clrcount_11, 
        rden_i, cmp_ci_3, wcount_r0, wcount_r1, ae_clrcount_0, ae_clrcount_1, 
        co0_7, wcount_r2, wcount_r3, ae_clrcount_2, ae_clrcount_3, 
        co1_7, wcount_r4, wcount_r5, ae_clrcount_4, ae_clrcount_5, 
        co2_7, wcount_r6, wcount_r7, ae_clrcount_6, ae_clrcount_7, 
        co3_7, w_g2b_xor_cluster_0, wcount_r9, ae_clrcount_8, ae_clrcount_9, 
        co4_7, wcount_r10, ae_clr_cmp_clr, ae_clrcount_10, ae_clr_cmp_set, 
        ae_clr_d, ae_clr_d_c, iaf_setcount_0, iaf_setcount_1, af_set_ctr_ci, 
        iaf_setcount_2, iaf_setcount_3, co0_8, iaf_setcount_4, iaf_setcount_5, 
        co1_8, iaf_setcount_6, iaf_setcount_7, co2_8, iaf_setcount_8, 
        iaf_setcount_9, co3_8, iaf_setcount_10, iaf_setcount_11, co4_8, 
        af_setcount_11, cmp_ci_4, af_setcount_0, af_setcount_1, co0_9, 
        af_setcount_2, af_setcount_3, co1_9, af_setcount_4, af_setcount_5, 
        co2_9, af_setcount_6, af_setcount_7, co3_9, af_setcount_8, 
        af_setcount_9, co4_9, af_set_cmp_clr, af_setcount_10, af_set_cmp_set, 
        af_set, af_set_c, iaf_clrcount_0, iaf_clrcount_1, af_clr_ctr_ci, 
        iaf_clrcount_2, iaf_clrcount_3, co0_10, iaf_clrcount_4, iaf_clrcount_5, 
        co1_10, iaf_clrcount_6, iaf_clrcount_7, co2_10, iaf_clrcount_8, 
        iaf_clrcount_9, co3_10, iaf_clrcount_10, iaf_clrcount_11, co4_10, 
        af_clrcount_11, wren_i, cmp_ci_5, rcount_w0, rcount_w1, af_clrcount_0, 
        af_clrcount_1, co0_11, rcount_w2, rcount_w3, af_clrcount_2, 
        af_clrcount_3, co1_11, rcount_w4, rcount_w5, af_clrcount_4, 
        af_clrcount_5, co2_11, rcount_w6, rcount_w7, af_clrcount_6, 
        af_clrcount_7, co3_11, r_g2b_xor_cluster_0, rcount_w9, af_clrcount_8, 
        af_clrcount_9, co4_11, rcount_w10, af_clr_cmp_clr, af_clrcount_10, 
        af_clr_cmp_set, af_clr, scuba_vhi, scuba_vlo, af_clr_c;
    
    ROM16X1A LUT4_40 (.AD0(w_gcount_r27), .AD1(w_gcount_r26), .AD2(w_gcount_r25), 
            .AD3(w_gcount_r24), .DO0(w_g2b_xor_cluster_1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_40.initval = 16'b0110100110010110;
    ROM16X1A LUT4_39 (.AD0(w_gcount_r23), .AD1(w_gcount_r22), .AD2(w_gcount_r21), 
            .AD3(w_gcount_r20), .DO0(w_g2b_xor_cluster_2)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_39.initval = 16'b0110100110010110;
    ROM16X1A LUT4_38 (.AD0(scuba_vlo), .AD1(scuba_vlo), .AD2(w_gcount_r211), 
            .AD3(w_gcount_r210), .DO0(wcount_r10)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_38.initval = 16'b0110100110010110;
    ROM16X1A LUT4_37 (.AD0(scuba_vlo), .AD1(w_gcount_r211), .AD2(w_gcount_r210), 
            .AD3(w_gcount_r29), .DO0(wcount_r9)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_37.initval = 16'b0110100110010110;
    ROM16X1A LUT4_36 (.AD0(wcount_r10), .AD1(w_gcount_r29), .AD2(w_gcount_r28), 
            .AD3(w_gcount_r27), .DO0(wcount_r7)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_36.initval = 16'b0110100110010110;
    ROM16X1A LUT4_35 (.AD0(wcount_r9), .AD1(w_gcount_r28), .AD2(w_gcount_r27), 
            .AD3(w_gcount_r26), .DO0(wcount_r6)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_35.initval = 16'b0110100110010110;
    ROM16X1A LUT4_34 (.AD0(w_g2b_xor_cluster_0), .AD1(w_gcount_r27), .AD2(w_gcount_r26), 
            .AD3(w_gcount_r25), .DO0(wcount_r5)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_34.initval = 16'b0110100110010110;
    ROM16X1A LUT4_33 (.AD0(scuba_vlo), .AD1(scuba_vlo), .AD2(w_g2b_xor_cluster_1), 
            .AD3(w_g2b_xor_cluster_0), .DO0(wcount_r4)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_33.initval = 16'b0110100110010110;
    ROM16X1A LUT4_32 (.AD0(scuba_vlo), .AD1(w_gcount_r23), .AD2(w_g2b_xor_cluster_1), 
            .AD3(w_g2b_xor_cluster_0), .DO0(wcount_r3)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_32.initval = 16'b0110100110010110;
    ROM16X1A LUT4_31 (.AD0(w_gcount_r23), .AD1(w_gcount_r22), .AD2(w_g2b_xor_cluster_1), 
            .AD3(w_g2b_xor_cluster_0), .DO0(wcount_r2)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_31.initval = 16'b0110100110010110;
    ROM16X1A LUT4_30 (.AD0(scuba_vlo), .AD1(w_gcount_r23), .AD2(w_gcount_r22), 
            .AD3(w_gcount_r21), .DO0(w_g2b_xor_cluster_2_1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_30.initval = 16'b0110100110010110;
    ROM16X1A LUT4_29 (.AD0(scuba_vlo), .AD1(w_g2b_xor_cluster_2_1), .AD2(w_g2b_xor_cluster_1), 
            .AD3(w_g2b_xor_cluster_0), .DO0(wcount_r1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_29.initval = 16'b0110100110010110;
    ROM16X1A LUT4_28 (.AD0(scuba_vlo), .AD1(w_g2b_xor_cluster_2), .AD2(w_g2b_xor_cluster_1), 
            .AD3(w_g2b_xor_cluster_0), .DO0(wcount_r0)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_28.initval = 16'b0110100110010110;
    ROM16X1A LUT4_27 (.AD0(r_gcount_w211), .AD1(r_gcount_w210), .AD2(r_gcount_w29), 
            .AD3(r_gcount_w28), .DO0(r_g2b_xor_cluster_0)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_27.initval = 16'b0110100110010110;
    ROM16X1A LUT4_26 (.AD0(r_gcount_w27), .AD1(r_gcount_w26), .AD2(r_gcount_w25), 
            .AD3(r_gcount_w24), .DO0(r_g2b_xor_cluster_1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_26.initval = 16'b0110100110010110;
    ROM16X1A LUT4_25 (.AD0(r_gcount_w23), .AD1(r_gcount_w22), .AD2(r_gcount_w21), 
            .AD3(r_gcount_w20), .DO0(r_g2b_xor_cluster_2)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_25.initval = 16'b0110100110010110;
    ROM16X1A LUT4_24 (.AD0(scuba_vlo), .AD1(scuba_vlo), .AD2(r_gcount_w211), 
            .AD3(r_gcount_w210), .DO0(rcount_w10)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_24.initval = 16'b0110100110010110;
    ROM16X1A LUT4_23 (.AD0(scuba_vlo), .AD1(r_gcount_w211), .AD2(r_gcount_w210), 
            .AD3(r_gcount_w29), .DO0(rcount_w9)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_23.initval = 16'b0110100110010110;
    ROM16X1A LUT4_22 (.AD0(rcount_w10), .AD1(r_gcount_w29), .AD2(r_gcount_w28), 
            .AD3(r_gcount_w27), .DO0(rcount_w7)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_22.initval = 16'b0110100110010110;
    ROM16X1A LUT4_21 (.AD0(rcount_w9), .AD1(r_gcount_w28), .AD2(r_gcount_w27), 
            .AD3(r_gcount_w26), .DO0(rcount_w6)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_21.initval = 16'b0110100110010110;
    ROM16X1A LUT4_20 (.AD0(r_g2b_xor_cluster_0), .AD1(r_gcount_w27), .AD2(r_gcount_w26), 
            .AD3(r_gcount_w25), .DO0(rcount_w5)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_20.initval = 16'b0110100110010110;
    ROM16X1A LUT4_19 (.AD0(scuba_vlo), .AD1(scuba_vlo), .AD2(r_g2b_xor_cluster_1), 
            .AD3(r_g2b_xor_cluster_0), .DO0(rcount_w4)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_19.initval = 16'b0110100110010110;
    ROM16X1A LUT4_18 (.AD0(scuba_vlo), .AD1(r_gcount_w23), .AD2(r_g2b_xor_cluster_1), 
            .AD3(r_g2b_xor_cluster_0), .DO0(rcount_w3)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_18.initval = 16'b0110100110010110;
    ROM16X1A LUT4_17 (.AD0(r_gcount_w23), .AD1(r_gcount_w22), .AD2(r_g2b_xor_cluster_1), 
            .AD3(r_g2b_xor_cluster_0), .DO0(rcount_w2)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_17.initval = 16'b0110100110010110;
    ROM16X1A LUT4_16 (.AD0(scuba_vlo), .AD1(r_gcount_w23), .AD2(r_gcount_w22), 
            .AD3(r_gcount_w21), .DO0(r_g2b_xor_cluster_2_1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_16.initval = 16'b0110100110010110;
    ROM16X1A LUT4_15 (.AD0(scuba_vlo), .AD1(r_g2b_xor_cluster_2_1), .AD2(r_g2b_xor_cluster_1), 
            .AD3(r_g2b_xor_cluster_0), .DO0(rcount_w1)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_15.initval = 16'b0110100110010110;
    ROM16X1A LUT4_14 (.AD0(scuba_vlo), .AD1(r_g2b_xor_cluster_2), .AD2(r_g2b_xor_cluster_1), 
            .AD3(r_g2b_xor_cluster_0), .DO0(rcount_w0)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_14.initval = 16'b0110100110010110;
    ROM16X1A LUT4_13 (.AD0(scuba_vlo), .AD1(w_gcount_r211), .AD2(rcount_11), 
            .AD3(rptr_11), .DO0(empty_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_13.initval = 16'b0000010000010000;
    ROM16X1A LUT4_12 (.AD0(scuba_vlo), .AD1(w_gcount_r211), .AD2(rcount_11), 
            .AD3(rptr_11), .DO0(empty_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_12.initval = 16'b0001000000000100;
    ROM16X1A LUT4_11 (.AD0(scuba_vlo), .AD1(r_gcount_w211), .AD2(wcount_11), 
            .AD3(wptr_11), .DO0(full_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_11.initval = 16'b0000000101000000;
    ROM16X1A LUT4_10 (.AD0(scuba_vlo), .AD1(r_gcount_w211), .AD2(wcount_11), 
            .AD3(wptr_11), .DO0(full_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_10.initval = 16'b0100000000000001;
    ROM16X1A LUT4_9 (.AD0(rptr_11), .AD1(w_gcount_r211), .AD2(rcount_11), 
            .AD3(ae_setcount_11), .DO0(ae_set_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_9.initval = 16'b0001001111001000;
    ROM16X1A LUT4_8 (.AD0(rptr_11), .AD1(w_gcount_r211), .AD2(rcount_11), 
            .AD3(ae_setcount_11), .DO0(ae_set_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_8.initval = 16'b0010000000000100;
    ROM16X1A LUT4_7 (.AD0(rptr_11), .AD1(w_gcount_r211), .AD2(rcount_11), 
            .AD3(ae_clrcount_11), .DO0(ae_clr_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_7.initval = 16'b0001001111001000;
    ROM16X1A LUT4_6 (.AD0(rptr_11), .AD1(w_gcount_r211), .AD2(rcount_11), 
            .AD3(ae_clrcount_11), .DO0(ae_clr_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_6.initval = 16'b0010000000000100;
    ROM16X1A LUT4_5 (.AD0(scuba_vlo), .AD1(ae_clr_d), .AD2(ae_set_d), 
            .AD3(AlmostEmpty), .DO0(ae_d)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_5.initval = 16'b0100010001010000;
    ROM16X1A LUT4_4 (.AD0(wptr_11), .AD1(r_gcount_w211), .AD2(wcount_11), 
            .AD3(af_setcount_11), .DO0(af_set_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_4.initval = 16'b0100110000110010;
    ROM16X1A LUT4_3 (.AD0(wptr_11), .AD1(r_gcount_w211), .AD2(wcount_11), 
            .AD3(af_setcount_11), .DO0(af_set_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_3.initval = 16'b1000000000000001;
    ROM16X1A LUT4_2 (.AD0(wptr_11), .AD1(r_gcount_w211), .AD2(wcount_11), 
            .AD3(af_clrcount_11), .DO0(af_clr_cmp_set)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_2.initval = 16'b0100110000110010;
    ROM16X1A LUT4_1 (.AD0(wptr_11), .AD1(r_gcount_w211), .AD2(wcount_11), 
            .AD3(af_clrcount_11), .DO0(af_clr_cmp_clr)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_1.initval = 16'b1000000000000001;
    ROM16X1A LUT4_0 (.AD0(scuba_vlo), .AD1(af_clr), .AD2(af_set), .AD3(AlmostFull), 
            .DO0(af_d)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_0.initval = 16'b0100010001010000;
    DP8KE pdp_ram_0_0_2 (.DIA0(Data[0]), .DIA1(Data[1]), .DIA2(Data[2]), 
          .DIA3(Data[3]), .DIA4(scuba_vlo), .DIA5(scuba_vlo), .DIA6(scuba_vlo), 
          .DIA7(scuba_vlo), .DIA8(scuba_vlo), .ADA0(scuba_vlo), .ADA1(scuba_vlo), 
          .ADA2(wptr_0), .ADA3(wptr_1), .ADA4(wptr_2), .ADA5(wptr_3), 
          .ADA6(wptr_4), .ADA7(wptr_5), .ADA8(wptr_6), .ADA9(wptr_7), 
          .ADA10(wptr_8), .ADA11(wptr_9), .ADA12(wptr_10), .CEA(wren_i), 
          .OCEA(wren_i), .CLKA(WrClock), .WEA(scuba_vhi), .CSA0(scuba_vlo), 
          .CSA1(scuba_vlo), .CSA2(scuba_vlo), .RSTA(Reset), .DIB0(scuba_vlo), 
          .DIB1(scuba_vlo), .DIB2(scuba_vlo), .DIB3(scuba_vlo), .DIB4(scuba_vlo), 
          .DIB5(scuba_vlo), .DIB6(scuba_vlo), .DIB7(scuba_vlo), .DIB8(scuba_vlo), 
          .ADB0(scuba_vlo), .ADB1(scuba_vlo), .ADB2(rptr_0), .ADB3(rptr_1), 
          .ADB4(rptr_2), .ADB5(rptr_3), .ADB6(rptr_4), .ADB7(rptr_5), 
          .ADB8(rptr_6), .ADB9(rptr_7), .ADB10(rptr_8), .ADB11(rptr_9), 
          .ADB12(rptr_10), .CEB(rden_i), .OCEB(rden_i), .CLKB(RdClock), 
          .WEB(scuba_vlo), .CSB0(scuba_vlo), .CSB1(scuba_vlo), .CSB2(scuba_vlo), 
          .RSTB(Reset), .DOB0(Q[0]), .DOB1(Q[1]), .DOB2(Q[2]), .DOB3(Q[3])) /* synthesis MEM_LPC_FILE="LUT_FIFO.lpc", MEM_INIT_FILE="", syn_instantiated=1 */ ;
    defparam pdp_ram_0_0_2.DATA_WIDTH_A = 4;
    defparam pdp_ram_0_0_2.DATA_WIDTH_B = 4;
    defparam pdp_ram_0_0_2.REGMODE_A = "NOREG";
    defparam pdp_ram_0_0_2.REGMODE_B = "NOREG";
    defparam pdp_ram_0_0_2.CSDECODE_A = "0b000";
    defparam pdp_ram_0_0_2.CSDECODE_B = "0b000";
    defparam pdp_ram_0_0_2.WRITEMODE_A = "NORMAL";
    defparam pdp_ram_0_0_2.WRITEMODE_B = "NORMAL";
    defparam pdp_ram_0_0_2.GSR = "ENABLED";
    defparam pdp_ram_0_0_2.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_2.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_2.INIT_DATA = "STATIC";
    defparam pdp_ram_0_0_2.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_2.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    FD1P3DX FF_170 (.D(iwcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(751[13] 752[22])
    defparam FF_170.GSR = "ENABLED";
    FD1P3DX FF_169 (.D(iwcount_2), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(755[13] 756[22])
    defparam FF_169.GSR = "ENABLED";
    FD1P3DX FF_168 (.D(iwcount_3), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(759[13] 760[22])
    defparam FF_168.GSR = "ENABLED";
    FD1P3DX FF_167 (.D(iwcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(763[13] 764[22])
    defparam FF_167.GSR = "ENABLED";
    FD1P3DX FF_166 (.D(iwcount_5), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(767[13] 768[22])
    defparam FF_166.GSR = "ENABLED";
    FD1P3DX FF_165 (.D(iwcount_6), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(771[13] 772[22])
    defparam FF_165.GSR = "ENABLED";
    FD1P3DX FF_164 (.D(iwcount_7), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(775[13] 776[22])
    defparam FF_164.GSR = "ENABLED";
    FD1P3DX FF_163 (.D(iwcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(779[13] 780[22])
    defparam FF_163.GSR = "ENABLED";
    FD1P3DX FF_162 (.D(iwcount_9), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(783[13] 784[22])
    defparam FF_162.GSR = "ENABLED";
    FD1P3DX FF_161 (.D(iwcount_10), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(787[13] 788[23])
    defparam FF_161.GSR = "ENABLED";
    FD1P3DX FF_160 (.D(iwcount_11), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wcount_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(791[13] 792[23])
    defparam FF_160.GSR = "ENABLED";
    FD1P3DX FF_159 (.D(w_gdata_0), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(795[13] 796[24])
    defparam FF_159.GSR = "ENABLED";
    FD1P3DX FF_158 (.D(w_gdata_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(799[13] 800[24])
    defparam FF_158.GSR = "ENABLED";
    FD1P3DX FF_157 (.D(w_gdata_2), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(803[13] 804[24])
    defparam FF_157.GSR = "ENABLED";
    FD1P3DX FF_156 (.D(w_gdata_3), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(807[13] 808[24])
    defparam FF_156.GSR = "ENABLED";
    FD1P3DX FF_155 (.D(w_gdata_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(811[13] 812[24])
    defparam FF_155.GSR = "ENABLED";
    FD1P3DX FF_154 (.D(w_gdata_5), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(815[13] 816[24])
    defparam FF_154.GSR = "ENABLED";
    FD1P3DX FF_153 (.D(w_gdata_6), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(819[13] 820[24])
    defparam FF_153.GSR = "ENABLED";
    FD1P3DX FF_152 (.D(w_gdata_7), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(823[13] 824[24])
    defparam FF_152.GSR = "ENABLED";
    FD1P3DX FF_151 (.D(w_gdata_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(827[13] 828[24])
    defparam FF_151.GSR = "ENABLED";
    FD1P3DX FF_150 (.D(w_gdata_9), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(831[13] 832[24])
    defparam FF_150.GSR = "ENABLED";
    FD1P3DX FF_149 (.D(w_gdata_10), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(835[13] 836[25])
    defparam FF_149.GSR = "ENABLED";
    FD1P3DX FF_148 (.D(wcount_11), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(w_gcount_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(839[13] 840[25])
    defparam FF_148.GSR = "ENABLED";
    FD1P3DX FF_147 (.D(wcount_0), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(843[13] 844[20])
    defparam FF_147.GSR = "ENABLED";
    FD1P3DX FF_146 (.D(wcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(847[13] 848[20])
    defparam FF_146.GSR = "ENABLED";
    FD1P3DX FF_145 (.D(wcount_2), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(851[13] 852[20])
    defparam FF_145.GSR = "ENABLED";
    FD1P3DX FF_144 (.D(wcount_3), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(855[13] 856[20])
    defparam FF_144.GSR = "ENABLED";
    FD1P3DX FF_143 (.D(wcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(859[13] 860[20])
    defparam FF_143.GSR = "ENABLED";
    FD1P3DX FF_142 (.D(wcount_5), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(863[13] 864[20])
    defparam FF_142.GSR = "ENABLED";
    FD1P3DX FF_141 (.D(wcount_6), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(867[13] 868[20])
    defparam FF_141.GSR = "ENABLED";
    FD1P3DX FF_140 (.D(wcount_7), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(871[13] 872[20])
    defparam FF_140.GSR = "ENABLED";
    FD1P3DX FF_139 (.D(wcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(875[13] 876[20])
    defparam FF_139.GSR = "ENABLED";
    FD1P3DX FF_138 (.D(wcount_9), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(879[13] 880[20])
    defparam FF_138.GSR = "ENABLED";
    FD1P3DX FF_137 (.D(wcount_10), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(883[13] 884[21])
    defparam FF_137.GSR = "ENABLED";
    FD1P3DX FF_136 (.D(wcount_11), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(wptr_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(887[13] 888[21])
    defparam FF_136.GSR = "ENABLED";
    FD1P3BX FF_135 (.D(ircount_0), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(rcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(891[13] 892[22])
    defparam FF_135.GSR = "ENABLED";
    FD1P3DX FF_134 (.D(ircount_1), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(895[13] 896[22])
    defparam FF_134.GSR = "ENABLED";
    FD1P3DX FF_133 (.D(ircount_2), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(899[13] 900[22])
    defparam FF_133.GSR = "ENABLED";
    FD1P3DX FF_132 (.D(ircount_3), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(903[13] 904[22])
    defparam FF_132.GSR = "ENABLED";
    FD1P3DX FF_131 (.D(ircount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(907[13] 908[22])
    defparam FF_131.GSR = "ENABLED";
    FD1P3DX FF_130 (.D(ircount_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(911[13] 912[22])
    defparam FF_130.GSR = "ENABLED";
    FD1P3DX FF_129 (.D(ircount_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(915[13] 916[22])
    defparam FF_129.GSR = "ENABLED";
    FD1P3DX FF_128 (.D(ircount_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(919[13] 920[22])
    defparam FF_128.GSR = "ENABLED";
    FD1P3DX FF_127 (.D(ircount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(923[13] 924[22])
    defparam FF_127.GSR = "ENABLED";
    FD1P3DX FF_126 (.D(ircount_9), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(927[13] 928[22])
    defparam FF_126.GSR = "ENABLED";
    FD1P3DX FF_125 (.D(ircount_10), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(931[13] 932[23])
    defparam FF_125.GSR = "ENABLED";
    FD1P3DX FF_124 (.D(ircount_11), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rcount_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(935[13] 936[23])
    defparam FF_124.GSR = "ENABLED";
    FD1P3DX FF_123 (.D(r_gdata_0), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(939[13] 940[24])
    defparam FF_123.GSR = "ENABLED";
    FD1P3DX FF_122 (.D(r_gdata_1), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(943[13] 944[24])
    defparam FF_122.GSR = "ENABLED";
    FD1P3DX FF_121 (.D(r_gdata_2), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(947[13] 948[24])
    defparam FF_121.GSR = "ENABLED";
    FD1P3DX FF_120 (.D(r_gdata_3), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(951[13] 952[24])
    defparam FF_120.GSR = "ENABLED";
    FD1P3DX FF_119 (.D(r_gdata_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(955[13] 956[24])
    defparam FF_119.GSR = "ENABLED";
    FD1P3DX FF_118 (.D(r_gdata_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(959[13] 960[24])
    defparam FF_118.GSR = "ENABLED";
    FD1P3DX FF_117 (.D(r_gdata_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(963[13] 964[24])
    defparam FF_117.GSR = "ENABLED";
    FD1P3DX FF_116 (.D(r_gdata_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(967[13] 968[24])
    defparam FF_116.GSR = "ENABLED";
    FD1P3DX FF_115 (.D(r_gdata_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(971[13] 972[24])
    defparam FF_115.GSR = "ENABLED";
    FD1P3DX FF_114 (.D(r_gdata_9), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(975[13] 976[24])
    defparam FF_114.GSR = "ENABLED";
    FD1P3DX FF_113 (.D(r_gdata_10), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(979[13] 980[25])
    defparam FF_113.GSR = "ENABLED";
    FD1P3DX FF_112 (.D(rcount_11), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(r_gcount_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(983[13] 984[25])
    defparam FF_112.GSR = "ENABLED";
    FD1P3DX FF_111 (.D(rcount_0), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(987[13] 988[20])
    defparam FF_111.GSR = "ENABLED";
    FD1P3DX FF_110 (.D(rcount_1), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(991[13] 992[20])
    defparam FF_110.GSR = "ENABLED";
    FD1P3DX FF_109 (.D(rcount_2), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(995[13] 996[20])
    defparam FF_109.GSR = "ENABLED";
    FD1P3DX FF_108 (.D(rcount_3), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(999[13] 1000[20])
    defparam FF_108.GSR = "ENABLED";
    FD1P3DX FF_107 (.D(rcount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1003[13] 1004[20])
    defparam FF_107.GSR = "ENABLED";
    FD1P3DX FF_106 (.D(rcount_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1007[13] 1008[20])
    defparam FF_106.GSR = "ENABLED";
    FD1P3DX FF_105 (.D(rcount_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1011[13] 1012[20])
    defparam FF_105.GSR = "ENABLED";
    FD1P3DX FF_104 (.D(rcount_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1015[13] 1016[20])
    defparam FF_104.GSR = "ENABLED";
    FD1P3DX FF_103 (.D(rcount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1019[13] 1020[20])
    defparam FF_103.GSR = "ENABLED";
    FD1P3DX FF_102 (.D(rcount_9), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1023[13] 1024[20])
    defparam FF_102.GSR = "ENABLED";
    FD1P3DX FF_101 (.D(rcount_10), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1027[13] 1028[21])
    defparam FF_101.GSR = "ENABLED";
    FD1P3DX FF_100 (.D(rcount_11), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(rptr_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1031[13] 1032[21])
    defparam FF_100.GSR = "ENABLED";
    FD1S3DX FF_99 (.D(w_gcount_0), .CK(RdClock), .CD(Reset), .Q(w_gcount_r0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1035[13:78])
    defparam FF_99.GSR = "ENABLED";
    FD1S3DX FF_98 (.D(w_gcount_1), .CK(RdClock), .CD(Reset), .Q(w_gcount_r1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1038[13:78])
    defparam FF_98.GSR = "ENABLED";
    FD1S3DX FF_97 (.D(w_gcount_2), .CK(RdClock), .CD(Reset), .Q(w_gcount_r2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1041[13:78])
    defparam FF_97.GSR = "ENABLED";
    FD1S3DX FF_96 (.D(w_gcount_3), .CK(RdClock), .CD(Reset), .Q(w_gcount_r3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1044[13:78])
    defparam FF_96.GSR = "ENABLED";
    FD1S3DX FF_95 (.D(w_gcount_4), .CK(RdClock), .CD(Reset), .Q(w_gcount_r4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1047[13:78])
    defparam FF_95.GSR = "ENABLED";
    FD1S3DX FF_94 (.D(w_gcount_5), .CK(RdClock), .CD(Reset), .Q(w_gcount_r5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1050[13:78])
    defparam FF_94.GSR = "ENABLED";
    FD1S3DX FF_93 (.D(w_gcount_6), .CK(RdClock), .CD(Reset), .Q(w_gcount_r6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1053[13:78])
    defparam FF_93.GSR = "ENABLED";
    FD1S3DX FF_92 (.D(w_gcount_7), .CK(RdClock), .CD(Reset), .Q(w_gcount_r7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1056[13:78])
    defparam FF_92.GSR = "ENABLED";
    FD1S3DX FF_91 (.D(w_gcount_8), .CK(RdClock), .CD(Reset), .Q(w_gcount_r8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1059[13:78])
    defparam FF_91.GSR = "ENABLED";
    FD1S3DX FF_90 (.D(w_gcount_9), .CK(RdClock), .CD(Reset), .Q(w_gcount_r9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1062[13:78])
    defparam FF_90.GSR = "ENABLED";
    FD1S3DX FF_89 (.D(w_gcount_10), .CK(RdClock), .CD(Reset), .Q(w_gcount_r10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1065[13:80])
    defparam FF_89.GSR = "ENABLED";
    FD1S3DX FF_88 (.D(w_gcount_11), .CK(RdClock), .CD(Reset), .Q(w_gcount_r11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1068[13:80])
    defparam FF_88.GSR = "ENABLED";
    FD1S3DX FF_87 (.D(r_gcount_0), .CK(WrClock), .CD(rRst), .Q(r_gcount_w0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1071[13:77])
    defparam FF_87.GSR = "ENABLED";
    FD1S3DX FF_86 (.D(r_gcount_1), .CK(WrClock), .CD(rRst), .Q(r_gcount_w1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1074[13:77])
    defparam FF_86.GSR = "ENABLED";
    FD1S3DX FF_85 (.D(r_gcount_2), .CK(WrClock), .CD(rRst), .Q(r_gcount_w2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1077[13:77])
    defparam FF_85.GSR = "ENABLED";
    FD1S3DX FF_84 (.D(r_gcount_3), .CK(WrClock), .CD(rRst), .Q(r_gcount_w3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1080[13:77])
    defparam FF_84.GSR = "ENABLED";
    FD1S3DX FF_83 (.D(r_gcount_4), .CK(WrClock), .CD(rRst), .Q(r_gcount_w4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1083[13:77])
    defparam FF_83.GSR = "ENABLED";
    FD1S3DX FF_82 (.D(r_gcount_5), .CK(WrClock), .CD(rRst), .Q(r_gcount_w5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1086[13:77])
    defparam FF_82.GSR = "ENABLED";
    FD1S3DX FF_81 (.D(r_gcount_6), .CK(WrClock), .CD(rRst), .Q(r_gcount_w6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1089[13:77])
    defparam FF_81.GSR = "ENABLED";
    FD1S3DX FF_80 (.D(r_gcount_7), .CK(WrClock), .CD(rRst), .Q(r_gcount_w7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1092[13:77])
    defparam FF_80.GSR = "ENABLED";
    FD1S3DX FF_79 (.D(r_gcount_8), .CK(WrClock), .CD(rRst), .Q(r_gcount_w8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1095[13:77])
    defparam FF_79.GSR = "ENABLED";
    FD1S3DX FF_78 (.D(r_gcount_9), .CK(WrClock), .CD(rRst), .Q(r_gcount_w9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1098[13:77])
    defparam FF_78.GSR = "ENABLED";
    FD1S3DX FF_77 (.D(r_gcount_10), .CK(WrClock), .CD(rRst), .Q(r_gcount_w10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1101[13:79])
    defparam FF_77.GSR = "ENABLED";
    FD1S3DX FF_76 (.D(r_gcount_11), .CK(WrClock), .CD(rRst), .Q(r_gcount_w11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1104[13:79])
    defparam FF_76.GSR = "ENABLED";
    FD1S3DX FF_75 (.D(w_gcount_r0), .CK(RdClock), .CD(Reset), .Q(w_gcount_r20)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1107[13:80])
    defparam FF_75.GSR = "ENABLED";
    FD1S3DX FF_74 (.D(w_gcount_r1), .CK(RdClock), .CD(Reset), .Q(w_gcount_r21)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1110[13:80])
    defparam FF_74.GSR = "ENABLED";
    FD1S3DX FF_73 (.D(w_gcount_r2), .CK(RdClock), .CD(Reset), .Q(w_gcount_r22)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1113[13:80])
    defparam FF_73.GSR = "ENABLED";
    FD1S3DX FF_72 (.D(w_gcount_r3), .CK(RdClock), .CD(Reset), .Q(w_gcount_r23)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1116[13:80])
    defparam FF_72.GSR = "ENABLED";
    FD1S3DX FF_71 (.D(w_gcount_r4), .CK(RdClock), .CD(Reset), .Q(w_gcount_r24)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1119[13:80])
    defparam FF_71.GSR = "ENABLED";
    FD1S3DX FF_70 (.D(w_gcount_r5), .CK(RdClock), .CD(Reset), .Q(w_gcount_r25)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1122[13:80])
    defparam FF_70.GSR = "ENABLED";
    FD1S3DX FF_69 (.D(w_gcount_r6), .CK(RdClock), .CD(Reset), .Q(w_gcount_r26)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1125[13:80])
    defparam FF_69.GSR = "ENABLED";
    FD1S3DX FF_68 (.D(w_gcount_r7), .CK(RdClock), .CD(Reset), .Q(w_gcount_r27)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1128[13:80])
    defparam FF_68.GSR = "ENABLED";
    FD1S3DX FF_67 (.D(w_gcount_r8), .CK(RdClock), .CD(Reset), .Q(w_gcount_r28)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1131[13:80])
    defparam FF_67.GSR = "ENABLED";
    FD1S3DX FF_66 (.D(w_gcount_r9), .CK(RdClock), .CD(Reset), .Q(w_gcount_r29)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1134[13:80])
    defparam FF_66.GSR = "ENABLED";
    FD1S3DX FF_65 (.D(w_gcount_r10), .CK(RdClock), .CD(Reset), .Q(w_gcount_r210)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1137[13:82])
    defparam FF_65.GSR = "ENABLED";
    FD1S3DX FF_64 (.D(w_gcount_r11), .CK(RdClock), .CD(Reset), .Q(w_gcount_r211)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1140[13:82])
    defparam FF_64.GSR = "ENABLED";
    FD1S3DX FF_63 (.D(r_gcount_w0), .CK(WrClock), .CD(rRst), .Q(r_gcount_w20)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1143[13:79])
    defparam FF_63.GSR = "ENABLED";
    FD1S3DX FF_62 (.D(r_gcount_w1), .CK(WrClock), .CD(rRst), .Q(r_gcount_w21)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1146[13:79])
    defparam FF_62.GSR = "ENABLED";
    FD1S3DX FF_61 (.D(r_gcount_w2), .CK(WrClock), .CD(rRst), .Q(r_gcount_w22)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1149[13:79])
    defparam FF_61.GSR = "ENABLED";
    FD1S3DX FF_60 (.D(r_gcount_w3), .CK(WrClock), .CD(rRst), .Q(r_gcount_w23)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1152[13:79])
    defparam FF_60.GSR = "ENABLED";
    FD1S3DX FF_59 (.D(r_gcount_w4), .CK(WrClock), .CD(rRst), .Q(r_gcount_w24)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1155[13:79])
    defparam FF_59.GSR = "ENABLED";
    FD1S3DX FF_58 (.D(r_gcount_w5), .CK(WrClock), .CD(rRst), .Q(r_gcount_w25)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1158[13:79])
    defparam FF_58.GSR = "ENABLED";
    FD1S3DX FF_57 (.D(r_gcount_w6), .CK(WrClock), .CD(rRst), .Q(r_gcount_w26)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1161[13:79])
    defparam FF_57.GSR = "ENABLED";
    FD1S3DX FF_56 (.D(r_gcount_w7), .CK(WrClock), .CD(rRst), .Q(r_gcount_w27)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1164[13:79])
    defparam FF_56.GSR = "ENABLED";
    FD1S3DX FF_55 (.D(r_gcount_w8), .CK(WrClock), .CD(rRst), .Q(r_gcount_w28)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1167[13:79])
    defparam FF_55.GSR = "ENABLED";
    FD1S3DX FF_54 (.D(r_gcount_w9), .CK(WrClock), .CD(rRst), .Q(r_gcount_w29)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1170[13:79])
    defparam FF_54.GSR = "ENABLED";
    FD1S3DX FF_53 (.D(r_gcount_w10), .CK(WrClock), .CD(rRst), .Q(r_gcount_w210)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1173[13:81])
    defparam FF_53.GSR = "ENABLED";
    FD1S3DX FF_52 (.D(r_gcount_w11), .CK(WrClock), .CD(rRst), .Q(r_gcount_w211)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1176[13:81])
    defparam FF_52.GSR = "ENABLED";
    FD1S3BX FF_51 (.D(empty_d), .CK(RdClock), .PD(rRst), .Q(Empty)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1179[13:70])
    defparam FF_51.GSR = "ENABLED";
    FD1S3DX FF_50 (.D(full_d), .CK(WrClock), .CD(Reset), .Q(Full)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1182[13:69])
    defparam FF_50.GSR = "ENABLED";
    FD1P3BX FF_49 (.D(iae_setcount_0), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_setcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1185[13] 1186[27])
    defparam FF_49.GSR = "ENABLED";
    FD1P3BX FF_48 (.D(iae_setcount_1), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_setcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1189[13] 1190[27])
    defparam FF_48.GSR = "ENABLED";
    FD1P3DX FF_47 (.D(iae_setcount_2), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1193[13] 1194[27])
    defparam FF_47.GSR = "ENABLED";
    FD1P3BX FF_46 (.D(iae_setcount_3), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_setcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1197[13] 1198[27])
    defparam FF_46.GSR = "ENABLED";
    FD1P3DX FF_45 (.D(iae_setcount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1201[13] 1202[27])
    defparam FF_45.GSR = "ENABLED";
    FD1P3DX FF_44 (.D(iae_setcount_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1205[13] 1206[27])
    defparam FF_44.GSR = "ENABLED";
    FD1P3DX FF_43 (.D(iae_setcount_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1209[13] 1210[27])
    defparam FF_43.GSR = "ENABLED";
    FD1P3DX FF_42 (.D(iae_setcount_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1213[13] 1214[27])
    defparam FF_42.GSR = "ENABLED";
    FD1P3DX FF_41 (.D(iae_setcount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1217[13] 1218[27])
    defparam FF_41.GSR = "ENABLED";
    FD1P3DX FF_40 (.D(iae_setcount_9), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1221[13] 1222[27])
    defparam FF_40.GSR = "ENABLED";
    FD1P3DX FF_39 (.D(iae_setcount_10), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1225[13] 1226[28])
    defparam FF_39.GSR = "ENABLED";
    FD1P3DX FF_38 (.D(iae_setcount_11), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_setcount_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1229[13] 1230[28])
    defparam FF_38.GSR = "ENABLED";
    FD1P3BX FF_37 (.D(iae_clrcount_0), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_clrcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1233[13] 1234[27])
    defparam FF_37.GSR = "ENABLED";
    FD1P3DX FF_36 (.D(iae_clrcount_1), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1237[13] 1238[27])
    defparam FF_36.GSR = "ENABLED";
    FD1P3BX FF_35 (.D(iae_clrcount_2), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_clrcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1241[13] 1242[27])
    defparam FF_35.GSR = "ENABLED";
    FD1P3BX FF_34 (.D(iae_clrcount_3), .SP(rden_i), .CK(RdClock), .PD(rRst), 
            .Q(ae_clrcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1245[13] 1246[27])
    defparam FF_34.GSR = "ENABLED";
    FD1P3DX FF_33 (.D(iae_clrcount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1249[13] 1250[27])
    defparam FF_33.GSR = "ENABLED";
    FD1P3DX FF_32 (.D(iae_clrcount_5), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1253[13] 1254[27])
    defparam FF_32.GSR = "ENABLED";
    FD1P3DX FF_31 (.D(iae_clrcount_6), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1257[13] 1258[27])
    defparam FF_31.GSR = "ENABLED";
    FD1P3DX FF_30 (.D(iae_clrcount_7), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1261[13] 1262[27])
    defparam FF_30.GSR = "ENABLED";
    FD1P3DX FF_29 (.D(iae_clrcount_8), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1265[13] 1266[27])
    defparam FF_29.GSR = "ENABLED";
    FD1P3DX FF_28 (.D(iae_clrcount_9), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1269[13] 1270[27])
    defparam FF_28.GSR = "ENABLED";
    FD1P3DX FF_27 (.D(iae_clrcount_10), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1273[13] 1274[28])
    defparam FF_27.GSR = "ENABLED";
    FD1P3DX FF_26 (.D(iae_clrcount_11), .SP(rden_i), .CK(RdClock), .CD(rRst), 
            .Q(ae_clrcount_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1277[13] 1278[28])
    defparam FF_26.GSR = "ENABLED";
    FD1S3BX FF_25 (.D(ae_d), .CK(RdClock), .PD(rRst), .Q(AlmostEmpty)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1281[13:62])
    defparam FF_25.GSR = "ENABLED";
    FD1P3BX FF_24 (.D(iaf_setcount_0), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1284[13] 1285[27])
    defparam FF_24.GSR = "ENABLED";
    FD1P3DX FF_23 (.D(iaf_setcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1288[13] 1289[27])
    defparam FF_23.GSR = "ENABLED";
    FD1P3BX FF_22 (.D(iaf_setcount_2), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1292[13] 1293[27])
    defparam FF_22.GSR = "ENABLED";
    FD1P3DX FF_21 (.D(iaf_setcount_3), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1296[13] 1297[27])
    defparam FF_21.GSR = "ENABLED";
    FD1P3DX FF_20 (.D(iaf_setcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1300[13] 1301[27])
    defparam FF_20.GSR = "ENABLED";
    FD1P3DX FF_19 (.D(iaf_setcount_5), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1304[13] 1305[27])
    defparam FF_19.GSR = "ENABLED";
    FD1P3DX FF_18 (.D(iaf_setcount_6), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1308[13] 1309[27])
    defparam FF_18.GSR = "ENABLED";
    FD1P3DX FF_17 (.D(iaf_setcount_7), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1312[13] 1313[27])
    defparam FF_17.GSR = "ENABLED";
    FD1P3DX FF_16 (.D(iaf_setcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1316[13] 1317[27])
    defparam FF_16.GSR = "ENABLED";
    FD1P3BX FF_15 (.D(iaf_setcount_9), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1320[13] 1321[27])
    defparam FF_15.GSR = "ENABLED";
    FD1P3BX FF_14 (.D(iaf_setcount_10), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_setcount_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1324[13] 1325[28])
    defparam FF_14.GSR = "ENABLED";
    FD1P3DX FF_13 (.D(iaf_setcount_11), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_setcount_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1328[13] 1329[28])
    defparam FF_13.GSR = "ENABLED";
    FD1P3BX FF_12 (.D(iaf_clrcount_0), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1332[13] 1333[27])
    defparam FF_12.GSR = "ENABLED";
    FD1P3BX FF_11 (.D(iaf_clrcount_1), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_1)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1336[13] 1337[27])
    defparam FF_11.GSR = "ENABLED";
    FD1P3BX FF_10 (.D(iaf_clrcount_2), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_2)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1340[13] 1341[27])
    defparam FF_10.GSR = "ENABLED";
    FD1P3DX FF_9 (.D(iaf_clrcount_3), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_3)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1344[13] 1345[27])
    defparam FF_9.GSR = "ENABLED";
    FD1P3DX FF_8 (.D(iaf_clrcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_4)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1348[13] 1349[27])
    defparam FF_8.GSR = "ENABLED";
    FD1P3DX FF_7 (.D(iaf_clrcount_5), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_5)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1352[13] 1353[27])
    defparam FF_7.GSR = "ENABLED";
    FD1P3DX FF_6 (.D(iaf_clrcount_6), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_6)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1356[13] 1357[27])
    defparam FF_6.GSR = "ENABLED";
    FD1P3DX FF_5 (.D(iaf_clrcount_7), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_7)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1360[13] 1361[27])
    defparam FF_5.GSR = "ENABLED";
    FD1P3DX FF_4 (.D(iaf_clrcount_8), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_8)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1364[13] 1365[27])
    defparam FF_4.GSR = "ENABLED";
    FD1P3BX FF_3 (.D(iaf_clrcount_9), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_9)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1368[13] 1369[27])
    defparam FF_3.GSR = "ENABLED";
    FD1P3BX FF_2 (.D(iaf_clrcount_10), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(af_clrcount_10)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1372[13] 1373[28])
    defparam FF_2.GSR = "ENABLED";
    FD1P3DX FF_1 (.D(iaf_clrcount_11), .SP(wren_i), .CK(WrClock), .CD(Reset), 
            .Q(af_clrcount_11)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1376[13] 1377[28])
    defparam FF_1.GSR = "ENABLED";
    FD1S3DX FF_0 (.D(af_d), .CK(WrClock), .CD(Reset), .Q(AlmostFull)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1380[13:62])
    defparam FF_0.GSR = "ENABLED";
    CCU2C w_gctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(w_gctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1387[11] 1389[48])
    defparam w_gctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_gctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_gctr_cia.INJECT1_0 = "NO";
    defparam w_gctr_cia.INJECT1_1 = "NO";
    CCU2C w_gctr_0 (.A0(wcount_0), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_1), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(w_gctr_ci), .COUT(co0), .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1395[11] 1397[69])
    defparam w_gctr_0.INIT0 = 16'b0110011010101010;
    defparam w_gctr_0.INIT1 = 16'b0110011010101010;
    defparam w_gctr_0.INJECT1_0 = "NO";
    defparam w_gctr_0.INJECT1_1 = "NO";
    CCU2C w_gctr_1 (.A0(wcount_2), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_3), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co0), .COUT(co1), .S0(iwcount_2), .S1(iwcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1403[11] 1405[63])
    defparam w_gctr_1.INIT0 = 16'b0110011010101010;
    defparam w_gctr_1.INIT1 = 16'b0110011010101010;
    defparam w_gctr_1.INJECT1_0 = "NO";
    defparam w_gctr_1.INJECT1_1 = "NO";
    CCU2C w_gctr_2 (.A0(wcount_4), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_5), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co1), .COUT(co2), .S0(iwcount_4), .S1(iwcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1411[11] 1413[63])
    defparam w_gctr_2.INIT0 = 16'b0110011010101010;
    defparam w_gctr_2.INIT1 = 16'b0110011010101010;
    defparam w_gctr_2.INJECT1_0 = "NO";
    defparam w_gctr_2.INJECT1_1 = "NO";
    CCU2C w_gctr_3 (.A0(wcount_6), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_7), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co2), .COUT(co3), .S0(iwcount_6), .S1(iwcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1419[11] 1421[63])
    defparam w_gctr_3.INIT0 = 16'b0110011010101010;
    defparam w_gctr_3.INIT1 = 16'b0110011010101010;
    defparam w_gctr_3.INJECT1_0 = "NO";
    defparam w_gctr_3.INJECT1_1 = "NO";
    CCU2C w_gctr_4 (.A0(wcount_8), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_9), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co3), .COUT(co4), .S0(iwcount_8), .S1(iwcount_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1427[11] 1429[63])
    defparam w_gctr_4.INIT0 = 16'b0110011010101010;
    defparam w_gctr_4.INIT1 = 16'b0110011010101010;
    defparam w_gctr_4.INJECT1_0 = "NO";
    defparam w_gctr_4.INJECT1_1 = "NO";
    CCU2C w_gctr_5 (.A0(wcount_10), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_11), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co4), .S0(iwcount_10), .S1(iwcount_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1435[11] 1437[65])
    defparam w_gctr_5.INIT0 = 16'b0110011010101010;
    defparam w_gctr_5.INIT1 = 16'b0110011010101010;
    defparam w_gctr_5.INJECT1_0 = "NO";
    defparam w_gctr_5.INJECT1_1 = "NO";
    CCU2C r_gctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(r_gctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1443[11] 1445[48])
    defparam r_gctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_gctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_gctr_cia.INJECT1_0 = "NO";
    defparam r_gctr_cia.INJECT1_1 = "NO";
    CCU2C r_gctr_0 (.A0(rcount_0), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_1), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(r_gctr_ci), .COUT(co0_1), .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1451[11] 1453[71])
    defparam r_gctr_0.INIT0 = 16'b0110011010101010;
    defparam r_gctr_0.INIT1 = 16'b0110011010101010;
    defparam r_gctr_0.INJECT1_0 = "NO";
    defparam r_gctr_0.INJECT1_1 = "NO";
    CCU2C r_gctr_1 (.A0(rcount_2), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_3), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co0_1), .COUT(co1_1), .S0(ircount_2), .S1(ircount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1459[11] 1461[67])
    defparam r_gctr_1.INIT0 = 16'b0110011010101010;
    defparam r_gctr_1.INIT1 = 16'b0110011010101010;
    defparam r_gctr_1.INJECT1_0 = "NO";
    defparam r_gctr_1.INJECT1_1 = "NO";
    CCU2C r_gctr_2 (.A0(rcount_4), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_5), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co1_1), .COUT(co2_1), .S0(ircount_4), .S1(ircount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1467[11] 1469[67])
    defparam r_gctr_2.INIT0 = 16'b0110011010101010;
    defparam r_gctr_2.INIT1 = 16'b0110011010101010;
    defparam r_gctr_2.INJECT1_0 = "NO";
    defparam r_gctr_2.INJECT1_1 = "NO";
    CCU2C r_gctr_3 (.A0(rcount_6), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_7), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co2_1), .COUT(co3_1), .S0(ircount_6), .S1(ircount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1475[11] 1477[67])
    defparam r_gctr_3.INIT0 = 16'b0110011010101010;
    defparam r_gctr_3.INIT1 = 16'b0110011010101010;
    defparam r_gctr_3.INJECT1_0 = "NO";
    defparam r_gctr_3.INJECT1_1 = "NO";
    CCU2C r_gctr_4 (.A0(rcount_8), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_9), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co3_1), .COUT(co4_1), .S0(ircount_8), .S1(ircount_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1483[11] 1485[67])
    defparam r_gctr_4.INIT0 = 16'b0110011010101010;
    defparam r_gctr_4.INIT1 = 16'b0110011010101010;
    defparam r_gctr_4.INJECT1_0 = "NO";
    defparam r_gctr_4.INJECT1_1 = "NO";
    CCU2C r_gctr_5 (.A0(rcount_10), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(rcount_11), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co4_1), .S0(ircount_10), .S1(ircount_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1491[11] 1493[69])
    defparam r_gctr_5.INIT0 = 16'b0110011010101010;
    defparam r_gctr_5.INIT1 = 16'b0110011010101010;
    defparam r_gctr_5.INJECT1_0 = "NO";
    defparam r_gctr_5.INJECT1_1 = "NO";
    CCU2C empty_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rden_i), .B1(rden_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1499[11] 1501[45])
    defparam empty_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam empty_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam empty_cmp_ci_a.INJECT1_0 = "NO";
    defparam empty_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C empty_cmp_0 (.A0(rcount_0), .B0(wcount_r0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_1), .B1(wcount_r1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci), .COUT(co0_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1507[11] 1509[50])
    defparam empty_cmp_0.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_0.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_0.INJECT1_0 = "NO";
    defparam empty_cmp_0.INJECT1_1 = "NO";
    CCU2C empty_cmp_1 (.A0(rcount_2), .B0(wcount_r2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_3), .B1(wcount_r3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_2), .COUT(co1_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1515[11] 1517[49])
    defparam empty_cmp_1.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_1.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_1.INJECT1_0 = "NO";
    defparam empty_cmp_1.INJECT1_1 = "NO";
    CCU2C empty_cmp_2 (.A0(rcount_4), .B0(wcount_r4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_5), .B1(wcount_r5), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_2), .COUT(co2_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1523[11] 1525[49])
    defparam empty_cmp_2.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_2.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_2.INJECT1_0 = "NO";
    defparam empty_cmp_2.INJECT1_1 = "NO";
    CCU2C empty_cmp_3 (.A0(rcount_6), .B0(wcount_r6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_7), .B1(wcount_r7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_2), .COUT(co3_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1531[11] 1533[49])
    defparam empty_cmp_3.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_3.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_3.INJECT1_0 = "NO";
    defparam empty_cmp_3.INJECT1_1 = "NO";
    CCU2C empty_cmp_4 (.A0(rcount_8), .B0(w_g2b_xor_cluster_0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rcount_9), .B1(wcount_r9), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_2), .COUT(co4_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1539[11] 1541[65])
    defparam empty_cmp_4.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_4.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_4.INJECT1_0 = "NO";
    defparam empty_cmp_4.INJECT1_1 = "NO";
    CCU2C empty_cmp_5 (.A0(rcount_10), .B0(wcount_r10), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(empty_cmp_set), .B1(empty_cmp_clr), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_2), .COUT(empty_d_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1547[11] 1549[69])
    defparam empty_cmp_5.INIT0 = 16'b1001100110101010;
    defparam empty_cmp_5.INIT1 = 16'b1001100110101010;
    defparam empty_cmp_5.INJECT1_0 = "NO";
    defparam empty_cmp_5.INJECT1_1 = "NO";
    CCU2C a0 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(empty_d_c), .S0(empty_d)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1555[11] 1557[55])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C full_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(wren_i), .B1(wren_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1563[11] 1565[47])
    defparam full_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam full_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam full_cmp_ci_a.INJECT1_0 = "NO";
    defparam full_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C full_cmp_0 (.A0(wcount_0), .B0(rcount_w0), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_1), .B1(rcount_w1), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(cmp_ci_1), .COUT(co0_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1571[11] 1573[52])
    defparam full_cmp_0.INIT0 = 16'b1001100110101010;
    defparam full_cmp_0.INIT1 = 16'b1001100110101010;
    defparam full_cmp_0.INJECT1_0 = "NO";
    defparam full_cmp_0.INJECT1_1 = "NO";
    CCU2C full_cmp_1 (.A0(wcount_2), .B0(rcount_w2), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_3), .B1(rcount_w3), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co0_3), .COUT(co1_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1579[11] 1581[49])
    defparam full_cmp_1.INIT0 = 16'b1001100110101010;
    defparam full_cmp_1.INIT1 = 16'b1001100110101010;
    defparam full_cmp_1.INJECT1_0 = "NO";
    defparam full_cmp_1.INJECT1_1 = "NO";
    CCU2C full_cmp_2 (.A0(wcount_4), .B0(rcount_w4), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_5), .B1(rcount_w5), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co1_3), .COUT(co2_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1587[11] 1589[49])
    defparam full_cmp_2.INIT0 = 16'b1001100110101010;
    defparam full_cmp_2.INIT1 = 16'b1001100110101010;
    defparam full_cmp_2.INJECT1_0 = "NO";
    defparam full_cmp_2.INJECT1_1 = "NO";
    CCU2C full_cmp_3 (.A0(wcount_6), .B0(rcount_w6), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(wcount_7), .B1(rcount_w7), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(co2_3), .COUT(co3_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1595[11] 1597[49])
    defparam full_cmp_3.INIT0 = 16'b1001100110101010;
    defparam full_cmp_3.INIT1 = 16'b1001100110101010;
    defparam full_cmp_3.INJECT1_0 = "NO";
    defparam full_cmp_3.INJECT1_1 = "NO";
    CCU2C full_cmp_4 (.A0(wcount_8), .B0(r_g2b_xor_cluster_0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(wcount_9), .B1(rcount_w9), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_3), .COUT(co4_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1603[11] 1605[65])
    defparam full_cmp_4.INIT0 = 16'b1001100110101010;
    defparam full_cmp_4.INIT1 = 16'b1001100110101010;
    defparam full_cmp_4.INJECT1_0 = "NO";
    defparam full_cmp_4.INJECT1_1 = "NO";
    CCU2C full_cmp_5 (.A0(wcount_10), .B0(rcount_w10), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(full_cmp_set), .B1(full_cmp_clr), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_3), .COUT(full_d_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1611[11] 1613[68])
    defparam full_cmp_5.INIT0 = 16'b1001100110101010;
    defparam full_cmp_5.INIT1 = 16'b1001100110101010;
    defparam full_cmp_5.INJECT1_0 = "NO";
    defparam full_cmp_5.INJECT1_1 = "NO";
    CCU2C a1 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(full_d_c), .S0(full_d)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1619[11] 1621[53])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(ae_set_ctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1627[11] 1629[68])
    defparam ae_set_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_cia.INJECT1_0 = "NO";
    defparam ae_set_ctr_cia.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_0 (.A0(ae_setcount_0), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_1), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(ae_set_ctr_ci), .COUT(co0_4), .S0(iae_setcount_0), 
          .S1(iae_setcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1635[11] 1638[22])
    defparam ae_set_ctr_0.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_0.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_0.INJECT1_0 = "NO";
    defparam ae_set_ctr_0.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_1 (.A0(ae_setcount_2), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_3), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_4), .COUT(co1_4), .S0(iae_setcount_2), 
          .S1(iae_setcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1644[11] 1647[22])
    defparam ae_set_ctr_1.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_1.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_1.INJECT1_0 = "NO";
    defparam ae_set_ctr_1.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_2 (.A0(ae_setcount_4), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_5), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_4), .COUT(co2_4), .S0(iae_setcount_4), 
          .S1(iae_setcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1653[11] 1656[22])
    defparam ae_set_ctr_2.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_2.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_2.INJECT1_0 = "NO";
    defparam ae_set_ctr_2.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_3 (.A0(ae_setcount_6), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_7), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_4), .COUT(co3_4), .S0(iae_setcount_6), 
          .S1(iae_setcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1662[11] 1665[22])
    defparam ae_set_ctr_3.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_3.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_3.INJECT1_0 = "NO";
    defparam ae_set_ctr_3.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_4 (.A0(ae_setcount_8), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_9), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_4), .COUT(co4_4), .S0(iae_setcount_8), 
          .S1(iae_setcount_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1671[11] 1674[22])
    defparam ae_set_ctr_4.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_4.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_4.INJECT1_0 = "NO";
    defparam ae_set_ctr_4.INJECT1_1 = "NO";
    CCU2C ae_set_ctr_5 (.A0(ae_setcount_10), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_11), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_4), .S0(iae_setcount_10), .S1(iae_setcount_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1680[11] 1683[22])
    defparam ae_set_ctr_5.INIT0 = 16'b0110011010101010;
    defparam ae_set_ctr_5.INIT1 = 16'b0110011010101010;
    defparam ae_set_ctr_5.INJECT1_0 = "NO";
    defparam ae_set_ctr_5.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rden_i), .B1(rden_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1689[11] 1691[47])
    defparam ae_set_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam ae_set_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam ae_set_cmp_ci_a.INJECT1_0 = "NO";
    defparam ae_set_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_0 (.A0(ae_setcount_0), .B0(wcount_r0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_1), .B1(wcount_r1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci_2), .COUT(co0_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1697[11] 1699[68])
    defparam ae_set_cmp_0.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_0.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_0.INJECT1_0 = "NO";
    defparam ae_set_cmp_0.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_1 (.A0(ae_setcount_2), .B0(wcount_r2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_3), .B1(wcount_r3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_5), .COUT(co1_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1705[11] 1707[65])
    defparam ae_set_cmp_1.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_1.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_1.INJECT1_0 = "NO";
    defparam ae_set_cmp_1.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_2 (.A0(ae_setcount_4), .B0(wcount_r4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_5), .B1(wcount_r5), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_5), .COUT(co2_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1713[11] 1715[65])
    defparam ae_set_cmp_2.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_2.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_2.INJECT1_0 = "NO";
    defparam ae_set_cmp_2.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_3 (.A0(ae_setcount_6), .B0(wcount_r6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_7), .B1(wcount_r7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_5), .COUT(co3_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1721[11] 1723[65])
    defparam ae_set_cmp_3.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_3.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_3.INJECT1_0 = "NO";
    defparam ae_set_cmp_3.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_4 (.A0(ae_setcount_8), .B0(w_g2b_xor_cluster_0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_setcount_9), .B1(wcount_r9), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_5), .COUT(co4_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1729[11] 1731[65])
    defparam ae_set_cmp_4.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_4.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_4.INJECT1_0 = "NO";
    defparam ae_set_cmp_4.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_5 (.A0(ae_setcount_10), .B0(wcount_r10), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_set_cmp_set), .B1(ae_set_cmp_clr), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_5), .COUT(ae_set_d_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1737[11] 1739[70])
    defparam ae_set_cmp_5.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_5.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_5.INJECT1_0 = "NO";
    defparam ae_set_cmp_5.INJECT1_1 = "NO";
    CCU2C a2 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(ae_set_d_c), .S0(ae_set_d)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1745[11] 1747[57])
    defparam a2.INIT0 = 16'b0110011010101010;
    defparam a2.INIT1 = 16'b0110011010101010;
    defparam a2.INJECT1_0 = "NO";
    defparam a2.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(ae_clr_ctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1753[11] 1755[68])
    defparam ae_clr_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_cia.INJECT1_0 = "NO";
    defparam ae_clr_ctr_cia.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_0 (.A0(ae_clrcount_0), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_1), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(ae_clr_ctr_ci), .COUT(co0_6), .S0(iae_clrcount_0), 
          .S1(iae_clrcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1761[11] 1764[22])
    defparam ae_clr_ctr_0.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_0.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_0.INJECT1_0 = "NO";
    defparam ae_clr_ctr_0.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_1 (.A0(ae_clrcount_2), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_3), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_6), .COUT(co1_6), .S0(iae_clrcount_2), 
          .S1(iae_clrcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1770[11] 1773[22])
    defparam ae_clr_ctr_1.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_1.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_1.INJECT1_0 = "NO";
    defparam ae_clr_ctr_1.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_2 (.A0(ae_clrcount_4), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_5), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_6), .COUT(co2_6), .S0(iae_clrcount_4), 
          .S1(iae_clrcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1779[11] 1782[22])
    defparam ae_clr_ctr_2.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_2.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_2.INJECT1_0 = "NO";
    defparam ae_clr_ctr_2.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_3 (.A0(ae_clrcount_6), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_7), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_6), .COUT(co3_6), .S0(iae_clrcount_6), 
          .S1(iae_clrcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1788[11] 1791[22])
    defparam ae_clr_ctr_3.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_3.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_3.INJECT1_0 = "NO";
    defparam ae_clr_ctr_3.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_4 (.A0(ae_clrcount_8), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_9), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_6), .COUT(co4_6), .S0(iae_clrcount_8), 
          .S1(iae_clrcount_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1797[11] 1800[22])
    defparam ae_clr_ctr_4.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_4.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_4.INJECT1_0 = "NO";
    defparam ae_clr_ctr_4.INJECT1_1 = "NO";
    CCU2C ae_clr_ctr_5 (.A0(ae_clrcount_10), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_11), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_6), .S0(iae_clrcount_10), .S1(iae_clrcount_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1806[11] 1809[22])
    defparam ae_clr_ctr_5.INIT0 = 16'b0110011010101010;
    defparam ae_clr_ctr_5.INIT1 = 16'b0110011010101010;
    defparam ae_clr_ctr_5.INJECT1_0 = "NO";
    defparam ae_clr_ctr_5.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(rden_i), .B1(rden_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1815[11] 1817[47])
    defparam ae_clr_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam ae_clr_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam ae_clr_cmp_ci_a.INJECT1_0 = "NO";
    defparam ae_clr_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_0 (.A0(ae_clrcount_0), .B0(wcount_r0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_1), .B1(wcount_r1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci_3), .COUT(co0_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1823[11] 1825[68])
    defparam ae_clr_cmp_0.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_0.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_0.INJECT1_0 = "NO";
    defparam ae_clr_cmp_0.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_1 (.A0(ae_clrcount_2), .B0(wcount_r2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_3), .B1(wcount_r3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_7), .COUT(co1_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1831[11] 1833[65])
    defparam ae_clr_cmp_1.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_1.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_1.INJECT1_0 = "NO";
    defparam ae_clr_cmp_1.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_2 (.A0(ae_clrcount_4), .B0(wcount_r4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_5), .B1(wcount_r5), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_7), .COUT(co2_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1839[11] 1841[65])
    defparam ae_clr_cmp_2.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_2.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_2.INJECT1_0 = "NO";
    defparam ae_clr_cmp_2.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_3 (.A0(ae_clrcount_6), .B0(wcount_r6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_7), .B1(wcount_r7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_7), .COUT(co3_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1847[11] 1849[65])
    defparam ae_clr_cmp_3.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_3.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_3.INJECT1_0 = "NO";
    defparam ae_clr_cmp_3.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_4 (.A0(ae_clrcount_8), .B0(w_g2b_xor_cluster_0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clrcount_9), .B1(wcount_r9), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_7), .COUT(co4_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1855[11] 1857[65])
    defparam ae_clr_cmp_4.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_4.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_4.INJECT1_0 = "NO";
    defparam ae_clr_cmp_4.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_5 (.A0(ae_clrcount_10), .B0(wcount_r10), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(ae_clr_cmp_set), .B1(ae_clr_cmp_clr), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_7), .COUT(ae_clr_d_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1863[11] 1865[70])
    defparam ae_clr_cmp_5.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_5.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_5.INJECT1_0 = "NO";
    defparam ae_clr_cmp_5.INJECT1_1 = "NO";
    CCU2C a3 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(ae_clr_d_c), .S0(ae_clr_d)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1871[11] 1873[57])
    defparam a3.INIT0 = 16'b0110011010101010;
    defparam a3.INIT1 = 16'b0110011010101010;
    defparam a3.INJECT1_0 = "NO";
    defparam a3.INJECT1_1 = "NO";
    CCU2C af_set_ctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(af_set_ctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1879[11] 1881[68])
    defparam af_set_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_cia.INJECT1_0 = "NO";
    defparam af_set_ctr_cia.INJECT1_1 = "NO";
    CCU2C af_set_ctr_0 (.A0(af_setcount_0), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_1), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(af_set_ctr_ci), .COUT(co0_8), .S0(iaf_setcount_0), 
          .S1(iaf_setcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1887[11] 1890[22])
    defparam af_set_ctr_0.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_0.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_0.INJECT1_0 = "NO";
    defparam af_set_ctr_0.INJECT1_1 = "NO";
    CCU2C af_set_ctr_1 (.A0(af_setcount_2), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_3), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_8), .COUT(co1_8), .S0(iaf_setcount_2), 
          .S1(iaf_setcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1896[11] 1899[22])
    defparam af_set_ctr_1.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_1.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_1.INJECT1_0 = "NO";
    defparam af_set_ctr_1.INJECT1_1 = "NO";
    CCU2C af_set_ctr_2 (.A0(af_setcount_4), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_5), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_8), .COUT(co2_8), .S0(iaf_setcount_4), 
          .S1(iaf_setcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1905[11] 1908[22])
    defparam af_set_ctr_2.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_2.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_2.INJECT1_0 = "NO";
    defparam af_set_ctr_2.INJECT1_1 = "NO";
    CCU2C af_set_ctr_3 (.A0(af_setcount_6), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_7), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_8), .COUT(co3_8), .S0(iaf_setcount_6), 
          .S1(iaf_setcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1914[11] 1917[22])
    defparam af_set_ctr_3.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_3.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_3.INJECT1_0 = "NO";
    defparam af_set_ctr_3.INJECT1_1 = "NO";
    CCU2C af_set_ctr_4 (.A0(af_setcount_8), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_9), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_8), .COUT(co4_8), .S0(iaf_setcount_8), 
          .S1(iaf_setcount_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1923[11] 1926[22])
    defparam af_set_ctr_4.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_4.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_4.INJECT1_0 = "NO";
    defparam af_set_ctr_4.INJECT1_1 = "NO";
    CCU2C af_set_ctr_5 (.A0(af_setcount_10), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_11), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_8), .S0(iaf_setcount_10), .S1(iaf_setcount_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1932[11] 1935[22])
    defparam af_set_ctr_5.INIT0 = 16'b0110011010101010;
    defparam af_set_ctr_5.INIT1 = 16'b0110011010101010;
    defparam af_set_ctr_5.INJECT1_0 = "NO";
    defparam af_set_ctr_5.INJECT1_1 = "NO";
    CCU2C af_set_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(wren_i), .B1(wren_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_4)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1941[11] 1943[47])
    defparam af_set_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam af_set_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam af_set_cmp_ci_a.INJECT1_0 = "NO";
    defparam af_set_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C af_set_cmp_0 (.A0(af_setcount_0), .B0(rcount_w0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_1), .B1(rcount_w1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci_4), .COUT(co0_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1949[11] 1951[68])
    defparam af_set_cmp_0.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_0.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_0.INJECT1_0 = "NO";
    defparam af_set_cmp_0.INJECT1_1 = "NO";
    CCU2C af_set_cmp_1 (.A0(af_setcount_2), .B0(rcount_w2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_3), .B1(rcount_w3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_9), .COUT(co1_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1957[11] 1959[65])
    defparam af_set_cmp_1.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_1.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_1.INJECT1_0 = "NO";
    defparam af_set_cmp_1.INJECT1_1 = "NO";
    CCU2C af_set_cmp_2 (.A0(af_setcount_4), .B0(rcount_w4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_5), .B1(rcount_w5), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_9), .COUT(co2_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1965[11] 1967[65])
    defparam af_set_cmp_2.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_2.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_2.INJECT1_0 = "NO";
    defparam af_set_cmp_2.INJECT1_1 = "NO";
    CCU2C af_set_cmp_3 (.A0(af_setcount_6), .B0(rcount_w6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_7), .B1(rcount_w7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_9), .COUT(co3_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1973[11] 1975[65])
    defparam af_set_cmp_3.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_3.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_3.INJECT1_0 = "NO";
    defparam af_set_cmp_3.INJECT1_1 = "NO";
    CCU2C af_set_cmp_4 (.A0(af_setcount_8), .B0(r_g2b_xor_cluster_0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_setcount_9), .B1(rcount_w9), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_9), .COUT(co4_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1981[11] 1983[65])
    defparam af_set_cmp_4.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_4.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_4.INJECT1_0 = "NO";
    defparam af_set_cmp_4.INJECT1_1 = "NO";
    CCU2C af_set_cmp_5 (.A0(af_setcount_10), .B0(rcount_w10), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_set_cmp_set), .B1(af_set_cmp_clr), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_9), .COUT(af_set_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1989[11] 1991[68])
    defparam af_set_cmp_5.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_5.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_5.INJECT1_0 = "NO";
    defparam af_set_cmp_5.INJECT1_1 = "NO";
    CCU2C a4 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(af_set_c), .S0(af_set)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(1997[11] 1999[53])
    defparam a4.INIT0 = 16'b0110011010101010;
    defparam a4.INIT1 = 16'b0110011010101010;
    defparam a4.INJECT1_0 = "NO";
    defparam a4.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_cia (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(scuba_vhi), .B1(scuba_vhi), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(af_clr_ctr_ci)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2005[11] 2007[68])
    defparam af_clr_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_cia.INJECT1_0 = "NO";
    defparam af_clr_ctr_cia.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_0 (.A0(af_clrcount_0), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_1), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(af_clr_ctr_ci), .COUT(co0_10), .S0(iaf_clrcount_0), 
          .S1(iaf_clrcount_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2013[11] 2016[23])
    defparam af_clr_ctr_0.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_0.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_0.INJECT1_0 = "NO";
    defparam af_clr_ctr_0.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_1 (.A0(af_clrcount_2), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_3), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_10), .COUT(co1_10), .S0(iaf_clrcount_2), 
          .S1(iaf_clrcount_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2022[11] 2025[23])
    defparam af_clr_ctr_1.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_1.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_1.INJECT1_0 = "NO";
    defparam af_clr_ctr_1.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_2 (.A0(af_clrcount_4), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_5), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_10), .COUT(co2_10), .S0(iaf_clrcount_4), 
          .S1(iaf_clrcount_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2031[11] 2034[23])
    defparam af_clr_ctr_2.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_2.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_2.INJECT1_0 = "NO";
    defparam af_clr_ctr_2.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_3 (.A0(af_clrcount_6), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_7), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_10), .COUT(co3_10), .S0(iaf_clrcount_6), 
          .S1(iaf_clrcount_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2040[11] 2043[23])
    defparam af_clr_ctr_3.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_3.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_3.INJECT1_0 = "NO";
    defparam af_clr_ctr_3.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_4 (.A0(af_clrcount_8), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_9), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_10), .COUT(co4_10), .S0(iaf_clrcount_8), 
          .S1(iaf_clrcount_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2049[11] 2052[23])
    defparam af_clr_ctr_4.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_4.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_4.INJECT1_0 = "NO";
    defparam af_clr_ctr_4.INJECT1_1 = "NO";
    CCU2C af_clr_ctr_5 (.A0(af_clrcount_10), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_11), .B1(scuba_vlo), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_10), .S0(iaf_clrcount_10), .S1(iaf_clrcount_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2058[11] 2061[22])
    defparam af_clr_ctr_5.INIT0 = 16'b0110011010101010;
    defparam af_clr_ctr_5.INIT1 = 16'b0110011010101010;
    defparam af_clr_ctr_5.INJECT1_0 = "NO";
    defparam af_clr_ctr_5.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_ci_a (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(wren_i), .B1(wren_i), .C1(scuba_vhi), 
          .D1(scuba_vhi), .COUT(cmp_ci_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2067[11] 2069[47])
    defparam af_clr_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam af_clr_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam af_clr_cmp_ci_a.INJECT1_0 = "NO";
    defparam af_clr_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_0 (.A0(af_clrcount_0), .B0(rcount_w0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_1), .B1(rcount_w1), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(cmp_ci_5), .COUT(co0_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2075[11] 2077[69])
    defparam af_clr_cmp_0.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_0.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_0.INJECT1_0 = "NO";
    defparam af_clr_cmp_0.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_1 (.A0(af_clrcount_2), .B0(rcount_w2), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_3), .B1(rcount_w3), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co0_11), .COUT(co1_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2083[11] 2085[67])
    defparam af_clr_cmp_1.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_1.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_1.INJECT1_0 = "NO";
    defparam af_clr_cmp_1.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_2 (.A0(af_clrcount_4), .B0(rcount_w4), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_5), .B1(rcount_w5), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co1_11), .COUT(co2_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2091[11] 2093[67])
    defparam af_clr_cmp_2.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_2.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_2.INJECT1_0 = "NO";
    defparam af_clr_cmp_2.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_3 (.A0(af_clrcount_6), .B0(rcount_w6), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_7), .B1(rcount_w7), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co2_11), .COUT(co3_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2099[11] 2101[67])
    defparam af_clr_cmp_3.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_3.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_3.INJECT1_0 = "NO";
    defparam af_clr_cmp_3.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_4 (.A0(af_clrcount_8), .B0(r_g2b_xor_cluster_0), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clrcount_9), .B1(rcount_w9), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co3_11), .COUT(co4_11)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2107[11] 2109[67])
    defparam af_clr_cmp_4.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_4.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_4.INJECT1_0 = "NO";
    defparam af_clr_cmp_4.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_5 (.A0(af_clrcount_10), .B0(rcount_w10), .C0(scuba_vhi), 
          .D0(scuba_vhi), .A1(af_clr_cmp_set), .B1(af_clr_cmp_clr), .C1(scuba_vhi), 
          .D1(scuba_vhi), .CIN(co4_11), .COUT(af_clr_c)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2115[11] 2117[69])
    defparam af_clr_cmp_5.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_5.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_5.INJECT1_0 = "NO";
    defparam af_clr_cmp_5.INJECT1_1 = "NO";
    VHI scuba_vhi_inst (.Z(scuba_vhi));
    VLO scuba_vlo_inst (.Z(scuba_vlo));
    CCU2C a5 (.A0(scuba_vlo), .B0(scuba_vlo), .C0(scuba_vhi), .D0(scuba_vhi), 
          .A1(scuba_vlo), .B1(scuba_vlo), .C1(scuba_vhi), .D1(scuba_vhi), 
          .CIN(af_clr_c), .S0(af_clr)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(2127[11] 2129[53])
    defparam a5.INIT0 = 16'b0110011010101010;
    defparam a5.INIT1 = 16'b0110011010101010;
    defparam a5.INJECT1_0 = "NO";
    defparam a5.INJECT1_1 = "NO";
    PUR PUR_INST (.PUR(scuba_vhi));
    defparam PUR_INST.RST_PULSE = 1;
    GSR GSR_INST (.GSR(scuba_vhi));
    AND2 AND2_t24 (.A(WrEn), .B(invout_1), .Z(wren_i)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(429[10:55])
    INV INV_1 (.A(Full), .Z(invout_1));
    AND2 AND2_t23 (.A(RdEn), .B(invout_0), .Z(rden_i)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(433[10:55])
    INV INV_0 (.A(Empty), .Z(invout_0));
    OR2 OR2_t22 (.A(Reset), .B(RPReset), .Z(rRst)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(437[9:51])
    XOR2 XOR2_t21 (.A(wcount_0), .B(wcount_1), .Z(w_gdata_0)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(439[10:62])
    XOR2 XOR2_t20 (.A(wcount_1), .B(wcount_2), .Z(w_gdata_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(441[10:62])
    XOR2 XOR2_t19 (.A(wcount_2), .B(wcount_3), .Z(w_gdata_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(443[10:62])
    XOR2 XOR2_t18 (.A(wcount_3), .B(wcount_4), .Z(w_gdata_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(445[10:62])
    XOR2 XOR2_t17 (.A(wcount_4), .B(wcount_5), .Z(w_gdata_4)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(447[10:62])
    XOR2 XOR2_t16 (.A(wcount_5), .B(wcount_6), .Z(w_gdata_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(449[10:62])
    XOR2 XOR2_t15 (.A(wcount_6), .B(wcount_7), .Z(w_gdata_6)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(451[10:62])
    XOR2 XOR2_t14 (.A(wcount_7), .B(wcount_8), .Z(w_gdata_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(453[10:62])
    XOR2 XOR2_t13 (.A(wcount_8), .B(wcount_9), .Z(w_gdata_8)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(455[10:62])
    XOR2 XOR2_t12 (.A(wcount_9), .B(wcount_10), .Z(w_gdata_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(457[10:63])
    XOR2 XOR2_t11 (.A(wcount_10), .B(wcount_11), .Z(w_gdata_10)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(459[10:65])
    XOR2 XOR2_t10 (.A(rcount_0), .B(rcount_1), .Z(r_gdata_0)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(461[10:62])
    XOR2 XOR2_t9 (.A(rcount_1), .B(rcount_2), .Z(r_gdata_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(463[10:61])
    XOR2 XOR2_t8 (.A(rcount_2), .B(rcount_3), .Z(r_gdata_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(465[10:61])
    XOR2 XOR2_t7 (.A(rcount_3), .B(rcount_4), .Z(r_gdata_3)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(467[10:61])
    XOR2 XOR2_t6 (.A(rcount_4), .B(rcount_5), .Z(r_gdata_4)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(469[10:61])
    XOR2 XOR2_t5 (.A(rcount_5), .B(rcount_6), .Z(r_gdata_5)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(471[10:61])
    XOR2 XOR2_t4 (.A(rcount_6), .B(rcount_7), .Z(r_gdata_6)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(473[10:61])
    XOR2 XOR2_t3 (.A(rcount_7), .B(rcount_8), .Z(r_gdata_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(475[10:61])
    XOR2 XOR2_t2 (.A(rcount_8), .B(rcount_9), .Z(r_gdata_8)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(477[10:61])
    XOR2 XOR2_t1 (.A(rcount_9), .B(rcount_10), .Z(r_gdata_9)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(479[10:62])
    XOR2 XOR2_t0 (.A(rcount_10), .B(rcount_11), .Z(r_gdata_10)) /* synthesis syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(481[10:64])
    ROM16X1A LUT4_41 (.AD0(w_gcount_r211), .AD1(w_gcount_r210), .AD2(w_gcount_r29), 
            .AD3(w_gcount_r28), .DO0(w_g2b_xor_cluster_0)) /* synthesis syn_instantiated=1 */ ;
    defparam LUT4_41.initval = 16'b0110100110010110;
    DP8KE pdp_ram_0_1_1 (.DIA0(Data[4]), .DIA1(Data[5]), .DIA2(Data[6]), 
          .DIA3(Data[7]), .DIA4(scuba_vlo), .DIA5(scuba_vlo), .DIA6(scuba_vlo), 
          .DIA7(scuba_vlo), .DIA8(scuba_vlo), .ADA0(scuba_vlo), .ADA1(scuba_vlo), 
          .ADA2(wptr_0), .ADA3(wptr_1), .ADA4(wptr_2), .ADA5(wptr_3), 
          .ADA6(wptr_4), .ADA7(wptr_5), .ADA8(wptr_6), .ADA9(wptr_7), 
          .ADA10(wptr_8), .ADA11(wptr_9), .ADA12(wptr_10), .CEA(wren_i), 
          .OCEA(wren_i), .CLKA(WrClock), .WEA(scuba_vhi), .CSA0(scuba_vlo), 
          .CSA1(scuba_vlo), .CSA2(scuba_vlo), .RSTA(Reset), .DIB0(scuba_vlo), 
          .DIB1(scuba_vlo), .DIB2(scuba_vlo), .DIB3(scuba_vlo), .DIB4(scuba_vlo), 
          .DIB5(scuba_vlo), .DIB6(scuba_vlo), .DIB7(scuba_vlo), .DIB8(scuba_vlo), 
          .ADB0(scuba_vlo), .ADB1(scuba_vlo), .ADB2(rptr_0), .ADB3(rptr_1), 
          .ADB4(rptr_2), .ADB5(rptr_3), .ADB6(rptr_4), .ADB7(rptr_5), 
          .ADB8(rptr_6), .ADB9(rptr_7), .ADB10(rptr_8), .ADB11(rptr_9), 
          .ADB12(rptr_10), .CEB(rden_i), .OCEB(rden_i), .CLKB(RdClock), 
          .WEB(scuba_vlo), .CSB0(scuba_vlo), .CSB1(scuba_vlo), .CSB2(scuba_vlo), 
          .RSTB(Reset), .DOB0(Q[4]), .DOB1(Q[5]), .DOB2(Q[6]), .DOB3(Q[7])) /* synthesis MEM_LPC_FILE="LUT_FIFO.lpc", MEM_INIT_FILE="", syn_instantiated=1 */ ;
    defparam pdp_ram_0_1_1.DATA_WIDTH_A = 4;
    defparam pdp_ram_0_1_1.DATA_WIDTH_B = 4;
    defparam pdp_ram_0_1_1.REGMODE_A = "NOREG";
    defparam pdp_ram_0_1_1.REGMODE_B = "NOREG";
    defparam pdp_ram_0_1_1.CSDECODE_A = "0b000";
    defparam pdp_ram_0_1_1.CSDECODE_B = "0b000";
    defparam pdp_ram_0_1_1.WRITEMODE_A = "NORMAL";
    defparam pdp_ram_0_1_1.WRITEMODE_B = "NORMAL";
    defparam pdp_ram_0_1_1.GSR = "ENABLED";
    defparam pdp_ram_0_1_1.RESETMODE = "ASYNC";
    defparam pdp_ram_0_1_1.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_1_1.INIT_DATA = "STATIC";
    defparam pdp_ram_0_1_1.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_1_1.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    DP8KE pdp_ram_0_2_0 (.DIA0(Data[8]), .DIA1(Data[9]), .DIA2(scuba_vlo), 
          .DIA3(scuba_vlo), .DIA4(scuba_vlo), .DIA5(scuba_vlo), .DIA6(scuba_vlo), 
          .DIA7(scuba_vlo), .DIA8(scuba_vlo), .ADA0(scuba_vlo), .ADA1(scuba_vlo), 
          .ADA2(wptr_0), .ADA3(wptr_1), .ADA4(wptr_2), .ADA5(wptr_3), 
          .ADA6(wptr_4), .ADA7(wptr_5), .ADA8(wptr_6), .ADA9(wptr_7), 
          .ADA10(wptr_8), .ADA11(wptr_9), .ADA12(wptr_10), .CEA(wren_i), 
          .OCEA(wren_i), .CLKA(WrClock), .WEA(scuba_vhi), .CSA0(scuba_vlo), 
          .CSA1(scuba_vlo), .CSA2(scuba_vlo), .RSTA(Reset), .DIB0(scuba_vlo), 
          .DIB1(scuba_vlo), .DIB2(scuba_vlo), .DIB3(scuba_vlo), .DIB4(scuba_vlo), 
          .DIB5(scuba_vlo), .DIB6(scuba_vlo), .DIB7(scuba_vlo), .DIB8(scuba_vlo), 
          .ADB0(scuba_vlo), .ADB1(scuba_vlo), .ADB2(rptr_0), .ADB3(rptr_1), 
          .ADB4(rptr_2), .ADB5(rptr_3), .ADB6(rptr_4), .ADB7(rptr_5), 
          .ADB8(rptr_6), .ADB9(rptr_7), .ADB10(rptr_8), .ADB11(rptr_9), 
          .ADB12(rptr_10), .CEB(rden_i), .OCEB(rden_i), .CLKB(RdClock), 
          .WEB(scuba_vlo), .CSB0(scuba_vlo), .CSB1(scuba_vlo), .CSB2(scuba_vlo), 
          .RSTB(Reset), .DOB0(Q[8]), .DOB1(Q[9])) /* synthesis MEM_LPC_FILE="LUT_FIFO.lpc", MEM_INIT_FILE="", syn_instantiated=1 */ ;
    defparam pdp_ram_0_2_0.DATA_WIDTH_A = 4;
    defparam pdp_ram_0_2_0.DATA_WIDTH_B = 4;
    defparam pdp_ram_0_2_0.REGMODE_A = "NOREG";
    defparam pdp_ram_0_2_0.REGMODE_B = "NOREG";
    defparam pdp_ram_0_2_0.CSDECODE_A = "0b000";
    defparam pdp_ram_0_2_0.CSDECODE_B = "0b000";
    defparam pdp_ram_0_2_0.WRITEMODE_A = "NORMAL";
    defparam pdp_ram_0_2_0.WRITEMODE_B = "NORMAL";
    defparam pdp_ram_0_2_0.GSR = "ENABLED";
    defparam pdp_ram_0_2_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_2_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_2_0.INIT_DATA = "STATIC";
    defparam pdp_ram_0_2_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_2_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    FD1P3BX FF_171 (.D(iwcount_0), .SP(wren_i), .CK(WrClock), .PD(Reset), 
            .Q(wcount_0)) /* synthesis GSR="ENABLED", syn_instantiated=1 */ ;   // c:/users/dchitti1/desktop/from robin/dphy_to_cmos_camera/phase_3rd/source/clarity/dual_camera/lut_fifo/lut_fifo.v(747[13] 748[22])
    defparam FF_171.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

