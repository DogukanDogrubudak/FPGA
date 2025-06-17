library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port ( rst : in std_logic;
           clk : in std_logic;
           X : out std_logic_vector(7 downto 0);
           A : in std_logic_vector(2 downto 0)
    );
end Decoder;

architecture Behavioral of Decoder is

begin

process( A,clk,rst)
begin
    if rst = '1' then
        X <= "11111111";
    elsif rising_edge(clk) then
        case A is         
            when "000" => X <= "01111111";
            when "001" => X <= "10111111";
            when "010" => X <= "11011111";
            when "011" => X <= "11101111";
            when "100" => X <= "11110111";
            when "101" => X <= "11111011";
            when "110" => X <= "11111101";
            when "111" => X <= "11111110";
            when others => X <= "00000000";
        end case;
    end if;
end process;     
end Behavioral;