//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2013 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
// Permission:
//
//   Lattice Semiconductor grants permission to use this code for use
//   in synthesis for any Lattice programmable logic product.  Other
//   use of this code, including the selling or duplication of any
//   portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL or Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Lattice Semiconductor provides no warranty
//   regarding the use or functionality of this code.
//
// --------------------------------------------------------------------
//
//                     Lattice Semiconductor Corporation
//                     5555 NE Moore Court
//                     Hillsboro, OR 97214
//                     U.S.A
//
//                     TEL: 1-800-Lattice (USA and Canada)
//                          408-826-6000 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
// rx_global_ctrl.v -- RX Global Controller
// --------------------------------------------------------------------------------------------
// Revision History :
// --------------------------------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Masashi Tayama    :| 02/03/15  :| Initial Release
//   V1.1 :| Masashi Tayama    :| 03/09/15  :| Added clk_hs_i & reset_d0_n_i
//   V1.2 :| Masashi Tayama    :| 03/23/15  :| Clock scheme change, parameter change to enable/
//                                             disable RX_FIFO
//   V1.3 :| Masashi Tayama    :| 04/20/15  :| Changed the reset scheme to lp_hs_d0_ctrl which 
//                                             has min. 1 clock from clock active to LP Data 
//                                             transition happens
//   V1.4 :| Masashi Tayama    :| 04/20/15  :| Async reset to lp_hs_d0_ctrl regardless of DPHY 
//   V1.5 :| Masashi Tayama    :| 04/24/15  :| Added rx_fifo_reset_i 
//   V1.6 :| Masashi Tayama    :| 06/29/15  :| Feed clk_byte to lp_hs_ctrl_d instead of clk_byte_fr 
//   V1.7 :| Masashi Tayama    :| 06/30/15  :| Back to V1.5 & use reset_byte_fr_n_i to FFs
// --------------------------------------------------------------------------------------------

module rx_global_ctrl #(
    parameter NUM_RX_LANE = 4,
    parameter RX_GEAR = 8,
    parameter RX_FIFO = "OFF",
    parameter RX_CLK_MODE = "HS_ONLY"
)
(
    input  wire	              reset_n_i,
    input  wire	              reset_lp_n_i,
    input  wire	              reset_byte_fr_n_i,
    input  wire               clk_lp_ctrl_i,
    input  wire	              clk_byte_hs_i,      // not used
    input  wire	              clk_byte_i,
    input  wire	              clk_byte_fr_i,
    input  wire	              pll_lock_i,         // PLL Lock indicator, active high

    input wire [RX_GEAR-1:0]  bd0_i,
    input wire [RX_GEAR-1:0]  bd1_i,
    input wire [RX_GEAR-1:0]  bd2_i,
    input wire [RX_GEAR-1:0]  bd3_i,
    input wire                lp_clk_p_i,         // LP P on CLK lane
    input wire                lp_clk_n_i,         // LP N on CLK lane
    input wire                lp_d0_p_i,          // LP P on D0 lane
    input wire                lp_d0_n_i,          // LP N on D0 lane
    input wire                lp_d1_p_i,          // LP P on D1 lane
    input wire                lp_d1_n_i,          // LP N on D1 lane
    input wire                lp_d2_p_i,          // LP P on D2 lane
    input wire                lp_d2_n_i,          // LP N on D2 lane
    input wire                lp_d3_p_i,          // LP P on D3 lane
    input wire                lp_d3_n_i,          // LP N on D3 lane
    input wire                hs_sync_i,          // HS sync from Lane Aligner, active high
    output wire [RX_GEAR-1:0] bd0_o,
    output wire [RX_GEAR-1:0] bd1_o,
    output wire [RX_GEAR-1:0] bd2_o,
    output wire [RX_GEAR-1:0] bd3_o,
    output wire               term_clk_en_o,      // Termination Enable on CLK lane for HS mode, active high
    output wire               term_d0_en_o,       // Termination Enable on Data lane 0 for HS mode, active high
    output wire               hs_d0_en_o,   	  // HS mode Enable on Data lane 0, active high
    output wire               term_d1_en_o,       // Termination Enable on Data lane 1 for HS mode, active high
    output wire               hs_d1_en_o,         // HS mode Enable on Data lane 1, active high
    output wire               term_d2_en_o,       // Termination Enable on Data lane 2 for HS mode, active high
    output wire               hs_d2_en_o,         // HS mode Enable on Data lane 2, active high
    output wire               term_d3_en_o,       // Termination Enable on Data lane 3 for HS mode, active high
    output wire               hs_d3_en_o,         // HS mode Enable on Data lane 3, active high
    output wire               hs_sync_o,          // HS sync, active high
    output wire [1:0]         lp_hs_state_clk_o,  // LP HS state machine (CLK) for debug
    output wire [1:0]         lp_hs_state_d_o     // LP HS state machine (D0) for debug
);



endmodule
