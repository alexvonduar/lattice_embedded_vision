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
// ----------------------------------------------------------------------------------------------
// dphy_rx_wrap.v -- DPHY RX Wrapper
// ----------------------------------------------------------------------------------------------
//
// Revision History :
// ----------------------------------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Masashi Tayama    :| 02/03/15  :| Initial Release
//   V1.1 :| Masashi Tayama    :| 03/09/15  :| Added clk_hs_o
//   V1.2 :| Masashi Tayama    :| 03/12/15  :| Insert "B8" for Mixel DPHY
//   V1.3 :| Masashi Tayama    :| 03/23/15  :| Mixel CLK/Data out similar to in-house DPHY
//   V1.4 :| Masashi Tayama    :| 04/01/15  :| Mixel DPHY Control back to normal (similar to V1.2)
//   V1.5 :| Masashi Tayama    :| 04/10/15  :| Instantiated In-house DPHY
//   V1.6 :| Masashi Tayama    :| 04/13/15  :| Use Mixel DPHY wrapper instead of X150_X151
//   V1.7 :| Masashi Tayama    :| 04/15/15  :| Assigned clk_byte_o to clk_hs_o for in-house DPHY
//   V1.8 :| Masashi Tayama    :| 04/18/15  :| Aligned hs_sync_o=1 to B8(Gear8) or B800(Gear16) 
//   V1.9 :| Masashi Tayama    :| 04/24/15  :| Added rx_fifo_reset_o 
//   V2.0 :| Masashi Tayama    :| 04/29/15  :| Changed all dphy ports to inout 
//   V2.1 :| Masashi Tayama    :| 06/10/15  :| Removed rx_fifo_reset_o 
// -----------------------------------------------------------------------------------------------

module dphy_rx_wrap #(
    parameter     NUM_RX_LANE = 4,
    parameter     RX_GEAR     = 8,
    parameter     DPHY_RX_IP  = "MIXEL",
    parameter     LANE_ALIGN  = "OFF",
    parameter     RX_CLK_MODE = "HS_LP",
    parameter     BYTECLK_MHZ = 46,
    parameter     FIFO_DEPTH  = 16,
    parameter     FIFO_TYPE0  = "EBR",
    parameter     FIFO_TYPE1  = "EBR",
    parameter     FIFO_TYPE2  = "EBR",
    parameter     FIFO_TYPE3  = "EBR"
)
(
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
    output wire [RX_GEAR-1:0] bd0_o,
    output wire [RX_GEAR-1:0] bd1_o,
    output wire [RX_GEAR-1:0] bd2_o,
    output wire [RX_GEAR-1:0] bd3_o,
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
	
	output [3:0] d_sot_det
);

reg                    hs_d0_en_r, hs_d1_en_r, hs_d2_en_r, hs_d3_en_r;
reg                    hs_d0_en1_r, hs_d1_en1_r, hs_d2_en1_r, hs_d3_en1_r;
reg                    hs_sync_meta, hs_sync_sync, hs_sync_d1_r, hs_sync_d2_r;
reg                    hs_sync1_meta, hs_sync1_sync, hs_sync1_d1_r, hs_sync1_d2_r;
reg                    hs_sync2_meta, hs_sync2_sync, hs_sync2_d1_r, hs_sync2_d2_r;
reg                    hs_sync3_meta, hs_sync3_sync, hs_sync3_d1_r, hs_sync3_d2_r;
reg                    hs_sync_latch, hs_sync1_latch, hs_sync2_latch, hs_sync3_latch;
reg [1:0]              bd_sel_r, bd_fr_sel_r;
reg [1:0]              bd1_sel_r, bd1_fr_sel_r;
reg [1:0]              bd2_sel_r, bd2_fr_sel_r;
reg [1:0]              bd3_sel_r, bd3_fr_sel_r;
reg [RX_GEAR-1:0]      bd0_reg1_r, bd1_reg1_r, bd2_reg1_r, bd3_reg1_r;
reg [RX_GEAR-1:0]      bd0_reg2_r, bd1_reg2_r, bd2_reg2_r, bd3_reg2_r;
reg [RX_GEAR-1:0]      bd0_reg3_r, bd1_reg3_r, bd2_reg3_r, bd3_reg3_r;
reg [RX_GEAR-1:0]      bd0_fr_r, bd1_fr_r, bd2_fr_r, bd3_fr_r;
reg [RX_GEAR-1:0]      bd0_align_r, bd1_align_r, bd2_align_r, bd3_align_r;
reg                    hs_en0_settle, hs_en1_settle, hs_en2_settle, hs_en3_settle;
reg [3:0]              settle_cnt_lane0, settle_cnt_lane1, settle_cnt_lane2, settle_cnt_lane3;
wire                   reset_by_hs_sync_sync_n, reset_by_hs_sync1_sync_n, reset_by_hs_sync2_sync_n, reset_by_hs_sync3_sync_n;
wire                   bd_sel_en, bd1_sel_en, bd2_sel_en, bd3_sel_en;
wire [1:0]             bd1_sel, bd1_fr_sel;
wire [1:0]             bd2_sel, bd2_fr_sel;
wire [1:0]             bd3_sel, bd3_fr_sel;
wire                   hs_sync_c, hs_sync1_c, hs_sync2_c, hs_sync3_c;
wire                   hs_sync_align;
wire                   hs_sync1_sync_w, hs_sync2_sync_w, hs_sync3_sync_w;
wire                   clk_hs;
wire [RX_GEAR-1:0]     sot_word;
wire                   d1_on, d2_on, d3_on;
wire                   cd_d0_p, cd_d0_n;
wire [3:0]             d_sot_det, d_sote_det, sot_det_c;
wire [RX_GEAR-1:0]     bd0, bd1, bd2, bd3;
wire [15:0]            bd0_mixel, bd1_mixel, bd2_mixel, bd3_mixel;
wire [RX_GEAR-1:0]     bd0_lattice, bd1_lattice, bd2_lattice, bd3_lattice;
wire [RX_GEAR-1:0]     bd0_r, bd1_r, bd2_r, bd3_r;
wire [RX_GEAR-1:0]     bd0_walign, bd1_walign, bd2_walign, bd3_walign;
wire [RX_GEAR-1:0]     bd0_align, bd1_align, bd2_align, bd3_align;
wire                   hs_sync_walign_w;
wire                   hs_sync_lane0_w, hs_sync_lane1_w, hs_sync_lane2_w, hs_sync_lane3_w;


wire lp_d0_rx_p;
reg  lp_d0_rx_p_r, lp_d0_rx_p_r1, lp_d0_rx_p_r2;

wire lp_d0_rx_n;
reg  lp_d0_rx_n_r, lp_d0_rx_n_r1, lp_d0_rx_n_r2;

always @(posedge clk_byte_fr_i or negedge reset_n_i)
    begin
        if (~reset_n_i) begin 
			lp_d0_rx_p_r <= 0;
			lp_d0_rx_p_r1 <= 0;
			lp_d0_rx_p_r2 <= 0;			
			lp_d0_rx_n_r <= 0;
			lp_d0_rx_n_r1 <= 0;
			lp_d0_rx_n_r2 <= 0;
		end
		else begin
			lp_d0_rx_p_r <= lp_d0_rx_p;
			lp_d0_rx_p_r1 <= lp_d0_rx_p_r;	
			lp_d0_rx_p_r2 <= lp_d0_rx_p_r1;
			lp_d0_rx_n_r <= lp_d0_rx_n;
			lp_d0_rx_n_r1 <= lp_d0_rx_n_r;
			lp_d0_rx_n_r2 <= lp_d0_rx_n_r1;			
		end
	end
	
