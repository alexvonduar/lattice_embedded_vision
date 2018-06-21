/* synthesis translate_off*/
`define SBP_SIMULATION
/* synthesis translate_on*/
`ifndef SBP_SIMULATION
`define SBP_SYNTHESIS
`endif

//
// Verific Verilog Description of module dp_ram
//
module dp_ram (debayer_dpram_Data, debayer_dpram_Q, debayer_dpram_RdAddress, 
            debayer_dpram_WrAddress, rb_ram_Data, rb_ram_Q, rb_ram_RdAddress, 
            rb_ram_WrAddress, debayer_dpram_RdClock, debayer_dpram_RdClockEn, 
            debayer_dpram_Reset, debayer_dpram_WE, debayer_dpram_WrClock, 
            debayer_dpram_WrClockEn, rb_ram_RdClock, rb_ram_RdClockEn, 
            rb_ram_Reset, rb_ram_WE, rb_ram_WrClock, rb_ram_WrClockEn) /* synthesis sbp_module=true */ ;
    input [11:0]debayer_dpram_Data;
    output [11:0]debayer_dpram_Q;
    input [11:0]debayer_dpram_RdAddress;
    input [11:0]debayer_dpram_WrAddress;
    input [11:0]rb_ram_Data;
    output [11:0]rb_ram_Q;
    input [10:0]rb_ram_RdAddress;
    input [10:0]rb_ram_WrAddress;
    input debayer_dpram_RdClock;
    input debayer_dpram_RdClockEn;
    input debayer_dpram_Reset;
    input debayer_dpram_WE;
    input debayer_dpram_WrClock;
    input debayer_dpram_WrClockEn;
    input rb_ram_RdClock;
    input rb_ram_RdClockEn;
    input rb_ram_Reset;
    input rb_ram_WE;
    input rb_ram_WrClock;
    input rb_ram_WrClockEn;
    
    
    debayer_dpram debayer_dpram_inst (.Data({debayer_dpram_Data}), .Q({debayer_dpram_Q}), 
            .RdAddress({debayer_dpram_RdAddress}), .WrAddress({debayer_dpram_WrAddress}), 
            .RdClock(debayer_dpram_RdClock), .RdClockEn(debayer_dpram_RdClockEn), 
            .Reset(debayer_dpram_Reset), .WE(debayer_dpram_WE), .WrClock(debayer_dpram_WrClock), 
            .WrClockEn(debayer_dpram_WrClockEn));
    rb_ram rb_ram_inst (.Data({rb_ram_Data}), .Q({rb_ram_Q}), .RdAddress({rb_ram_RdAddress}), 
           .WrAddress({rb_ram_WrAddress}), .RdClock(rb_ram_RdClock), .RdClockEn(rb_ram_RdClockEn), 
           .Reset(rb_ram_Reset), .WE(rb_ram_WE), .WrClock(rb_ram_WrClock), 
           .WrClockEn(rb_ram_WrClockEn));
    
endmodule

