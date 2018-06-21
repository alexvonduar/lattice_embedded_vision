// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2000-2001 (c) Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorised by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement from
// Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                      408-826-6000 (other locations)
// Hillsboro, OR 97124                      web  : http://www.latticesemi.com/
// U.S.A                                    email: techsupport@latticesemi.com
// =============================================================================
//                FILE DETAILS
// Project          : Gamma Correction 
// File             : gamma_tb.v
// Title            : top level testbench for  the Gamma Correction  .
// Dependencies     : 1. 
// Description      : 
// =============================================================================
//                REVISION HISTORY
// Version          : 1.1
// Author(s)        : 
// Mod. Date        : Sept 29, 2006
// Changes Made     : Initial Creation
// -----------------------------------------------------------------------------

`ifdef TIMING_SIM
        `timescale 1ns / 1ps
`else
        `timescale 1ns / 1ns
`endif


// =============================================================================
// defines used in the top level testbench
// =============================================================================
`define  WAIT_FOR_RST_INACTIVE (`HALF_PERIOD*40)

`ifdef RTL_SIM
   `define SDF_INP_DELAY                0
`endif
`ifdef SYNNET_SIM
   `define SDF_INP_DELAY                0
`endif
`ifdef PARNET_SIM
   `define SDF_INP_DELAY                `HALF_PERIOD
   //`define SDF_INP_DELAY                0
`endif
`ifdef TIMING_SIM
   //`define SDF_INP_DELAY                `HALF_PERIOD
   `define SDF_INP_DELAY                0
`endif



module gamma_tb ;                                                              // testbench module name
 
      `include "includefile2.v"

// =============================================================================
// parameter definitions 
// =============================================================================
  localparam MFACT  = (pinput_serial) ?((pcplane2) ? 3 : 2 ) : 1;

  localparam integer PDATA1_SIZE = 2**pdata1_width;
  localparam integer PDATA2_SIZE = 2**pdata2_width;
  localparam integer PDATA0MINUS1_SIZE = 2**(pdata0_width-pdata1_width);
  localparam integer PDATA0MINUS2_SIZE = 2**(pdata0_width-pdata2_width);
// =============================================================================
// internal signals  declarations 
// =============================================================================

reg [pdata0_width-1:0]                       mem_din0[0:NUM_PIXELS*MFACT-1];  // first color plane data for input color space 
reg [pdata1_width-1:0]                       mem_din1[0:NUM_PIXELS-1];  // second color plane data for input color space 
reg [pdata2_width-1:0]                       mem_din2[0:NUM_PIXELS-1];  // third color plane data for input color space 

reg [pdata0_width-1:0]                       mem_dout0[0:NUM_PIXELS*MFACT-1]; // first color plane data for output color space 
reg [pdata1_width-1:0]                       mem_dout1[0:NUM_PIXELS-1]; // second color plane data for output color space 
reg [pdata2_width-1:0]                       mem_dout2[0:NUM_PIXELS-1]; // third color plane data for output color space 

reg [pdata0_width-1:0]                       mem_lut0[0:2**pdata0_width-1]; // first color plane lut memory
reg [pdata1_width-1:0]                       mem_lut1[0:2**pdata1_width-1]; // second color plane lut memory
reg [pdata2_width-1:0]                       mem_lut2[0:2**pdata2_width-1]; // third color plane lut memory
reg                                          error0;                    // Indicates the mismatch  in comparison for dout0
reg                                          error1;                    // Indicates the mismatch  in comparison for dout1
reg                                          error2;                    // Indicates the mismatch  in comparison for dout2
reg [pdata0_width-1:0]                       golden_dout0;              // golden data dout0 from c program
reg [pdata1_width-1:0]                       golden_dout1;              // golden data dout1 from c program
reg [pdata2_width-1:0]                       golden_dout2;              // golden data dout2 from c program
reg [pdata0_width-1:0]                       golden_dout0_d1;              // golden data dout0 from c program
reg [pdata1_width-1:0]                       golden_dout1_d1;              // golden data dout1 from c program
reg [pdata2_width-1:0]                       golden_dout2_d1;              // golden data dout2 from c program

reg [pdata0_width-1:0]                       din0_dd;                   
reg [pdata1_width-1:0]                       din1_dd;                   
reg [pdata2_width-1:0]                       din2_dd;                   

reg                                          inpvalid_dd;
reg                                          sr_dd;
reg                                          ce_dd;
reg                                          gcen_dd;

reg [pdata0_width-1:0]                       din0;                   
reg [pdata1_width-1:0]                       din1;                   
reg [pdata2_width-1:0]                       din2;                   
reg [pdata0_width-1:0]                       lut0val;                   
reg [pdata1_width-1:0]                       lut1val;                   
reg [pdata2_width-1:0]                       lut2val;                   
reg [pdata0_width-1:0]                       lut0val_dd;                   
reg [pdata1_width-1:0]                       lut1val_dd;                   
reg [pdata2_width-1:0]                       lut2val_dd;                   
reg                                          lut0wren;
wire                                         lut0wreni;
reg                                          lut1wren;
reg                                          lut2wren;
reg                                          lut0wren_dd;
reg                                          lut1wren_dd;
reg                                          lut2wren_dd;

reg                                          inpvalid;
reg                                          sr_tb;
reg                                          sr;
reg                                          ce;
reg                                          gcen;

integer                                      num_errors_dout0;          // Number of errors  in dout0 data comparison
integer                                      num_errors_dout1;          // Number of errors  in dout1 data comparison
integer                                      num_errors_dout2;          // Number of errors  in dout2 data comparison
integer                                      i;          
integer                                      j;          
integer                                      k;          

reg                                          clk;
reg                                          rstn;
wire                                         gcvalid;
wire                                         outvalid;
wire                                         ovalid;
wire [pdata0_width-1:0]                      dout0;              
wire [pdata1_width-1:0]                      dout1;              
wire [pdata2_width-1:0]                      dout2;              
reg  [pdata0_width-1:0]                      dout0_d1;              
reg  [pdata1_width-1:0]                      dout1_d1;              
reg  [pdata2_width-1:0]                      dout2_d1;              
reg  [pcpsel_width-1:0]                      cpsel;
reg  [pcpsel_width-1:0]                      cpsel_pre;
reg  [pcpsel_width-1:0]                      cpsel_dd;
wire [pcpsel_width-1:0]                      cpout;
wire [pcpsel_width-1:0]                      cpsel_pre_0;
wire [pcpsel_width-1:0]                      cpsel_pre_0_0;
wire [pcpsel_width-1:0]                      cpsel_pre_1;
wire [pcpsel_width-1:0]                      cpsel_pre_2;

reg  [15:0]                                  shift_reg; 
reg  [31:0]                                  index;      
wire [31:0]                                  indexo;      
reg                                          lut0index_en;
wire                                         lut0index_en_din0;
reg  [31:0]                                  lut0index;      
reg                                          lut1index_en;
reg  [31:0]                                  lut1index;      
reg                                          lut2index_en;
reg  [31:0]                                  lut2index;      
reg                                          lut0index_en_d1;
reg                                          lut1index_en_d1;
reg                                          lut2index_en_d1;
reg                                          lut0index_en_d2;
reg                                          lut1index_en_d2;
reg                                          lut2index_en_d2;
reg                                          lut0index_en_d3;
reg                                          lut1index_en_d3;
reg                                          lut2index_en_d3;
wire                                         lut0index_enable;
wire                                         lut1index_enable;
wire                                         lut2index_enable;

reg  [31:0]                                  indexd[0:`LATENCY-1];      
reg                                          tst_end_pulse;
reg                                          first_start1;
reg                                          first_start;
reg                                          index_en;
reg                                          index_end[0:`LATENCY];
wire                                         index_eno;
wire                                         index_mod3;
reg  [pdata0_width-1:0]                      dinput0[0:platency-1];
reg  [pdata1_width-1:0]                      dinput1[0:platency-1];
reg  [pdata2_width-1:0]                      dinput2[0:platency-1];
wire [pdata0_width-1:0]                      ddel0;
wire [pdata1_width-1:0]                      ddel1;
wire [pdata2_width-1:0]                      ddel2;
wire                                         gcovalid;
reg                                          firststart_en_lut0;
reg                                          firststart_en_lut1;
reg                                          firststart_en_lut2;



// =============================================================================
// module  instantiations 
// =============================================================================

// =============================================================================
// IP Top Level  module    
// =============================================================================
      `include "includefile.v"
               //=====INPUTS
               .clk                (clk),                 // system clock
               .rstn               (rstn),                // system reset
               `ifdef CLKEN
                  .ce              (ce_dd),               // clock enable
               `endif
               `ifdef SYNCRST
                  .sr              (sr_dd),               // synchronous reset
               `endif
               `ifdef BYPASSEN
                  .gcen            (gcen_dd),             // gamma enable
               `endif
               .inpvalid           (inpvalid_dd),         // input data valid signal
               .din0               (din0_dd),             // first  dimension of input color space
               `ifdef LUT0WRITEPORT
                  .lut0wren        (lut0wren_dd),         // first color plane LUT write enable
                  .lut0val         (lut0val_dd),          // first color plane LUT write value
               `endif
               `ifdef INPUT_SERIAL
                  .cpsel           (cpsel_dd),            // color plane select for the inputs
               `endif
               `ifndef INPUT_SERIAL
                  `ifdef NUMCP2
                     .din1         (din1_dd),             // second input color plane
                     `ifdef LUT1WRITEPORT
                        .lut1wren  (lut1wren_dd),         // second color plane LUT write enable
                        .lut1val   (lut1val_dd),          // second color plane LUT write value
                     `endif
                  `endif
                  `ifdef NUMCP3
                     .din2         (din2_dd),             // third  input color plane
                     `ifdef LUT2WRITEPORT
                        .lut2wren  (lut2wren_dd),         // third color plane LUT write enable
                        .lut2val   (lut2val_dd),          // third color plane LUT write value
                     `endif
                  `endif
               `endif
               //=====OUTPUTS
               `ifdef BYPASSEN
                  .gcvalid         (gcvalid),             // valid gamma correction output indicator
               `endif
               .outvalid           (outvalid),            // output data valid signal
               `ifdef INPUT_SERIAL
                  .cpout           (cpout),               // color plane select for the outputs
               `endif
               `ifndef INPUT_SERIAL
                  `ifdef NUMCP2
                     .dout1        (dout1),               // second output color plane
                  `endif
                  `ifdef NUMCP3
                     .dout2        (dout2),               // third  output color plane
                  `endif
               `endif
               .dout0              (dout0)                // first  dimension of output color space

                   );

