//------------------------------------------------
// USERNAME module instantiation template
//------------------------------------------------
#include <orcapp_head>
USERNAME u1_USERNAME (
   //=====INPUTS
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