assign lp_d0_rx_p_o = lp_d0_rx_p_r & lp_d0_rx_p_r1 & lp_d0_rx_p_r2;
assign lp_d0_rx_n_o = lp_d0_rx_n_r & lp_d0_rx_n_r1 & lp_d0_rx_n_r2;

wire lp_d1_rx_p;
reg  lp_d1_rx_p_r, lp_d1_rx_p_r1, lp_d1_rx_p_r2;

wire lp_d1_rx_n;
reg  lp_d1_rx_n_r, lp_d1_rx_n_r1, lp_d1_rx_n_r2;

always @(posedge clk_byte_fr_i or negedge reset_n_i)
    begin
        if (~reset_n_i) begin 
			lp_d1_rx_p_r <= 0;
			lp_d1_rx_p_r1 <= 0;
			lp_d1_rx_p_r2 <= 0;
			lp_d1_rx_n_r <= 0;
			lp_d1_rx_n_r1 <= 0;
			lp_d1_rx_n_r2 <= 0;
		end
		else begin
			lp_d1_rx_p_r  <= lp_d1_rx_p;
			lp_d1_rx_p_r1 <= lp_d1_rx_p_r;	
			lp_d1_rx_p_r2 <= lp_d1_rx_p_r1;	
			lp_d1_rx_n_r  <= lp_d1_rx_n;
			lp_d1_rx_n_r1 <= lp_d1_rx_n_r;
			lp_d1_rx_n_r2 <= lp_d1_rx_n_r1;			
		end
	end
	
assign lp_d1_rx_p_o = lp_d1_rx_p_r & lp_d1_rx_p_r1 & lp_d1_rx_p_r2;
assign lp_d1_rx_n_o = lp_d1_rx_n_r & lp_d1_rx_n_r1 & lp_d1_rx_n_r2;

wire lp_d2_rx_p;
reg  lp_d2_rx_p_r, lp_d2_rx_p_r1, lp_d2_rx_p_r2;

wire lp_d2_rx_n;
reg  lp_d2_rx_n_r, lp_d2_rx_n_r1, lp_d2_rx_n_r2;

always @(posedge clk_byte_fr_i or negedge reset_n_i)
    begin
        if (~reset_n_i) begin 
			lp_d2_rx_p_r <= 0;
			lp_d2_rx_p_r1 <= 0;
			lp_d2_rx_p_r2 <= 0;
			lp_d2_rx_n_r <= 0;
			lp_d2_rx_n_r1 <= 0;
			lp_d2_rx_n_r2 <= 0;
		end
		else begin
			lp_d2_rx_p_r  <= lp_d2_rx_p;
			lp_d2_rx_p_r1 <= lp_d2_rx_p_r;	
			lp_d2_rx_p_r2 <= lp_d2_rx_p_r1;
			lp_d2_rx_n_r  <= lp_d2_rx_n;
			lp_d2_rx_n_r1 <= lp_d2_rx_n_r;	
			lp_d2_rx_n_r2 <= lp_d2_rx_n_r1;	
		end
	end
	
assign lp_d2_rx_p_o = lp_d2_rx_p_r & lp_d2_rx_p_r1 & lp_d2_rx_p_r2;
assign lp_d2_rx_n_o = lp_d2_rx_n_r & lp_d2_rx_n_r1 & lp_d2_rx_n_r2;

wire lp_d3_rx_p;
reg  lp_d3_rx_p_r, lp_d3_rx_p_r1, lp_d3_rx_p_r2;

wire lp_d3_rx_n;
reg  lp_d3_rx_n_r, lp_d3_rx_n_r1, lp_d3_rx_n_r2;

always @(posedge clk_byte_fr_i or negedge reset_n_i)
    begin
        if (~reset_n_i) begin 
			lp_d3_rx_p_r <= 0;
			lp_d3_rx_p_r1 <= 0;
			lp_d3_rx_p_r2 <= 0;
			lp_d3_rx_n_r <= 0;
			lp_d3_rx_n_r1 <= 0;
			lp_d3_rx_n_r2 <= 0;
		end
		else begin
			lp_d3_rx_p_r  <= lp_d3_rx_p;
			lp_d3_rx_p_r1 <= lp_d3_rx_p_r;	
			lp_d3_rx_p_r2 <= lp_d3_rx_p_r1;
			lp_d3_rx_n_r  <= lp_d3_rx_n;
			lp_d3_rx_n_r1 <= lp_d3_rx_n_r;	
			lp_d3_rx_n_r2 <= lp_d3_rx_n_r1;
		end
	end
	
assign lp_d3_rx_p_o = lp_d3_rx_p_r & lp_d3_rx_p_r1 & lp_d3_rx_p_r2;
assign lp_d3_rx_n_o = lp_d3_rx_n_r & lp_d3_rx_n_r1 & lp_d3_rx_n_r2;




// Ignore incoming data for HS-SETTLE period (for hard DPHY)
localparam  BYTECLK_PS   = 1000000/BYTECLK_MHZ;
localparam  UI6          = 6*(BYTECLK_PS/RX_GEAR);
localparam  SETTLE_CYC   = (85000+UI6)/BYTECLK_PS < 2 ? 2 : ((85000+UI6)/BYTECLK_PS);

// HS-SETTLE timer for hard DPHY
// HS-SETTLE timer for soft DPHY is in word aligner
generate
  if (DPHY_RX_IP == "MIXEL") begin
    always @(posedge clk_byte_fr_i or negedge reset_n_i)
    begin
        if (~reset_n_i) 
        begin
            hs_en0_settle <= 0;
        end
        else if (settle_cnt_lane0 == 0) 
        begin
            hs_en0_settle <= hs_d0_en_i;
        end
    end
    
    always @(posedge clk_byte_fr_i or negedge reset_n_i) 
    begin
        if (~reset_n_i)
        begin
            settle_cnt_lane0 <= SETTLE_CYC;
        end
        // reset settle_cnt when hs transmission is over
        else if (!hs_d0_en_i) 
        begin
            settle_cnt_lane0 <= SETTLE_CYC;
        end
        else if (settle_cnt_lane0 == 0)
        begin
            settle_cnt_lane0 <= 0;
        end
        else if (hs_d0_en_i) 
        begin
            settle_cnt_lane0 <= settle_cnt_lane0 - 1;
        end
    end
    
    if (NUM_RX_LANE > 1) begin
        always @(posedge clk_byte_fr_i or negedge reset_n_i)
        begin
            if (~reset_n_i)
            begin
                hs_en1_settle <= 0;
            end
            else if (settle_cnt_lane1 == 0)
            begin
                hs_en1_settle <= hs_d1_en_i;
            end
        end
        
        always @(posedge clk_byte_fr_i or negedge reset_n_i)
        begin
            if (~reset_n_i)
            begin
                settle_cnt_lane1 <= SETTLE_CYC;
            end
            // reset settle_cnt when hs transmission is over
            else if (!hs_d1_en_i)
            begin
                settle_cnt_lane1 <= SETTLE_CYC;
            end
            else if (settle_cnt_lane1 == 0)
            begin
                settle_cnt_lane1 <= 0;
            end
            else if (hs_d1_en_i)
            begin
                settle_cnt_lane1 <= settle_cnt_lane1 - 1;
            end
        end
    end
    if (NUM_RX_LANE > 2) begin
        always @(posedge clk_byte_fr_i or negedge reset_n_i)
        begin
            if (~reset_n_i)
            begin
                hs_en2_settle <= 0;
            end
            else if (settle_cnt_lane2 == 0)
            begin
                hs_en2_settle <= hs_d2_en_i;
            end
        end

        always @(posedge clk_byte_fr_i or negedge reset_n_i)
        begin
            if (~reset_n_i)
            begin
                settle_cnt_lane2 <= SETTLE_CYC;
            end
            // reset settle_cnt when hs transmission is over
            else if (!hs_d2_en_i)
            begin
                settle_cnt_lane2 <= SETTLE_CYC;
            end
            else if (settle_cnt_lane2 == 0)
            begin
                settle_cnt_lane2 <= 0;
            end
            else if (hs_d2_en_i)
            begin
                settle_cnt_lane2 <= settle_cnt_lane2 - 1;
            end
        end
    end
    if (NUM_RX_LANE > 3) begin
        always @(posedge clk_byte_fr_i or negedge reset_n_i)
        begin
            if (~reset_n_i)
            begin
                hs_en3_settle <= 0;
            end
            else if (settle_cnt_lane3 == 0)
            begin
                hs_en3_settle <= hs_d3_en_i;
            end
        end

        always @(posedge clk_byte_fr_i or negedge reset_n_i)
        begin
            if (~reset_n_i)
            begin
                settle_cnt_lane3 <= SETTLE_CYC;
            end
            // reset settle_cnt when hs transmission is over
            else if (!hs_d3_en_i)
            begin
                settle_cnt_lane3 <= SETTLE_CYC;
            end
            else if (settle_cnt_lane3 == 0)
            begin
                settle_cnt_lane3 <= 0;
            end
            else if (hs_d3_en_i)
            begin
                settle_cnt_lane3 <= settle_cnt_lane3 - 1;
            end
        end
    end
  end