always @(inpvalid)
   inpvalid_dd                = #`SDF_INP_DELAY inpvalid ;
always @(din0)
   din0_dd                    = #`SDF_INP_DELAY din0 ;
always @(din1)
   din1_dd                    = #`SDF_INP_DELAY din1 ;
always @(din2)
   din2_dd                    = #`SDF_INP_DELAY din2 ;
always @(sr)
   sr_dd                      = #`SDF_INP_DELAY sr ;
always @(ce)
   ce_dd                      = #`SDF_INP_DELAY ce ;
always @(gcen)
   gcen_dd                    = #`SDF_INP_DELAY gcen ;
always @(cpsel)
  cpsel_dd                    = #`SDF_INP_DELAY cpsel ;
always @(lut0val)
  lut0val_dd                  = #`SDF_INP_DELAY lut0val ;
always @(lut1val)
  lut1val_dd                  = #`SDF_INP_DELAY lut1val ;
always @(lut2val)
  lut2val_dd                  = #`SDF_INP_DELAY lut2val ;
always @(lut0wreni)
  lut0wren_dd                 = #`SDF_INP_DELAY lut0wreni ;
always @(lut1wren)
  lut1wren_dd                 = #`SDF_INP_DELAY lut1wren ;
always @(lut2wren)
  lut2wren_dd                 = #`SDF_INP_DELAY lut2wren ;


