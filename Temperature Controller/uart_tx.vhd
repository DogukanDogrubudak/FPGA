library ieee;
use ieee.std_logic_1164.all;

entity uart_tx is

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

end entity;

architecture rtl of uart_tx is

constant PERIOD : integer := SYS_FREQ / BAUD_RATE;

signal counter     : integer range 0 to PERIOD := 0;
signal bit_counter : integer range 0 to TOTAL_BITS := TOTAL_BITS;
signal reg         : std_logic_vector(TOTAL_BITS-2 downto 0) := (others => '0');
signal TX_reg      : std_logic := '1';

-- State Machine States
type t_state is (IDLE, START, SHIFT, STOP);
signal state : t_state := IDLE;

begin
-- Update TX whenever TX_reg changes
TX <= TX_reg;
process(clk)
begin
    if rising_edge(clk) then
        case state is
            when IDLE =>
               TX_done <= '0';
               if enable = '1' and TX_reg = '1' then
                    state <= START;
                    counter <= 0; 
               end if;
            when START =>
                if counter = PERIOD then
                    TX_reg <= '0';
                    reg <= data;
                    state <= SHIFT;
                    counter <= 0;
                    bit_counter <= TOTAL_BITS - 1;
                else    
                    counter <= counter + 1;
                end if;
                   
            when SHIFT =>
                if bit_counter = 0 then
                        bit_counter <= TOTAL_BITS;
                        state <= STOP;
                    else
                        if counter = PERIOD then
                            TX_reg <= reg(0);
                            reg <= '0' & reg(reg'left downto 1);
                            bit_counter <= bit_counter - 1;
                            counter <= 0;
                        else
                            counter <= counter + 1;
                        end if;    
                    end if;
            when STOP =>
                if counter = PERIOD then
                    counter <= 0;
                    TX_done <= '1';
                    TX_reg <= '1';
                    state <= IDLE;
                else
                    counter <= counter + 1;
                end if;
        end case;
    end if;
end process;
end rtl;