//////////////////////////////////////////////////////////////////////////////////
// Company: Axelsys
// Author:  Vico Ou
// Module Name:    i2c_top 
// Description:    
//  i2c top module
// 0.1 --- Auguest 30,2009 --- File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
module hdmi_i2c_top (
   input  wire       rst_n,
   input  wire       clk, 
   inout  wire       scl,
   inout  wire       sda,
   output wire  	 config_done
   );

   wire       i2c_done;
   wire        cmd;
   wire [6:0]  addr_dev;
   wire [7:0]  addr_reg_H;
   wire [7:0]  addr_reg_L;
   wire [7:0]  data_wr_H;
   wire [7:0]  data_wr_L;
   wire [7:0]  data_rd;
   wire        i2c_rqt;
   

   hdmi_i2c_ctrl hdmi_i2c_ctrl_inst (     
      .rst_n         (rst_n       ),
      .clk           ( clk        ),
      .config_done   (config_done ),
      .cmd           (cmd         ),
      .addr_dev      (addr_dev    ),
      .addr_reg_H    (addr_reg_H  ),
      .addr_reg_L    (addr_reg_L  ),
      .data_wr_H     (data_wr_H   ),
      .data_wr_L     (data_wr_L   ),
      .data_rdy      (data_rdy    ),
      .data_rd       (data_rd     ),
      .i2c_done      (i2c_done    ),
      .i2c_rqt       (i2c_rqt     )    
        );
   
   hdmi_i2c_core hdmi_i2c_core_inst ( 
      .rst_n            (rst_n      ),                             
      .clk              ( clk       ),                                
      .scl              (scl        ),                                 
      .sda              (sda        ),                                 
      .i2c_rqt          (i2c_rqt    ),                     
      .cmd              (cmd        ),                             
      .addr_dev         (addr_dev   ),                   
      .addr_reg_H       (addr_reg_H ),               // addr_reg_H     
      .addr_reg_L       (addr_reg_L ),               // addr_reg_L
      .data_wr_H        (data_wr_H  ),               // data_wr_H      
      .data_wr_L        (data_wr_L  ),               // data_wr_L
      .data_rd          (data_rd    ),                         
      .data_rdy         (data_rdy   ),                       
      .i2c_done         (i2c_done   )                        
        );                                       
		
assign i2c_data_rd= data_rd;

endmodule
 