assign  index_mod3= (index%3==0);
assign  indexo    = indexd[`LATENCY-1];
assign  index_eno = index_end[`LATENCY];
assign  ddel0     = dinput0[platency-1];
assign  ddel1     = dinput1[platency-1];
assign  ddel2     = dinput2[platency-1];

   assign ovalid = outvalid;

   generate
   if (pbypassen == 1) begin
      assign gcovalid = gcvalid;
   end
   else begin
      assign gcovalid = 1'b1;
   end
   endgenerate

   generate
   if (pinput_serial == 1) begin
      assign cpsel_pre_1      = cpsel_pre;
      assign cpsel_pre_2      = cpsel_pre;
      assign lut0index_enable = lut0index_en_d1;
      assign lut1index_enable = lut0index_en_d2;
      assign lut2index_enable = lut0index_en_d3;
      //assign lut1index_enable = lut1index_en_d2;
      //assign lut2index_enable = lut2index_en_d3;
   end
   else begin
      assign cpsel_pre_1      = 0;
      assign cpsel_pre_2      = 1;
      assign lut0index_enable = lut0index_en;
      assign lut1index_enable = lut1index_en;
      assign lut2index_enable = lut2index_en;
   end
   endgenerate

   generate
   if (pinput_serial == 1) begin
      assign cpsel_pre_0      = cpsel_pre;
   end
   //else if (pcplane2 == 1) begin
   //   assign cpsel_pre_0      = 2;
   //end
   //else if (pcplane1 == 1) begin
   //   assign cpsel_pre_0      = 1;
   //end
   else  begin
      assign cpsel_pre_0      = 0;
   end
   endgenerate

   generate
   if ((pinput_serial == 1)&&(pcplane2 == 1)) begin
      assign cpsel_pre_0_0      = 2;
   end
   else if ((pinput_serial == 1)&&(pcplane1 == 1)) begin
      assign cpsel_pre_0_0      = 1;
   end
   else  begin
      assign cpsel_pre_0_0      = 0;
   end
   endgenerate

   generate
   if ((pinput_serial == 1)&&(pcplane2 == 1)) begin
      assign lut0wreni      = lut0wren | lut1wren | lut2wren;
      assign lut0index_en_din0      = lut0index_en | lut1index_en | lut2index_en;
   end
   else if ((pinput_serial == 1)&&(pcplane1 == 1)) begin
      assign lut0index_en_din0      = lut0index_en | lut1index_en ;
      assign lut0wreni      = lut0wren | lut1wren ;
   end
   else  begin
      assign lut0index_en_din0      = lut0index_en ;
      assign lut0wreni      = lut0wren ;
   end
   endgenerate


