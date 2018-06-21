//////////////////////////////////////////////////////////////////////////////////
// Module Name:    i2c_ctrl 
// Description:    
// generate the instruction to config the  tvp5154/saa7129 devices iva I2C
// 0.1 --- December 18 2009 --- File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
module i2c_ctrl (
   input  wire       rst_n      ,
   input  wire       clk        ,
   output wire       config_done,
   output reg        cmd        ,
   output reg  [6:0] addr_dev   ,
   output reg  [7:0] addr_reg_H ,
   output reg  [7:0] addr_reg_L ,
   output reg  [7:0] data_wr_H  ,
   output reg  [7:0] data_wr_L  ,
   input  wire       data_rdy   ,
   input  wire [7:0] data_rd    ,
   input  wire       i2c_done   ,
   output reg        i2c_rqt

   )/* synthesis syn_preserve=1 */
   /* synthesis syn_hier = "hard" */;


   reg               i2c_done_s1;
   reg [11:0]         step_cnt;
   wire              i2c_done_neg;

   
   parameter  
      WRITE= 1,
      READ = 0;

   
   parameter ADDR_SENSOR  =7'h10;

   always@(posedge clk ) i2c_done_s1<=i2c_done;
   assign i2c_done_neg = !i2c_done && i2c_done_s1;
  
   always@(posedge clk or  negedge rst_n) begin
      if(!rst_n) begin
         i2c_rqt <= 0;
         step_cnt<=0;   
      end
      else if ( step_cnt<=84) begin // TBD: how many registers need to be configured.
        if(i2c_done_neg) begin
           step_cnt<=step_cnt+1; 
           i2c_rqt <= 1'b0;
        end
        else
           i2c_rqt <= 1'b1;
      end
      else if (i2c_done_neg)
         i2c_rqt <= 1'b0;
   end
   
assign config_done = (step_cnt==84);

