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
// Project          : DDR3 Versa EB Demo 
// File             : ddr_ulogic.v 
// Title            : ddr_ulogic
// Dependencies     : 
// Description      : DDR3 user logic block, command and address generation
//                    write data generation, read data validation
//            
//
// =============================================================================
//                        REVISION HISTORY
// Version          : 1.0
// Author(s)        : Kyoho Lee
// Mod. Date        : February, 2011
// Changes Made     :
//
// =============================================================================

`timescale 1 ns / 100 ps
`include "ddr3_test_params.v"

module ddr_ulogic 
(
//---------inputs-------------
    sclk,
    reset_n,
    init_done,
    cmd_rdy,
    datain_rdy,
    read_data,
    read_data_valid,
    dip_sw,
//---------outputs-------------
    cmd,
    cmd_valid,
    addr,
    cmd_burst_cnt,
    write_data,
    init_start,
    mem_rst_n,
    data_mask,
    otf_bl_sel,
    err_det
    );

// ==============================================================================
// define all inputs / outputs
// ==============================================================================
input                       sclk;
input                       reset_n;
input                       init_done;
input                       cmd_rdy;
input                       datain_rdy;
input   [`inst1_DSIZE-1:0]        read_data;
input                       read_data_valid;
input   [4:0]               dip_sw;
output                      init_start;
output                      mem_rst_n;
output  [3:0]               cmd;
output                      cmd_valid;
output  [`inst1_ADDR_WIDTH-1:0]   addr;
output  [`inst1_DSIZE-1:0]        write_data;
output  [`inst1_DSIZE / 8-1:0]    data_mask;
output  [4:0]               cmd_burst_cnt;
output                      err_det;
output                      otf_bl_sel;

