module top (

    inout  wire                              clk_p_i,           // DPHY clock (p)
    inout  wire                              clk_n_i,           // DPHY clock (n)
    inout  wire                              d0_p_i,           // DPHY D0 (p) in DSI
    inout  wire                              d0_n_i,           // DPHY D0 (n) in DSI
    inout  wire                              d1_p_i,            // DPHY D1 (p)
    inout  wire                              d1_n_i,            // DPHY D1 (n)
    inout  wire                              d2_p_i,            // DPHY D2 (p)
    inout  wire                              d2_n_i,            // DPHY D2 (n)
    inout  wire                              d3_p_i,            // DPHY D3 (p)
    inout  wire                              d3_n_i,            // DPHY D3 (n)

    inout  wire                              clk_p_i_s,           // DPHY clock (p)
    inout  wire                              clk_n_i_s,           // DPHY clock (n)
    inout  wire                              d0_p_i_s,           // DPHY D0 (p) in DSI
    inout  wire                              d0_n_i_s,           // DPHY D0 (n) in DSI
    inout  wire                              d1_p_i_s,            // DPHY D1 (p)
    inout  wire                              d1_n_i_s,            // DPHY D1 (n)
    inout  wire                              d2_p_i_s,            // DPHY D2 (p)
    inout  wire                              d2_n_i_s,            // DPHY D2 (n)
    inout  wire                              d3_p_i_s,            // DPHY D3 (p)
    inout  wire                              d3_n_i_s,            // DPHY D3 (n)
   //output                                payload_en_o_s,payload_en_o,
   output                                fv,lv,
  // output hs_sync_o,
   output                                pixel_clk,
   output                                [9:0]pixdata,
	input  							         reset_n_i

);
localparam NUM_RX_LANE = 4;
localparam RX_GEAR = 8;
wire clk_byte_fr;
wire [3:0] dphy_sync_s,dphy_sync;
  //   wire                              clk_byte_o_s,        // non-continuous byte clock
  //   wire                              clk_byte_hs_s,  
//wire reset_n_i;
//assign reset_n_i = 1'b1;
reg                     reset_ref_n_meta, reset_ref_n_sync;
reg                     reset_byte_n_meta, reset_byte_n_sync;
reg                     reset_byte_fr_n_meta, reset_byte_fr_n_sync;
reg                     reset_pixel_n_meta, reset_pixel_n_sync;