endgenerate

generate
    // continuous byte clock
    if (DPHY_RX_IP == "MIXEL") begin
        assign clk_hs_o = clk_hs;
    end
    else if (DPHY_RX_IP == "LATTICE") begin
        assign clk_hs_o = clk_byte_o;
    end

    // enable write to multicycle registers for transferring data to free-running byte clock
    if (DPHY_RX_IP == "MIXEL") begin
        // SoT detection (for Mixel DPHY only)
        // asserts with either correct SoT or SoT with single-bit error
        assign sot_det_c = d_sot_det | d_sote_det;

        // hs_sync_c will enable write to multicycle registers
        if (NUM_RX_LANE == 1) 
            assign hs_sync_c = sot_det_c[0];
        else if (NUM_RX_LANE == 2)
            assign hs_sync_c = &sot_det_c[1:0];
        else if (NUM_RX_LANE == 3)
            assign hs_sync_c = &sot_det_c[2:0];
        else if (NUM_RX_LANE == 4)
            assign hs_sync_c = &sot_det_c[3:0];

        assign bd_sel_en = hs_sync_c | hs_sync_latch;
        if (NUM_RX_LANE < 1)
            assign bd1_sel_en = hs_sync1_c | hs_sync1_latch;
        else if (NUM_RX_LANE < 2)
            assign bd2_sel_en = hs_sync2_c | hs_sync2_latch;
        else if (NUM_RX_LANE < 3)
            assign bd3_sel_en = hs_sync3_c | hs_sync3_latch;

    end
    else if (DPHY_RX_IP == "LATTICE") begin
        always @(posedge clk_byte_o or negedge reset_byte_n_i) begin
            if (~reset_byte_n_i) begin
                hs_d0_en_r <= 0;
                hs_d0_en1_r <= 0;
            end
            else begin
                hs_d0_en_r <= hs_d0_en_i;
                hs_d0_en1_r <= hs_d0_en_r;
            end
        end
//        if (RX_CLK_MODE=="HS_LP" && RX_GEAR==16) 
            assign hs_sync_c = hs_d0_en_i | hs_d0_en1_r | (|bd0_lattice);
//        else
//            assign hs_sync_c = hs_d0_en_i | hs_d0_en_r;
        assign bd_sel_en = hs_sync_latch;

        if (NUM_RX_LANE > 1) begin
            always @(posedge clk_byte_o or negedge reset_byte_n_i) begin
                if (~reset_byte_n_i) begin
                    hs_d1_en_r  <= 0;
                    hs_d1_en1_r <= 0;
                end
                else begin
                    hs_d1_en_r  <= hs_d1_en_i;
                    hs_d1_en1_r <= hs_d1_en_r;
                end
            end
//            if (RX_CLK_MODE=="HS_LP" && RX_GEAR==16) 
                assign hs_sync1_c = hs_d1_en_i | hs_d1_en1_r | (|bd1_lattice);
//            else
//                assign hs_sync1_c = hs_d1_en_i | hs_d1_en_r;
            assign bd1_sel_en = hs_sync1_latch;
        end
        if (NUM_RX_LANE > 2) begin
            always @(posedge clk_byte_o or negedge reset_byte_n_i) begin
                if (~reset_byte_n_i) begin
                    hs_d2_en_r  <= 0;
                    hs_d2_en1_r <= 0;
                end
                else begin
                    hs_d2_en_r  <= hs_d2_en_i;
                    hs_d2_en1_r <= hs_d2_en_r;
                end
            end
//            if (RX_CLK_MODE=="HS_LP" && RX_GEAR==16) 
                assign hs_sync2_c = hs_d2_en_i | hs_d2_en1_r | (|bd2_lattice);
//            else
//                assign hs_sync2_c = hs_d2_en_i | hs_d2_en_r;
            assign bd2_sel_en = hs_sync2_latch;
        end
        if (NUM_RX_LANE > 3) begin
            always @(posedge clk_byte_o or negedge reset_byte_n_i) begin
                if (~reset_byte_n_i) begin
                    hs_d3_en_r  <= 0;
                    hs_d3_en1_r <= 0;
                end
                else begin
                    hs_d3_en_r  <= hs_d3_en_i;
                    hs_d3_en1_r <= hs_d3_en_r;
                end
            end
//            if (RX_CLK_MODE=="HS_LP" && RX_GEAR==16) 
                assign hs_sync3_c = hs_d3_en_i | hs_d3_en1_r | (|bd3_lattice);
