--VHDL instantiation template

component Gamma is
    port (gammaCorrector_din0: in std_logic_vector(11 downto 0);
        gammaCorrector_din1: in std_logic_vector(11 downto 0);
        gammaCorrector_din2: in std_logic_vector(11 downto 0);
        gammaCorrector_dout0: out std_logic_vector(11 downto 0);
        gammaCorrector_dout1: out std_logic_vector(11 downto 0);
        gammaCorrector_dout2: out std_logic_vector(11 downto 0);
        gammaCorrector_clk: in std_logic;
        gammaCorrector_inpvalid: in std_logic;
        gammaCorrector_outvalid: out std_logic;
        gammaCorrector_rstn: in std_logic
    );
    
end component Gamma; -- sbp_module=true 
_inst: Gamma port map (gammaCorrector_din0 => __,gammaCorrector_din1 => __,
            gammaCorrector_din2 => __,gammaCorrector_dout0 => __,gammaCorrector_dout1 => __,
            gammaCorrector_dout2 => __,gammaCorrector_clk => __,gammaCorrector_inpvalid => __,
            gammaCorrector_outvalid => __,gammaCorrector_rstn => __);
