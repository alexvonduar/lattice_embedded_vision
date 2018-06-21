//Verilog instantiation template

dual_camera _inst (.cross_domain_fifo_Data(), .cross_domain_fifo_Q(), .cross_domain_fifo_AlmostEmpty(), 
            .cross_domain_fifo_AlmostFull(), .cross_domain_fifo_Empty(), 
            .cross_domain_fifo_Full(), .cross_domain_fifo_RPReset(), .cross_domain_fifo_RdClock(), 
            .cross_domain_fifo_RdEn(), .cross_domain_fifo_Reset(), .cross_domain_fifo_WrClock(), 
            .cross_domain_fifo_WrEn(), .pll_double_CLKI(), .pll_double_CLKOP(), 
            .pll_double_CLKOS(), .pll_double_CLKOS2(), .pll_double_LOCK(), 
            .pll_double_RST(), .LUT_FIFO_Data(), .LUT_FIFO_Q(), .LUT_FIFO_AlmostEmpty(), 
            .LUT_FIFO_AlmostFull(), .LUT_FIFO_Empty(), .LUT_FIFO_Full(), 
            .LUT_FIFO_RPReset(), .LUT_FIFO_RdClock(), .LUT_FIFO_RdEn(), 
            .LUT_FIFO_Reset(), .LUT_FIFO_WrClock(), .LUT_FIFO_WrEn());