// TBD: how many registers need to be configured. slave_addr=0x20 (write 8-bit) slave_addr=0x21 (read 8-bit)
// i2c write format: start slave_addr ACK reg_addr_byte1 ACK reg_addr_byte2 ACK write_data_byte1 ACK write_data_byte2 ACK stop
   always@(*) begin
         case( step_cnt)

             0:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h36; data_wr_H=8'h1B; end//external clock settings 27 MHz
             1:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h37; data_wr_H=8'h00; end

             2:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h01; data_wr_H=8'h00; end // Image Orientation  normal/normal
             3:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h05; data_wr_H=8'h01; end // Mask Corrupted Frames - On
             4:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h06; data_wr_H=8'h01; end // Fast Standby - On
             //Mystery Register
             5:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h45; addr_reg_L=8'h50; data_wr_H=8'h02; end //?????

             //MODE SETTINGS 1080P60
             6:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h14; data_wr_H=8'h03; end  // CSI Lane Mode -- 4 lanes
             7:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h20; data_wr_H=8'h00; end  // HDR mode - Normal
             8:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h21; data_wr_H=8'h11; end  // Resolution Reduction
             9:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h22; data_wr_H=8'h01; end  // Exposure Ratio

            10:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h40; data_wr_H=8'h04; end // Total number of lines per frame (16-bit) - divisable by 2
            11:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h41; data_wr_H=8'h5C; end // h45C = 1116
            12:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h42; data_wr_H=8'h13; end // Total number of pixels per line (16-bit) - divisable by 8
            13:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h43; data_wr_H=8'h88; end // h1388 = 5000
				
            //Imaging area
            14:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h44; data_wr_H=8'h00; end // X address start
            15:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h45; data_wr_H=8'hB8; end //
            16:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h46; data_wr_H=8'h01; end // Y addrss start
            17:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h47; data_wr_H=8'hE0; end //
            18:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h48; data_wr_H=8'h0F; end // X address end
            19:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h49; data_wr_H=8'hB7; end //
            20:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h4A; data_wr_H=8'h0A; end // Y address end
            21:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h4B; data_wr_H=8'h4F; end //
            //Subsampling
            22:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h81; data_wr_H=8'h01; end // X Increment for even pixels
            23:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h83; data_wr_H=8'h01; end // X Increment for odd pixels
            24:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h85; data_wr_H=8'h01; end // Y Incremetn for even pixels
            25:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h87; data_wr_H=8'h01; end // Y Increment for odd pixels
            //Binning
            26:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h09; addr_reg_L=8'h00; data_wr_H=8'h01; end // Binning Mode - Enable
            27:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h09; addr_reg_L=8'h01; data_wr_H=8'h22; end // Binning Type - 22 - V:1/2, H:1/2
            28:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h09; addr_reg_L=8'h02; data_wr_H=8'h02; end // Binning Weight - Bayer weighting 02
            //Data Format
            29:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h12; data_wr_H=8'h0A; end // OUTPUT SIZE SETTINGS - RAW10
            30:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h13; data_wr_H=8'h0A; end
            //Crop Size
            31:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h4C; data_wr_H=8'h07; end // Output X Crop Size   h0780 = 1920
            32:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h4D; data_wr_H=8'h80; end // 
            33:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h4E; data_wr_H=8'h04; end // Output Y Crop Size   h0438 = 1080
            34:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h4F; data_wr_H=8'h38; end //
				
            35:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h01; data_wr_H=8'h00; end // Scaling Mode - No scaling
            36:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h04; data_wr_H=8'h00; end // Down Scale Factor - 9-bit
            37:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h05; data_wr_H=8'h10; end // 
				
            38:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h08; data_wr_H=8'h00; end // Digital Crop X offset   
            39:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h09; data_wr_H=8'h00; end //
            40:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h0A; data_wr_H=8'h00; end // Digital Crop Y offset
            41:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h0B; data_wr_H=8'h00; end //
            42:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h0C; data_wr_H=8'h07; end // Digital Crop image width
            43:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h0D; data_wr_H=8'h80; end //
            44:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h0E; data_wr_H=8'h04; end // Digital Crop image height
            45:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h04; addr_reg_L=8'h0F; data_wr_H=8'h38; end //
		
            //CLOCK SETTING
            46:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h01; data_wr_H=8'h05; end // Video Timing Pixel Clock Divider 
            47:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h03; data_wr_H=8'h02; end // Video Timing System Clock Divider 
            48:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h05; data_wr_H=8'h04; end // Pre PLL clock divider
            49:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h06; data_wr_H=8'h00; end // PLL multiplier Value - 16-bit
            50:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h07; data_wr_H=8'h7C; end //
            51:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h09; data_wr_H=8'h0A; end // Output Pixel Clock Divider
            52:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h0B; data_wr_H=8'h01; end // Output Sys Clock Divider
            53:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h10; data_wr_H=8'h01; end // PLL mode - dual
            //Dual Mode Setting
            54:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h0D; data_wr_H=8'h08; end // Pre PLL Clk Op divider
            55:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h0E; data_wr_H=8'h00; end // PLL OP multiplier
            56:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h0F; data_wr_H=8'h6E; end //
					
            // Requested Link Bit Rate mbps
            57:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h08; addr_reg_L=8'h20; data_wr_H=8'h0B; end // Target Frequency 32-bit
            58:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h08; addr_reg_L=8'h21; data_wr_H=8'h9A; end
            59:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h08; addr_reg_L=8'h22; data_wr_H=8'h00; end
            60:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h08; addr_reg_L=8'h23; data_wr_H=8'h00; end
		
            61:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h0B; addr_reg_L=8'h06; data_wr_H=8'h01; end // Dynamic defect compensation -ENABLE 
            62:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h30; addr_reg_L=8'hA2; data_wr_H=8'h00; end // Chroma (and Luminance) Noise Reduction --off

            63:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h30; addr_reg_L=8'h13; data_wr_H=8'h00; end // STATS Data output - OFF
			
            64:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h02; data_wr_H=8'h04; end // Coarse INTEGRATION TIME  16-bit
            65:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h03; data_wr_H=8'h52; end //
            66:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h24; data_wr_H=8'h01; end // Direct short INTEGRATION TIME  16-bit
            67:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h25; data_wr_H=8'hF4; end //

            68:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h04; data_wr_H=8'h01; end // Analogue GAIN SETTINGS 
            69:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h05; data_wr_H=8'h80; end
            70:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h0E; data_wr_H=8'h03; end // Digital Gain Gr
            71:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h0F; data_wr_H=8'h00; end
            72:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h10; data_wr_H=8'h04; end // Digital Gain R
            73:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h11; data_wr_H=8'h80; end
            74:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h12; data_wr_H=8'h05; end // Digital Gain B
            75:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h13; data_wr_H=8'h00; end
            76:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h14; data_wr_H=8'h03; end // Digital Gain Gb
            77:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h15; data_wr_H=8'h00; end
            78:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h16; data_wr_H=8'h00; end // Short Analogue Gain
            79:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h02; addr_reg_L=8'h17; data_wr_H=8'h00; end

            80:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h50; addr_reg_L=8'h40; data_wr_H=8'h00; end // Clock Mode during Frame Blanking - stay in HS
            81:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h03; addr_reg_L=8'h50; data_wr_H=8'h00; end // Frame length control - auto frame length 
  
            82:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h08; addr_reg_L=8'h08; data_wr_H=8'h01; end // DPHY control : Use UI control
         
            83:   begin cmd=WRITE; addr_dev=ADDR_SENSOR; addr_reg_H=8'h01; addr_reg_L=8'h00; data_wr_H=8'h01; end // Start Streaming

            default:  begin ;end    
         endcase


   end                                                                                                      
                                                                                                            
                                                                                                            
endmodule                                                                                                   
                                                                                                            





















































































































































































































































































































































            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            