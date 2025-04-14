library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Seven_Segment is
    Port ( clk      : in STD_LOGIC;
           inputs   : inout STD_LOGIC_VECTOR (7 downto 0);
           outputs  : out STD_LOGIC_VECTOR (6 downto 0);
           X        : inout std_logic_vector (7 downto 0));          
end Seven_Segment;

architecture Behavioral of Seven_Segment is

component Clock_Divider
    Port (
        clk      : in  STD_LOGIC;  
        clk_out  : inout STD_LOGIC   
    );
end component;

component Decoder
    Port (
           clk : in std_logic;
           X : out std_logic_vector(7 downto 0);
           A : in std_logic_vector(2 downto 0) 
    );
end component;

component Input_Controller
    Port (
           clk : in std_logic;
           X : out std_logic_vector(2 downto 0)
    );
end component;

signal timer : std_logic;
signal anode  : std_logic_vector(7 downto 0);
signal decoder_in : std_logic_vector(2 downto 0);
signal divided_inputs : std_logic_vector(7 downto 0):= "00000100";
signal temp :  std_logic_vector(7 downto 0):= "00000100";

begin

component1: Clock_Divider port map ( clk => clk, clk_out => timer );
component2: Decoder port map ( clk => timer, X => X, A => decoder_in );
component3: Input_Controller port map ( clk => timer, X => decoder_in); 

process(inputs)
begin
        if( X = "11110111") then
            divided_inputs <= std_logic_vector(unsigned(inputs) /1000);
        elsif (X = "11111011") then
            temp <= std_logic_vector(unsigned(inputs) mod 1000);
            divided_inputs <= std_logic_vector(unsigned(temp) /100);
        elsif (X = "11111101") then
            temp <= std_logic_vector(unsigned(inputs) mod 100);
            divided_inputs <= std_logic_vector(unsigned(temp) /10);
        elsif (X = "11111110") then
            divided_inputs <= std_logic_vector(unsigned(inputs) mod 10);
        else
            divided_inputs <= "11111111";
        end if;  
end process;

process(divided_inputs)
begin
    case divided_inputs is
    when "00000000" => outputs <= "0000001"; -- "0"     
    when "00000001" => outputs <= "1001111"; -- "1" 
    when "00000010" => outputs <= "0010010"; -- "2" 
    when "00000011" => outputs <= "0000110"; -- "3" 
    when "00000100" => outputs <= "1001100"; -- "4" 
    when "00000101" => outputs <= "0100100"; -- "5" 
    when "00000110" => outputs <= "0100000"; -- "6" 
    when "00000111" => outputs <= "0001111"; -- "7" 
    when "00001000" => outputs <= "0000000"; -- "8"     
    when "00001001" => outputs <= "0000100"; -- "9" 
    when "00001010" => outputs <= "0000010"; -- a
    when "00001011" => outputs <= "1100000"; -- b
    when "00001100" => outputs <= "0110001"; -- C
    when "00001101" => outputs <= "1000010"; -- d
    when "00001110" => outputs <= "0110000"; -- E
    when "00001111" => outputs <= "0111000"; -- 
    when others => outputs <= "0000001";
    end case;
end process;
end Behavioral;