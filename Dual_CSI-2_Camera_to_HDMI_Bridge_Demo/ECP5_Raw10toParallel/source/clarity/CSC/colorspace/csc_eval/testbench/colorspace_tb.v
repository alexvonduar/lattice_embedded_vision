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
// Project          : Color Space Converter
// File             : csc_tb.v
// Title            : top level testbench for  the CSC  .
// Dependencies     : 1. csc_params.v
// Description      : 
// =============================================================================
//                REVISION HISTORY
// Version          : 2.0
// Author(s)        : 
// Mod. Date        : April, 2011
// Changes Made     : 
// -----------------------------------------------------------------------------

`ifdef TIMING_SIM
        `timescale 1ns/100ps
`else
        `timescale 1ns/1ns
`endif

module colorspace_tb ;                                                              // testbench module name

`include "csc_params.v"

localparam  HALF_PERIOD                = 10 ;
localparam  WAIT_FOR_RST_INACTIVE      = HALF_PERIOD * 40;
localparam  MEM0_DEPTH                 = (INSERIAL == "Serial") ? NUM_PIXELS*3 : NUM_PIXELS; 
// =============================================================================
// internal signals  declarations 
// =============================================================================
reg [DINWIDTH-1:0]                           mem_din0[0:MEM0_DEPTH-1];  // first color plane data for input color space 
reg [DINWIDTH-1:0]                           mem_din1[0:NUM_PIXELS-1];  // second color plane data for input color space 
reg [DINWIDTH-1:0]                           mem_din2[0:NUM_PIXELS-1];  // third color plane data for input color space 
reg [DOUTWIDTH-1:0]                          mem_dout0[0:MEM0_DEPTH-1]; // first color plane data for output color space 
reg [DOUTWIDTH-1:0]                          mem_dout1[0:NUM_PIXELS-1]; // second color plane data for output color space 
reg [DOUTWIDTH-1:0]                          mem_dout2[0:NUM_PIXELS-1]; // third color plane data for output color space 
reg                                          clk;
reg                                          rstn;
reg                                          ce;
reg                                          sr;
reg                                          run_en;
reg                                          orun_en;
reg                                          complete;
reg                                          checked;
reg                                          error0;                    // Indicates the mismatch  in comparison for dout0
reg                                          error1;                    // Indicates the mismatch  in comparison for dout1
reg                                          error2;                    // Indicates the mismatch  in comparison for dout2
reg                                          tags_error;
reg [31:0]                                   error0_cnt;
reg [31:0]                                   error1_cnt;
reg [31:0]                                   error2_cnt;
reg [31:0]                                   tags_error_cnt;
reg [31:0]                                   pixelin_cnt;
reg [31:0]                                   pixelout_cnt;
reg [1:0]                                    iindex;
reg [1:0]                                    oindex;
reg [LATENCY+1:0]                            ovalid;
reg                                          outvalid_d1;
reg                                          outvalid_d2;
reg  [TAGSWIDTH-1:0]                         tags_in;
reg  [TAGSWIDTH-1:0]                         tags_out_exp [0:LATENCY-1];


wire                                         inpvalid;
wire [DINWIDTH-1:0]                          din0;                   
wire [DINWIDTH-1:0]                          din1;                   
wire [DINWIDTH-1:0]                          din2;                   

wire                                         outvalid;
wire [DOUTWIDTH-1:0]                         dout0;              
wire [DOUTWIDTH-1:0]                         dout1;              
wire [DOUTWIDTH-1:0]                         dout2;              
wire [DOUTWIDTH-1:0]                         dout0i;              
wire [DOUTWIDTH-1:0]                         dout1i;              
wire [DOUTWIDTH-1:0]                         dout2i;              
wire [DOUTWIDTH-1:0]                         ref_dout0;              
wire [DOUTWIDTH-1:0]                         ref_dout1;              
wire [DOUTWIDTH-1:0]                         ref_dout2;              
wire                                         gen_inp;
wire                                         ovalid0;
wire                                         ovalid1;
wire                                         ovalid2;
wire [TAGSWIDTH-1:0]                         tags_out;
// =============================================================================
// IP Top Level  module    
// =============================================================================
colorspace_top u1_colorspace_top(
                     .clk              (clk           ),
                     .din0             (din0          ),
                     .din1             (din1          ),
                     .din2             (din2          ),
                     .dout0            (dout0         ),
                     .dout1            (dout1         ),
                     .dout2            (dout2         ),
                     .rstn             (rstn          )
                    );

// =============================================================================
// alias of the ports
// =============================================================================
                    