// =============================================================================
// initialization for the memories from external files
// =============================================================================
initial begin 
   $readmemh("din0.dat",   mem_din0);     
   $readmemh("dout0.dat",  mem_dout0);     
   `ifdef LUT0WRITEPORT
      $readmemb("loadlut0_init.mem",  mem_lut0);     
   `endif 
   `ifdef LUT1WRITEPORT
      $readmemb("loadlut1_init.mem",  mem_lut1);     
   `endif 
   `ifdef LUT2WRITEPORT
      $readmemb("loadlut2_init.mem",  mem_lut2);     
   `endif 
   `ifndef INPUT_SERIAL
      `ifdef NUMCP2
         $readmemh("din1.dat",   mem_din1);     
         $readmemh("dout1.dat",  mem_dout1);     
      `endif 
      `ifdef NUMCP3
         $readmemh("din2.dat",   mem_din2);     
         $readmemh("dout2.dat",  mem_dout2);     
      `endif 
   `endif 
end

initial begin
   rstn                         <=1'b1;
   #5  rstn                     <=1'b0;
   #`WAIT_FOR_RST_INACTIVE rstn <=1'b1;
end
initial begin
   clk                          <=1'b1;
end
always  #`HALF_PERIOD clk <= ~clk;

always @(*)
    //gcen = inpvalid;
    gcen = ~(shift_reg[1]&shift_reg[10]);
// =============================================================================
// initialization for the signals 
// =============================================================================
initial begin
   //gcen                       = 1'b1;
   lut0index_en               = 1'b0;
   lut1index_en               = 1'b0;
   lut2index_en               = 1'b0;
   lut0index_en_d1            = 1'b0;
   lut1index_en_d1            = 1'b0;
   lut2index_en_d1            = 1'b0;
   sr                         = 1'b1;
   ce                         = 1'b0;
   num_errors_dout0           = 0;
   num_errors_dout1           = 0;
   num_errors_dout2           = 0;
   error0                     = 1'b0;
   error1                     = 1'b0;
   error2                     = 1'b0;
   #1;
   sr                         = 1'b0;
   ce                         = 1'b1;
end

// =============================================================================
// first start signal assertion after power on reset  
// =============================================================================
initial begin
   first_start1                   <=1'b0;
   #`WAIT_FOR_RST_INACTIVE;
   @(posedge clk) begin
      first_start1                <=1'b0;
   end 
   @(posedge clk) begin
      first_start1                <=1'b1;
   end
   @(posedge clk) begin
      first_start1                <=1'b0;
   end 
end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            firststart_en_lut0 <= 1'b0;
            firststart_en_lut1 <= 1'b0;
            firststart_en_lut2 <= 1'b0;
         end
         else if (ce) begin 
            firststart_en_lut0 <= (~lut0index_en) & lut0index_en_d1;
            firststart_en_lut1 <= (~lut1index_en) & lut1index_en_d1;
            firststart_en_lut2 <= (~lut2index_en) & lut2index_en_d1;
         end 
      end
generate
   if ((plut0writeport == 1)||(plut1writeport == 1)||(plut2writeport == 1)) begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            first_start <= 0;
         else if (ce) begin 
            first_start <= (firststart_en_lut0 & (~lut1index_en_d1) & (~lut2index_en_d1)) ||
                           (firststart_en_lut1 & (~lut0index_en_d1) & (~lut2index_en_d1)) ||
                           (firststart_en_lut2 & (~lut0index_en_d1) & (~lut1index_en_d1));
         end 
      end
   end
   else begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            first_start <= 0;
         else if (ce) begin 
            first_start <= first_start1;
         end 
      end
   end 
endgenerate

always @(posedge clk or negedge rstn) begin
   if (!rstn) begin
      for (k=0;k<platency;k=k+1) begin
         dinput0[k]    <= 'b0;
         dinput1[k]    <= 'b0;
         dinput2[k]    <= 'b0;
      end
   end
   else if (ce) begin
      if (sr)  begin
         for (k=0;k<platency;k=k+1) begin
            dinput0[k]    <= 'b0;
            dinput1[k]    <= 'b0;
            dinput2[k]    <= 'b0;
         end
      end
      else begin
         dinput0[0] <= din0;
         dinput1[0] <= din1;
         dinput2[0] <= din2;
         for (k=1;k<platency;k=k+1) begin
            dinput0[k]    <= dinput0[k-1];
            dinput1[k]    <= dinput1[k-1];
            dinput2[k]    <= dinput2[k-1];
         end
      end
   end
end


