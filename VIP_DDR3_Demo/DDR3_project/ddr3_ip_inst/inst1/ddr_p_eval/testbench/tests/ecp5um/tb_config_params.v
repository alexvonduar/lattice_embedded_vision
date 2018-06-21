
`ifdef inst1_DELAY_0  // values 0,1,2,10,50
   `define inst1_DELAY 0
`else
   `ifdef inst1_DELAY_2
      `define inst1_DELAY 2
   `else
      `ifdef inst1_DELAY_10
         `define inst1_DELAY 10
      `else
         `ifdef inst1_DELAY_50
            `define inst1_DELAY 50
         `else
            `define inst1_DELAY 1
         `endif
      `endif
   `endif
`endif

`ifdef inst1_FLY_BY_DEL_2000
  `define inst1_FULL_FLY_BY_DEL 2000
`elseif FLY_BY_DEL_1500
  `define inst1_FULL_FLY_BY_DEL 1500
`else
`define inst1_FULL_FLY_BY_DEL 1000
`endif

`ifdef inst1_RDIMM
  `ifdef inst1_NO_WRITE_LEVEL
     `define inst1_FBY_TRC_DQS8 0 
     `define inst1_FBY_TRC_DQS3 0
     `define inst1_FBY_TRC_DQS2 0
     `define inst1_FBY_TRC_DQS1 0
     `define inst1_FBY_TRC_DQS0 0

     `define inst1_FBY_TRC_DQS4 0
     `define inst1_FBY_TRC_DQS5 0
     `define inst1_FBY_TRC_DQS6 0
     `define inst1_FBY_TRC_DQS7 0

     `define inst1_FBY_TRC_DQS17 0 
     `define inst1_FBY_TRC_DQS12 0 
     `define inst1_FBY_TRC_DQS11 0 
     `define inst1_FBY_TRC_DQS10 0 
     `define inst1_FBY_TRC_DQS9 0 

     `define inst1_FBY_TRC_DQS13 0 
     `define inst1_FBY_TRC_DQS14 0 
     `define inst1_FBY_TRC_DQS15 0 
     `define inst1_FBY_TRC_DQS16 0 

  `else

     `ifdef inst1_x4

       `define inst1_FBY_TRC_DQS0 520 
       `define inst1_FBY_TRC_DQS1 400 
       `define inst1_FBY_TRC_DQS2 270 
       `define inst1_FBY_TRC_DQS3 200 

       `define inst1_FBY_TRC_DQS4 200 
       `define inst1_FBY_TRC_DQS5 270 
       `define inst1_FBY_TRC_DQS6 400 
       `define inst1_FBY_TRC_DQS7 520 

       `define inst1_FBY_TRC_DQS8 520 
       `define inst1_FBY_TRC_DQS9 400 
       `define inst1_FBY_TRC_DQS10 270 
       `define inst1_FBY_TRC_DQS11 200 

       `define inst1_FBY_TRC_DQS12 200 
       `define inst1_FBY_TRC_DQS13 270 
       `define inst1_FBY_TRC_DQS14 400 
       `define inst1_FBY_TRC_DQS15 520 
       `define inst1_FBY_TRC_DQS16 520 
       `define inst1_FBY_TRC_DQS17 520 

     `else
       `define inst1_FBY_TRC_DQS0 520 
       `define inst1_FBY_TRC_DQS1 400 
       `define inst1_FBY_TRC_DQS2 270 
       `define inst1_FBY_TRC_DQS3 200 

       `define inst1_FBY_TRC_DQS4 200 
       `define inst1_FBY_TRC_DQS5 270 
       `define inst1_FBY_TRC_DQS6 400 
       `define inst1_FBY_TRC_DQS7 520 
       `define inst1_FBY_TRC_DQS8 520 
     `endif

  `endif

`else // UDIMM

// x4
`define inst1_FBY_TRC_DQS9 0
`define inst1_FBY_TRC_DQS10 0
`define inst1_FBY_TRC_DQS11 0
`define inst1_FBY_TRC_DQS12 0
`define inst1_FBY_TRC_DQS13 0
`define inst1_FBY_TRC_DQS14 0
`define inst1_FBY_TRC_DQS15 0
`define inst1_FBY_TRC_DQS16 0
`define inst1_FBY_TRC_DQS17 0 

  `ifdef inst1_NO_WRITE_LEVEL
     `define inst1_FBY_TRC_DQS0 0
     `define inst1_FBY_TRC_DQS1 0
     `define inst1_FBY_TRC_DQS2 0
     `define inst1_FBY_TRC_DQS3 0
     `define inst1_FBY_TRC_DQS4 0
     `define inst1_FBY_TRC_DQS5 0
     `define inst1_FBY_TRC_DQS6 0
     `define inst1_FBY_TRC_DQS7 0
     `define inst1_FBY_TRC_DQS8 0 
  `else
      `ifdef inst1_FBY_TRC_DQS_50
         `define inst1_FBY_TRC_DQS0 65
         `define inst1_FBY_TRC_DQS1 65
         `define inst1_FBY_TRC_DQS2 65 
         `define inst1_FBY_TRC_DQS3 65
         `define inst1_FBY_TRC_DQS4 65 
         `define inst1_FBY_TRC_DQS5 65
         `define inst1_FBY_TRC_DQS6 65
         `define inst1_FBY_TRC_DQS7 65
         `define inst1_FBY_TRC_DQS8 65
     `else
         `define inst1_FBY_TRC_DQS0 (`inst1_FULL_FLY_BY_DEL * 0.461)   //TL1 
         `define inst1_FBY_TRC_DQS1 (`inst1_FULL_FLY_BY_DEL * 0.077)   //TL2 
         `define inst1_FBY_TRC_DQS2 (`inst1_FULL_FLY_BY_DEL * 0.077)   //TL3 
         `define inst1_FBY_TRC_DQS3 (`inst1_FULL_FLY_BY_DEL * 0.077)   //TL4 
         `define inst1_FBY_TRC_DQS4 (`inst1_FULL_FLY_BY_DEL * 0.077)   //TL5 
         `define inst1_FBY_TRC_DQS5 (`inst1_FULL_FLY_BY_DEL * 0.077)   //TL6 
         `define inst1_FBY_TRC_DQS6 (`inst1_FULL_FLY_BY_DEL * 0.077)   //TL7 
         `define inst1_FBY_TRC_DQS7 (`inst1_FULL_FLY_BY_DEL * 0.077)   //TL8 
         `define inst1_FBY_TRC_DQS8 (`inst1_FULL_FLY_BY_DEL * 0.077)   //TL9 
     `endif
  `endif //NO_WRITE_LEVEL
`endif // UDIMM

`define inst1_RD_Tstaoff 2200
`define inst1_RD_tPDM 650