wire                           clk_byte_hs;
wire                           clk_byte_hs_s;
wire                           term_d0_en_w, term_d1_en_w, term_d2_en_w, term_d3_en_w;
wire                           term_d0_en_w_s, term_d1_en_w_s, term_d2_en_w_s, term_d3_en_w_s;
wire                           term_d1_en_temp_w, term_d2_en_temp_w, term_d3_en_temp_w;
wire                           term_d1_en_temp_w_s, term_d2_en_temp_w_s, term_d3_en_temp_w_s;
wire                           hs_d1_en_w, hs_d2_en_w, hs_d3_en_w;
wire                           hs_d1_en_w_s, hs_d2_en_w_s, hs_d3_en_w_s;
wire                           hs_d1_en_temp_w, hs_d2_en_temp_w, hs_d3_en_temp_w;
wire                           hs_d1_en_temp_w_s, hs_d2_en_temp_w_s, hs_d3_en_temp_w_s;
wire                           capture_en_pre;
wire                           capture_en_pre_s;
wire [RX_GEAR-1:0]             bd0, bd1, bd2, bd3, bd0_pre, bd1_pre, bd2_pre, bd3_pre;
wire [RX_GEAR-1:0]             bd0_s, bd1_s, bd2_s, bd3_s, bd0_pre_s, bd1_pre_s, bd2_pre_s, bd3_pre_s;
wire                           lp_clk_rx_p, lp_clk_rx_n;
wire                           lp_clk_rx_p_s, lp_clk_rx_n_s;
wire                           lp_av_en, lp2_av_en;
wire                           lp_av_en_s, lp2_av_en_s;
wire [NUM_RX_LANE*RX_GEAR-1:0] payload;
wire [NUM_RX_LANE*RX_GEAR-1:0] payload_s;
   wire [5:0]                        dt_o;	      // Data Type
   wire [5:0]                        dt_o_s;	      // Data Type
   wire [5:0]                        dt2_o;	      // Data Type #2
   wire [5:0]                        dt2_o_s;	      // Data Type #2
   wire [15:0]                       wc_o;            // payload byte count
   wire [15:0]                       wc_o_s;            // payload byte count
   wire [15:0]                       wc2_o;           // payload byte count #2
   wire [15:0]                       wc2_o_s;           // payload byte count #2



   wire                              term_clk_en_o ;      // Termination Enable on CLK ;  active high
   wire                              term_clk_en_o_s ;      // Termination Enable on CLK ;  active high
       wire                              hs_d_en_o ;          // HS mode Enable on D0 ;  active high
       wire                              hs_d_en_o_s ;          // HS mode Enable on D0 ;  active high
       wire [1:0]                        lp_hs_state_clk_o ;  // LP HS Controller (CLK) state machine
       wire [1:0]                        lp_hs_state_clk_o_s ;  // LP HS Controller (CLK) state machine
       wire [1:0]                        lp_hs_state_d_o ;    // LP HS Controller (D0) state machine
       wire [1:0]                        lp_hs_state_d_o_s ;    // LP HS Controller (D0) state machine
       wire                              hs_sync_o ;          // HS Sync ;  active high
       wire                              hs_sync_o_s ;          // HS Sync ;  active high
       wire                              capture_en_o ;       // Capture Enable ;  active high
       wire                              capture_en_o_s ;       // Capture Enable ;  active high
       wire                              sp2_en_o ;           // Short Packet Enable #2 ;  active high
       wire                              sp2_en_o_s ;           // Short Packet Enable #2 ;  active high
       //wire                              sp2_en_o ;           // Short Packet Enable #2 ;  active high
       wire                              lp2_en_o ;           // Long Packet Enable #2 ;  active high
       wire                              lp2_en_o_s ;           // Long Packet Enable #2 ;  active high
       wire                              lp_av_en_o ;         // Active Video Long Packet Enable ;  active high
       wire                              lp_av_en_o_s ;         // Active Video Long Packet Enable ;  active high
       wire                              lp2_av_en_o ;        // Active Video Long Packet Enable #2 ;  active high
       wire                              lp2_av_en_o_s ;        // Active Video Long Packet Enable #2 ;  active high
       //wire [5:0]                        dt2_o ;              // Data Type #2   
      // wire [5:0]                        dt2_o_s ;              // Data Type #2   
       wire [1:0]                        vc2_o ;              // Virtual Channel #2
       wire [1:0]                        vc2_o_s ;              // Virtual Channel #2
      // wire [15:0]                       wc2_o ;              // Byte count #2
      // wire [15:0]                       wc2_o_s ;              // Byte count #2
       wire [7:0]                        ecc_o ;              // ECC of Packet Header #2   
       wire [7:0]                        ecc_o_s ;              // ECC of Packet Header #2   
       wire [7:0]                        ecc2_o ;             // ECC of Packet Header #2   
       wire [7:0]                        ecc2_o_s ;             // ECC of Packet Header #2   
       wire                              payload_en_o ;       // Payload Enable ;  active high
       wire                              payload_en_o_s ;       // Payload Enable ;  active high
       wire [3:0]                        write_cycle_o ;      // Payload Data Write Cycle
       wire [3:0]                        write_cycle_o_s ;      // Payload Data Write Cycle
       wire                              mem_we_o ;           // Payload Data Write Enable ;  active high
       wire                              mem_we_o_s  ;        // Payload Data Write Enable ;  active high
       wire                              mem_re_o ;           // Payload Data Read Enable ;  active high
       wire                              mem_re_o_s ;           // Payload Data Read Enable ;  active high
       wire [1:0]                        read_cycle_o ;       // Pixel Data Read Cycle
       wire [1:0]                        read_cycle_o_s ;       // Pixel Data Read Cycle
       wire [2:0]                        mem_radr_o ; 
       wire [2:0]                        mem_radr_o_s;
	   wire pll_lock;

always @(posedge clk_byte_hs or negedge reset_n_i)
    begin
        if (~reset_n_i)
        begin
            reset_byte_fr_n_meta <= 0;
            reset_byte_fr_n_sync <= 0;
        end
        else
        begin
            reset_byte_fr_n_meta <= reset_n_i;
            reset_byte_fr_n_sync <= reset_byte_fr_n_meta;
        end
    end


