//Verilog instantiation template

dp_ram _inst (.rb_ram_Data(), .rb_ram_Q(), .rb_ram_RdAddress(), .rb_ram_WrAddress(), 
       .rb_ram_RdClock(), .rb_ram_RdClockEn(), .rb_ram_Reset(), .rb_ram_WE(), 
       .rb_ram_WrClock(), .rb_ram_WrClockEn(), .debayer_dpram_Data(), 
       .debayer_dpram_Q(), .debayer_dpram_RdAddress(), .debayer_dpram_WrAddress(), 
       .debayer_dpram_RdClock(), .debayer_dpram_RdClockEn(), .debayer_dpram_Reset(), 
       .debayer_dpram_WE(), .debayer_dpram_WrClock(), .debayer_dpram_WrClockEn());