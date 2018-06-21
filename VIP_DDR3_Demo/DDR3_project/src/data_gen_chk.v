// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2011 (c) Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorised by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement from
// Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                            408-826-6000 (other locations)
// Hillsboro, OR 97124                     web  : http://www.latticesemi.com/
// U.S.A                                   email: techsupport@lscc.com
// =============================================================================
//                         FILE DETAILS
// Project          : DDR3 IOPB Demo 
// File             : data_gen_chk.v 
// Title            : data_gen_chk
// Dependencies     : 
// Description      : data generator checker block
//            
//
// =============================================================================
//                        REVISION HISTORY
// Version          : 1.0
// Author(s)        : Kyoho Lee/ LSV Apps
// Mod. Date        : February, 2011
// Changes Made     :
//
// =============================================================================

`timescale 1 ns / 100 ps
`include "ddr3_test_params.v"
`include "ddr3_sdram_mem_params_inst1.v"

module data_gen_chk 
(
//---------inputs-------------
    sclk,
    reset_n,
    datain_rdy,
    clr_gen,
    load_en,
    read_data,
    read_data_valid,
    Data_Mode,
             
//---------outputs-------------
    curr_data,
    byte_ok,
    dqs_ok
    );


// ==============================================================================
// define all inputs / outputs
// ==============================================================================
input                       sclk;
input                       reset_n;
input                       datain_rdy;
input                       clr_gen;
input                       load_en;
input   [`inst1_DSIZE-1:0]        read_data;
input                       read_data_valid;
input                       Data_Mode;