generate
   if (plut0writeport == 1) begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            lut0index_en_d1 <= 0;
            lut0index_en_d2 <= 0;
            lut0index_en_d3 <= 0;
         end 
         else if (ce) begin 
            lut0index_en_d1 <= lut0index_en;
            lut0index_en_d2 <= lut0index_en_d1;
            lut0index_en_d3 <= lut0index_en_d2;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut0index_en <= 1'b0;
         else if (ce) begin 
            if (sr||(lut0index==2**pdata0_width-1)) 
               lut0index_en <= 1'b0;
            else if (first_start1) 
               lut0index_en <= 1'b1;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut0wren <= 1'b0;
         else if (ce) begin
            if (sr) 
               lut0wren <= 1'b0;
            else 
               lut0wren <= lut0index_en;
         end
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut0index <= 0;
         else if (ce) begin 
            //if ((lut0index_enable)&&(cpsel_pre==0)) 
            //if ((lut0index_enable)&&(cpsel_pre_0==2)) 
            if ((lut0index_enable)&&(cpsel_pre_0==cpsel_pre_0_0)) 
               lut0index <= lut0index + 1;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            lut0val <= 0;
         end
         else if (ce) begin
            if (sr) begin
               lut0val <= 0;
            end
            //else if (lut0index_en) begin
            else if (lut0index_en_din0) begin
               if (cpsel_pre ==0)
                  lut0val <= mem_lut0[lut0index];
               if (cpsel_pre ==1)
                  //lut0val <= mem_lut1[(lut1index%(2**pdata1_width))*(2**(pdata0_width-pdata1_width))];
                  lut0val <= mem_lut1[(lut1index%PDATA1_SIZE)];
               if (cpsel_pre ==2)
                  //lut0val <= mem_lut2[(lut2index%(2**pdata2_width))*(2**(pdata0_width-pdata2_width))];
                  lut0val <= mem_lut2[(lut2index%PDATA2_SIZE)];

               //if (cpsel_pre ==0)  
               //   lut0val <= mem_lut0[lut0index];
               //if (cpsel_pre ==1)  
               //   lut0val <= mem_lut1[lut1index];
               //if (cpsel_pre ==2)  
               //   lut0val <= mem_lut2[lut2index];

            end
         end
      end

      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            din0 <= 0;
         end
         else if (ce) begin
            if (sr) begin
               din0 <= 0;
            end
            else begin
               //if (lut0index_en) 
               //   din0 <= lut0index;
               if (lut0index_en_din0) begin
                  if (cpsel_pre ==0)
                     din0 <= lut0index;
                  if (cpsel_pre ==1)
                     din0 <= (lut0index%PDATA1_SIZE)*PDATA0MINUS1_SIZE;
                  if (cpsel_pre ==2)
                     din0 <= (lut0index%PDATA2_SIZE)*PDATA0MINUS2_SIZE;
               end
               else 
                  din0 <= mem_din0[index];
               //else begin 
               //   if (cpsel_pre ==0)
               //      din0 <= mem_din0[index];
               //   if (cpsel_pre ==1)
               //      din0 <= mem_din0[(index%(2**pdata1_width))*(2**(pdata0_width-pdata1_width))];
               //   if (cpsel_pre ==2)
               //      din0 <= mem_din0[(index%(2**pdata2_width))*(2**(pdata0_width-pdata2_width))];
               //end 
            end
         end
      end
   end
   else begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            din0 <= 0;
         end
         else if (ce) begin
            if (sr) begin
               din0 <= 0;
            end
            else begin
               din0 <= mem_din0[index];
            end
         end
      end
   end 
endgenerate
generate
   if (plut1writeport == 1) begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            lut1index_en_d1 <= 0;
            lut1index_en_d2 <= 0;
            lut1index_en_d3 <= 0;
         end 
         else if (ce) begin 
            lut1index_en_d1 <= lut1index_en;
            lut1index_en_d2 <= lut1index_en_d1;
            lut1index_en_d3 <= lut1index_en_d2;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut1index_en <= 1'b0;
         else if (ce) begin 
            if (sr||(lut1index==2**pdata1_width-1)) 
               lut1index_en <= 1'b0;
            else if (first_start1) 
               lut1index_en <= 1'b1;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut1wren <= 1'b0;
         else if (ce) begin
            if (sr) 
               lut1wren <= 1'b0;
            else 
               lut1wren <= lut1index_en;
         end
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut1index <= 0;
         else if (ce) begin 
            //if ((lut1index_enable)&&(cpsel_pre==1)) 
            if ((lut1index_enable)&&(cpsel_pre_1==0)) 
               lut1index <= lut1index + 1;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            lut1val <= 0;
         end
         else if (ce) begin
            if (sr) begin
               lut1val <= 0;
            end
            else if (lut1index_en) begin
               lut1val <= mem_lut1[lut1index];
            end
         end
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            din1 <= 0;
         end
         else if (ce) begin
            if (sr) begin
               din1 <= 0;
            end
            else begin
               if (lut1index_en) 
                  din1 <= lut1index;
               else 
                  din1 <= mem_din1[index];
            end
         end
      end
   end
   else begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            din1 <= 0;
         end
         else if (ce) begin
            if (sr) begin
               din1 <= 0;
            end
            else begin
               din1 <= mem_din1[index];
            end
         end
      end
   end 
