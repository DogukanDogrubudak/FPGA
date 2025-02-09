library ieee;
use ieee.std_logic_1164.all;

entity top_module is
generic
(
    TOTAL_BITS  : integer := 8;
    SYS_FREQ    : integer := 100000000;
    BAUD_RATE   : integer := 115200
);
port
(
    CLK         : in std_logic;
    EN          : in std_logic_vector(1 downto 0);
    RX          : in std_logic;
    TX          : out std_logic;
    INPUT       : in std_logic_vector(7 downto 0);
    DONE        : out std_logic_vector( 1 downto 0);
    SEVEN_SEG   : out STD_LOGIC_VECTOR (6 downto 0);
    X           : inout std_logic_vector (7 downto 0)
);
end entity;


architecture rtl of top_module is

component baud_sel is
port
(
    clk       : in std_logic;
    sel       : in std_logic_vector(2 downto 0);
    baud_rate : out integer
);
end component;

component uart_tx is
generic
(
    TOTAL_BITS  : integer := 9;
    BAUD_RATE   : integer := 115200;
    SYS_FREQ    : integer := 100000000
);
port
(
    clk      : in std_logic;
    enable    : in std_logic;
    data     : in std_logic_vector(TOTAL_BITS-2 downto 0);
    TX       : out std_logic;
    TX_done  : out std_logic
);
end component;

component Seven_Segment
    Port (
        clk      : in STD_LOGIC;
        inputs   : inout STD_LOGIC_VECTOR (7 downto 0);
        outputs  : out STD_LOGIC_VECTOR (6 downto 0);
        X        : inout std_logic_vector (7 downto 0)   
    );
end component;

component uart_rx is
generic
(
    TOTAL_BITS  : integer := 8;
    BAUD_RATE   : integer := 115200;
    SYS_FREQ    : integer := 100000000
);
port
(
    clk      : in std_logic;
    enable    : in std_logic;
    RX       : in std_logic;
    RX_done  : out std_logic;
    data     : out std_logic_vector(TOTAL_BITS downto 0)
);
end component;

signal DATA      : std_logic_vector(TOTAL_BITS downto 0);

begin

component1: Seven_Segment 
port map ( clk => CLK, inputs => DATA(TOTAL_BITS downto 1), outputs => SEVEN_SEG, X => X);
component2: uart_rx
generic map( TOTAL_BITS => TOTAL_BITS, BAUD_RATE => BAUD_RATE, SYS_FREQ => SYS_FREQ)
port map ( clk => CLK, enable=> EN(0), RX => RX, RX_done=> DONE(0),data=>DATA);
component3: uart_tx
generic map(TOTAL_BITS => (TOTAL_BITS + 1), BAUD_RATE => BAUD_RATE, SYS_FREQ => SYS_FREQ)
port map(clk => CLK, enable => EN(1), data => INPUT, TX => TX, TX_done => DONE(1));

end rtl;