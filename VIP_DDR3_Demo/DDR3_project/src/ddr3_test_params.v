
`include "ddr3_sdram_mem_params_inst1.v"

//`include "ddr3_sdram_mem_params.v"
`ifdef SIM
 `include "tb_config_params.v"
`endif

//=============================================================================
// Demo parameters
//=============================================================================
//== Define LED polarity
`define LED_ON					1'b0
`define LED_OFF					1'b1

`define UsrCmdBrstCnt			2	// 2,4,8,16,32 allowed, default=2
									// 1 can be used but dynamic OTF change from BC4 to BL8
									// may not work without an error