OSCI #(
                .HFCLKDIV (1)
            )
	        osc (
                .HFOUTEN  (1'b1),
                .HFCLKOUT (refclk),  // ~47.6MHz by sim.
                .LFCLKOUT ()
            );


 always @(posedge refclk or negedge reset_n_i)
    begin
        if (~reset_n_i)
        begin
            reset_ref_n_meta <= 0;
            reset_ref_n_sync <= 0;
        end
        else
        begin
            reset_ref_n_meta <= reset_n_i;
            reset_ref_n_sync <= reset_ref_n_meta;
        end
    end

 always @(posedge clk_byte_hs or negedge reset_n_i)
    begin
        if (~reset_n_i)
        begin
            reset_pixel_n_meta <= 0;
            reset_pixel_n_sync <= 0;
        end
        else
        begin
            reset_pixel_n_meta <= reset_n_i ;
            reset_pixel_n_sync <= reset_pixel_n_meta;
        end
    end



wire dt_correct, wc_correct, dt_correct_s, wc_correct_s;

//........................first camera DPHY....................// 
sip4_demo_dphy_rx_wrap 
        csi_rx (
            .reset_n_i        (reset_n_i),
            .reset_byte_n_i   (reset_n_i),
            .reset_byte_fr_n_i(reset_byte_fr_n_sync),
            .clk_byte_fr_i    (clk_byte_hs),
            .clk_p_i          (clk_p_i),
            .clk_n_i          (clk_n_i),
            .d0_p_io          (d0_p_i),
            .d0_n_io          (d0_n_i),
            .d1_p_i           (d1_p_i),
            .d1_n_i           (d1_n_i),
            .d2_p_i           (d2_p_i),
            .d2_n_i           (d2_n_i),
            .d3_p_i           (d3_p_i),
            .d3_n_i           (d3_n_i),
            .term_clk_en_i    (term_clk_en_o),
            .term_d0_en_i     (term_d0_en_w),
            .term_d1_en_i     (term_d1_en_w),
            .term_d2_en_i     (term_d2_en_w),
            .term_d3_en_i     (term_d3_en_w),
            .hs_d0_en_i       (hs_d_en_o),
            .hs_d1_en_i       (hs_d1_en_w),
            .hs_d2_en_i       (hs_d2_en_w),
            .hs_d3_en_i       (hs_d3_en_w),
            .lp_d0_tx_en_i    (1'b0),
            .lp_d0_tx_p_i     (1'b0),
            .lp_d0_tx_n_i     (1'b0),

            .clk_hs_o         (clk_byte_hs),
            .clk_byte_o       (clk_byte_o),
            .bd0_o            (bd0),
            .bd1_o            (bd1),
            .bd2_o            (bd2),
            .bd3_o            (bd3),
            .hs_sync_o        (hs_sync_o),

            .lp_clk_rx_p_o    (lp_clk_rx_p),
            .lp_clk_rx_n_o    (lp_clk_rx_n),
            .lp_d0_rx_p_o     (lp_d0_rx_p_o),
            .lp_d0_rx_n_o     (lp_d0_rx_n_o),
            .lp_d1_rx_p_o     (lp_d1_rx_p_o),
            .lp_d1_rx_n_o     (lp_d1_rx_n_o),
            .lp_d2_rx_p_o     (lp_d2_rx_p_o),
            .lp_d2_rx_n_o     (lp_d2_rx_n_o),
            .lp_d3_rx_p_o     (lp_d3_rx_p_o),
            .lp_d3_rx_n_o     (lp_d3_rx_n_o),
            .cd_clk_o         (),
            .cd_d0_o          (cd_d0_o),
			.dphy_sync (dphy_sync)
        );
		

//........................Second camera DPHY....................// 
sip4_demo_dphy_rx_wrap 
        csi_rx_second (
            .reset_n_i        (reset_n_i),
            .reset_byte_n_i   (reset_n_i),
            .reset_byte_fr_n_i(reset_byte_fr_n_sync),
            .clk_byte_fr_i    (clk_byte_hs_s),
            .clk_p_i          (clk_p_i_s),
            .clk_n_i          (clk_n_i_s),
            .d0_p_io          (d0_p_i_s),
            .d0_n_io          (d0_n_i_s),
            .d1_p_i           (d1_p_i_s),
            .d1_n_i           (d1_n_i_s),
            .d2_p_i           (d2_p_i_s),
            .d2_n_i           (d2_n_i_s),
            .d3_p_i           (d3_p_i_s),
            .d3_n_i           (d3_n_i_s),
            .term_clk_en_i    (term_clk_en_o_s),
            .term_d0_en_i     (term_d0_en_w_s),
            .term_d1_en_i     (term_d1_en_w_s),
            .term_d2_en_i     (term_d2_en_w_s),
            .term_d3_en_i     (term_d3_en_w_s),
            .hs_d0_en_i       (hs_d_en_o_s),
            .hs_d1_en_i       (hs_d1_en_w_s),
            .hs_d2_en_i       (hs_d2_en_w_s),
            .hs_d3_en_i       (hs_d3_en_w_s),
            .lp_d0_tx_en_i    (1'b0),
            .lp_d0_tx_p_i     (1'b0),
            .lp_d0_tx_n_i     (1'b0),

            .clk_hs_o         (clk_byte_hs_s),
            .clk_byte_o       (clk_byte_o_s),
            .bd0_o            (bd0_s),
            .bd1_o            (bd1_s),
            .bd2_o            (bd2_s),
            .bd3_o            (bd3_s),
            .hs_sync_o        (hs_sync_o_s),

            .lp_clk_rx_p_o    (lp_clk_rx_p_s),
            .lp_clk_rx_n_o    (lp_clk_rx_n_s),
            .lp_d0_rx_p_o     (lp_d0_rx_p_o_s),
            .lp_d0_rx_n_o     (lp_d0_rx_n_o_s),
            .lp_d1_rx_p_o     (lp_d1_rx_p_o_s),
            .lp_d1_rx_n_o     (lp_d1_rx_n_o_s),
            .lp_d2_rx_p_o     (lp_d2_rx_p_o_s),
            .lp_d2_rx_n_o     (lp_d2_rx_n_o_s),
            .lp_d3_rx_p_o     (lp_d3_rx_p_o_s),
            .lp_d3_rx_n_o     (lp_d3_rx_n_o_s),
            .cd_clk_o         (),
            .cd_d0_o          (cd_d0_o_s),
			.dphy_sync (dphy_sync_s)
        );		
		
		
		
		
		
		
		
		
		
//........................first camera RX controller....................// 
sip4_demo_rx_global_ctrl 
rx_global_ctrl (
    .reset_n_i         (reset_n_i),
    .reset_lp_n_i      (reset_ref_n_sync),
    .reset_byte_fr_n_i (reset_byte_fr_n_sync),
    .clk_lp_ctrl_i     (refclk),
    .clk_byte_i        (clk_byte_o),
    .clk_byte_hs_i     (clk_byte_hs),
    .clk_byte_fr_i     (clk_byte_hs),
    .pll_lock_i        (pll_lock),
    .bd0_i             (bd0),
    .bd1_i             (bd1),
    .bd2_i             (bd2),
    .bd3_i             (bd3),
    .lp_clk_p_i        (lp_clk_rx_p),
    .lp_clk_n_i        (lp_clk_rx_n),
    .lp_d0_p_i         (lp_d0_rx_p_o),
    .lp_d0_n_i         (lp_d0_rx_n_o),
    .lp_d1_p_i         (lp_d1_rx_p_o),
    .lp_d1_n_i         (lp_d1_rx_n_o),
    .lp_d2_p_i         (lp_d2_rx_p_o),
    .lp_d2_n_i         (lp_d2_rx_n_o),
    .lp_d3_p_i         (lp_d3_rx_p_o),
    .lp_d3_n_i         (lp_d3_rx_n_o),
    .hs_sync_i         (hs_sync_o),
    .bd0_o             (bd0_pre),
    .bd1_o             (bd1_pre),
    .bd2_o             (bd2_pre),
    .bd3_o             (bd3_pre),
    .term_clk_en_o     (term_clk_en_o),
    .term_d0_en_o      (term_d0_en_w),
    .hs_d0_en_o        (hs_d_en_o),
    .term_d1_en_o      (term_d1_en_temp_w),
    .hs_d1_en_o        (hs_d1_en_temp_w),
    .term_d2_en_o      (term_d2_en_temp_w),
    .hs_d2_en_o        (hs_d2_en_temp_w),
    .term_d3_en_o      (term_d3_en_temp_w),
    .hs_d3_en_o        (hs_d3_en_temp_w),
    .hs_sync_o         (capture_en_pre),
    .lp_hs_state_clk_o (lp_hs_state_clk_o),
    .lp_hs_state_d_o   (lp_hs_state_d_o)
);		
		
		
assign term_d1_en_w = term_d0_en_w;
  assign term_d2_en_w = term_d0_en_w;
  assign term_d3_en_w = term_d0_en_w;
  assign hs_d1_en_w   = hs_d_en_o;
  assign hs_d2_en_w   = hs_d_en_o;
  assign hs_d3_en_w   = hs_d_en_o;		
	



//........................Second camera RX controller....................// 
sip4_demo_rx_global_ctrl 
rx_global_ctrl_second (
    .reset_n_i         (reset_n_i),
    .reset_lp_n_i      (reset_lp_n_i),
    .reset_byte_fr_n_i (reset_byte_fr_n_sync),
    .clk_lp_ctrl_i     (refclk),
    .clk_byte_i        (clk_byte_o_s),
    .clk_byte_hs_i     (clk_byte_hs_s),
    .clk_byte_fr_i     (clk_byte_hs_s),
    .pll_lock_i        (pll_lock),
    .bd0_i             (bd0_s),
    .bd1_i             (bd1_s),
    .bd2_i             (bd2_s),
    .bd3_i             (bd3_s),
    .lp_clk_p_i        (lp_clk_rx_p_s),
    .lp_clk_n_i        (lp_clk_rx_n_s),
    .lp_d0_p_i         (lp_d0_rx_p_o_s),
    .lp_d0_n_i         (lp_d0_rx_n_o_s),
    .lp_d1_p_i         (lp_d1_rx_p_o_s),
    .lp_d1_n_i         (lp_d1_rx_n_o_s),
    .lp_d2_p_i         (lp_d2_rx_p_o_s),
    .lp_d2_n_i         (lp_d2_rx_n_o_s),
    .lp_d3_p_i         (lp_d3_rx_p_o_s),
    .lp_d3_n_i         (lp_d3_rx_n_o_s),
    .hs_sync_i         (hs_sync_o_s),
    .bd0_o             (bd0_pre_s),
    .bd1_o             (bd1_pre_s),
    .bd2_o             (bd2_pre_s),
    .bd3_o             (bd3_pre_s),
    .term_clk_en_o     (term_clk_en_o_s),
    .term_d0_en_o      (term_d0_en_w_s),
    .hs_d0_en_o        (hs_d_en_o_s),
    .term_d1_en_o      (term_d1_en_temp_w_s),
    .hs_d1_en_o        (hs_d1_en_temp_w_s),
    .term_d2_en_o      (term_d2_en_temp_w_s),
    .hs_d2_en_o        (hs_d2_en_temp_w_s),
    .term_d3_en_o      (term_d3_en_temp_w_s),
    .hs_d3_en_o        (hs_d3_en_temp_w_s),
    .hs_sync_o         (capture_en_pre_s),
    .lp_hs_state_clk_o (lp_hs_state_clk_o_s),
    .lp_hs_state_d_o   (lp_hs_state_d_o_s)
);		
	
assign term_d1_en_w_s = term_d0_en_w_s;
  assign term_d2_en_w_s = term_d0_en_w_s;
  assign term_d3_en_w_s = term_d0_en_w_s;
  assign hs_d1_en_w_s   = hs_d_en_o_s;
  assign hs_d2_en_w_s   = hs_d_en_o_s;
  assign hs_d3_en_w_s   = hs_d_en_o_s;		
	

wire [31:0] bytedata,bytedata_s;
wire [7:0] bd3_pre_out,bd2_pre_out,bd1_pre_out,bd0_pre_out;
wire [7:0] bd3_pre_s_out,bd2_pre_s_out,bd1_pre_s_out,bd0_pre_s_out;

wire empty,read_en;
//-------------First Cross Domain FIFO...........//

cross_domain_fifo fifo_first(.Data({bd3_pre,bd2_pre,bd1_pre,bd0_pre}), .WrClock(clk_byte_hs), .RdClock(read_clk), .WrEn(1), .RdEn(1), .Reset(~(reset_n_i)), .RPReset(~(reset_n_i)), .Q({bd3_pre_out,bd2_pre_out,bd1_pre_out,bd0_pre_out}), .Empty(empty), .Full(), .AlmostEmpty(), .AlmostFull());

//-------------Second Cross Domain FIFO...........//
cross_domain_fifo fifo_second(.Data({bd3_pre_s,bd2_pre_s,bd1_pre_s,bd0_pre_s}), .WrClock(~clk_byte_hs_s), .RdClock(read_clk), .WrEn(1), .RdEn(1), .Reset(~(reset_n_i)), .RPReset(~(reset_n_i)), .Q({bd3_pre_s_out,bd2_pre_s_out,bd1_pre_s_out,bd0_pre_s_out}), .Empty(empty_s), .Full(), .AlmostEmpty(), .AlmostFull());

//--------------PLL Generating pixel clock and double pixel clock...............//
pll_double pll(.CLKI(clk_byte_hs), .RST(~reset_n_i), .CLKOP(pixel_clock),  .CLKOS2(read_clk), .LOCK(pll_lock));

//...................shift register for fifo read enable..................

reg [8:0]shift;
reg [4:0] shift_s;


control_capture_lane4 
	u_control_capture1(.rstn(reset_byte_fr_n_sync), .clk(read_clk), .din({bd3_pre_out,bd2_pre_out,bd1_pre_out,bd0_pre_out}), 
						.fv(fv_8bit), .lv(lv_8bit), .dout(payload), .vc(vc_o), .dt_correct(dt_correct), .wc_correct(wc_correct),
						.dt(dt_o), .wc(wc_o), .ecc(ecc_o), .line_length_detect(1'b0), .line_length(line_length));
						
control_capture_lane4 
	u_control_capture2(.rstn(reset_byte_fr_n_sync), .clk(read_clk), .din({bd3_pre_s_out,bd2_pre_s_out,bd1_pre_s_out,bd0_pre_s_out}), 
						.fv(fv_8bit_s), .lv(lv_8bit_s), .dout(payload_s), .vc(vc_o_s), .dt_correct(dt_correct_s), .wc_correct(wc_correct_s),
						.dt(dt_o_s), .wc(wc_o_s), .ecc(ecc_o_s), .line_length_detect(1'b0), .line_length(line_length));



wire [9:0]pd_o,pd_o_s;

raw10_lane4 #(.bus_width(10), .lane_width(4)) 
			byte_pixel (.rstn(reset_n_i), .clk(read_clk), .pixclk(pixel_clock), .din(payload), .fv_8bit(fv_8bit),
						.lv_8bit(lv_8bit), .pixdata(pd_o), .fv(fv_o), .lv(lv_o));
						
raw10_lane4 #(.bus_width(10), .lane_width(4)) 
			byte_pixel_second (.rstn(reset_n_i), .clk(read_clk), .pixclk(pixel_clock), .din(payload_s), .fv_8bit(fv_8bit_s), 
								.lv_8bit(lv_8bit_s), .pixdata(pd_o_s), .fv(fv_o_s), .lv(lv_o_s));

//.........................Merging ...................//



SDR_user_ctrl u_SDR_user_ctrl(
	.i_rst_n		(reset_n_i),
	.i_clk			(pixel_clock),
	.i_clk_2		(pixel_clock), 
	.i_clk_x2       ( pixel_clock),

	.ia_fv			(fv_o),
	.ia_lv			(lv_o),
	.ia_data		(pd_o),
	
	.ib_fv			(fv_o_s),
	.ib_lv			(lv_o_s),
	.ib_data		(pd_o_s),

	.o_vsync		(fv_o_out),
	.o_hsync		(lv_o_out),
	.o_data			(pixdata_out)
);
wire [9:0]pixdata_out;

genvar i;
generate
        begin
            for (i=0; i<10 ;i=i+1)
            begin : pixel_data
                OFS1P3DX r_ff_i
                (
                    .D     (pixdata_out[i]),
                    .SP    (1'b1),
                    .SCLK  (pixel_clock),
                    .CD    (~reset_pixel_n_sync),
                    .Q     (pixdata[i])
                );
            end
	  end 		
endgenerate



ODDRX1F pclk_ddr
    (
        .D0    (1'b0),
        .D1    (1'b1),
        .SCLK  (pixel_clock),
        .RST   (~reset_pixel_n_sync),
        .Q     (pixel_clk)
    );


OFS1P3DX fv_ff
        (
            .D     (fv_o_out),
            .SP    (1'b1),
            .SCLK  (pixel_clock),
            .CD    (~reset_pixel_n_sync),
            .Q     (fv)
        );

OFS1P3DX lv_ff
        (
            .D     (lv_o_out),
            .SP    (1'b1),
            .SCLK  (pixel_clock),
            .CD    (~reset_pixel_n_sync),
            .Q     (lv)
        );



		
endmodule 		