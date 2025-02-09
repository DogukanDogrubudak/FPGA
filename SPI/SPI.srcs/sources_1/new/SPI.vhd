library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SPI is
generic
(
    TOTAL_BITS  : integer := 8;
    SYS_FREQ    : integer := 100_000_000;  
    BAUD_RATE   : integer := 1_000_000_000    
);
port
(
    CLK     : in  std_logic;                               
    EN      : in  std_logic;                             
    SCLK    : out std_logic;                             
    CPOL    : in  std_logic;
    CPHA    : in  std_logic;                          
    MOSI    : out std_logic;                              
    MISO    : in  std_logic;                               
    SSN     : in  std_logic;                               
    DONE    : out std_logic;                               
    TX_DATA : in  std_logic_vector(TOTAL_BITS-1 downto 0); 
    RX_DATA : out std_logic_vector(TOTAL_BITS-1 downto 0)  
);
end entity;

architecture rtl of SPI is

constant PERIOD : integer := SYS_FREQ / BAUD_RATE;

signal counter     : integer range 0 to PERIOD := 0;
signal bit_counter : integer range 0 to TOTAL_BITS := 0;

signal TX_SHIFT : std_logic_vector(TOTAL_BITS-1 downto 0) := (others => '0');  
signal RX_SHIFT : std_logic_vector(TOTAL_BITS-1 downto 0) := (others => '0');  

signal POL  : std_logic := '0';
signal PREV : std_logic := '0';

type t_state is (IDLE, SHIFT, STOP);
signal state : t_state := IDLE;

begin

MOSI <= TX_SHIFT(TOTAL_BITS-1);
SCLK <= POL;

process(CLK)
begin
    if rising_edge(CLK) then
        case state is
            when IDLE  =>
                DONE <= '0';
                
                if EN = '1' and SSN = '0' then
                    state <= SHIFT;
                    counter <= 0;
                    bit_counter <= TOTAL_BITS;
                    TX_SHIFT <= TX_DATA;
                    RX_SHIFT <= (others => '0'); 
                    
                    POL <= CPOL;
                end if;
                
            when SHIFT =>
                if bit_counter = 0 then
                    state <= STOP;
                else
                    if counter = PERIOD then
                        PREV <= POL;
                        POL <= not POL;
                        counter <= 0;
                        
                        if CPHA = '0' and PREV = '0' and POL = '1' then
                            TX_SHIFT(TOTAL_BITS-1 downto 1) <= TX_SHIFT(TOTAL_BITS-2 downto 0);  
                            TX_SHIFT(0) <= '0';  
                            
                            RX_SHIFT(TOTAL_BITS-1 downto 1) <= RX_SHIFT(TOTAL_BITS-2 downto 0);  
                            RX_SHIFT(0) <= MISO; 
                            
                            bit_counter <= bit_counter - 1;

                        elsif CPHA = '1' and PREV = '1' and POL = '0' then
                            TX_SHIFT(TOTAL_BITS-1 downto 1) <= TX_SHIFT(TOTAL_BITS-2 downto 0);  
                            TX_SHIFT(0) <= '0';  
                            
                            RX_SHIFT(TOTAL_BITS-1 downto 1) <= RX_SHIFT(TOTAL_BITS-2 downto 0);  
                            RX_SHIFT(0) <= MISO;

                            bit_counter <= bit_counter - 1;
                        end if;
                    else
                        counter <= counter + 1;
                    end if;
                end if;

            when STOP =>
                DONE <= '1';
                RX_DATA <= RX_SHIFT;
                state <= IDLE;
        end case;
    end if;
end process;

end rtl;
