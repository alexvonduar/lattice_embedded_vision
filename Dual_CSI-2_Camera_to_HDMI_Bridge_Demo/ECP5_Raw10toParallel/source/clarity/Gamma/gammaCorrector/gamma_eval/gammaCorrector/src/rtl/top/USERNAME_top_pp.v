#include <orcapp_head>
module USERNAME_top (
   //=====INPUTS
   clk,                 // system clock  
   rstn,                // system reset
   #ifdef CLKEN
      ce,               // clock enable
   #endif
   #ifdef SYNCRST
      sr,               // synchronous reset 
   #endif
   #ifdef BYPASSEN
      gcen,             // gamma enable 
   #endif
   inpvalid,            // input data valid signal
   din0,                // first  input color plane 
   #ifdef LUT0WRITEPORT
      lut0wren,         // first color plane LUT write enable 
      lut0val,          // first color plane LUT write value
   #endif 
   #ifdef INPUT_SERIAL 
      cpsel,            // color plane select for the inputs
   #endif 
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         din1,          // second input color plane 
         #ifdef LUT1WRITEPORT
            lut1wren,   // second color plane LUT write enable 
            lut1val,    // second color plane LUT write value
         #endif 
      #endif 
      #ifdef NUMCP3
         din2,          // third  input color plane 
         #ifdef LUT2WRITEPORT
            lut2wren,   // third color plane LUT write enable 
            lut2val,    // third color plane LUT write value
         #endif 
      #endif 
   #endif 
   
   //=====OUTPUTS
   #ifdef BYPASSEN
      gcvalid,          // valid gamma correction output indicator 
   #endif
   outvalid,            // output data valid signal
   #ifdef INPUT_SERIAL 
      cpout,            // color plane select for the outputs
   #endif 
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         dout1,         // second output color plane 
      #endif 
      #ifdef NUMCP3
         dout2,         // third  output color plane 
      #endif 
   #endif 
   dout0                // first  output color plane 
);

// ------------ input ports
   input                                     clk;
   input                                     rstn;
   #ifdef CLKEN
      input                                  ce;
   #endif
   #ifdef SYNCRST
      input                                  sr;
   #endif
   #ifdef BYPASSEN
      input                                  gcen;
   #endif
   input                                     inpvalid;
   input  [DATA0_WIDTH-1:0]                 din0;
   #ifdef LUT0WRITEPORT
      input                                  lut0wren;
      input  [DATA0_WIDTH-1:0]              lut0val;
   #endif
   #ifdef INPUT_SERIAL 
      input  [CPSEL_WIDTH-1:0]              cpsel;
   #endif
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         input  [DATA1_WIDTH-1:0]           din1;
         #ifdef LUT1WRITEPORT
            input                            lut1wren;
            input  [DATA1_WIDTH-1:0]        lut1val;
         #endif
      #endif 
      #ifdef NUMCP3
         input  [DATA2_WIDTH-1:0]           din2;
         #ifdef LUT2WRITEPORT
            input                            lut2wren;
            input  [DATA2_WIDTH-1:0]        lut2val;
         #endif
      #endif 
   #endif

// ------------ output ports
   #ifdef BYPASSEN
      output                                 gcvalid;
   #endif
   output                                    outvalid;
   output [DATA0_WIDTH-1:0]                 dout0;
   #ifdef INPUT_SERIAL 
      output [CPSEL_WIDTH-1:0]              cpout;
   #endif
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         output  [DATA1_WIDTH-1:0]          dout1;
      #endif 
      #ifdef NUMCP3
         output  [DATA2_WIDTH-1:0]          dout2;
      #endif 
   #endif

wire clkin;

//-------Add PLL Instance for timing simulation--------------------------
#ifdef DEVICE_ECP5
// ecp5_pll  u1_pll(                  
//          .CLKI               (clk),
//          .RST                (0),
//          .CLKOP              (clkin),
//          .LOCK               ()
//          );  
#endif
#ifndef DEVICE_ECP5
// ecp3_pll  u1_pll(                  
//          .CLK                (clk),
//          .RESET              (0),
//          .CLKOP              (clkin),
//          .LOCK               ()
//          );  
#endif


USERNAME u1_USERNAME (
   //=====INPUTS
//   .clk              (clkin),               // system clock (for timing simulation)  
   .clk              (clk),                 // system clock  
   .rstn             (rstn),                // system reset
   #ifdef CLKEN
      .ce            (ce),                  // clock enable
   #endif
   #ifdef SYNCRST
      .sr            (sr),                  // synchronous reset 
   #endif
   #ifdef BYPASSEN
      .gcen          (gcen),                // gamma enable 
   #endif
   .inpvalid         (inpvalid),            // input data valid signal
   .din0             (din0),                // first  input color plane 
   #ifdef LUT0WRITEPORT
      .lut0wren      (lut0wren),            // first color plane LUT write enable 
      .lut0val       (lut0val) ,            // first color plane LUT write value
   #endif 
   #ifdef INPUT_SERIAL 
      .cpsel         (cpsel),               // color plane select for the inputs
   #endif 
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         .din1       (din1),                // second input color plane 
         #ifdef LUT1WRITEPORT
            .lut1wren(lut1wren),            // second color plane LUT write enable 
            .lut1val (lut1val),             // second color plane LUT write value
         #endif 
      #endif 
      #ifdef NUMCP3
         .din2       (din2),                // third  input color plane 
         #ifdef LUT2WRITEPORT
            .lut2wren(lut2wren),            // third color plane LUT write enable 
            .lut2val (lut2val),             // third color plane LUT write value
         #endif 
      #endif 
   #endif 
   
   //=====OUTPUTS
   #ifdef BYPASSEN
      .gcvalid       (gcvalid),             // valid gamma correction output indicator 
   #endif
   .outvalid         (outvalid),            // output data valid signal
   #ifdef INPUT_SERIAL 
      .cpout         (cpout),               // color plane select for the outputs
   #endif 
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         .dout1      (dout1),               // second output color plane 
      #endif 
      #ifdef NUMCP3
         .dout2      (dout2),               // third  output color plane 
      #endif 
   #endif 
   .dout0            (dout0)                // first  output color plane 
);
endmodule
