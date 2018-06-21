--VHDL instantiation template

component CSC is
    port (colorspace_din0: in std_logic_vector(11 downto 0);
        colorspace_din1: in std_logic_vector(11 downto 0);
        colorspace_din2: in std_logic_vector(11 downto 0);
        colorspace_dout0: out std_logic_vector(11 downto 0);
        colorspace_dout1: out std_logic_vector(11 downto 0);
        colorspace_dout2: out std_logic_vector(11 downto 0);
        colorspace_clk: in std_logic;
        colorspace_rstn: in std_logic
    );
    
end component CSC; -- sbp_module=true 
_inst: CSC port map (colorspace_din0 => __,colorspace_din1 => __,colorspace_din2 => __,
          colorspace_dout0 => __,colorspace_dout1 => __,colorspace_dout2 => __,
          colorspace_clk => __,colorspace_rstn => __);
