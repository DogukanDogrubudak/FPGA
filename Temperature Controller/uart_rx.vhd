library ieee;
use ieee.std_logic_1164.all;

entity uart_rx is
generic
(
    TOTAL_BITS  : integer;
    BAUD_RATE   : integer;
    SYS_FREQ    : integer
);
port
(
    clk      : in std_logic;
    enable    : in std_logic;
    RX       : in std_logic;
    RX_done  : out std_logic;
    data     : out std_logic_vector(TOTAL_BITS downto 0)
);
end entity;

architecture rtl of uart_rx is

constant PERIOD : integer := SYS_FREQ / BAUD_RATE;

signal counter     : integer range 0 to PERIOD := 0;
signal bit_counter : integer range 0 to TOTAL_BITS := TOTAL_BITS;
signal reg         : std_logic_vector(TOTAL_BITS downto 0) := (others => '0');

type t_state is (IDLE, START, SHIFT, STOP);
signal state : t_state := IDLE;

begin

process(clk)
begin
    if rising_edge(clk) then
        case state is
            when IDLE =>
                RX_done <= '0';
                if enable = '1' and RX = '0' then
                    state <= START;
                    counter <= 0;
                end if;

            when START =>
                if counter = PERIOD / 2 then
                    counter <= 0;
                    bit_counter <= TOTAL_BITS - 1;
                    state <= SHIFT;
                else
                    counter <= counter + 1;
                end if;

            when SHIFT =>
                if bit_counter = 0 then
                    state <= STOP;
                else
                    if counter = PERIOD then
                        counter <= 0;
                        reg(TOTAL_BITS-2 downto 0) <= reg(TOTAL_BITS-1 downto 1);
                        reg(TOTAL_BITS-1) <= RX;
                        bit_counter <= bit_counter - 1;
                    else
                        counter <= counter + 1;
                    end if;
                end if;

            when STOP =>
                if counter = PERIOD then
                    counter <= 0;
                    if RX = '1' then
                        RX_done <= '1';
                        data <= reg;
                        state <= IDLE;
                    end if;
                else
                    counter <= counter + 1;
                end if;
        end case;
    end if;
end process;
end rtl;