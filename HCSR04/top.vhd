library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    Generic (
                CLK_FREQ           : integer := 100000000; -- 100 MHz
                MAX_ECHO_TIME      : integer := 2330000;  -- 23.3 ms 
                TRIG_PULSE_WIDTH   : integer := 1000;     -- 10 us
                TRIG_WAIT_TIME     : integer := 5_000_000 -- 50 ms
            );
    Port    (
                Trigger : out STD_LOGIC;
                Echo    : in STD_LOGIC;
                clk     : in STD_LOGIC;
                reset   : in STD_LOGIC;
                AN      : inout STD_LOGIC_VECTOR (7 downto 0);
                display : out STD_LOGIC_VECTOR(6 downto 0)
            );
end top;

architecture Behavioral of top is

signal Distance        : STD_LOGIC_VECTOR(31 downto 0); -- Distance value in cm
signal distance_int    : integer; -- Distance value as integer

component Seven_Segment
    Port ( 
            clk      : in STD_LOGIC;
            rst      : in STD_LOGIC;
            inputs   : in integer range 0 to 9999;
            outputs  : out STD_LOGIC_VECTOR (6 downto 0);
            X        : inout STD_LOGIC_VECTOR (7 downto 0)
          );          
end component;

component HCSR04
    Generic (
                CLK_FREQ           : integer; -- 100 MHz
                MAX_ECHO_TIME      : integer;   -- 23.3 ms 
                TRIG_PULSE_WIDTH   : integer;   -- 10 us
                TRIG_WAIT_TIME     : integer    -- 50 ms
            );
    Port    (   
                Trigger : out STD_LOGIC;
                Echo    : in STD_LOGIC;  
                Distance : out STD_LOGIC_VECTOR (31 downto 0);
                clk     : in STD_LOGIC;
                rst   : in STD_LOGIC
            );
end component;
    
begin

HCSR04_inst: HCSR04
generic map(CLK_FREQ => CLK_FREQ, MAX_ECHO_TIME => MAX_ECHO_TIME, TRIG_PULSE_WIDTH => TRIG_PULSE_WIDTH, TRIG_WAIT_TIME => TRIG_WAIT_TIME)
port map(Trigger => Trigger, Echo => Echo, Distance => Distance, clk => clk, rst => reset);
        
distance_int <= to_integer(unsigned(Distance));

Display_comp_inst: Seven_Segment
port map(clk => clk, rst => reset, inputs => distance_int, outputs => display, X => AN);

end Behavioral;