output  [`inst1_DSIZE-1:0]        curr_data;
output  [`inst1_DSIZE/8-1:0]      byte_ok;
output  [`inst1_DATA_WIDTH/8-1:0] dqs_ok;

// ==============================================================================
// internal signals
// ==============================================================================
reg     [`inst1_DSIZE-1:0]        curr_data;
reg     [`inst1_DSIZE-1:0]        exp_data0;
reg     [`inst1_DSIZE-1:0]        exp_data;
reg     [`inst1_DSIZE-1:0]        read_data_d;
reg                         read_data_valid_d;
reg     [`inst1_DSIZE/8-1:0]      byte_ok;
wire    [`inst1_DATA_WIDTH/8-1:0] dqs_ok;
`ifdef DATA_SIZE_8
 wire   [31:0]              prbs32, prbs32e;
`else
 wire   [127:0]             prbs128,prbs128e;
`endif
reg   [31:0]                seqd32,seqd32e;


// ==============================================================================
// Write_data generator
// 
// *** Data_Mode
//      1 : prbs mode       64: 128b x2, 32: 128b x1, 16: 1/2 128b, 8: 32b x1 
//      0 : sequential mode 64: 32b x8,  32: 32b x4,  16: 32b x1,   8: 32b x1
// ==============================================================================

`ifdef inst1_DATA_SIZE_64
 always @( * ) begin
    if (Data_Mode) begin
        curr_data   =   {prbs128,prbs128};
    end
    else begin
        curr_data   =   {seqd32,seqd32,seqd32,seqd32,seqd32,seqd32,seqd32,seqd32};
    end
 end
`endif

`ifdef inst1_DATA_SIZE_32
 always @( * ) begin
    if (Data_Mode) begin
        curr_data   =   prbs128;
    end
    else begin
        curr_data   =   {seqd32,seqd32,seqd32,seqd32};
    end
 end
`endif

/*

reg [63:0] count,count_read;

always @(posedge sclk or negedge reset_n)
	if(!reset_n)
		count <= 0;
	else if(count == 64'h0000000000FFFFFF)
		count <= 0;
	else if(datain_rdy)
		count <= count+1;
	else 
		count <= count;
		
		


always @(posedge sclk or negedge reset_n)
	if(!reset_n)
		count_read <= 0;
	else if(count_read == 64'h0000000000FFFFFF)
		count_read <= 0;
	else if(read_data_valid)
		count_read <= count+1;
	else 
		count_read <= count;

*/




`ifdef inst1_DATA_SIZE_16
 always @( * ) begin
    if (Data_Mode) begin
        curr_data   = prbs128[63:0] ;// count;  // 64'h0A0A0A0A0A0A0A0A;// prbs128[63:0];
    end
    else begin
        curr_data   =  {seqd32,seqd32};// count; //64'h0A0A0A0A0A0A0A0A;// {seqd32,seqd32};
    end
 end
`endif

`ifdef inst1_DATA_SIZE_8
 always @( * ) begin
    if (Data_Mode) begin
        curr_data   =   prbs32;
    end
    else begin
        curr_data   =   seqd32;
    end
 end
`endif


`ifdef inst1_DATA_SIZE_8
// ==============================================================================
// 32-bit PRBS data generator
// ==============================================================================
lfsr32 U_lfsr32 (
    .clk(sclk),
    .resetn(reset_n),
    .enable(datain_rdy),
    .clear(clr_gen),
    .load(load_en),
    .din(32'h0),
    .q(prbs32)
    );
`else
// ==============================================================================
// 128-bit PRBS data generator
// ==============================================================================
lfsr128 U_lfsr128 (
    .clk(sclk),
    .resetn(reset_n),
    .enable(datain_rdy),
    .clear(clr_gen),
    .load(load_en),
    .din(128'h0),
    .q(prbs128)
    );
`endif
 
// ==============================================================================
// 32-bit Sequential data generator
// ==============================================================================
always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        seqd32  <=  32'b0;
    end
    else if (clr_gen) begin
        seqd32  <=  32'b0;
    end
    else if (datain_rdy) begin
        seqd32  <=  seqd32 + 1;
    end
end     

// ==============================================================================
// Data checker block
// - generates the expected data patterns the same way as the data generator
// ==============================================================================

`ifdef inst1_DATA_SIZE_64
 always @( * ) begin
    if (Data_Mode) begin
        exp_data0   =   {prbs128e,prbs128e};
    end
    else begin
        exp_data0   =   {seqd32e,seqd32e,seqd32e,seqd32e,seqd32e,seqd32e,seqd32e,seqd32e};
    end
 end
`endif


`ifdef inst1_DATA_SIZE_32
 always @( * ) begin
    if (Data_Mode) begin
        exp_data0   =   prbs128e;
    end
    else begin
        exp_data0   =   {seqd32e,seqd32e,seqd32e,seqd32e};
    end
 end
`endif


`ifdef inst1_DATA_SIZE_16
 always @( * ) begin
    if (Data_Mode) begin
        exp_data0   =  prbs128e[63:0]; // count_read;// prbs128e[63:0];
    end
    else begin
        exp_data0   =  {seqd32e,seqd32e};//  count_read;//{seqd32e,seqd32e};
    end
 end
`endif


`ifdef inst1_DATA_SIZE_8
 always @( * ) begin
    if (Data_Mode) begin
        exp_data0   =   prbs32e;
    end
    else begin
        exp_data0   =   seqd32e;
    end
 end
`endif

`ifdef inst1_DATA_SIZE_8
// ==============================================================================
// 32-bit PRBS expected data generator
// ==============================================================================
lfsr32 U_lfsr32exp (
    .clk(sclk),
    .resetn(reset_n),
    .enable(read_data_valid),
    .clear(clr_gen),
    .load(load_en),
    .din(32'h0),
    .q(prbs32e)
    );
`else
// ==============================================================================
// 128-bit PRBS expected data generator
// ==============================================================================
lfsr128 U_lfsr128exp (
    .clk(sclk),
    .resetn(reset_n),
    .enable(read_data_valid),
    .clear(clr_gen),
    .load(load_en),
    .din(128'h0),
    .q(prbs128e)
    );
`endif

// ==============================================================================
// 32-bit Sequential expected data generator
// ==============================================================================
always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        seqd32e     <=  32'b0;
    end
    else if (clr_gen) begin
        seqd32e     <=  32'b0;
    end
    else if (read_data_valid) begin
        seqd32e     <=  seqd32e + 1;
    end
end     


// ==============================================================================
// Data comparator
// ==============================================================================
`ifdef inst1_DATA_SIZE_16
    `define DATA_SIZE_64_32_16
`endif

`ifdef inst1_DATA_SIZE_32
    `define DATA_SIZE_64_32_16
    `define DATA_SIZE_64_32
`endif

`ifdef inst1_DATA_SIZE_64
    `define DATA_SIZE_64_32_16
    `define DATA_SIZE_64_32
`endif


always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        read_data_d         <=  {`inst1_DSIZE{1'b0}};
        read_data_valid_d   <=  1'b0;
        exp_data            <=  {`inst1_DSIZE{1'b0}};
    end
    else begin
        read_data_d         <=  read_data;
        read_data_valid_d   <=  read_data_valid;
        exp_data            <=  exp_data0;
    end
end


wire comp_en    =   read_data_valid_d;
                                                                                                                                
always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        byte_ok <=  0;
    end
    else begin
        if (comp_en && (read_data_d[7:0]        ==  exp_data[7:0]))     byte_ok[0]  <=  1'b1;   else    byte_ok[0]  <=  1'b0;
        if (comp_en && (read_data_d[15:8]       ==  exp_data[15:8]))    byte_ok[1]  <=  1'b1;   else    byte_ok[1]  <=  1'b0;
        if (comp_en && (read_data_d[23:16]      ==  exp_data[23:16]))   byte_ok[2]  <=  1'b1;   else    byte_ok[2]  <=  1'b0;
        if (comp_en && (read_data_d[31:24]      ==  exp_data[31:24]))   byte_ok[3]  <=  1'b1;   else    byte_ok[3]  <=  1'b0;
    `ifdef DATA_SIZE_64_32_16
        if (comp_en && (read_data_d[39:32]      ==  exp_data[39:32]))   byte_ok[4]  <=  1'b1;   else    byte_ok[4]  <=  1'b0;
        if (comp_en && (read_data_d[47:40]      ==  exp_data[47:40]))   byte_ok[5]  <=  1'b1;   else    byte_ok[5]  <=  1'b0;
        if (comp_en && (read_data_d[55:48]      ==  exp_data[55:48]))   byte_ok[6]  <=  1'b1;   else    byte_ok[6]  <=  1'b0;
        if (comp_en && (read_data_d[63:56]      ==  exp_data[63:56]))   byte_ok[7]  <=  1'b1;   else    byte_ok[7]  <=  1'b0;
    `endif
    `ifdef DATA_SIZE_64_32
        if (comp_en && (read_data_d[71:64]      ==  exp_data[71:64]))   byte_ok[8]  <=  1'b1;   else    byte_ok[8]  <=  1'b0;
        if (comp_en && (read_data_d[79:72]      ==  exp_data[79:72]))   byte_ok[9]  <=  1'b1;   else    byte_ok[9]  <=  1'b0;
        if (comp_en && (read_data_d[87:80]      ==  exp_data[87:80]))   byte_ok[10] <=  1'b1;   else    byte_ok[10] <=  1'b0;
        if (comp_en && (read_data_d[95:88]      ==  exp_data[95:88]))   byte_ok[11] <=  1'b1;   else    byte_ok[11] <=  1'b0;
        if (comp_en && (read_data_d[103:96]     ==  exp_data[103:96]))  byte_ok[12] <=  1'b1;   else    byte_ok[12] <=  1'b0;
        if (comp_en && (read_data_d[111:104]    ==  exp_data[111:104])) byte_ok[13] <=  1'b1;   else    byte_ok[13] <=  1'b0;
        if (comp_en && (read_data_d[119:112]    ==  exp_data[119:112])) byte_ok[14] <=  1'b1;   else    byte_ok[14] <=  1'b0;
        if (comp_en && (read_data_d[127:120]    ==  exp_data[127:120])) byte_ok[15] <=  1'b1;   else    byte_ok[15] <=  1'b0;
    `endif
    `ifdef inst1_DATA_SIZE_64
        if (comp_en && (read_data_d[135:128]    ==  exp_data[135:128])) byte_ok[16] <=  1'b1;   else    byte_ok[16] <=  1'b0;
        if (comp_en && (read_data_d[143:136]    ==  exp_data[143:136])) byte_ok[17] <=  1'b1;   else    byte_ok[17] <=  1'b0;
        if (comp_en && (read_data_d[151:144]    ==  exp_data[151:144])) byte_ok[18] <=  1'b1;   else    byte_ok[18] <=  1'b0;
        if (comp_en && (read_data_d[159:152]    ==  exp_data[159:152])) byte_ok[19] <=  1'b1;   else    byte_ok[19] <=  1'b0;
        if (comp_en && (read_data_d[167:160]    ==  exp_data[167:160])) byte_ok[20] <=  1'b1;   else    byte_ok[20] <=  1'b0;
        if (comp_en && (read_data_d[175:168]    ==  exp_data[175:168])) byte_ok[21] <=  1'b1;   else    byte_ok[21] <=  1'b0;
        if (comp_en && (read_data_d[183:176]    ==  exp_data[183:176])) byte_ok[22] <=  1'b1;   else    byte_ok[22] <=  1'b0;
        if (comp_en && (read_data_d[191:184]    ==  exp_data[191:184])) byte_ok[23] <=  1'b1;   else    byte_ok[23] <=  1'b0;
        if (comp_en && (read_data_d[199:192]    ==  exp_data[199:192])) byte_ok[24] <=  1'b1;   else    byte_ok[24] <=  1'b0;
        if (comp_en && (read_data_d[207:200]    ==  exp_data[207:200])) byte_ok[25] <=  1'b1;   else    byte_ok[25] <=  1'b0;
        if (comp_en && (read_data_d[215:208]    ==  exp_data[215:208])) byte_ok[26] <=  1'b1;   else    byte_ok[26] <=  1'b0;
        if (comp_en && (read_data_d[223:216]    ==  exp_data[223:216])) byte_ok[27] <=  1'b1;   else    byte_ok[27] <=  1'b0;
        if (comp_en && (read_data_d[231:224]    ==  exp_data[231:224])) byte_ok[28] <=  1'b1;   else    byte_ok[28] <=  1'b0;
        if (comp_en && (read_data_d[239:232]    ==  exp_data[239:232])) byte_ok[29] <=  1'b1;   else    byte_ok[29] <=  1'b0;
        if (comp_en && (read_data_d[247:240]    ==  exp_data[247:240])) byte_ok[30] <=  1'b1;   else    byte_ok[30] <=  1'b0;
        if (comp_en && (read_data_d[255:248]    ==  exp_data[255:248])) byte_ok[31] <=  1'b1;   else    byte_ok[31] <=  1'b0;
    `endif
    end
end

`ifdef inst1_DATA_SIZE_64
assign  dqs_ok[0]   =   (byte_ok[0] && byte_ok[8]  && byte_ok[16] && byte_ok[24]);
assign  dqs_ok[1]   =   (byte_ok[1] && byte_ok[9]  && byte_ok[17] && byte_ok[25]);
assign  dqs_ok[2]   =   (byte_ok[2] && byte_ok[10] && byte_ok[18] && byte_ok[26]);
assign  dqs_ok[3]   =   (byte_ok[3] && byte_ok[11] && byte_ok[19] && byte_ok[27]);
assign  dqs_ok[4]   =   (byte_ok[4] && byte_ok[12] && byte_ok[20] && byte_ok[28]);
assign  dqs_ok[5]   =   (byte_ok[5] && byte_ok[13] && byte_ok[21] && byte_ok[29]);
assign  dqs_ok[6]   =   (byte_ok[6] && byte_ok[14] && byte_ok[22] && byte_ok[30]);
assign  dqs_ok[7]   =   (byte_ok[7] && byte_ok[15] && byte_ok[23] && byte_ok[31]);
`endif

`ifdef inst1_DATA_SIZE_32
assign  dqs_ok[0]   =   (byte_ok[0] && byte_ok[4]  && byte_ok[8]  && byte_ok[12]);
assign  dqs_ok[1]   =   (byte_ok[1] && byte_ok[5]  && byte_ok[9]  && byte_ok[13]);
assign  dqs_ok[2]   =   (byte_ok[2] && byte_ok[6]  && byte_ok[10] && byte_ok[14]);
assign  dqs_ok[3]   =   (byte_ok[3] && byte_ok[7]  && byte_ok[11] && byte_ok[15]);
`endif

`ifdef inst1_DATA_SIZE_16
assign  dqs_ok[0]   =   (byte_ok[0] && byte_ok[2]  && byte_ok[4]  && byte_ok[6]);
assign  dqs_ok[1]   =   (byte_ok[1] && byte_ok[3]  && byte_ok[5]  && byte_ok[7]);
`endif

`ifdef inst1_DATA_SIZE_8
assign  dqs_ok[0]   =   (byte_ok[0] && byte_ok[1]  && byte_ok[2]  && byte_ok[3]);
`endif                                                                                                                          


endmodule