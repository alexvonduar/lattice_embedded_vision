--VHDL instantiation template

component ddr3_ip_inst is
    port (inst1_addr: in std_logic_vector(26 downto 0);
        inst1_cmd: in std_logic_vector(3 downto 0);
        inst1_cmd_burst_cnt: in std_logic_vector(4 downto 0);
        inst1_data_mask: in std_logic_vector(7 downto 0);
        inst1_em_ddr_addr: out std_logic_vector(13 downto 0);
        inst1_em_ddr_ba: out std_logic_vector(2 downto 0);
        inst1_em_ddr_cke: out std_logic_vector(0 downto 0);
        inst1_em_ddr_clk: out std_logic_vector(0 downto 0);
        inst1_em_ddr_cs_n: out std_logic_vector(0 downto 0);
        inst1_em_ddr_data: inout std_logic_vector(15 downto 0);
        inst1_em_ddr_dm: out std_logic_vector(1 downto 0);
        inst1_em_ddr_dqs: inout std_logic_vector(1 downto 0);
        inst1_em_ddr_odt: out std_logic_vector(0 downto 0);
        inst1_read_data: out std_logic_vector(63 downto 0);
        inst1_write_data: in std_logic_vector(63 downto 0);
        inst1_clk_in: in std_logic;
        inst1_clocking_good: out std_logic;
        inst1_cmd_rdy: out std_logic;
        inst1_cmd_valid: in std_logic;
        inst1_datain_rdy: out std_logic;
        inst1_em_ddr_cas_n: out std_logic;
        inst1_em_ddr_ras_n: out std_logic;
        inst1_em_ddr_reset_n: out std_logic;
        inst1_em_ddr_we_n: out std_logic;
        inst1_init_done: out std_logic;
        inst1_init_start: in std_logic;
        inst1_mem_rst_n: in std_logic;
        inst1_ofly_burst_len: in std_logic;
        inst1_read_data_valid: out std_logic;
        inst1_rst_n: in std_logic;
        inst1_rt_err: out std_logic;
        inst1_sclk_out: out std_logic;
        inst1_wl_err: out std_logic
    );
    
end component ddr3_ip_inst; -- sbp_module=true 
_inst: ddr3_ip_inst port map (inst1_addr => __,inst1_cmd => __,inst1_cmd_burst_cnt => __,
            inst1_data_mask => __,inst1_em_ddr_addr => __,inst1_em_ddr_ba => __,
            inst1_em_ddr_cke => __,inst1_em_ddr_clk => __,inst1_em_ddr_cs_n => __,
            inst1_em_ddr_data => __,inst1_em_ddr_dm => __,inst1_em_ddr_dqs => __,
            inst1_em_ddr_odt => __,inst1_read_data => __,inst1_write_data => __,
            inst1_clk_in => __,inst1_clocking_good => __,inst1_cmd_rdy => __,
            inst1_cmd_valid => __,inst1_datain_rdy => __,inst1_em_ddr_cas_n => __,
            inst1_em_ddr_ras_n => __,inst1_em_ddr_reset_n => __,inst1_em_ddr_we_n => __,
            inst1_init_done => __,inst1_init_start => __,inst1_mem_rst_n => __,
            inst1_ofly_burst_len => __,inst1_read_data_valid => __,inst1_rst_n => __,
            inst1_rt_err => __,inst1_sclk_out => __,inst1_wl_err => __);