// =============================================================================
// initialization for the signals 
// =============================================================================
initial begin
   clk = 1'b0;
   forever #HALF_PERIOD clk = ~clk;
end

initial begin
   read_data;
   var_init;
   async_reset(2);
   sync_reset(2);
   run_ctrl;
   check_result;
end


task read_data;
   begin
      if (INSERIAL == "Serial") begin
         $readmemh("din0.dat",   mem_din0);     
         $readmemh("dout0.dat",  mem_dout0);     
      end else begin
         $readmemh("din0.dat",   mem_din0);     
         $readmemh("dout0.dat",  mem_dout0);     
         $readmemh("din1.dat",   mem_din1);     
         $readmemh("dout1.dat",  mem_dout1);     
         $readmemh("din2.dat",   mem_din2);     
         $readmemh("dout2.dat",  mem_dout2);     
      end
   end
endtask

task var_init;
   begin
      clk               = 1'b0;
      rstn              = 1'b0;
      sr                = 1'b1;
      ce                = 1'b1;
      run_en            = 1'b0;
      complete          = 1'b0;
      checked           = 0;
   end
endtask

task async_reset;
   input [15:0] dc;
   begin
      # 1 rstn = 1'b0;
      repeat (dc) @ (posedge clk);
      #HALF_PERIOD rstn = 1'b1;
   end
endtask

task sync_reset;
   input [15:0] dc;
   begin
      # 1 sr = 1'b1;
      repeat (dc) @ (posedge clk);
      # 1 sr = 1'b0;
   end
endtask

