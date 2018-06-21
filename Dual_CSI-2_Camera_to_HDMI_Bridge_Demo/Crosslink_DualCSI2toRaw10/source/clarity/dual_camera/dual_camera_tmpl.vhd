--VHDL instantiation template

component dual_camera is
    port (LUT_FIFO_Data: in std_logic_vector(9 downto 0);
        LUT_FIFO_Q: out std_logic_vector(9 downto 0);
        cross_domain_fifo_Data: in std_logic_vector(31 downto 0);
        cross_domain_fifo_Q: out std_logic_vector(31 downto 0);
        LUT_FIFO_AlmostEmpty: out std_logic;
        LUT_FIFO_AlmostFull: out std_logic;
        LUT_FIFO_Empty: out std_logic;
        LUT_FIFO_Full: out std_logic;
        LUT_FIFO_RPReset: in std_logic;
        LUT_FIFO_RdClock: in std_logic;
        LUT_FIFO_RdEn: in std_logic;
        LUT_FIFO_Reset: in std_logic;
        LUT_FIFO_WrClock: in std_logic;
        LUT_FIFO_WrEn: in std_logic;
        cross_domain_fifo_AlmostEmpty: out std_logic;
        cross_domain_fifo_AlmostFull: out std_logic;
        cross_domain_fifo_Empty: out std_logic;
        cross_domain_fifo_Full: out std_logic;
        cross_domain_fifo_RPReset: in std_logic;
        cross_domain_fifo_RdClock: in std_logic;
        cross_domain_fifo_RdEn: in std_logic;
        cross_domain_fifo_Reset: in std_logic;
        cross_domain_fifo_WrClock: in std_logic;
        cross_domain_fifo_WrEn: in std_logic;
        pll_double_CLKI: in std_logic;
        pll_double_CLKOP: out std_logic;
        pll_double_CLKOS: out std_logic;
        pll_double_CLKOS2: out std_logic;
        pll_double_LOCK: out std_logic;
        pll_double_RST: in std_logic
    );
    
end component dual_camera; -- sbp_module=true 
_inst: dual_camera port map (cross_domain_fifo_Data => __,cross_domain_fifo_Q => __,
            cross_domain_fifo_AlmostEmpty => __,cross_domain_fifo_AlmostFull => __,
            cross_domain_fifo_Empty => __,cross_domain_fifo_Full => __,cross_domain_fifo_RPReset => __,
            cross_domain_fifo_RdClock => __,cross_domain_fifo_RdEn => __,cross_domain_fifo_Reset => __,
            cross_domain_fifo_WrClock => __,cross_domain_fifo_WrEn => __,pll_double_CLKI => __,
            pll_double_CLKOP => __,pll_double_CLKOS => __,pll_double_CLKOS2 => __,
            pll_double_LOCK => __,pll_double_RST => __,LUT_FIFO_Data => __,
            LUT_FIFO_Q => __,LUT_FIFO_AlmostEmpty => __,LUT_FIFO_AlmostFull => __,
            LUT_FIFO_Empty => __,LUT_FIFO_Full => __,LUT_FIFO_RPReset => __,
            LUT_FIFO_RdClock => __,LUT_FIFO_RdEn => __,LUT_FIFO_Reset => __,
            LUT_FIFO_WrClock => __,LUT_FIFO_WrEn => __);
