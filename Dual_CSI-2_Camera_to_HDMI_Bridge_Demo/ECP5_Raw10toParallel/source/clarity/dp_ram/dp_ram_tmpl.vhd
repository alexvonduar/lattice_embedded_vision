--VHDL instantiation template

component dp_ram is
    port (debayer_dpram_Data: in std_logic_vector(11 downto 0);
        debayer_dpram_Q: out std_logic_vector(11 downto 0);
        debayer_dpram_RdAddress: in std_logic_vector(11 downto 0);
        debayer_dpram_WrAddress: in std_logic_vector(11 downto 0);
        rb_ram_Data: in std_logic_vector(11 downto 0);
        rb_ram_Q: out std_logic_vector(11 downto 0);
        rb_ram_RdAddress: in std_logic_vector(10 downto 0);
        rb_ram_WrAddress: in std_logic_vector(10 downto 0);
        debayer_dpram_RdClock: in std_logic;
        debayer_dpram_RdClockEn: in std_logic;
        debayer_dpram_Reset: in std_logic;
        debayer_dpram_WE: in std_logic;
        debayer_dpram_WrClock: in std_logic;
        debayer_dpram_WrClockEn: in std_logic;
        rb_ram_RdClock: in std_logic;
        rb_ram_RdClockEn: in std_logic;
        rb_ram_Reset: in std_logic;
        rb_ram_WE: in std_logic;
        rb_ram_WrClock: in std_logic;
        rb_ram_WrClockEn: in std_logic
    );
    
end component dp_ram; -- sbp_module=true 
_inst: dp_ram port map (rb_ram_Data => __,rb_ram_Q => __,rb_ram_RdAddress => __,
            rb_ram_WrAddress => __,rb_ram_RdClock => __,rb_ram_RdClockEn => __,
            rb_ram_Reset => __,rb_ram_WE => __,rb_ram_WrClock => __,rb_ram_WrClockEn => __,
            debayer_dpram_Data => __,debayer_dpram_Q => __,debayer_dpram_RdAddress => __,
            debayer_dpram_WrAddress => __,debayer_dpram_RdClock => __,debayer_dpram_RdClockEn => __,
            debayer_dpram_Reset => __,debayer_dpram_WE => __,debayer_dpram_WrClock => __,
            debayer_dpram_WrClockEn => __);