task run_ctrl;
   begin
      run_en = 1'b0;
      orun_en = 1'b0;
      repeat (20) @(posedge clk);
      run_en = 1'b1;
      repeat (LATENCY) @(posedge clk);
      orun_en = 1'b1;
      if (INSERIAL == "Serial") begin
         wait (pixelin_cnt == NUM_PIXELS-1 && iindex == 2'b10 )
            @ (posedge clk);
            run_en = 1'b0;
         wait (pixelout_cnt == NUM_PIXELS-1 && oindex == 2'b10 )
            @ (posedge clk);
            orun_en = 1'b0;
      end else begin
         wait (pixelin_cnt == NUM_PIXELS-1)
            @ (posedge clk);
            run_en = 1'b0;
         wait (pixelout_cnt == NUM_PIXELS-1)
            @ (posedge clk);
            orun_en = 1'b0;
      end
   end
endtask

task check_result;
   begin
      checked = 0;
      if (INSERIAL == "Serial") begin
         wait (pixelout_cnt == NUM_PIXELS-1 && oindex == 2'b10 ) begin
            @ (posedge clk);
            if (error0_cnt==0 && error1_cnt==0 && error2_cnt==0 && tags_error_cnt==0) begin
               $display("");
               $display("=======================");
               $display("   Simulation passed!");
               $display("=======================");
               $display("");
            end else begin
               $display("");
               $display("<><><><><><><><><><><><");
               $display("   Simulation failed!");
               $display("<><><><><><><><><><><><");
               $display("");
            end
         end
      end else begin
         wait (pixelout_cnt == NUM_PIXELS-1) begin
            @ (posedge clk);
            if (error0_cnt==0 && error1_cnt==0 && error2_cnt==0 && tags_error_cnt==0 ) begin
               $display("");
               $display("=======================");
               $display("   Simulation passed!");
               $display("=======================");
               $display("");
            end else begin
               $display("");
               $display("<><><><><><><><><><><><");
               $display("   Simulation failed!");
               $display("<><><><><><><><><><><><");
               $display("");
            end
         end
      end
      checked = 1;
      delay(5);
      $finish;
   end
endtask

task delay;
   input [15:0] dc;
   begin
      repeat (dc) @ (posedge clk);
   end
endtask

integer k;
always @(posedge clk or negedge rstn) begin
   if (rstn == 1'b0) begin
      ovalid <= {(LATENCY+2){1'b0}};
      for (k=0; k<LATENCY; k=k+1) tags_out_exp[k] <= {{TAGSWIDTH}{1'b0}};
   end else if (ce) begin
      if (sr) begin
         ovalid <= {(LATENCY+2){1'b0}};
         for (k=0; k<LATENCY; k=k+1) tags_out_exp[k] <= {{TAGSWIDTH}{1'b0}};
      end else begin
         ovalid <= {ovalid[LATENCY:0],inpvalid};
         tags_out_exp[0] <= tags_in;
         for (k=1; k<LATENCY; k=k+1) tags_out_exp[k] <= tags_out_exp[k-1];
      end
   end
end

generate begin : INSIG
   if (INSERIAL == "Serial") begin : SERL
       assign inpvalid  = (iindex==2'b00 && run_en==1'b1)? 1'b1 : 1'b0;
       always @(posedge clk or negedge rstn) begin
          if (rstn == 1'b0) begin
             iindex <= 2'b00;
             pixelin_cnt <= {32{1'b0}};
          end else if (ce) begin
             if (sr) begin
                iindex <= 2'b00;
                pixelin_cnt <= {32{1'b0}};
             end else if (run_en) begin
                iindex <= (iindex == 2'b10)? 2'b00 : (iindex + 1);
                pixelin_cnt <= (iindex == 2'b10)? (pixelin_cnt + 1) : pixelin_cnt;
             end else begin
                iindex <= 2'b00;
             end
          end
       end
       assign din0  = mem_din0[pixelin_cnt*3+iindex];
   end else begin : PARAL
       assign inpvalid  = run_en;
       always @(posedge clk or negedge rstn) begin
          if (rstn == 1'b0) begin
             pixelin_cnt <= {32{1'b0}};
          end else if (ce) begin
             if (sr) begin
                pixelin_cnt <= {32{1'b0}};
             end else if (run_en) begin
                pixelin_cnt <= pixelin_cnt + 1 ;
             end
          end
       end
       assign din0  = mem_din0[pixelin_cnt];
       assign din1  = mem_din1[pixelin_cnt];
       assign din2  = mem_din2[pixelin_cnt];
   end

   always @(posedge clk or negedge rstn) begin
      if (rstn == 1'b0) begin
         tags_in <= {{TAGSWIDTH}{1'b0}};
      end else if (ce) begin
         if (sr) begin
            tags_in <= {{TAGSWIDTH}{1'b0}};
         end else if (run_en) begin
            tags_in <= tags_in + 1;
         end
      end
   end

end
endgenerate

generate begin : OUTSIG
   if (INSERIAL == "Serial") begin : SERL
         always @(posedge clk or negedge rstn) begin
            if (rstn == 1'b0) begin
               oindex <= 2'b00;
               pixelout_cnt <= {32{1'b0}};
            end else if (ce) begin
               if (sr) begin
                  oindex <= 2'b00;
                  pixelout_cnt <= {32{1'b0}};
               end else if(orun_en) begin
                  oindex <= (oindex == 2'b10)? 2'b00 : (oindex + 1);
                  pixelout_cnt <= (oindex == 2'b10) ? (pixelout_cnt + 1) : pixelout_cnt;
               end else begin
                  oindex <= 2'b00;
               end
            end
         end

       if (IOVALID == 1) begin 
          always @(posedge clk or negedge rstn) begin
            if (rstn == 1'b0) begin
               outvalid_d1 <= 1'b0;
               outvalid_d2 <= 1'b0;
            end else if (ce) begin
               if (sr) begin
                  outvalid_d1 <= 1'b0;
                  outvalid_d2 <= 1'b0;
               end else begin
                  outvalid_d1 <= outvalid;
                  outvalid_d2 <= outvalid_d1;
               end
            end
         end
         assign ovalid0   = outvalid;
         assign ovalid1   = outvalid_d1;
         assign ovalid2   = outvalid_d2;
      end else begin
         assign ovalid0    = ovalid[LATENCY-1];
         assign ovalid1    = ovalid[LATENCY];
         assign ovalid2    = ovalid[LATENCY+1];
      end

      assign ref_dout0 = mem_dout0[pixelout_cnt*3+oindex];
      assign dout0i    = dout0;   
      assign dout1i    = dout0;   
      assign dout2i    = dout0;   

   end else begin : PARAL
      always @(posedge clk or negedge rstn) begin
         if (rstn == 1'b0) begin
            pixelout_cnt <= {32{1'b0}};
         end else if (ce) begin
            if (sr) begin
               pixelout_cnt <= {32{1'b0}};
            end else if(orun_en) begin
               pixelout_cnt <= pixelout_cnt + 1;
            end
         end
      end

      if (IOVALID == 1) begin
         assign ovalid0 = outvalid;
         assign ovalid1 = outvalid;
         assign ovalid2 = outvalid;
      end else begin
         assign ovalid0    = ovalid[LATENCY-1];
         assign ovalid1    = ovalid[LATENCY-1];
         assign ovalid2    = ovalid[LATENCY-1];
      end

      assign ref_dout0 = mem_dout0[pixelout_cnt];
      assign ref_dout1 = mem_dout1[pixelout_cnt];
      assign ref_dout2 = mem_dout2[pixelout_cnt];
      assign dout0i    = dout0;   
      assign dout1i    = dout1;   
      assign dout2i    = dout2;   
   end
end
endgenerate

generate begin : COMPARE
// ====================================================================
// Data Ouput related tests
// ====================================================================
   if (INSERIAL == "Serial") begin : SERL
      always @(posedge clk or negedge rstn) begin
         if (rstn == 1'b0) begin
            error0 <= 1'b0;
            error0_cnt <= {32{1'b0}};
            tags_error <= 1'b0;
            tags_error_cnt <= {32{1'b0}};
         end else if (ce) begin
            if (sr) begin
               error0 <= 1'b0;
               error0_cnt <= {32{1'b0}};
               tags_error <= 1'b0;
               tags_error_cnt <= {32{1'b0}};
            end else if (ovalid0) begin
               if (dout0i != ref_dout0) begin
                  error0 <= 1'b1;
                  error0_cnt <= error0_cnt + 1;
                  $display("First  Color ERROR! Actual data = %h   Expect data = %h   At time %d", dout0i, ref_dout0, $time);
               end
               if (VSSCORE == 1) begin
                  if (tags_out_exp[LATENCY-1] != tags_out) begin
                     tags_error <= 1'b0;
                     tags_error_cnt <= tags_error_cnt + 1;
                     $display ("VSS CORE : TAGSOUT ERROR");
                  end
               end
            end
         end
      end

      always @(posedge clk or negedge rstn) begin
         if (rstn == 1'b0) begin
            error1 <= 1'b0;
            error1_cnt <= {32{1'b0}};
         end else if (ce) begin
            if (sr) begin
               error1 <= 1'b0;
               error1_cnt <= {32{1'b0}};
            end else if (ovalid1) begin
               if (dout1i != ref_dout0) begin
                  error1 <= 1'b1;
                  error1_cnt <= error1_cnt + 1;
                  $display("Second Color ERROR! Actual data = %h   Expect data = %h   At time %d", dout1i, ref_dout0, $time);
               end
            end
         end
      end

      always @(posedge clk or negedge rstn) begin
         if (rstn == 1'b0) begin
            error2 <= 1'b0;
            error2_cnt <= {32{1'b0}};
         end else if (ce) begin
            if (sr) begin
               error2 <= 1'b0;
               error2_cnt <= {32{1'b0}};
            end else if (ovalid2) begin
               if (dout2i != ref_dout0) begin
                  error2 <= 1'b1;
                  error2_cnt <= error2_cnt + 1;
                  $display("Third  Color ERROR! Actual data = %h   Expect data = %h   At time %d", dout2i, ref_dout0, $time);
               end
            end
         end
      end

   end else begin : PARAL
      always @(posedge clk or negedge rstn) begin
         if (rstn == 1'b0) begin
            error0 <= 1'b0;
            error0_cnt <= {32{1'b0}};
            error1 <= 1'b0;
            error1_cnt <= {32{1'b0}};
            error2 <= 1'b0;
            error2_cnt <= {32{1'b0}};
            tags_error <= 1'b0;
            tags_error_cnt <= {32{1'b0}};
         end else if (ce) begin
            if (sr) begin
               error0 <= 1'b0;
               error0_cnt <= {32{1'b0}};
               error1 <= 1'b0;
               error1_cnt <= {32{1'b0}};
               error2 <= 1'b0;
               error2_cnt <= {32{1'b0}};
               tags_error <= 1'b0;
               tags_error_cnt <= {32{1'b0}};
            end else if (ovalid0) begin
               if (dout0i != ref_dout0) begin
                  error0 <= 1'b1;
                  error0_cnt <= error0_cnt + 1;
                  $display("First  Color ERROR! Actual data = %h   Expect data = %h   At time %d", dout0i, ref_dout0, $time);
               end
               if (dout1i != ref_dout1) begin
                  error1 <= 1'b1;
                  error1_cnt <= error1_cnt + 1;
                  $display("Second Color ERROR! Actual data = %h   Expect data = %h   At time %d", dout1i, ref_dout1, $time);
               end
               if (dout2i != ref_dout2) begin
                  error2 <= 1'b1;
                  error2_cnt <= error2_cnt + 1;
                  $display("Third  Color ERROR! Actual data = %h   Expect data = %h   At time %d", dout2i, ref_dout2, $time);
               end
               if (VSSCORE == 1) begin
                  if (tags_out_exp[LATENCY-1] != tags_out) begin
                     tags_error <= 1'b0;
                     tags_error_cnt <= tags_error_cnt + 1;
                     $display ("VSS CORE : TAGSOUT ERROR");
                  end
               end
            end
         end
      end
   end

end
endgenerate

endmodule
