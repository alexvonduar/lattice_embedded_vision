#include <orcapp_head>
library ieee;
use ieee.std_logic_1164.all;
entity USERNAME_top is port (
	--INPUTS
	clk         : in std_logic;      -- system clock 
	rstn        : in std_logic;      -- system reset 
	--OUTPUTS
	#ifdef CLKEN
	   ce       : in std_logic;      -- clock enable 
	#endif
	#ifdef SYNCRST
	   sr       : in std_logic;      -- synchronous reset 
	#endif
	#ifdef BYPASSEN
       gcen     : in std_logic;      -- gamma enable 
    #endif
    inpvalid    : in std_logic;      -- input data valid signal
    din0        : in std_logic_vector(DATA0_WIDTH-1 downto 0);    -- first  input color plane 
    #ifdef LUT0WRITEPORT
       lut0wren : in std_logic;      -- first color plane LUT write enable 
       lut0val  : in std_logic_vector(DATA0_WIDTH-1 downto 0);    -- first color plane LUT write value
    #endif 
    #ifdef INPUT_SERIAL 
        cpsel   : in std_logic_vector(CPSEL_WIDTH-1 downto 0);    -- color plane select for the inputs
    #endif 
    #ifndef INPUT_SERIAL 
       #ifdef NUMCP2
          din1  : in std_logic_vector(DATA1_WIDTH-1 downto 0);       -- second input color plane 
          #ifdef LUT1WRITEPORT
             lut1wren : in std_logic;                                 -- second color plane LUT write enable 
             lut1val  : in std_logic_vector(DATA1_WIDTH-1 downto 0); -- second color plane LUT write value
          #endif 
       #endif 
       #ifdef NUMCP3
          din2  : in std_logic_vector(DATA2_WIDTH-1 downto 0);       -- third  input color plane 
          #ifdef LUT2WRITEPORT
             lut2wren : in std_logic;                                 -- third color plane LUT write enable 
             lut2val  : in std_logic_vector(DATA2_WIDTH-1 downto 0); -- third color plane LUT write value
          #endif 
       #endif 
    #endif 
   
   --=====OUTPUTS
   #ifdef BYPASSEN
      gcvalid : out std_logic;        -- valid gamma correction output indicator 
   #endif
   outvalid   : out std_logic;        -- output data valid signal
   #ifdef INPUT_SERIAL 
      cpout   : out std_logic_vector(CPSEL_WIDTH-1 downto 0); -- color plane select for the outputs
   #endif 
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         dout1: out std_logic_vector(DATA1_WIDTH-1 downto 0); -- second output color plane 
      #endif 
      #ifdef NUMCP3
         dout2: out std_logic_vector(DATA2_WIDTH-1 downto 0); -- third  output color plane 
      #endif 
   #endif 
   dout0      : out std_logic_vector(DATA0_WIDTH-1 downto 0) -- first  output color plane
);
end USERNAME_top;

architecture arch of USERNAME_top is
#ifdef DEVICE_ECP5
--component ecp5_pll
--port (
--   CLKI         : in  std_logic;
--   RST          : in  std_logic;
--   CLKOP        : out std_logic;
--   LOCK         : out std_logic
--);
--end component;
#endif 
#ifdef DEVICE_ECP3
--component ecp3_pll
--   CLK          : in  std_logic;
--   RESET        : in  std_logic;
--   CLKOP        : out std_logic;
--   LOCK         : out std_logic
--);
--end component;
#endif 
#ifdef DEVICE_XP2
--component xp2_pll
--   CLK          : in  std_logic;
--   RESET        : in  std_logic;
--   CLKOP        : out std_logic;
--   LOCK         : out std_logic
--);
--end component;
#endif 

