// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2011 (c) Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorised by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement from
// Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                            408-826-6000 (other locations)
// Hillsboro, OR 97124                     web  : http://www.latticesemi.com/
// U.S.A                                   email: techsupport@lscc.com
// =============================================================================
//                         FILE DETAILS
// Project          : DDR3 Versa EB Demo 
// File             : ddr3_test_top.v 
// Title            : ddr3_test_top
// Dependencies     : 
// Description      : Command and address generation block
//            
//
// =============================================================================
//                        REVISION HISTORY
// Version          : 1.0
// Author(s)        : Kyoho Lee/ LSV Apps
// Mod. Date        : February, 2011
// Changes Made     :
//
// =============================================================================

`timescale 1 ns / 100 ps
`include "ddr3_test_params.v"

module ddr3_test_top (
   test1,
   out_test1,
    clk_in,
    reset_n,
    // LED display & dip sw signals
    oled,
    //seg,
    dip_sw,
  `ifdef SIM
    sclk,
  `endif
    // output to external memory
    em_ddr_data,
    em_ddr_dqs,
    em_ddr_dm,
    em_ddr_clk,
    em_ddr_cke,
    em_ddr_cs_n,
    em_ddr_odt,
    em_ddr_reset_n,
    em_ddr_ras_n,
    em_ddr_cas_n,
    em_ddr_we_n,
    em_ddr_ba,
    em_ddr_addr
	//vref_out
    )/* synthesis syn_dspstyle=LOGIC */ /* synthesis syn_useioff = 0 */;

// ==============================================================================
// define all inputs / outputs
// ==============================================================================
input 							test1;
input                           clk_in;
input                           reset_n;
input   [4:0]                   dip_sw;
output out_test1;

// inputs & outputs for memory interface
inout  [`inst1_DATA_WIDTH-1:0]        em_ddr_data;
inout  [`inst1_DATA_WIDTH / 8-1:0]    em_ddr_dqs;
output [`inst1_DATA_WIDTH/8-1:0]      em_ddr_dm;
output [0:0]          em_ddr_clk;
output [0:0]          em_ddr_cke;
output                          em_ddr_ras_n;
output                          em_ddr_cas_n;
output                          em_ddr_we_n;
output  [`inst1_CS_WIDTH-1:0]         em_ddr_cs_n;
output  [`inst1_CS_WIDTH -1 :0]       em_ddr_odt;
output  [`inst1_ROW_WIDTH-1:0]        em_ddr_addr;
output  [`inst1_BANK_WIDTH-1:0]       em_ddr_ba;
output                          em_ddr_reset_n;
output  [6:0]                   oled;
//output  [14:0]                  seg;
`ifdef SIM
 output                         sclk;
`endif

assign em_ddr_cke=temp_cke;
assign out_test1=test1;


// ==============================================================================
// internal signals
// ==============================================================================                               
wire                            sclk /* synthesis syn_keep=1 */;    
wire    [0:0]         em_ddr_clk;
wire    [0:0]         em_ddr_cke;
wire                            init_start;
wire                            mem_rst_n;
wire    [6:0]                   oled;
wire                            err_notify;
wire    [3:0]                   cmd;
wire    [`inst1_ADDR_WIDTH-1:0]       addr;
wire                            cmd_valid;
wire    [4:0]                   cmd_burst_cnt;
wire    [`inst1_DSIZE-1:0]            write_data;
wire    [`inst1_USER_DM-1:0]          data_mask;
wire                            cmd_rdy;
wire                            init_done;
wire                            datain_rdy;
wire    [`inst1_DSIZE-1:0]            read_data;
wire                            read_data_valid;
wire                            err_det;
wire    [2:0]                   rpt;
wire    [`inst1_DQS_WIDTH*3-1:0]      read_pulse_tap;
wire    [14:0]                  seg;
reg     [25:0]                  hb_cnt;
reg                             init_done_det;
reg                             cmd_rdy_det;
reg                             datain_rdy_det;
reg                             rd_dat_val_det;
reg     [25:0]                  read_num, write_num;
reg     [22:0]                  data_1_cnt;
reg     [22:0]                  data_0_cnt;

