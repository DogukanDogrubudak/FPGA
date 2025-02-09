library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Input_Controller is
  Port ( 
         clk : in std_logic;
         X : out std_logic_vector(2 downto 0)
  );
end Input_Controller;

architecture Behavioral of Input_Controller is

signal counter : integer := 0; -- counter için başlangıç değeri ekledik.

begin

process(clk)
begin
    if rising_edge(clk) then
        if counter < 7 then
            counter <= counter + 1;
        else
            counter <= 0;
        end if;
    end if;
end process;

process (counter)
begin
    case counter is
        when 0 => X <= "111";
        when 1 => X <= "110";
        when 2 => X <= "101";
        when 3 => X <= "100";
        when 4 => X <= "011";
        when 5 => X <= "010";
        when 6 => X <= "001";
        when 7 => X <= "000";
        when others => null;
    end case;
end process;

end Behavioral;