component USERNAME
port (
	--INPUTS
	clk         : in std_logic;      -- system clock 
	rstn        : in std_logic;      -- system reset 
	--OUTPUTS
	#ifdef CLKEN
	   ce       : in std_logic;      -- clock enable 
	#endif
	#ifdef SYNCRST
	   sr       : in std_logic;      -- synchronous reset 
	#endif
	#ifdef BYPASSEN
       gcen     : in std_logic;      -- gamma enable 
    #endif
    inpvalid    : in std_logic;      -- input data valid signal
    din0        : in std_logic_vector(DATA0_WIDTH-1 downto 0);    -- first  input color plane 
    #ifdef LUT0WRITEPORT
       lut0wren : in std_logic;      -- first color plane LUT write enable 
       lut0val  : in std_logic_vector(DATA0_WIDTH-1 downto 0);    -- first color plane LUT write value
    #endif 
    #ifdef INPUT_SERIAL 
        cpsel   : in std_logic_vector(CPSEL_WIDTH-1 downto 0);    -- color plane select for the inputs
    #endif 
    #ifndef INPUT_SERIAL 
       #ifdef NUMCP2
          din1  : in std_logic_vector(DATA1_WIDTH-1 downto 0);       -- second input color plane 
          #ifdef LUT1WRITEPORT
             lut1wren : in std_logic;                                 -- second color plane LUT write enable 
             lut1val  : in std_logic_vector(DATA1_WIDTH-1 downto 0); -- second color plane LUT write value
          #endif 
       #endif 
       #ifdef NUMCP3
          din2  : in std_logic_vector(DATA2_WIDTH-1 downto 0);       -- third  input color plane 
          #ifdef LUT2WRITEPORT
             lut2wren : in std_logic;                                 -- third color plane LUT write enable 
             lut2val  : in std_logic_vector(DATA2_WIDTH-1 downto 0); -- third color plane LUT write value
          #endif 
       #endif 
    #endif 
   
   --=====OUTPUTS
   #ifdef BYPASSEN
      gcvalid : out std_logic;        -- valid gamma correction output indicator 
   #endif
   outvalid   : out std_logic;        -- output data valid signal
   #ifdef INPUT_SERIAL 
      cpout   : out std_logic_vector(CPSEL_WIDTH-1 downto 0); -- color plane select for the outputs
   #endif 
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         dout1: out std_logic_vector(DATA1_WIDTH-1 downto 0); -- second output color plane 
      #endif 
      #ifdef NUMCP3
         dout2: out std_logic_vector(DATA2_WIDTH-1 downto 0); -- third  output color plane 
      #endif 
   #endif 
   dout0      : out std_logic_vector(DATA0_WIDTH-1 downto 0) -- first  output color plane
);
end component;

signal clkin  : std_logic;


begin
--Add PLL Instance for timing simulation---------
#ifdef DEVICE_ECP5
--u1_pll : ecp5_pll
--  port map (
--     CLK            => clk,
--     RESET          => '0',
--     CLKOP          => clkin,
--     LOCK           => open
--  );
#endif
#ifdef DEVICE_ECP3
--u1_pll : ecp3_pll
--  port map (
--     CLKI           => clk,
--     RST            => '0',
--     CLKOP          => clkin,
--     LOCK           => open
--  );
#endif
#ifdef DEVICE_XP2
--u1_pll : xp2_pll
--  port map (
--     CLKI           => clk,
--     RST            => '0',
--     CLKOP          => clkin,
--     LOCK           => open
--  );
#endif

u1_USERNAME : USERNAME
  port map (
   -- INPUTS
--   clk              => clkin,               -- system clock (for timing simulation)  
   clk              => clk,                 -- system clock  
   rstn             => rstn,                -- system reset
   #ifdef CLKEN
      ce            => ce,                  -- clock enable
   #endif
   #ifdef SYNCRST
      sr            => sr,                  -- synchronous reset 
   #endif
   #ifdef BYPASSEN
      gcen          => gcen,                -- gamma enable 
   #endif
   inpvalid         => inpvalid,            -- input data valid signal
   din0             => din0,                -- first  input color plane 
   #ifdef LUT0WRITEPORT
      lut0wren      => lut0wren,            -- first color plane LUT write enable 
      lut0val       => lut0val ,            -- first color plane LUT write value
   #endif 
   #ifdef INPUT_SERIAL 
      cpsel         => cpsel,               -- color plane select for the inputs
   #endif 
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         din1       => din1,                -- second input color plane 
         #ifdef LUT1WRITEPORT
            lut1wren=> lut1wren,            -- second color plane LUT write enable 
            lut1val => lut1val,             -- second color plane LUT write value
         #endif 
      #endif 
      #ifdef NUMCP3
         din2       => din2,                -- third  input color plane 
         #ifdef LUT2WRITEPORT
            lut2wren=> lut2wren,            -- third color plane LUT write enable 
            lut2val => lut2val,             -- third color plane LUT write value
         #endif 
      #endif 
   #endif 
   
   --=====OUTPUTS
   #ifdef BYPASSEN
      gcvalid       => gcvalid,             -- valid gamma correction output indicator 
   #endif
   outvalid         => outvalid,            -- output data valid signal
   #ifdef INPUT_SERIAL 
      cpout         => cpout,               -- color plane select for the outputs
   #endif 
   #ifndef INPUT_SERIAL 
      #ifdef NUMCP2
         dout1      => dout1,               -- second output color plane 
      #endif 
      #ifdef NUMCP3
         dout2      => dout2,               -- third  output color plane 
      #endif 
   #endif 
   dout0            => dout0                -- first  output color plane 
);
end arch;