// ==============================================================================
// READ_PULSE_TAP setting for PCB routing compensation
// ==============================================================================                               
assign rpt  = {1'b0, 1'b1, 1'b0};   // use the default = 2
assign read_pulse_tap = {`inst1_DQS_WIDTH{rpt}};

// ==============================================================================
// Output LED display
// ==============================================================================
assign  oled[0] =   hb_cnt[25];
assign  oled[1] =   read_num[22];
assign  oled[2] =   data_1_cnt[20] && data_0_cnt[20]; 
assign  oled[3] =   err_notify;
assign  oled[4] =   cmd_rdy_det;
assign  oled[5] =   datain_rdy_det;
assign  oled[6] =   rd_dat_val_det;
assign  err_notify  =   err_det ? hb_cnt[25] : `LED_OFF;

//assign vref_out = 1'bz;

always@(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        hb_cnt          <= 26'h0;
        read_num        <= 26'b0;
        write_num       <= 26'b0;
        data_0_cnt      <= 23'b0;
        data_1_cnt      <= 23'b0;
        datain_rdy_det  <=`LED_OFF;
        rd_dat_val_det  <=`LED_OFF;
        init_done_det   <=`LED_OFF;
        cmd_rdy_det     <=`LED_OFF;
    end
    else begin
        hb_cnt  <=  hb_cnt + 1;
        if (init_done)          init_done_det       <=  `LED_ON;
        if (cmd_rdy)            cmd_rdy_det         <=  `LED_ON;
        if (datain_rdy)         datain_rdy_det      <=  `LED_ON;
        if (read_data_valid)    rd_dat_val_det      <=  `LED_ON;
        if (read_data_valid && read_data[7])    data_1_cnt  <=  data_1_cnt + 1;
        if (read_data_valid && ~read_data[7])   data_0_cnt  <=  data_0_cnt + 1;
        if (read_data_valid)                    read_num    <=  read_num + 1;
        if (datain_rdy)                         write_num   <=  write_num + 1;
    end 
end

//=============================================================================
// User Refresh assertion when EXT_AUTO_REF is defined
//=============================================================================
`ifdef EXT_AUTO_REF
 reg        req_pending;
 reg        ext_auto_ref;
 wire       ext_auto_ref_ack;
 
 always@(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        ext_auto_ref    <= 1'b0;
        req_pending     <= 1'b0;
    end
    else begin
        if (hb_cnt[12] && !req_pending) begin
            ext_auto_ref    <= 1'b1;
            req_pending     <= 1'b1;
        end
        else if (ext_auto_ref_ack)
            ext_auto_ref    <= 1'b0;
        
        if (!hb_cnt[12])
            req_pending     <= 1'b0;
    end
 end
`endif

wire [1:0] temp_cke;

// ==============================================================================
// DDR3 IP core instantiation
// ==============================================================================   
//ddr3_sdram_mem_top u_ddr3_sdram_mem_top (
ddr3_ip_inst u_ddr3_sdram_mem_top (
    .inst1_clk_in                 (clk_in), 
    .inst1_rst_n                  (reset_n),
    .inst1_mem_rst_n              (mem_rst_n),
    .inst1_cmd                    (cmd), 
    .inst1_addr                   (addr), 
    .inst1_cmd_valid              (cmd_valid),
    .inst1_ofly_burst_len         (ofly_burst_len),
    .inst1_cmd_burst_cnt          (cmd_burst_cnt), 
    .inst1_init_start             (init_start), 
    .inst1_write_data             (write_data), 
    .inst1_data_mask              (data_mask), 
    .inst1_cmd_rdy                (cmd_rdy), 
    .inst1_init_done              (init_done), 
    .inst1_datain_rdy             (datain_rdy),
    .inst1_wl_err                 (wl_err),
    .inst1_clocking_good          (clocking_good),
  `ifdef EXT_AUTO_REF
    .ext_auto_ref           (ext_auto_ref),
    .ext_auto_ref_ack       (ext_auto_ref_ack),
  `endif 
    .inst1_read_data              (read_data), 
    .inst1_read_data_valid        (read_data_valid),
//    .inst1_read_pulse_tap         (read_pulse_tap), 
    .inst1_em_ddr_data            (em_ddr_data), 
    .inst1_em_ddr_dqs             (em_ddr_dqs), 
    .inst1_em_ddr_clk             (em_ddr_clk), 
    .inst1_em_ddr_reset_n         (em_ddr_reset_n),
    .inst1_em_ddr_cke             (temp_cke), 
    .inst1_em_ddr_ras_n           (em_ddr_ras_n), 
    .inst1_em_ddr_cas_n           (em_ddr_cas_n), 
    .inst1_em_ddr_we_n            (em_ddr_we_n), 
    .inst1_em_ddr_cs_n            (em_ddr_cs_n),
    .inst1_em_ddr_odt             (em_ddr_odt),
    .inst1_em_ddr_dm              (em_ddr_dm), 
    .inst1_em_ddr_ba              (em_ddr_ba), 
    .inst1_em_ddr_addr            (em_ddr_addr),
    .inst1_sclk_out               (sclk)
);

// ==============================================================================
// User Test Logic instantiation
// ==============================================================================
ddr_ulogic  u_ddr_ulogic (
//---------inputs-------------
    .sclk                   (sclk),
    .reset_n                (reset_n),
    .init_done              (init_done),
    .cmd_rdy                (cmd_rdy),
    .datain_rdy             (datain_rdy),
    .read_data              (read_data),
    .read_data_valid        (read_data_valid),
    .dip_sw                 (dip_sw[4:0]),
    .cmd                    (cmd),
    .cmd_valid              (cmd_valid),
    .addr                   (addr),
    .cmd_burst_cnt          (cmd_burst_cnt),
    .write_data             (write_data),
    .init_start             (init_start),
    .mem_rst_n              (mem_rst_n),
    .data_mask              (data_mask),
    .otf_bl_sel             (ofly_burst_len),
    .err_det                (err_det)
    ) /*synthesis UGROUP="ddr3_ulogic" PBBOX="25,20" BBOXTYPE= "DEVSIZE" */;

assign speed  =  read_num[22];

led_15seg_drv u_led_15seg_drv (
    .clk                    (sclk),
    .resetn                 (reset_n),
    .err_det                (err_det),
    .blink_speed            (speed),
    .seg_en                 (1'b1),
    .seg                    (seg)
    );

endmodule
