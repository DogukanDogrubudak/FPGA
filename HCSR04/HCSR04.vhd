library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HCSR04 is
    Generic (
                CLK_FREQ           : integer;
                MAX_ECHO_TIME      : integer;
                TRIG_PULSE_WIDTH   : integer;
                TRIG_WAIT_TIME     : integer
            );
    Port ( 
                Trigger     : out STD_LOGIC;
                Echo        : in STD_LOGIC;
                Distance    : out STD_LOGIC_VECTOR (31 downto 0);
                clk         : in STD_LOGIC;
                rst       : in STD_LOGIC
          );
end HCSR04;

architecture Behavioral of HCSR04 is

signal trig_counter : integer := 0;
signal echo_counter  : integer := 0;

signal trig_reg      : STD_LOGIC := '0';
signal distance_reg  : unsigned(31 downto 0) := (others => '0');

type state_type is (IDLE, TRIG, ECHO_HIGH, ECHO_LOW, CALCULATE);
signal state : state_type := IDLE;

begin

process(clk,rst)
begin
    if rst = '1' then
        state <= IDLE;
        echo_counter <= 0;
        trig_counter <= 0;
        trig_reg <= '0';
        distance_reg  <= (others => '0');
    elsif clk'event and clk = '1' then
        case state is
        when IDLE =>
            echo_counter <= 0;
            if trig_counter < TRIG_WAIT_TIME then 
                trig_counter <= trig_counter + 1;
            else 
                trig_counter <= 0;
                state <= TRIG;
            end if;
        when TRIG =>
            trig_reg <= '1';
            if trig_counter < TRIG_PULSE_WIDTH then
                trig_counter <= trig_counter + 1;
            else
                trig_reg <= '0';
                trig_counter <= 0;
                state <= ECHO_HIGH;
            end if;  
        when ECHO_HIGH =>
            if echo = '1' then
                state <= ECHO_LOW;
                echo_counter <= 0;
            elsif echo_counter > MAX_ECHO_TIME then
                state <= IDLE;
                echo_counter <= 0;
            else
                echo_counter <= echo_counter + 1;
            end if;  
        when ECHO_LOW =>
            if echo = '0' then
                state <= CALCULATE;
            elsif echo_counter < MAX_ECHO_TIME then
                echo_counter <= echo_counter + 1;
            else                        
                state <= IDLE;
                echo_counter <= 0;
            end if;
        when CALCULATE =>
            distance_reg <= to_unsigned(echo_counter * 171 / (1000000), 32);
            state <= IDLE;
        when others =>
            state <= IDLE;        
        end case;
    end if;
end process;

Trigger <= trig_reg;
Distance <= std_logic_vector(distance_reg);
end Behavioral;