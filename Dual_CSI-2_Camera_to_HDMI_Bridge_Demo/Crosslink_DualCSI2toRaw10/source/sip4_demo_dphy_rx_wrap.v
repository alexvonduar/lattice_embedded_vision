
// `include "../testbench/testbench_define_files.v"  // for simulation only add this. 

module sip4_demo_dphy_rx_wrap (
    input wire                reset_n_i,
    input wire                reset_byte_n_i,
    input wire                reset_byte_fr_n_i,
    input wire                clk_byte_fr_i,
    inout wire                clk_p_i,
    inout wire                clk_n_i,
    inout wire                d0_p_io,	
    inout wire                d0_n_io,	
    inout wire                d1_p_i,	
    inout wire                d1_n_i,	
    inout wire                d2_p_i,	
    inout wire                d2_n_i,	
    inout wire                d3_p_i,	
    inout wire                d3_n_i,
    input wire                term_clk_en_i,
    input wire                term_d0_en_i,
    input wire                term_d1_en_i,
    input wire                term_d2_en_i,
    input wire                term_d3_en_i,
    input wire                hs_d0_en_i,
    input wire                hs_d1_en_i,
    input wire                hs_d2_en_i,
    input wire                hs_d3_en_i,
    input wire                lp_d0_tx_en_i,
    input wire                lp_d0_tx_p_i,
    input wire                lp_d0_tx_n_i,

    output wire               clk_hs_o,
    output wire               clk_byte_o,
    output wire [8-1:0] bd0_o,
    output wire [8-1:0] bd1_o,
    output wire [8-1:0] bd2_o,
    output wire [8-1:0] bd3_o,
    output wire               hs_sync_o,       // aligned to B8(Gear8) or B800(Gear16)

    output wire               lp_clk_rx_p_o,
    output wire               lp_clk_rx_n_o,
    output wire               lp_d0_rx_p_o,
    output wire               lp_d0_rx_n_o,
    output wire               lp_d1_rx_p_o,
    output wire               lp_d1_rx_n_o,
    output wire               lp_d2_rx_p_o,
    output wire               lp_d2_rx_n_o,
    output wire               lp_d3_rx_p_o,
    output wire               lp_d3_rx_n_o,
    output wire               cd_clk_o,
    output wire               cd_d0_o,
	output [3:0] dphy_sync
);
`ifdef sim
	`define frq 46
`else
	`define frq 96
`endif

dphy_rx_wrap
#(
    .NUM_RX_LANE    (4),
    .RX_GEAR        (8),
    .DPHY_RX_IP     ("MIXEL"),
    .LANE_ALIGN     ("OFF"),
    .BYTECLK_MHZ    (`frq)
)
dsi_rx (
    .reset_n_i        (reset_n_i),
    .reset_byte_n_i   (reset_byte_n_i),
    .reset_byte_fr_n_i(reset_byte_fr_n_i),
    .clk_byte_fr_i    (clk_byte_fr_i),
    .clk_p_i          (clk_p_i),
    .clk_n_i          (clk_n_i),
    .d0_p_io          (d0_p_io),
    .d0_n_io          (d0_n_io),
    .d1_p_i           (d1_p_i),
    .d1_n_i           (d1_n_i),
    .d2_p_i           (d2_p_i),
    .d2_n_i           (d2_n_i),
    .d3_p_i           (d3_p_i),
    .d3_n_i           (d3_n_i),
    .term_clk_en_i    (term_clk_en_i),
    .term_d0_en_i     (term_d0_en_i),
    .term_d1_en_i     (term_d1_en_i),
    .term_d2_en_i     (term_d2_en_i),
    .term_d3_en_i     (term_d3_en_i),
    .hs_d0_en_i       (hs_d0_en_i),
    .hs_d1_en_i       (hs_d1_en_i),
    .hs_d2_en_i       (hs_d2_en_i),
    .hs_d3_en_i       (hs_d3_en_i),
    .lp_d0_tx_en_i    (lp_d0_tx_en_i),
    .lp_d0_tx_p_i     (lp_d0_tx_p_i),
    .lp_d0_tx_n_i     (lp_d0_tx_n_i),

    .clk_hs_o         (clk_hs_o), // byte clk output. used to clock hs_ctrl_d0
    .clk_byte_o       (clk_byte_o),  // used to latch data
    .bd0_o            (bd0_o),
    .bd1_o            (bd1_o),
    .bd2_o            (bd2_o),
    .bd3_o            (bd3_o),
    .hs_sync_o        (hs_sync_o),

    .lp_clk_rx_p_o    (lp_clk_rx_p_o),
    .lp_clk_rx_n_o    (lp_clk_rx_n_o),
    .lp_d0_rx_p_o     (lp_d0_rx_p_o),
    .lp_d0_rx_n_o     (lp_d0_rx_n_o),
    .lp_d1_rx_p_o     (lp_d1_rx_p_o),
    .lp_d1_rx_n_o     (lp_d1_rx_n_o),
    .lp_d2_rx_p_o     (lp_d2_rx_p_o),
    .lp_d2_rx_n_o     (lp_d2_rx_n_o),
    .lp_d3_rx_p_o     (lp_d3_rx_p_o),
    .lp_d3_rx_n_o     (lp_d3_rx_n_o),
    .cd_clk_o         (cd_clk_o),
    .cd_d0_o          (cd_d0_o),
	.d_sot_det(dphy_sync)
);

endmodule
