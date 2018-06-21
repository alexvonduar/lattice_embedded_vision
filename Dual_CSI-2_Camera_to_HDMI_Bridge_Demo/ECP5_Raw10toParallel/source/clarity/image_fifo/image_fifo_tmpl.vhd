--VHDL instantiation template

component image_fifo is
    port (sc_fifo_Data: in std_logic_vector(9 downto 0);
        sc_fifo_Q: out std_logic_vector(9 downto 0);
        sc_fifo_Clock: in std_logic;
        sc_fifo_Empty: out std_logic;
        sc_fifo_Full: out std_logic;
        sc_fifo_RdEn: in std_logic;
        sc_fifo_Reset: in std_logic;
        sc_fifo_WrEn: in std_logic
    );
    
end component image_fifo; -- sbp_module=true 
_inst: image_fifo port map (sc_fifo_Data => __,sc_fifo_Q => __,sc_fifo_Clock => __,
            sc_fifo_Empty => __,sc_fifo_Full => __,sc_fifo_RdEn => __,sc_fifo_Reset => __,
            sc_fifo_WrEn => __);