endgenerate
generate
   if (plut2writeport == 1) begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            lut2index_en_d1 <= 0;
            lut2index_en_d2 <= 0;
            lut2index_en_d3 <= 0;
         end 
         else if (ce) begin 
            lut2index_en_d1 <= lut2index_en;
            lut2index_en_d2 <= lut2index_en_d1;
            lut2index_en_d3 <= lut2index_en_d2;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut2index_en <= 1'b0;
         else if (ce) begin 
            if (sr||(lut2index==2**pdata2_width-1)) 
               lut2index_en <= 1'b0;
            else if (first_start1) 
               lut2index_en <= 1'b1;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut2wren <= 1'b0;
         else if (ce) begin
            if (sr) 
               lut2wren <= 1'b0;
            else 
               lut2wren <= lut2index_en;
         end
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            lut2index <= 0;
         else if (ce) begin 
            //if ((lut2index_enable)&&(cpsel_pre==2)) 
            if ((lut2index_enable)&&(cpsel_pre_2==1)) 
               lut2index <= lut2index + 1;
         end 
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            lut2val <= 0;
         end
         else if (ce) begin
            if (sr) begin
               lut2val <= 0;
            end
            else if (lut2index_en) begin
               lut2val <= mem_lut2[lut2index];
            end
         end
      end
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            din2 <= 0;
         end
         else if (ce) begin
            if (sr) begin
               din2 <= 0;
            end
            else begin
               if (lut2index_en) 
                  din2 <= lut2index;
               else 
                  din2 <= mem_din2[index];
            end
         end
      end
   end
   else begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0) begin
            din2 <= 0;
         end
         else if (ce) begin
            if (sr) begin
               din2 <= 0;
            end
            else begin
               din2 <= mem_din2[index];
            end
         end
      end
   end 
