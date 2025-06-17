library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Clock_Divider is
    Port (
        clk      : in  STD_LOGIC;  
        clk_out  : inout STD_LOGIC   
    );
end Clock_Divider;

architecture Behavioral of Clock_Divider is
    signal counter : integer := 0;
    constant divider : integer := 80000;  
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if counter = (divider - 1) then
                clk_out <= not clk_out;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;