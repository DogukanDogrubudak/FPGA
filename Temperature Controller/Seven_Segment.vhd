library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Seven_Segment is
    Port (
        clk     : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        inputs  : in  integer range 0 to 9999;
        outputs : out STD_LOGIC_VECTOR (6 downto 0);  -- abcdefg
        X       : inout STD_LOGIC_VECTOR (7 downto 0) -- aktif display
    );          
end Seven_Segment;

architecture Behavioral of Seven_Segment is

    -- Alt bileşen tanımları
    component Clock_Divider
        Port (
            clk     : in  STD_LOGIC;  
            rst     : in  STD_LOGIC;
            clk_out : inout STD_LOGIC   
        );
    end component;

    component Decoder
        Port (
            rst : in  STD_LOGIC;
            clk : in  STD_LOGIC;
            X   : out STD_LOGIC_VECTOR (7 downto 0);
            A   : in  STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    component Input_Controller
        Port (
            rst : in  STD_LOGIC;
            clk : in  STD_LOGIC;
            X   : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Sinyal tanımları
    signal timer         : STD_LOGIC;
    signal decoder_in    : STD_LOGIC_VECTOR (2 downto 0);
    signal divided_inputs: UNSIGNED(3 downto 0) := "0000";  -- 0-9 arası
begin

    -- Alt bileşen eşlemeleri
    component1: Clock_Divider 
        port map (clk => clk, rst => rst, clk_out => timer);

    component2: Decoder 
        port map (clk => timer, rst => rst, X => X, A => decoder_in);

    component3: Input_Controller 
        port map (rst => rst, clk => timer, X => decoder_in);

    -- Sayıyı basamaklara böl
    process(inputs, X)
    begin
        if X = "11110111" then  -- 1. display aktif → binler
            divided_inputs <= to_unsigned((inputs / 1000) mod 10, 4);
        elsif X = "11111011" then  -- 2. display aktif → yüzler
            divided_inputs <= to_unsigned((inputs / 100) mod 10, 4);
        elsif X = "11111101" then  -- 3. display aktif → onlar
            divided_inputs <= to_unsigned((inputs / 10) mod 10, 4);
        elsif X = "11111110" then  -- 4. display aktif → birler
            divided_inputs <= to_unsigned(inputs mod 10, 4);
        else
            divided_inputs <= "0000";
        end if;
    end process;

    -- 7 Segment decoder
    process(divided_inputs)
    begin
        case to_integer(divided_inputs) is
            when 0 => outputs <= "1000000"; -- 0
            when 1 => outputs <= "1111001"; -- 1
            when 2 => outputs <= "0100100"; -- 2
            when 3 => outputs <= "0110000"; -- 3
            when 4 => outputs <= "0011001"; -- 4
            when 5 => outputs <= "0010010"; -- 5
            when 6 => outputs <= "0000010"; -- 6
            when 7 => outputs <= "1111000"; -- 7
            when 8 => outputs <= "0000000"; -- 8
            when 9 => outputs <= "0010000"; -- 9
            when others => outputs <= "1111111"; -- ekran kapalı
        end case;
    end process;

end Behavioral;