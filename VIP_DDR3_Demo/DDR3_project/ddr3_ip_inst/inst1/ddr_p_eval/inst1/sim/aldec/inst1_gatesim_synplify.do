cd {C:/Users/hreddy/Desktop/VIP_DDR3_Demo/DDR3_project/ddr3_ip_inst/inst1/ddr_p_eval/inst1/sim/aldec}
workspace create ddr3_space
design create ddr3_design .
design open ddr3_design
cd {C:/Users/hreddy/Desktop/VIP_DDR3_Demo/DDR3_project/ddr3_ip_inst/inst1/ddr_p_eval/inst1/sim/aldec}
waveformmode asdb
vlog -msg 0 +define+inst1_NO_DEBUG+inst1_SIM+inst1_GATE_SIM+SIM+NO_DEBUG \
-y ../../../models/ecp5um +libext+.v \
-y ../../../models/mem +libext+.v \
+incdir+../../../testbench/tests/ecp5um \
+incdir+../../src/params \
+incdir+../../../models/mem \
../../src/params/ddr3_sdram_mem_params_inst1.v \
../../../testbench/top/ecp5um/odt_watchdog.v \
../../../testbench/top/ecp5um/monitor.v \
../../../testbench/top/ecp5um/test_mem_ctrl.v

vsim -O5 +access +r -lib ddr3_design ddr3_design.test_mem_ctrl -L ovi_ecp5um -noglitch +notimingchecks 
add wave -noupdate -divider {Global Signals}
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/clk_in
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/rst_n
add wave -noupdate -divider {Memory Interface Signals}
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_reset_n
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_cke
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_clk
wave -virtual "em_ddr_cmd" -expand /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_cs_n /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_ras_n /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_cas_n /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_we_n
add wave -noupdate -format Literal -radix hexadecimal /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_addr
add wave -noupdate -format Literal -radix hexadecimal /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_ba
add wave -noupdate -format Literal -radix hexadecimal /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_data
add wave -noupdate -format Literal /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_dqs
add wave -noupdate -format Literal /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_dm
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/em_ddr_odt
add wave -noupdate -divider {Local Interface Signals}
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/sclk_out
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/init_start
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/init_done
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/wl_err
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/rt_err
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/clocking_good
add wave -noupdate -format Literal -radix hexadecimal /test_mem_ctrl/U1_ddr_sdram_mem_top/addr
add wave -noupdate -format Literal -radix hexadecimal /test_mem_ctrl/U1_ddr_sdram_mem_top/cmd
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/cmd_valid
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/cmd_rdy
add wave -noupdate -format Literal /test_mem_ctrl/U1_ddr_sdram_mem_top/cmd_burst_cnt
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/ofly_burst_len
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/datain_rdy
add wave -noupdate -format Literal -radix hexadecimal /test_mem_ctrl/U1_ddr_sdram_mem_top/write_data
add wave -noupdate -format Literal -radix hexadecimal /test_mem_ctrl/U1_ddr_sdram_mem_top/data_mask
add wave -noupdate -format Literal -radix hexadecimal /test_mem_ctrl/U1_ddr_sdram_mem_top/read_data
add wave -noupdate -format Logic /test_mem_ctrl/U1_ddr_sdram_mem_top/read_data_valid
run -all