//            else
//                assign hs_sync3_c = hs_d3_en_i | hs_d3_en_r;
            assign bd3_sel_en = hs_sync3_latch;
        end
    end

    // write data
    if (DPHY_RX_IP == "MIXEL") begin
        assign bd0_r = bd0_mixel[RX_GEAR-1:0];
        if (NUM_RX_LANE > 1)
          assign bd1_r = bd1_mixel[RX_GEAR-1:0];
        if (NUM_RX_LANE > 2)
          assign bd2_r = bd2_mixel[RX_GEAR-1:0];
        if (NUM_RX_LANE > 3)
          assign bd3_r = bd3_mixel[RX_GEAR-1:0];
    end
    else if (DPHY_RX_IP == "LATTICE") begin
        assign bd0_r = bd0_lattice;
        if (NUM_RX_LANE > 1)
          assign bd1_r = bd1_lattice;
        if (NUM_RX_LANE > 2)
          assign bd2_r = bd2_lattice;
        if (NUM_RX_LANE > 3)
          assign bd3_r = bd3_lattice;
    end

    // Data enable output
    if (DPHY_RX_IP == "MIXEL") begin
        assign hs_sync_o = hs_sync_d1_r | hs_sync_d2_r;
    end
    else if (DPHY_RX_IP == "LATTICE") begin
        assign hs_sync_o = hs_sync_align;
    end

    // Byte Data output
    if (DPHY_RX_IP == "MIXEL") begin
        assign bd0_o = bd0_align_r;
        if (NUM_RX_LANE > 1)
            assign bd1_o = bd1_align_r;
        if (NUM_RX_LANE > 2)
            assign bd2_o = bd2_align_r;
        if (NUM_RX_LANE > 3)
            assign bd3_o = bd3_align_r;
    end
    else if (DPHY_RX_IP == "LATTICE") begin
        assign bd0_o = bd0_align;
        if (NUM_RX_LANE > 1)
            assign bd1_o = bd1_align;
        if (NUM_RX_LANE > 2)
            assign bd2_o = bd2_align;
        if (NUM_RX_LANE > 3)
            assign bd3_o = bd3_align;
    end

    // for Mixel only
    if (DPHY_RX_IP == "MIXEL")
    begin
        // Contention detection
        assign cd_d0_o = cd_d0_p | cd_d0_n;

        // Data lane enable
        if (NUM_RX_LANE == 1)
	    begin
            assign d1_on = 0; assign d2_on = 0; assign d3_on = 0;
        end
        else if (NUM_RX_LANE == 2)
	    begin
            assign d1_on = 1; assign d2_on = 0; assign d3_on = 0;
        end
        else if (NUM_RX_LANE == 3)
	    begin
            assign d1_on = 1; assign d2_on = 1; assign d3_on = 0;
        end
        else if (NUM_RX_LANE == 4)
	    begin
            assign d1_on = 1; assign d2_on = 1; assign d3_on = 1;
        end

        // Insert SOT
        if (RX_GEAR == 16)
            assign sot_word = 16'hB800;
        else
            assign sot_word = 8'hB8;

        always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)  
        begin
            if (~reset_byte_fr_n_i) begin
                bd0_align_r <= 0;
            end
            else if (hs_sync_sync & ~hs_sync_d1_r) begin
                bd0_align_r <= sot_word;
            end
            else if (hs_sync_d1_r) begin
                bd0_align_r <= bd0_fr_r;
            end
            else begin
                bd0_align_r <= 0;
            end
        end
        if (NUM_RX_LANE > 1)
        begin
          always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)  
          begin
              if (~reset_byte_fr_n_i) begin
                  bd1_align_r <= 0;
              end
              else if (hs_sync_sync & ~hs_sync_d1_r) begin
                  bd1_align_r <= sot_word;
              end
              else if (hs_sync_d1_r) begin
                  bd1_align_r <= bd1_fr_r;
              end
              else begin
                  bd1_align_r <= 0;
              end
          end
        end
        if (NUM_RX_LANE > 2)
        begin
          always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)  
          begin
              if (~reset_byte_fr_n_i) begin
                  bd2_align_r <= 0;
              end
              else if (hs_sync_sync & ~hs_sync_d1_r) begin
                  bd2_align_r <= sot_word;
              end
              else if (hs_sync_d1_r) begin
                  bd2_align_r <= bd2_fr_r;
              end
              else begin
                  bd2_align_r <= 0;
              end
          end
        end
        if (NUM_RX_LANE > 3)
        begin
          always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)  
          begin
              if (~reset_byte_fr_n_i) begin
                  bd3_align_r <= 0;
              end
              else if (hs_sync_sync & ~hs_sync_d1_r) begin
                  bd3_align_r <= sot_word;
              end
              else if (hs_sync_d1_r) begin
                  bd3_align_r <= bd3_fr_r;
              end
              else begin
                  bd3_align_r <= 0;
              end
          end
        end
    end
endgenerate

// Asynchronous reset by hs_sync_c and hs_sync_sync to reset bd_sel_r even if clk_byte_o is already off
assign reset_by_hs_sync_sync_n  = reset_byte_n_i & (hs_sync_d2_r|hs_sync_c);
assign reset_by_hs_sync1_sync_n = reset_byte_n_i & (hs_sync1_d2_r|hs_sync1_c);
assign reset_by_hs_sync2_sync_n = reset_byte_n_i & (hs_sync2_d2_r|hs_sync2_c);
assign reset_by_hs_sync3_sync_n = reset_byte_n_i & (hs_sync3_d2_r|hs_sync3_c);

// Data transfer from non-continuous to free-running byte clock
// Synchronize to free-running byte clock
always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)
begin
    if (~reset_byte_fr_n_i) begin
        hs_sync_meta  <= 0;
        hs_sync_sync  <= 0;
        hs_sync_d1_r  <= 0;
        hs_sync_d2_r  <= 0;
    end
    else begin
        hs_sync_meta  <= hs_sync_c;
        hs_sync_sync  <= hs_sync_meta;
        hs_sync_d1_r  <= hs_sync_sync;
        hs_sync_d2_r  <= hs_sync_d1_r;
    end
end 