// ==============================================================================
// internal signals
// ==============================================================================
reg     [3:0]               cmdgen;
reg     [3:0]               cmd;
reg                         cmd_valid;
reg     [`inst1_ADDR_WIDTH-1:0]   addr;
reg     [15:0]              init_cnt;
reg                         init_srvcd;
reg                         rst_srvcd;
reg                         init_start_hit;
reg                         init_start_hit_1;
reg                         init_start;
reg                         mem_rst_n;
reg     [`inst1_ADDR_WIDTH-1:0]   addr_rd /* synthesis syn_multstyle="logic" */;
reg     [`inst1_ADDR_WIDTH-1:0]   addr_wr /* synthesis syn_multstyle="logic" */;
reg     [8:0]               addr_interval /* synthesis syn_multstyle="logic" */;
reg     [`inst1_DSIZE-1:0]        write_data;
`ifdef WrRqDDelay_2
 reg                        datain_rdy_d;
`endif
reg                         clr_gen;
reg                         err_det;
reg                         mismatch;
reg                         read_data_valid_d;
reg                         read_data_valid_d2;
reg                         otf_bl_sel;
reg     [1:0]               Bl_Mode /* synthesis syn_useioff = 0 */;
reg                         MaxCmd_Siz /* synthesis syn_useioff = 0 */;
reg                         CmdBurst_En /* synthesis syn_useioff = 0 */;
reg     [4:0]               cmd_burst_cnt;  
reg                         clr_cmd_cnt;
reg     [4:0]               sngl_cmd_cnt;
wire    [`inst1_DSIZE / 8-1:0]    byte_ok;
wire    [`inst1_DATA_WIDTH/8-1:0] dqs_ok;
wire    [`inst1_DSIZE / 8-1:0]    data_mask;
wire    [4:0]               dip_sw;
wire    [`inst1_DSIZE-1:0]        curr_data;
wire    [1:0]               Bl_Mode_p;
wire                        Data_Mode;  
wire    [1:0]               mr0_bl;
wire    [1:0]               RankSel;
wire    [1:0]               Odt;
wire    [4:0]               CmdBrstCnt;
wire    [4:0]               SnglCmdCnt;
wire    [`inst1_ADDR_WIDTH-1:0]   curr_addr_wr;
wire    [`inst1_ADDR_WIDTH-1:0]   curr_addr_rd;
wire                        cmd_gone;
// ==============================================================================
// Mode regsiter programming
// - This is demo purpose only, usual applications do not need reprogramming MRs
// ==============================================================================
wire    [15:0]              mr0_init        =   { `inst1_MRS0_INIT };
wire    [15:0]              mr1_init        =   { `inst1_MRS1_INIT };
wire    [15:0]              mr2_init        =   { `inst1_MRS2_INIT };
wire    [15:0]              mr3_init        =   { `inst1_MRS3_INIT };
wire    [15:0]              mr0_data        =   {mr0_init[15:9],1'b0,mr0_init[7:2],mr0_bl}; // User BL setting & disable DLL reset
wire    [15:0]              mr1_data        =   mr1_init;
wire    [15:0]              mr2_data        =   mr2_init;
wire    [15:0]              mr3_data        =   mr3_init;

assign  mr0_bl      = (Bl_Mode_p == 2'b11)  ?   2'b00   :   // BL8 Fixed
                      (Bl_Mode_p == 2'b10)  ?   2'b10   :   // BC4 Fixed
                                                2'b01   ;   // OTP BL8/BC4

// ==============================================================================
// Test configuration generation
// ==============================================================================
assign  Data_Mode       = dip_sw[4];
                //  [1] :   PRBS Data Pattern
                //  [0] :   32-bit Sequential Data Pattern (i.e., 32-bit DDR3 = 32-bit sequential x 4 local)

assign  MaxCmd_Siz_p    = dip_sw[3];
                //  [1] :   Use maximum command size/length (=32)
                //  [0] :   Use user command burst size (default = 2)

assign  CmdBurst_En_p   = dip_sw[2];
                //  [1] :   Enable command burst mode
                //          (32 burst when MaxCmd_Siz=1, User burst size when MaxCmd_Siz =0)
                //  [0] :   Use single command mode
                //          (Manual command repetition is still supported by MaxCmd_Siz)

assign  Bl_Mode_p       = dip_sw[1:0];
                //  Bl_Mode[1]: 1 = Fixed, 0 = OTP
                //  Bl_Mode[0]: 1 = BL8,   0 = BC4
                //
                //  [11]:   BL8 Fixed
                //  [10]:   BC4 Fixed
                //  [01]:   OTP BL8
                //  [00]:   OTP BC4

// ==============================================================================
// state assignments & defines
// ==============================================================================
`define     IDLE_ST         0
`define     CONF_MR0        2
`define     CONF_MR1        3
`define     CONF_MR2        4
`define     CONF_MR3        5
`define     WRITE_CMD       6
`define     READ_CMD        7

//********************************************************************/
// Init_start generation
// - in simulation mode, wait for 128 clock cycles
// - in synthesis mode, wait for +200us for memory reset requirement
//********************************************************************/
always@(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        init_cnt        <=  16'h0;
        init_srvcd      <=  1'b0;
        init_start_hit  <=  1'b0;
        rst_srvcd       <=  1'b0;
        init_start_hit_1    <=  1'b0;
    end
    else begin
        init_cnt    <=  init_cnt + 1;
        if (init_cnt[7] == 1'b1) begin                      // takes the first hit
            rst_srvcd   <=  1'b1;
            if (!rst_srvcd)
                init_start_hit  <=  1'b1;
            else
                init_start_hit  <=  1'b0;
        end

`ifdef SIM
        if (init_cnt[6] && rst_srvcd == 1'b1)   begin       // to save the simulation run time
`else
        if (init_cnt[15] && init_cnt[13] && rst_srvcd == 1'b1)  begin
                                                            // takes the second hit after 200 us
`endif
            init_srvcd  <=  1'b1;
            if (!init_srvcd)
                init_start_hit_1    <=  1'b1;
            else
                init_start_hit_1    <=  1'b0;
        end
    end
end


always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        init_start      <=  1'b0;
        mem_rst_n   <=  1'b0;
    end
    else begin
        if (init_start_hit) begin
            mem_rst_n   <=  1'b0;
        end
        else if (init_start_hit_1) begin
            mem_rst_n   <=  1'b1;
            init_start      <=  1'b1;
        end
        else if (init_done) begin
            init_start      <=  1'b0;
        end
    end
end


// ==============================================================================
// Address generator
//  Note: Only 1,2,4,8,16 or 32 of cmd_burst_cnt allowed for non-stop runs
// ==============================================================================
assign  cmd_gone    =   cmd_rdy && cmd_valid;

assign  wr_done =   (cmdgen == `WRITE_CMD) && cmd_gone;
assign  rd_done =   (cmdgen == `READ_CMD)  && cmd_gone;

always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        addr_rd         <=  {`inst1_ADDR_WIDTH{1'b0}};
        addr_wr         <=  {`inst1_ADDR_WIDTH{1'b0}};
        addr_interval   <=  0 ;
    end
    else if (clr_gen) begin
        addr_rd         <=  {`inst1_ADDR_WIDTH{1'b0}};
        addr_wr         <=  {`inst1_ADDR_WIDTH{1'b0}};
    end
    else begin
        if (wr_done) 
            addr_wr     <=  addr_wr + addr_interval;

        if (rd_done) begin
            addr_rd     <=  addr_rd + addr_interval;
        end

        if (Bl_Mode[0]) begin
            if (CmdBrstCnt == 5'b00000)
                addr_interval   <=  256 ;
            else
                addr_interval   <=  CmdBrstCnt * 8 ;
        end
        else begin
            if (CmdBrstCnt == 5'b00000)
                addr_interval   <=  128 ;
            else
                addr_interval   <=  CmdBrstCnt * 4 ;
        end

    end
end

assign  curr_addr_wr    =   addr_wr;
assign  curr_addr_rd    =   addr_rd;

// ==============================================================================
// Command generation state machine
// ==============================================================================
always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        cmdgen          <=  `IDLE_ST;
        cmd             <=  4'h0;
        cmd_burst_cnt   <=  5'h0;
        cmd_valid       <=  1'b0;
        addr            <=  {`inst1_ADDR_WIDTH{1'b0}};
        otf_bl_sel      <=  1'b0;   
        Bl_Mode         <= 2'b00;
        MaxCmd_Siz      <=  1'b0;
        CmdBurst_En     <=  1'b0;
        clr_cmd_cnt     <=  1'b0;
    end
    else begin

        case (cmdgen)

        `IDLE_ST : begin
            if (init_done) begin
                cmdgen      <=  `CONF_MR0;
            end
            else begin
                cmdgen      <=  `IDLE_ST;
            end
        end             

        `CONF_MR0 : begin
            cmd         <=  4'h6;       // Load Mode Register
            cmd_valid   <=  1'b1;
            addr        <=  {{`inst1_ADDR_WIDTH-18{1'b0}},2'b00,mr0_data};
            if (cmd_gone) begin
                cmdgen      <=  `CONF_MR1;
                cmd_valid   <=  1'b0;
            end
            else
                cmdgen      <=  `CONF_MR0;
        end

        `CONF_MR1 : begin
            cmd_valid   <=  1'b1;
            addr        <=  {{`inst1_ADDR_WIDTH-18{1'b0}},2'b01,mr1_data};
            if (cmd_gone) begin
                cmdgen      <=  `CONF_MR2;
            #1  cmd_valid   <=  1'b0;
            end
            else
                cmdgen      <=  `CONF_MR1;
        end

        `CONF_MR2 : begin
            cmd_valid   <=  1'b1;
            addr        <=  {{`inst1_ADDR_WIDTH-18{1'b0}},2'b10,mr2_data};
            if (cmd_gone) begin
                cmdgen      <=  `CONF_MR3;
                cmd_valid   <=  1'b0;
            end
            else
                cmdgen      <=  `CONF_MR2;
        end

        `CONF_MR3 : begin
            cmd_valid   <=  1'b1;
            addr        <=  {{`inst1_ADDR_WIDTH-18{1'b0}},2'b11,mr3_data};
            if (cmd_gone) begin
                cmd_valid   <=  1'b0;
                cmdgen      <=  `WRITE_CMD;
                Bl_Mode     <=  Bl_Mode_p;              // Sample BL_Mode[0] for OTF
                MaxCmd_Siz  <=  MaxCmd_Siz_p;
                CmdBurst_En <=  CmdBurst_En_p;
            end
            else
                cmdgen      <=  `CONF_MR3;
        end

        `WRITE_CMD : begin
            cmd         <=  4'h2;                       // Switch to write
            addr        <=  curr_addr_wr;
            cmd_burst_cnt <= CmdBrstCnt;
            otf_bl_sel  <=  Bl_Mode[0];                 // Set OTF burst lengh
            cmd_valid   <=  1'b1;
            clr_cmd_cnt <=  1'b0;
                if (cmd_gone) begin
                    if (CmdBurst_En == 1'b0)        // single cmd mode
                        if (sngl_cmd_cnt == SnglCmdCnt) begin
                            clr_cmd_cnt <= 1'b1;
                            cmdgen      <=  `READ_CMD;      // go to read operation
                        end
                        else
                            cmdgen      <=  `WRITE_CMD;                             
                    else begin                      // cmd burst mode
                        cmdgen      <=  `READ_CMD;
                        clr_cmd_cnt <= 1'b1;        // prepare cmd burst mode switch
                    end
                    cmd_valid   <=  1'b0;               // prepare command en/disable control for manual mode
                end
                else
                    cmdgen      <=  `WRITE_CMD;
        end

    
        `READ_CMD : begin                   
            cmd         <=  4'h1;                       // Switch to read
            addr        <=  curr_addr_rd;
            cmd_burst_cnt <= CmdBrstCnt;
            cmd_valid   <=  1'b1;
            clr_cmd_cnt <=  1'b0;
                if (cmd_gone) begin
                    if (CmdBurst_En == 1'b0)
                        if (sngl_cmd_cnt == SnglCmdCnt) begin
                            clr_cmd_cnt <= 1'b1;
                            Bl_Mode[0]  <=  Bl_Mode_p[0]; // Updated only after a manual burst read done (for OTF support)
                            CmdBurst_En <=  CmdBurst_En_p;
                            MaxCmd_Siz  <=  MaxCmd_Siz_p;
                            cmdgen      <=  `WRITE_CMD;
                        end
                        else
                            cmdgen      <=  `READ_CMD;
                    else begin
                        cmdgen      <=  `WRITE_CMD;
                        clr_cmd_cnt <= 1'b1;            // prepare cmd burst mode switch
                        if ((~MaxCmd_Siz && (addr[2] || Bl_Mode[0])) || MaxCmd_Siz) begin
                            Bl_Mode[0]  <=  Bl_Mode_p[0]; // Address alignment for BC4, Sample Bl_Mode[0] for OTF timing
                            CmdBurst_En <=  CmdBurst_En_p;
                            MaxCmd_Siz  <=  MaxCmd_Siz_p;
                        end
                    end
                    cmd_valid   <=  1'b0;               // prepare command en/disable control for manual mode
                end
                else
                    cmdgen      <=  `READ_CMD;
        end

        endcase
    end
end


always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        sngl_cmd_cnt        <=  5'h0;
    end
    else begin
        if (clr_cmd_cnt)
            sngl_cmd_cnt    <=  5'h0;
        else
            if ((cmdgen == `READ_CMD || cmdgen == `WRITE_CMD) && cmd_gone)
                sngl_cmd_cnt        <=  sngl_cmd_cnt + 1;
    end
end


// ==============================================================================
// Write data insertion timing
//  - with WrRqDDelay_1 defined: 1 clock delay. Otherwise, two clocks.
// ==============================================================================

always @(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        write_data      <=  {`inst1_DSIZE{1'b0}};
        clr_gen         <=  1'b0;
      `ifdef WrRqDDelay_2
        datain_rdy_d    <=  1'b0;
      `endif
    end
    else begin
      `ifdef WrRqDDelay_2
        datain_rdy_d    <=  datain_rdy;
        if (datain_rdy_d)
            write_data      <=  curr_data;
        else
            write_data      <=  {`inst1_DSIZE{1'b0}};
      `else     //WrRqDDelay_1
        if (datain_rdy)
            write_data      <=  curr_data;
        else
            write_data      <=  {`inst1_DSIZE{1'b0}};
      `endif    

        if (init_done)
            clr_gen         <=  1'b1;
        else
            clr_gen         <=  1'b0;
    end
end

    
data_gen_chk U_data_gen_chk (
//---------inputs-------------
    .sclk           (sclk),
    .reset_n            (reset_n),
    .datain_rdy         (datain_rdy),
    .clr_gen            (clr_gen),
    .load_en            (clr_gen),
    .read_data          (read_data),
    .read_data_valid    (read_data_valid),
    .Data_Mode          (Data_Mode),
//---------outputs-------------
    .curr_data          (curr_data),
    .byte_ok            (byte_ok),
    .dqs_ok             (dqs_ok)
    );


assign  data_mask   =   0;

assign  CmdBrstCnt  =   CmdBurst_En ?  (MaxCmd_Siz  ? 5'b00000  : 5'b00001) :
                        `UsrCmdBrstCnt; 

assign  SnglCmdCnt  =   MaxCmd_Siz  ? 5'h1f     : `UsrCmdBrstCnt-1;

// ==============================================================================
// Error detect
// ==============================================================================

always@(posedge sclk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
        mismatch            <=  1'b0;
        err_det             <=  1'b0;
        read_data_valid_d   <=  1'b0;
        read_data_valid_d2  <=  1'b0;
    end
    else begin
        read_data_valid_d   <=  read_data_valid;
        read_data_valid_d2  <=  read_data_valid_d;
            if (read_data_valid_d2 && cmdgen != `IDLE_ST) begin
                if (~& dqs_ok) begin 
                    mismatch        <=  1'b1;
                end
                else begin
                    mismatch        <=  1'b0;
                end
            end
            else begin
                    mismatch        <=  1'b0;
            end 

            if (mismatch)
                    err_det         <=  1'b1;
    end
end

endmodule

