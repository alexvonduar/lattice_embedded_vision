/* synthesis translate_off*/
`define SBP_SIMULATION
/* synthesis translate_on*/
`ifndef SBP_SIMULATION
`define SBP_SYNTHESIS
`endif

//
// Verific Verilog Description of module ddr3_ip_inst
//
module ddr3_ip_inst (inst1_addr, inst1_cmd, inst1_cmd_burst_cnt, inst1_data_mask, 
            inst1_em_ddr_addr, inst1_em_ddr_ba, inst1_em_ddr_cke, inst1_em_ddr_clk, 
            inst1_em_ddr_cs_n, inst1_em_ddr_data, inst1_em_ddr_dm, inst1_em_ddr_dqs, 
            inst1_em_ddr_odt, inst1_read_data, inst1_write_data, inst1_clk_in, 
            inst1_clocking_good, inst1_cmd_rdy, inst1_cmd_valid, inst1_datain_rdy, 
            inst1_em_ddr_cas_n, inst1_em_ddr_ras_n, inst1_em_ddr_reset_n, 
            inst1_em_ddr_we_n, inst1_init_done, inst1_init_start, inst1_mem_rst_n, 
            inst1_ofly_burst_len, inst1_read_data_valid, inst1_rst_n, 
            inst1_rt_err, inst1_sclk_out, inst1_wl_err) /* synthesis sbp_module=true */ ;
    input [26:0]inst1_addr;
    input [3:0]inst1_cmd;
    input [4:0]inst1_cmd_burst_cnt;
    input [7:0]inst1_data_mask;
    output [13:0]inst1_em_ddr_addr;
    output [2:0]inst1_em_ddr_ba;
    output [0:0]inst1_em_ddr_cke;
    output [0:0]inst1_em_ddr_clk;
    output [0:0]inst1_em_ddr_cs_n;
    inout [15:0]inst1_em_ddr_data;
    output [1:0]inst1_em_ddr_dm;
    inout [1:0]inst1_em_ddr_dqs;
    output [0:0]inst1_em_ddr_odt;
    output [63:0]inst1_read_data;
    input [63:0]inst1_write_data;
    input inst1_clk_in;
    output inst1_clocking_good;
    output inst1_cmd_rdy;
    input inst1_cmd_valid;
    output inst1_datain_rdy;
    output inst1_em_ddr_cas_n;
    output inst1_em_ddr_ras_n;
    output inst1_em_ddr_reset_n;
    output inst1_em_ddr_we_n;
    output inst1_init_done;
    input inst1_init_start;
    input inst1_mem_rst_n;
    input inst1_ofly_burst_len;
    output inst1_read_data_valid;
    input inst1_rst_n;
    output inst1_rt_err;
    output inst1_sclk_out;
    output inst1_wl_err;
    
    
    ddr3_sdram_mem_top_inst1 inst1_inst (.addr({inst1_addr}), .cmd({inst1_cmd}), 
            .cmd_burst_cnt({inst1_cmd_burst_cnt}), .data_mask({inst1_data_mask}), 
            .em_ddr_addr({inst1_em_ddr_addr}), .em_ddr_ba({inst1_em_ddr_ba}), 
            .em_ddr_cke({inst1_em_ddr_cke}), .em_ddr_clk({inst1_em_ddr_clk}), 
            .em_ddr_cs_n({inst1_em_ddr_cs_n}), .em_ddr_data({inst1_em_ddr_data}), 
            .em_ddr_dm({inst1_em_ddr_dm}), .em_ddr_dqs({inst1_em_ddr_dqs}), 
            .em_ddr_odt({inst1_em_ddr_odt}), .read_data({inst1_read_data}), 
            .write_data({inst1_write_data}), .clk_in(inst1_clk_in), .clocking_good(inst1_clocking_good), 
            .cmd_rdy(inst1_cmd_rdy), .cmd_valid(inst1_cmd_valid), .datain_rdy(inst1_datain_rdy), 
            .em_ddr_cas_n(inst1_em_ddr_cas_n), .em_ddr_ras_n(inst1_em_ddr_ras_n), 
            .em_ddr_reset_n(inst1_em_ddr_reset_n), .em_ddr_we_n(inst1_em_ddr_we_n), 
            .init_done(inst1_init_done), .init_start(inst1_init_start), 
            .mem_rst_n(inst1_mem_rst_n), .ofly_burst_len(inst1_ofly_burst_len), 
            .read_data_valid(inst1_read_data_valid), .rst_n(inst1_rst_n), 
            .rt_err(inst1_rt_err), .sclk_out(inst1_sclk_out), .wl_err(inst1_wl_err));
    
endmodule