// Selector for writing to multicycle registers in non-continuous byte clock domain
always @(posedge clk_byte_o or negedge reset_by_hs_sync_sync_n)  
begin
    if (~reset_by_hs_sync_sync_n) begin
        bd_sel_r <= 0;
    end
    else if (bd_sel_r == 2'b10) begin
        bd_sel_r <= 0;
    end
    else if (bd_sel_en) begin
        bd_sel_r <= bd_sel_r + 1;
    end
    else begin
        bd_sel_r <= 0;
    end
end

always @(posedge clk_byte_o or negedge reset_by_hs_sync_sync_n)  
begin
    if (~reset_by_hs_sync_sync_n) begin
        hs_sync_latch <= 0;
    end
    else if (hs_sync_c) begin
        hs_sync_latch <= 1;
    end
end

// Selector for reading from multicycle registers in free-running byte clock domain
always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)  
begin
    if (~reset_byte_fr_n_i) begin
        bd_fr_sel_r <= 0;
    end
    else if (bd_fr_sel_r == 2'b10) begin
        bd_fr_sel_r <= 0;
    end
    else if (hs_sync_sync | hs_sync_d1_r) begin
        bd_fr_sel_r <= bd_fr_sel_r + 1;
    end
    else begin
        bd_fr_sel_r <= 0;
    end
end
generate 
    if (DPHY_RX_IP=="MIXEL") begin
        if (NUM_RX_LANE > 1) begin
            assign bd1_sel         = bd_sel_r;
            assign bd1_fr_sel      = bd_fr_sel_r;
            assign hs_sync1_sync_w = hs_sync_sync | hs_sync_d1_r;
        end
        if (NUM_RX_LANE > 2) begin
            assign bd2_sel         = bd_sel_r;
            assign bd2_fr_sel      = bd_fr_sel_r;
            assign hs_sync2_sync_w = hs_sync_sync | hs_sync_d1_r;
        end
        if (NUM_RX_LANE > 3) begin
            assign bd3_sel         = bd_sel_r;
            assign bd3_fr_sel      = bd_fr_sel_r;
            assign hs_sync3_sync_w = hs_sync_sync | hs_sync_d1_r;
        end
    end
    else if (DPHY_RX_IP=="LATTICE") begin
        if (NUM_RX_LANE > 1) begin
            assign bd1_sel         = bd1_sel_r;
            assign bd1_fr_sel      = bd1_fr_sel_r;
            assign hs_sync1_sync_w = hs_sync1_sync | hs_sync1_d1_r;
            always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)
            begin
                if (~reset_byte_fr_n_i) begin
                    hs_sync1_meta  <= 0;
                    hs_sync1_sync  <= 0;
                    hs_sync1_d1_r  <= 0;
                    hs_sync1_d2_r  <= 0;
                end
                else begin
                    hs_sync1_meta  <= hs_sync1_c;
                    hs_sync1_sync  <= hs_sync1_meta;
                    hs_sync1_d1_r  <= hs_sync1_sync;
                    hs_sync1_d2_r  <= hs_sync1_d1_r;
                end
            end 
            always @(posedge clk_byte_o or negedge reset_by_hs_sync1_sync_n)  
            begin
                if (~reset_by_hs_sync1_sync_n) begin
                    bd1_sel_r <= 0;
                end
                else if (bd1_sel_r == 2'b10) begin
                    bd1_sel_r <= 0;
                end
                else if (bd1_sel_en) begin
                    bd1_sel_r <= bd1_sel_r + 1;
                end
                else begin
                    bd1_sel_r <= 0;
                end
            end
            always @(posedge clk_byte_o or negedge reset_by_hs_sync_sync_n)  
            begin
                if (~reset_by_hs_sync_sync_n) begin
                    hs_sync1_latch <= 0;
                end
                else if (hs_sync1_c) begin
                    hs_sync1_latch <= 1;
                end
            end
            always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)  
            begin
                if (~reset_byte_fr_n_i) begin
                    bd1_fr_sel_r <= 0;
                end
                else if (bd1_fr_sel_r == 2'b10) begin
                    bd1_fr_sel_r <= 0;
                end
                else if (hs_sync1_sync_w) begin
                    bd1_fr_sel_r <= bd1_fr_sel_r + 1;
                end
                else begin
                    bd1_fr_sel_r <= 0;
                end
            end
        end
        if (NUM_RX_LANE > 2) begin
            assign bd2_sel         = bd2_sel_r;
            assign bd2_fr_sel      = bd2_fr_sel_r;
            assign hs_sync2_sync_w = hs_sync2_sync | hs_sync2_d1_r;
            always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)
            begin
                if (~reset_byte_fr_n_i) begin
                    hs_sync2_meta  <= 0;
                    hs_sync2_sync  <= 0;
                    hs_sync2_d1_r  <= 0;
                    hs_sync2_d2_r  <= 0;
                end
                else begin
                    hs_sync2_meta  <= hs_sync2_c;
                    hs_sync2_sync  <= hs_sync2_meta;
                    hs_sync2_d1_r  <= hs_sync2_sync;
                    hs_sync2_d2_r  <= hs_sync2_d1_r;
                end
            end 
            always @(posedge clk_byte_o or negedge reset_by_hs_sync2_sync_n)  
            begin
                if (~reset_by_hs_sync2_sync_n) begin
                    bd2_sel_r <= 0;
                end
                else if (bd2_sel_r == 2'b10) begin
                    bd2_sel_r <= 0;
                end
                else if (bd2_sel_en) begin
                    bd2_sel_r <= bd2_sel_r + 1;
                end
                else begin
                    bd2_sel_r <= 0;
                end
            end
            always @(posedge clk_byte_o or negedge reset_by_hs_sync_sync_n)  
            begin
                if (~reset_by_hs_sync_sync_n) begin
                    hs_sync2_latch <= 0;
                end
                else if (hs_sync2_c) begin
                    hs_sync2_latch <= 1;
                end
            end
            always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)  
            begin
                if (~reset_byte_fr_n_i) begin
                    bd2_fr_sel_r <= 0;
                end
                else if (bd2_fr_sel_r == 2'b10) begin
                    bd2_fr_sel_r <= 0;
                end
                else if (hs_sync2_sync_w) begin
                    bd2_fr_sel_r <= bd2_fr_sel_r + 1;
                end
                else begin
                    bd2_fr_sel_r <= 0;
                end
            end
        end
        if (NUM_RX_LANE > 3) begin
            assign bd3_sel         = bd3_sel_r;
            assign bd3_fr_sel      = bd3_fr_sel_r;
            assign hs_sync3_sync_w = hs_sync3_sync | hs_sync3_d1_r;
            always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)
            begin
                if (~reset_byte_fr_n_i) begin
                    hs_sync3_meta  <= 0;
                    hs_sync3_sync  <= 0;
                    hs_sync3_d1_r  <= 0;
                    hs_sync3_d2_r  <= 0;
                end
                else begin
                    hs_sync3_meta  <= hs_sync3_c;
                    hs_sync3_sync  <= hs_sync3_meta;
                    hs_sync3_d1_r  <= hs_sync3_sync;
                    hs_sync3_d2_r  <= hs_sync3_d1_r;
                end
            end 
            always @(posedge clk_byte_o or negedge reset_by_hs_sync3_sync_n)  
            begin
                if (~reset_by_hs_sync3_sync_n) begin
                    bd3_sel_r <= 0;
                end
                else if (bd3_sel_r == 2'b10) begin
                    bd3_sel_r <= 0;
                end
                else if (bd3_sel_en) begin
                    bd3_sel_r <= bd3_sel_r + 1;
                end
                else begin
                    bd3_sel_r <= 0;
                end
            end
            always @(posedge clk_byte_o or negedge reset_by_hs_sync_sync_n)  
            begin
                if (~reset_by_hs_sync_sync_n) begin
                    hs_sync3_latch <= 0;
                end
                else if (hs_sync3_c) begin
                    hs_sync3_latch <= 1;
                end
            end
            always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)  
            begin
                if (~reset_byte_fr_n_i) begin
                    bd3_fr_sel_r <= 0;
                end
                else if (bd3_fr_sel_r == 2'b10) begin
                    bd3_fr_sel_r <= 0;
                end
                else if (hs_sync3_sync_w) begin
                    bd3_fr_sel_r <= bd3_fr_sel_r + 1;
                end
                else begin
                    bd3_fr_sel_r <= 0;
                end
            end
        end
    end
endgenerate

// Multicycle data registers for CDC to free-running byte clock

//  ==Data Lane 0==
always @(posedge clk_byte_o or negedge reset_byte_n_i)  
begin
    if (~reset_byte_n_i) begin
        bd0_reg1_r <= 0;
        bd0_reg2_r <= 0;
        bd0_reg3_r <= 0;
    end
    else begin
        case (bd_sel_r) 
            2'b00:   bd0_reg1_r <= bd0_r;
            2'b01:   bd0_reg2_r <= bd0_r;
            2'b10:   bd0_reg3_r <= bd0_r;
            default: bd0_reg1_r <= bd0_r;
        endcase
    end
end
always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)
begin
    if (~reset_byte_fr_n_i) begin
        bd0_fr_r <= 0;
    end
    else if (hs_sync_sync | hs_sync_d1_r) begin
        case (bd_fr_sel_r) 
            2'b00:   bd0_fr_r <= bd0_reg1_r;
            2'b01:   bd0_fr_r <= bd0_reg2_r;
            2'b10:   bd0_fr_r <= bd0_reg3_r;
            default: bd0_fr_r <= bd0_reg1_r;
        endcase
    end
