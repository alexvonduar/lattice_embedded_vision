//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
//   ------------------------------------------------------------------
//   Copyright (c) 2017 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement. 
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
//   --------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02 
//                  Singapore 307591
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   --------------------------------------------------------------------
//
module blanking_adjustment #(
	parameter rst_delay_msb = 15,
	parameter rst_delay_cyc = 'd17600    ,  
    parameter h_active      = 'd1920     ,
    parameter h_total       = 'd2200     ,
    parameter v_active      = 'd1080     ,
    parameter v_total       = 'd1125     ,
    parameter H_FRONT_PORCH =   'd88     ,
    parameter H_SYNCH       =   'd44     ,
    parameter H_BACK_PORCH  =  'd148     ,
    parameter V_FRONT_PORCH =    'd4     ,
    parameter V_SYNCH       =    'd5     
)
( 
    input                     rstn       , 
    input                     clk        , 
    output         reg        fv         , 
    output         reg        lv     
); 
 
    reg [11:0] pixcnt;   
    reg [11:0] linecnt;
    reg [11:0] fv_cnt;
    reg        q_fv;
    reg [rst_delay_msb:0]  rstn_cnt;
    
    always @(posedge clk or negedge rstn) 
       if (!rstn) 
             rstn_cnt <= 0;
       else
             rstn_cnt <= rstn_cnt[rst_delay_msb] ? rstn_cnt : rstn_cnt+1;
			 
	wire reset_n;
	
	assign reset_n = rstn_cnt[rst_delay_msb];
             
    always @(posedge clk or negedge reset_n) begin 
       if (!reset_n) begin 
       	  fv_cnt    <= 0;  
       	  pixcnt    <= 12'd0; 
       	  
       	  linecnt   <= 12'd0;
       	  
       	  lv        <= 1'b0;  
       	  fv        <= 1'b0;  
       	  q_fv      <= 0;                                    
           
       
       end                                   
       else begin 
          fv_cnt    <= (fv_cnt==11'h7FF)  ? 11'h7FF  : fv_cnt+ (~fv&q_fv);
          pixcnt    <= (pixcnt<h_total-1) ? pixcnt+1 : 0;  
                    
          linecnt   <= (linecnt==v_total-1 && pixcnt ==h_total-1)  ? 0         :  
                       (linecnt< v_total-1 && pixcnt ==h_total-1)  ? linecnt+1 : linecnt; 
       	            
       	  lv        <= (pixcnt>12'd0)   & (pixcnt<=h_active) & (linecnt> 0 & linecnt<=v_active); 
       	  fv        <= (linecnt>=12'd0) & (linecnt<=v_active+1);
       	  q_fv      <= fv; 
     	   
       end 
    end   
      
endmodule                  