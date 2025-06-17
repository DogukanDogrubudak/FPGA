library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SPI_TB is
end entity;

architecture tb of SPI_TB is
    constant CLK_PERIOD : time := 10 ns;
    
    signal CLK      : std_logic := '0';
    signal EN       : std_logic := '0';
    signal SCLK     : std_logic;
    signal CPOL     : std_logic := '1';
    signal CPHA     : std_logic := '1';
    signal MOSI     : std_logic;
    signal MISO     : std_logic := '0';
    signal SSN      : std_logic := '1';
    signal DONE     : std_logic;
    signal TX_DATA  : std_logic_vector(7 downto 0) := "00100100";
    signal RX_DATA  : std_logic_vector(7 downto 0);
    
    component SPI
        generic (
            TOTAL_BITS  : integer := 8;
            SYS_FREQ    : integer := 100_000_000;
            BAUD_RATE   : integer := 1_000_000_000
        );
        port (
            CLK     : in  std_logic;
            EN      : in  std_logic;
            SCLK    : out std_logic;
            CPOL    : in  std_logic;
            CPHA    : in  std_logic;
            MOSI    : out std_logic;
            MISO    : in  std_logic;
            SSN     : in  std_logic;
            DONE    : out std_logic;
            TX_DATA : in  std_logic_vector(7 downto 0);
            RX_DATA : out std_logic_vector(7 downto 0)
        );
    end component;
    
begin
    DUT: SPI
    generic map (
        TOTAL_BITS => 8,
        SYS_FREQ   => 100_000_000,
        BAUD_RATE  => 1_000_000_000
    )
    port map (
        CLK     => CLK,
        EN      => EN,
        SCLK    => SCLK,
        CPOL    => CPOL,
        CPHA    => CPHA,
        MOSI    => MOSI,
        MISO    => MISO,
        SSN     => SSN,
        DONE    => DONE,
        TX_DATA => TX_DATA,
        RX_DATA => RX_DATA
    );
    
    -- Clock process
    process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;
    
    -- Test process
    process
    begin
        wait for 20 ns;
        SSN <= '0';
        EN  <= '1';   
        wait for 1000 ns;
        
        EN  <= '0';
        SSN <= '1';
        
        wait for 50 ns;
        report "Test completed with RX_DATA: " & integer'image(to_integer(unsigned(RX_DATA)));
        
        wait;
    end process;
    
end tb;