end 
//  ==Data Lane 1==
generate
  if (NUM_RX_LANE > 1)
  begin
    always @(posedge clk_byte_o or negedge reset_byte_n_i)  
    begin
        if (~reset_byte_n_i) begin
            bd1_reg1_r <= 0;
            bd1_reg2_r <= 0;
            bd1_reg3_r <= 0;
        end
        else begin
            case (bd1_sel) 
                2'b00:   bd1_reg1_r <= bd1_r;
                2'b01:   bd1_reg2_r <= bd1_r;
                2'b10:   bd1_reg3_r <= bd1_r;
                default: bd1_reg1_r <= bd1_r;
            endcase
        end
    end
    always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)
    begin
        if (~reset_byte_fr_n_i) begin
            bd1_fr_r <= 0;
        end
        else if (hs_sync1_sync_w) begin
            case (bd1_fr_sel) 
                2'b00:   bd1_fr_r <= bd1_reg1_r;
                2'b01:   bd1_fr_r <= bd1_reg2_r;
                2'b10:   bd1_fr_r <= bd1_reg3_r;
                default: bd1_fr_r <= bd1_reg1_r;
            endcase
        end
    end 
  end
//  ==Data Lane 2==
  if (NUM_RX_LANE > 2)
  begin
    always @(posedge clk_byte_o or negedge reset_byte_n_i)  
    begin
        if (~reset_byte_n_i) begin
            bd2_reg1_r <= 0;
            bd2_reg2_r <= 0;
            bd2_reg3_r <= 0;
        end
        else begin
            case (bd2_sel) 
                2'b00:   bd2_reg1_r <= bd2_r;
                2'b01:   bd2_reg2_r <= bd2_r;
                2'b10:   bd2_reg3_r <= bd2_r;
                default: bd2_reg1_r <= bd2_r;
            endcase
        end
    end
    always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)
    begin
        if (~reset_byte_fr_n_i) begin
            bd2_fr_r <= 0;
        end
        else if (hs_sync2_sync_w) begin
            case (bd2_fr_sel) 
                2'b00:   bd2_fr_r <= bd2_reg1_r;
                2'b01:   bd2_fr_r <= bd2_reg2_r;
                2'b10:   bd2_fr_r <= bd2_reg3_r;
                default: bd2_fr_r <= bd2_reg1_r;
            endcase
        end
    end 
  end
//  ==Data Lane 3==
  if (NUM_RX_LANE > 3)
  begin
    always @(posedge clk_byte_o or negedge reset_byte_n_i)  
    begin
        if (~reset_byte_n_i) begin
            bd3_reg1_r <= 0;
            bd3_reg2_r <= 0;
            bd3_reg3_r <= 0;
        end
        else begin
            case (bd3_sel) 
                2'b00:   bd3_reg1_r <= bd3_r;
                2'b01:   bd3_reg2_r <= bd3_r;
                2'b10:   bd3_reg3_r <= bd3_r;
                default: bd3_reg1_r <= bd3_r;
            endcase
        end
    end
    always @(posedge clk_byte_fr_i or negedge reset_byte_fr_n_i)
    begin
        if (~reset_byte_fr_n_i) begin
            bd3_fr_r <= 0;
        end
        else if (hs_sync3_sync_w) begin
            case (bd3_fr_sel) 
                2'b00:   bd3_fr_r <= bd3_reg1_r;
                2'b01:   bd3_fr_r <= bd3_reg2_r;
                2'b10:   bd3_fr_r <= bd3_reg3_r;
                default: bd3_fr_r <= bd3_reg1_r;
            endcase
        end
    end
  end 
endgenerate