endgenerate
// =============================================================================
// index_en signal generation                   
// =============================================================================
always @( posedge clk or  negedge rstn ) begin
   if ( rstn == 1'b0)
      index_en <= 1'b0;
   else if (ce) begin 
      if (sr) 
         index_en <= 1'b0;
      else if (first_start) 
         index_en <= 1'b1;
   end 
end
always @( posedge clk or  negedge rstn ) begin
   if ( rstn == 1'b0)
      inpvalid <= 1'b0;
   else if (ce) begin
      if (sr) 
         inpvalid <= 1'b0;
      else 
         inpvalid <= index_en;
   end
end
always @( posedge clk or  negedge rstn ) begin
   if ( rstn == 1'b0)
      index <= 0;
   else if (ce) begin 
      if (index_en) 
         index <= index + 1;
   end 
end
always @( posedge clk or  negedge rstn ) begin
   if ( rstn == 1'b0)
      cpsel <= 0;
   else if (ce) begin 
      if (sr)
         cpsel <= 0;
      else 
         cpsel <= cpsel_pre ;
   end 
end

generate
   if (pinput_serial == 1) begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            cpsel_pre <= 0;
         else if (ce) begin
            if ((first_start)||(sr))
               cpsel_pre <= 0;
            //else if ((index_en)||(lut0index_en)) begin
           `ifdef NUMCP3
            else if ((index_en)||(lut0index_en)||(lut0index_en_d2)) begin
           `else
            else if ((index_en)||(lut0index_en)||(lut0index_en_d1)) begin
           `endif  
               `ifdef NUMCP3
                  if (cpsel_pre==2)
                     cpsel_pre <= 0;
                  else
                     cpsel_pre <= cpsel_pre + 1;
               `else
                  `ifdef NUMCP2
                     if (cpsel_pre==1)
                        cpsel_pre <= 0;
                     else
                        cpsel_pre <= cpsel_pre + 1;
                  `endif
               `endif  
            end
         end
      end
   end
   else  begin
      always @( posedge clk or  negedge rstn ) begin
         if ( rstn == 1'b0)
            cpsel_pre <= 0;
         else if (ce) begin
            cpsel_pre <= 0;
         end
      end
   end
endgenerate

always @( posedge clk or  negedge rstn ) begin
   if ( rstn == 1'b0) begin
      for (i=0;i<=`LATENCY;i=i+1) begin
         indexd[i]    <= 0;
         index_end[i] <= 0;
      end 
   end 
   else if (ce) begin 
         indexd[0]    <= index;
         index_end[0] <= index_en;
         for (i=1;i<=`LATENCY;i=i+1) begin
            indexd[i]    <= indexd[i-1];
            index_end[i] <= index_end[i-1];
         end 
   end 
end
// =============================================================================
// din0,din1,din2 signal generation                                  
// =============================================================================
always @( posedge clk or  negedge rstn ) begin
   if ( rstn == 1'b0) begin
      dout0_d1 <= 0;
      dout1_d1 <= 0;
      dout2_d1 <= 0;
      golden_dout0_d1 <= 0;
      golden_dout1_d1 <= 0;
      golden_dout2_d1 <= 0;
      //din0 <= 0;
      //din1 <= 0;
      //din2 <= 0;
      golden_dout0 <= 0;
      golden_dout1 <= 0;
      golden_dout2 <= 0;
   end 
   else if (ce) begin 
      if (sr) begin
         dout0_d1 <= 0;
         dout1_d1 <= 0;
         dout2_d1 <= 0;
         golden_dout0_d1 <= 0;
         golden_dout1_d1 <= 0;
         golden_dout2_d1 <= 0;
         //din0 <= 0;
         //din1 <= 0;
         //din2 <= 0;
         golden_dout0 <= 0;
         golden_dout1 <= 0;
         golden_dout2 <= 0;
      end 
      else begin 
         dout0_d1 <= dout0;
         dout1_d1 <= dout1;
         dout2_d1 <= dout2;
         golden_dout0_d1 <= golden_dout0;
         golden_dout1_d1 <= golden_dout1;
         golden_dout2_d1 <= golden_dout2;
         //din0 <= mem_din0[index];
         //din1 <= mem_din1[index];
         //din2 <= mem_din2[index];
         golden_dout0 <= mem_dout0[indexo];
         golden_dout1 <= mem_dout1[indexo];
         golden_dout2 <= mem_dout2[indexo];
      end 
   end
end
// =============================================================================
// error_start  signal generation                                  
// =============================================================================
always @(posedge clk or negedge rstn) begin
   if ( rstn == 1'b0) begin
      error0  <= 1'b0; 
      error1  <= 1'b0; 
      error2  <= 1'b0; 
   end 
   else if (ce) begin
      if (sr) begin
         error0  <= 1'b0; 
         error1  <= 1'b0; 
         error2  <= 1'b0; 
      end 
      else begin 
         if ((index_eno)&&(ovalid)) begin 
            if (((dout0 == golden_dout0) &&(gcovalid)) || ((dout0 == ddel0) &&(!gcovalid)))
               error0  <= 1'b0; 
            else 
               error0  <= 1'b1; 
            if (((dout1 == golden_dout1) &&(gcovalid)) || ((dout1 == ddel1) &&(!gcovalid)))
               error1  <= 1'b0; 
            else 
               error1  <= 1'b1; 
            if (((dout2 == golden_dout2) &&(gcovalid)) || ((dout2 == ddel2) &&(!gcovalid)))
               error2  <= 1'b0; 
            else 
               error2  <= 1'b1; 
         end 
      end 
   end 
end

always @(posedge clk or negedge rstn) begin
   if ( rstn == 1'b0) begin
      num_errors_dout0  <= 0; 
      num_errors_dout1  <= 0; 
      num_errors_dout2  <= 0; 
   end 
   else if(ce)  begin
      if (sr) begin
         num_errors_dout0  <= 0; 
         num_errors_dout1  <= 0; 
         num_errors_dout2  <= 0; 
      end 
      else begin 
         if (error0 )
            num_errors_dout0   <= num_errors_dout0 + 1; 
         if (error1 )
            num_errors_dout1   <= num_errors_dout1 + 1; 
         if (error2 )
            num_errors_dout2   <= num_errors_dout2 + 1; 
      end 
   end 
end

// =============================================================================
// test end pulse                
// =============================================================================
always  @(index)begin  
   if (index==NUM_PIXELS) 
      tst_end_pulse = 1'b1;
   else
      tst_end_pulse = 1'b0;
end

// =============================================================================
// signal monitors                                             
// =============================================================================

always @(negedge rstn) begin // indication of the reset assertion and de-assertion to output
   $display ("RESET ASSERTED                  time %dns",$time);
   wait ( rstn)
   $display ("RESET DE-ASSERTED               time %dns",$time);
   $display ("****************************************************************************");
   $display ("****************************************************************************");
   `ifdef CORE_SIM
      $display ("** SIMULATION LEVEL--------------------------->CORE                       **");
   `endif
   `ifdef TOP_SIM
      $display ("** SIMULATION LEVEL--------------------------->TOP                        **");
   `endif
   `ifdef RTL_SIM
      $display ("** SIMULATION TYPE---------------------------->RTL                        **");
   `endif
   `ifdef SYNNET_SIM
      $display ("** SIMULATION TYPE---------------------------->SYNTHESIS GATE LEVEL       **");
   `endif
   `ifdef PARNET_SIM
      $display ("** SIMULATION TYPE---------------------------->PNR GATE LEVEL WITHOUT SDF **");
   `endif
   `ifdef TIMING_SIM
      $display ("** SIMULATION TYPE---------------------------->PNR GATE LEVEL WITH SDF    **");
   `endif
   $display ("****************************************************************************");
   $display ("****************************************************************************");
end 

always @(posedge clk ) begin
   if(ce)  begin
         if (error0 ) begin
            $display ("ERRORS in first  output color plane comparison starts at time %d ",$time);
            $display ("ACTUAL DATA  = %h  EXPECTED DATA  =%h TIME %d " ,dout0_d1,golden_dout0_d1,$time);
         end 
   end
end


   generate
   if (pinput_serial == 0) begin
   `ifdef NUMCP2
      always @(posedge clk ) begin
         if(ce)  begin
            if (error1 ) begin
               $display ("ERRORS in second output color plane comparison starts at time %d ",$time);
               $display ("ACTUAL DATA  = %h  EXPECTED DATA  =%h TIME %d " ,dout1_d1,golden_dout1_d1,$time);
            end 
         end
      end
   `endif
   `ifdef NUMCP3
      always @(posedge clk ) begin
         if(ce)  begin
            if (error2 ) begin
               $display ("ERRORS in third  output color plane comparison starts at time %d ",$time);
               $display ("ACTUAL DATA  = %h  EXPECTED DATA  =%h TIME %d " ,dout2_d1,golden_dout2_d1,$time);
            end 
         end
      end
   `endif
   end
   endgenerate

always  @(posedge tst_end_pulse  )begin  
   if ( num_errors_dout0 == 0 ) begin
      $display ("**************************************************************");
      $display ("******************DOUT0 TEST PASSED***************************");
      $display ("**************************************************************");
   end
   else begin
      $display ("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
      $display ("$$$$$$$$$$$$$$$$$$DOUT0 TEST FAILED$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
      $display ("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
   end
   $display ("At simulation time %d   NUM_ERRORS FOR DOUT0 are  %d",$time,num_errors_dout0);
   `ifndef INPUT_SERIAL
   `ifdef NUMCP2
   if ( num_errors_dout1 == 0 ) begin
      $display ("**************************************************************");
      $display ("******************DOUT1 TEST PASSED***************************");
      $display ("**************************************************************");
   end
   else begin
      $display ("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
      $display ("$$$$$$$$$$$$$$$$$$DOUT1 TEST FAILED$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
      $display ("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
   end
   $display ("At simulation time %d   NUM_ERRORS FOR DOUT1 are  %d",$time,num_errors_dout1);
   `endif 
   `ifdef NUMCP3
   if ( num_errors_dout2 == 0 ) begin
      $display ("**************************************************************");
      $display ("******************DOUT2 TEST PASSED***************************");
      $display ("**************************************************************");
   end
   else begin
      $display ("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
      $display ("$$$$$$$$$$$$$$$$$$DOUT2 TEST FAILED$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
      $display ("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
   end
   $display ("At simulation time %d   NUM_ERRORS FOR DOUT2 are  %d",$time,num_errors_dout2);
   `endif 
   `endif 

   $stop;
end

// =============================================================================
// dump file generation 
// =============================================================================
`ifdef VCD
   initial begin
      $dumpfile ("gamma_tb.dump");
      //$dumpvars(0,gamma_tb);
      $dumpvars ;
      //$recordfile("gamma_tb.trn");
      //$recordvars;
   end
`endif
// ====================================================================
// RANDOM NUMBER  FOR ce SIGNAL randomness
// ====================================================================
always @( posedge clk or negedge rstn) begin
   if ( rstn == 1'b0)
      shift_reg <= 16'b1;
   else begin
      if (sr)
         shift_reg <= 16'b1;
      else begin
         shift_reg[0] <= shift_reg[0] ^ shift_reg[1] ^ shift_reg[2]
              ^ shift_reg[4] ^ shift_reg[5] ^ shift_reg[6]
              ^ shift_reg[9] ^ shift_reg[14] ^ shift_reg[15];
         for ( j=0; j<=15; j= j+1) begin
            shift_reg[j+1] <= shift_reg[j];
         end
      end
   end
end

`ifdef CLKEN
   always @(*)
      ce = shift_reg[0] ;
`endif 

always @( posedge clk or  negedge rstn ) begin
   if ( rstn == 1'b0)
      sr_tb <= 0;
   else if (ce) begin 
      if (index == 5009) 
         sr_tb <= 1;
      else 
         sr_tb <= 0;
   end 
end

`ifdef SYNCRST
   always @(*)
      sr = sr_tb ;
`endif 

      always @(*)
      begin
         if (outvalid==1)
            $display("\n\t------------------ OUTVALID ASSERTED ---------------\n");  
      end


endmodule