generate
    if (DPHY_RX_IP == "MIXEL")
    begin : mixel
        MIPIDPHYA #(
            .HSEL          (RX_GEAR/8-1),  // 1 for Gear16, 0 for Gear8
            .HS_16BIT_EN   (RX_GEAR/8-1),  // 1 for Gear16, 0 for Gear8
            .CN            (5'd0),
            .CM            (8'd0),
            .CO            (2'd0),
            .PLL_TST       (4'd9),
            .ENP_DESER     (1'd0)
        )
        mixel_dphy (
// CLOCK Interface pins
            .CKP           (clk_p_i),
            .CKN           (clk_n_i),
            .CLKHSBYTE     (clk_hs),        // continuous clock for HS mode 
            .CLKRXHSEN     (term_clk_en_i),
            .CLKRXLPEN     (~term_clk_en_i),
            .CLKDRXLPP     (lp_clk_rx_p_o),
            .CLKDRXLPN     (lp_clk_rx_n_o),
            .CLKCDEN       (1'b1),
            .CLKDCDN       (cd_clk_o),
            .CLKTXLPEN     (1'b0),
            .CLKDTXLPP     (1'b0),
            .CLKDTXLPN     (1'b0),
            .CLKTXHSEN     (1'b0),
            .CLKTXHSGATE   (1'b0),
            .CLKTXHSPD     (1'b1),
            .CLKDRXHS      (),
            .HSBYTECLKD    (clk_byte_o),    // Byteclk output from Lane0 deserializer
            .HSBYTECLKS    (),

// Common Interface Pins
            .LBEN          (1'b0),        //  
            .PDDPHY        (~reset_n_i),  // Power Down
            .PDBIAS        (1'b0),  // 
            .PDCKG         (1'b0),  // instead of term_d*_en_i?

// PLL Interface pins	// only for Tx
            .CLKREF        (1'b0),
            .LOCK          (),
            .PDPLL         (1'b1),

// DATA0 Interface pins
            .DP0           (d0_p_io),
            .DN0           (d0_n_io),
            .D0RXLPEN      (~lp_d0_tx_en_i),
            .D0DRXLPP      (lp_d0_rx_p),
            .D0DRXLPN      (lp_d0_rx_n),
            .D0CDEN        (1'b1),        // LP Contention Detection Enable
            .D0DCDP        (cd_d0_p),     // LP Contention Detection Output - P
            .D0DCDN        (cd_d0_n),     // LP Contention Detection Output - N
            .D0TXLPEN      (lp_d0_tx_en_i),
            .D0DTXLPP      (lp_d0_tx_p_i), 
            .D0DTXLPN      (lp_d0_tx_n_i),
            .D0RXHSEN      (term_d0_en_i),
            .D0HSRXDATA15  (bd0_mixel[15]),
            .D0HSRXDATA14  (bd0_mixel[14]),
            .D0HSRXDATA13  (bd0_mixel[13]),
            .D0HSRXDATA12  (bd0_mixel[12]),
            .D0HSRXDATA11  (bd0_mixel[11]),
            .D0HSRXDATA10  (bd0_mixel[10]),
            .D0HSRXDATA9   (bd0_mixel[9]),
            .D0HSRXDATA8   (bd0_mixel[8]),
            .D0HSRXDATA7   (bd0_mixel[7]),
            .D0HSRXDATA6   (bd0_mixel[6]),
            .D0HSRXDATA5   (bd0_mixel[5]),
            .D0HSRXDATA4   (bd0_mixel[4]),
            .D0HSRXDATA3   (bd0_mixel[3]),
            .D0HSRXDATA2   (bd0_mixel[2]),
            .D0HSRXDATA1   (bd0_mixel[1]),
            .D0HSRXDATA0   (bd0_mixel[0]),
            .D0SYNC        (d_sot_det[0]),  // SoT Detection Indicator	
            .D0ERRSYNC     (d_sote_det[0]), // SoT Detection with a Single Bit Error
            .D0NOSYNC      (),              // SoT Detection Corruption Indicator
            .D0HSDESEREN   (hs_en0_settle),
            .D0TXHSEN      (1'b0),
            .D0HSTXDATA15  (1'b0),
            .D0HSTXDATA14  (1'b0),
            .D0HSTXDATA13  (1'b0),
            .D0HSTXDATA12  (1'b0),
            .D0HSTXDATA11  (1'b0),
            .D0HSTXDATA10  (1'b0),
            .D0HSTXDATA9   (1'b0),
            .D0HSTXDATA8   (1'b0),
            .D0HSTXDATA7   (1'b0),
            .D0HSTXDATA6   (1'b0),
            .D0HSTXDATA5   (1'b0),
            .D0HSTXDATA4   (1'b0),
            .D0HSTXDATA3   (1'b0),
            .D0HSTXDATA2   (1'b0),
            .D0HSTXDATA1   (1'b0),
            .D0HSTXDATA0   (1'b0),
            .D0HSSEREN     (1'b0),
            .D0TXHSPD      (1'b1),  // High Speed Tx Power Down
            .D0DRXHS       (),

// DATA1 Interface pins
            .DP1           (d1_p_i),
            .DN1           (d1_n_i),
            .D1RXLPEN      (1'b0),
            .D1DRXLPP      (lp_d1_rx_p),
            .D1DRXLPN      (lp_d1_rx_n),
            .D1CDEN        (1'b0),    // LP Contention Detection Enable
            .D1DCDP        (),        // LP Contention Detection Output - P
            .D1DCDN        (),        // LP Contention Detection Output - N
            .D1TXLPEN      (1'b0),
            .D1DTXLPP      (1'b0), 
            .D1DTXLPN      (1'b0),
            .D1RXHSEN      (term_d1_en_i & d1_on),
            .D1HSRXDATA15  (bd1_mixel[15]),
            .D1HSRXDATA14  (bd1_mixel[14]),
            .D1HSRXDATA13  (bd1_mixel[13]),
            .D1HSRXDATA12  (bd1_mixel[12]),
            .D1HSRXDATA11  (bd1_mixel[11]),
            .D1HSRXDATA10  (bd1_mixel[10]),
            .D1HSRXDATA9   (bd1_mixel[9]),
            .D1HSRXDATA8   (bd1_mixel[8]),
            .D1HSRXDATA7   (bd1_mixel[7]),
            .D1HSRXDATA6   (bd1_mixel[6]),
            .D1HSRXDATA5   (bd1_mixel[5]),
            .D1HSRXDATA4   (bd1_mixel[4]),
            .D1HSRXDATA3   (bd1_mixel[3]),
            .D1HSRXDATA2   (bd1_mixel[2]),
            .D1HSRXDATA1   (bd1_mixel[1]),
            .D1HSRXDATA0   (bd1_mixel[0]),
            .D1SYNC        (d_sot_det[1]),  // SoT Detection Indicator	
            .D1ERRSYNC     (d_sote_det[1]), // SoT Detection with a Single Bit Error
            .D1NOSYNC      (),              // SoT Detection Corruption Indicator
            .D1HSDESEREN   (hs_en1_settle & d1_on),
            .D1TXHSEN      (1'b0),
            .D1HSTXDATA15  (1'b0),
            .D1HSTXDATA14  (1'b0),
            .D1HSTXDATA13  (1'b0),
            .D1HSTXDATA12  (1'b0),
            .D1HSTXDATA11  (1'b0),
            .D1HSTXDATA10  (1'b0),
            .D1HSTXDATA9   (1'b0),
            .D1HSTXDATA8   (1'b0),
            .D1HSTXDATA7   (1'b0),
            .D1HSTXDATA6   (1'b0),
            .D1HSTXDATA5   (1'b0),
            .D1HSTXDATA4   (1'b0),
            .D1HSTXDATA3   (1'b0),
            .D1HSTXDATA2   (1'b0),
            .D1HSTXDATA1   (1'b0),
            .D1HSTXDATA0   (1'b0),
            .D1HSSEREN     (1'b0),
            .D1TXHSPD      (1'b1),	// High Speed Tx Power Down
            .D1DRXHS       (),

// DATA2 Interface pins
            .DP2           (d2_p_i),
            .DN2           (d2_n_i),
            .D2RXLPEN      (1'b0),
            .D2DRXLPP      (lp_d2_rx_p),
            .D2DRXLPN      (lp_d2_rx_n),
            .D2CDEN        (1'b0),    // LP Contention Detection Enable
            .D2DCDP        (),        // LP Contention Detection Output - P
            .D2DCDN        (),        // LP Contention Detection Output - N
            .D2TXLPEN      (1'b0),
            .D2DTXLPP      (1'b0), 
            .D2DTXLPN      (1'b0),
            .D2RXHSEN      (term_d2_en_i & d2_on),
            .D2HSRXDATA15  (bd2_mixel[15]),
            .D2HSRXDATA14  (bd2_mixel[14]),
            .D2HSRXDATA13  (bd2_mixel[13]),
            .D2HSRXDATA12  (bd2_mixel[12]),
            .D2HSRXDATA11  (bd2_mixel[11]),
            .D2HSRXDATA10  (bd2_mixel[10]),
            .D2HSRXDATA9   (bd2_mixel[9]),
            .D2HSRXDATA8   (bd2_mixel[8]),
            .D2HSRXDATA7   (bd2_mixel[7]),
            .D2HSRXDATA6   (bd2_mixel[6]),
            .D2HSRXDATA5   (bd2_mixel[5]),
            .D2HSRXDATA4   (bd2_mixel[4]),
            .D2HSRXDATA3   (bd2_mixel[3]),
            .D2HSRXDATA2   (bd2_mixel[2]),
            .D2HSRXDATA1   (bd2_mixel[1]),
            .D2HSRXDATA0   (bd2_mixel[0]),
            .D2SYNC        (d_sot_det[2]),  // SoT Detection Indicator	
            .D2ERRSYNC     (d_sote_det[2]), // SoT Detection with a Single Bit Error
            .D2NOSYNC      (),              // SoT Detection Corruption Indicator
            .D2HSDESEREN   (hs_en2_settle & d2_on),
            .D2TXHSEN      (1'b0),
            .D2HSTXDATA15  (1'b0),
            .D2HSTXDATA14  (1'b0),
            .D2HSTXDATA13  (1'b0),
            .D2HSTXDATA12  (1'b0),
            .D2HSTXDATA11  (1'b0),
            .D2HSTXDATA10  (1'b0),
            .D2HSTXDATA9   (1'b0),
            .D2HSTXDATA8   (1'b0),
            .D2HSTXDATA7   (1'b0),
            .D2HSTXDATA6   (1'b0),
            .D2HSTXDATA5   (1'b0),
            .D2HSTXDATA4   (1'b0),
            .D2HSTXDATA3   (1'b0),
            .D2HSTXDATA2   (1'b0),
            .D2HSTXDATA1   (1'b0),
            .D2HSTXDATA0   (1'b0),
            .D2HSSEREN     (1'b0),
            .D2TXHSPD      (1'b1),	// High Speed Tx Power Down
            .D2DRXHS       (),

// DATA3 Interface pins
            .DP3           (d3_p_i),
            .DN3           (d3_n_i),
            .D3RXLPEN      (1'b0),
            .D3DRXLPP      (lp_d3_rx_p),
            .D3DRXLPN      (lp_d3_rx_n),
            .D3CDEN        (1'b0),    // LP Contention Detection Enable
            .D3DCDP        (),        // LP Contention Detection Output - P
            .D3DCDN        (),        // LP Contention Detection Output - N
            .D3TXLPEN      (1'b0),
            .D3DTXLPP      (1'b0), 
            .D3DTXLPN      (1'b0),
            .D3RXHSEN      (term_d3_en_i & d3_on),
            .D3HSRXDATA15  (bd3_mixel[15]),
            .D3HSRXDATA14  (bd3_mixel[14]),
            .D3HSRXDATA13  (bd3_mixel[13]),
            .D3HSRXDATA12  (bd3_mixel[12]),
            .D3HSRXDATA11  (bd3_mixel[11]),
            .D3HSRXDATA10  (bd3_mixel[10]),
            .D3HSRXDATA9   (bd3_mixel[9]),
            .D3HSRXDATA8   (bd3_mixel[8]),
            .D3HSRXDATA7   (bd3_mixel[7]),
            .D3HSRXDATA6   (bd3_mixel[6]),
            .D3HSRXDATA5   (bd3_mixel[5]),
            .D3HSRXDATA4   (bd3_mixel[4]),
            .D3HSRXDATA3   (bd3_mixel[3]),
            .D3HSRXDATA2   (bd3_mixel[2]),
            .D3HSRXDATA1   (bd3_mixel[1]),
            .D3HSRXDATA0   (bd3_mixel[0]),
            .D3SYNC        (d_sot_det[3]),  // SoT Detection Indicator	
            .D3ERRSYNC     (d_sote_det[3]), // SoT Detection with a Single Bit Error
            .D3NOSYNC      (),              // SoT Detection Corruption Indicator
            .D3HSDESEREN   (hs_en3_settle & d3_on),
            .D3TXHSEN      (1'b0),
            .D3HSTXDATA15  (1'b0),
            .D3HSTXDATA14  (1'b0),
            .D3HSTXDATA13  (1'b0),
            .D3HSTXDATA12  (1'b0),
            .D3HSTXDATA11  (1'b0),
            .D3HSTXDATA10  (1'b0),
            .D3HSTXDATA9   (1'b0),
            .D3HSTXDATA8   (1'b0),
            .D3HSTXDATA7   (1'b0),
            .D3HSTXDATA6   (1'b0),
            .D3HSTXDATA5   (1'b0),
            .D3HSTXDATA4   (1'b0),
            .D3HSTXDATA3   (1'b0),
            .D3HSTXDATA2   (1'b0),
            .D3HSTXDATA1   (1'b0),
            .D3HSTXDATA0   (1'b0),
            .D3HSSEREN     (1'b0),
            .D3TXHSPD      (1'b1),	// High Speed Tx Power Down
            .D3DRXHS       ()
        );
    end
    else if (DPHY_RX_IP == "LATTICE")
    begin : lattice
        soft_dphy_rx #( 
            .RX_GEAR     (RX_GEAR),
            .NUM_RX_LANE (NUM_RX_LANE)
        )
        dphy_rx (
            .reset_n_i      (reset_n_i),
            .clk_p_i        (clk_p_i),
            .clk_n_i        (clk_n_i),
            .d0_p_io        (d0_p_io),
            .d0_n_io        (d0_n_io),
            .d1_p_i         (d1_p_i),
            .d1_n_i         (d1_n_i),
            .d2_p_i         (d2_p_i),
            .d2_n_i         (d2_n_i),
            .d3_p_i         (d3_p_i),
            .d3_n_i         (d3_n_i),
            .hs_clk_en_i    (term_clk_en_i),
            .hs_d0_en_i     (term_d0_en_i),
            .hs_d1_en_i     (term_d1_en_i),
            .hs_d2_en_i     (term_d2_en_i),
            .hs_d3_en_i     (term_d3_en_i),
            .lp_d0_tx_en_i  (lp_d0_tx_en_i),
            .lp_d0_tx_p_i   (lp_d0_tx_p_i),
            .lp_d0_tx_n_i   (lp_d0_tx_n_i),
            .clk_byte_o     (clk_byte_o),
            .bd0_o          (bd0_lattice[RX_GEAR-1:0]),
            .bd1_o          (bd1_lattice[RX_GEAR-1:0]),
            .bd2_o          (bd2_lattice[RX_GEAR-1:0]),
            .bd3_o          (bd3_lattice[RX_GEAR-1:0]),
            .lp_clk_rx_p_o  (lp_clk_rx_p_o),
            .lp_clk_rx_n_o  (lp_clk_rx_n_o),
            .lp_d0_rx_p_o   (lp_d0_rx_p),
            .lp_d0_rx_n_o   (lp_d0_rx_n),
            .lp_d1_rx_p_o   (lp_d1_rx_p),
            .lp_d1_rx_n_o   (lp_d1_rx_n),
            .lp_d2_rx_p_o   (lp_d2_rx_p),
            .lp_d2_rx_n_o   (lp_d2_rx_n),
            .lp_d3_rx_p_o   (lp_d3_rx_p),
            .lp_d3_rx_n_o   (lp_d3_rx_n),
            .cd_clk_o       (cd_clk_o),
            .cd_d0_o        (cd_d0_o)
        );

        word_align #(
            .RX_GEAR     (RX_GEAR),
            .NUM_RX_LANE (NUM_RX_LANE),
            .BYTECLK_MHZ (BYTECLK_MHZ)
        )
        w_align (
            .reset_n_i        (reset_byte_fr_n_i),
            .clk_byte_i       (clk_byte_fr_i),
            .bd0_i            (bd0_fr_r),
            .bd1_i            (bd1_fr_r),
            .bd2_i            (bd2_fr_r),
            .bd3_i            (bd3_fr_r),
            .hs_en0_i         (hs_sync_d1_r),
            .hs_en1_i         (hs_sync1_d1_r),
            .hs_en2_i         (hs_sync2_d1_r),
            .hs_en3_i         (hs_sync3_d1_r),
            .bd0_o            (bd0_walign),
            .bd1_o            (bd1_walign),
            .bd2_o            (bd2_walign),
            .bd3_o            (bd3_walign),
            .hs_sync_err_o    (),
            .hs_sync_lane0_o  (hs_sync_lane0_w),
            .hs_sync_lane1_o  (hs_sync_lane1_w),
            .hs_sync_lane2_o  (hs_sync_lane2_w),
            .hs_sync_lane3_o  (hs_sync_lane3_w),
            .hs_sync_o        (hs_sync_walign_w)
        );


        if (LANE_ALIGN == "ON") begin
          lane_align #(
              .RX_GEAR     (RX_GEAR),
              .NUM_RX_LANE (NUM_RX_LANE),
              .FIFO_DEPTH  (FIFO_DEPTH),
              .FIFO_TYPE0  (FIFO_TYPE0),
              .FIFO_TYPE1  (FIFO_TYPE1),
              .FIFO_TYPE2  (FIFO_TYPE2),
              .FIFO_TYPE3  (FIFO_TYPE3)
          )
          l_align (
              .clk_i            (clk_byte_fr_i),
              .reset_i          (~reset_byte_fr_n_i),
              .bd0_i            (bd0_walign),
              .bd1_i            (bd1_walign),
              .bd2_i            (bd2_walign),
              .bd3_i            (bd3_walign),
              .sync0_i          (hs_sync_lane0_w),
              .sync1_i          (hs_sync_lane1_w),
              .sync2_i          (hs_sync_lane2_w),
              .sync3_i          (hs_sync_lane3_w),
              .sync_i           (hs_sync_walign_w),
              .bd0_o            (bd0_align),
              .bd1_o            (bd1_align),
              .bd2_o            (bd2_align),
              .bd3_o            (bd3_align),
              .hs_sync_o        (hs_sync_align)
          );
       end
       else begin
           assign bd0_align     = bd0_walign;
           assign bd1_align     = bd1_walign;
           assign bd2_align     = bd2_walign;
           assign bd3_align     = bd3_walign;
           assign hs_sync_align = hs_sync_walign_w;
       end
    end
endgenerate

endmodule
