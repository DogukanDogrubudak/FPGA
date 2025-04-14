library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL; --Kod içerinde aritmetik iþlemler yapacaðýz
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity vga_controller is
    generic(
            constant H_VISIBLE_AREA : integer := 1280;
            constant H_FRONT_PORCH  : integer := 48;
            constant H_BACK_PORCH   : integer := 248;
            constant H_SYNC_PULSE   : integer := 112;
    
            constant V_VISIBLE_AREA : integer := 1024;
            constant V_FRONT_PORCH  : integer := 1;
            constant V_BACK_PORCH   : integer := 38;
            constant V_SYNC_PULSE   : integer := 3
            );
    Port   (
            CLK      : in STD_LOGIC;
            HSYNC    : out STD_LOGIC;
            VSYNC    : out STD_LOGIC;
            RED      : out STD_LOGIC_VECTOR(3 downto 0);
            GREEN    : out STD_LOGIC_VECTOR(3 downto 0);
            BLUE     : out STD_LOGIC_VECTOR(3 downto 0)
            );
end vga_controller;

architecture Behavioral of vga_controller is

constant H_WHOLE_LINE : integer := (H_VISIBLE_AREA + H_FRONT_PORCH + H_BACK_PORCH + H_SYNC_PULSE);
constant V_WHOLE_LINE : integer := (V_VISIBLE_AREA + V_FRONT_PORCH + V_BACK_PORCH + V_SYNC_PULSE);
--For Sync
constant H_SYNC : integer := (H_VISIBLE_AREA + H_FRONT_PORCH);
constant H_SYNC2 : integer := (H_VISIBLE_AREA + H_FRONT_PORCH + H_SYNC_PULSE );
constant V_SYNC : integer :=  (V_VISIBLE_AREA + V_FRONT_PORCH);
constant V_SYNC2 : integer := (V_VISIBLE_AREA + V_FRONT_PORCH + V_SYNC_PULSE );

signal H_Count : integer range 0 to H_WHOLE_LINE:=0;
signal V_Count : integer range 0 to V_WHOLE_LINE :=0;

signal VIDEO_ON :std_logic:='0';

begin

VSYNC <= '1' when (V_Count <= V_SYNC or V_Count > V_SYNC2) else '0';
HSYNC <= '1' when (H_Count <= H_SYNC or H_Count > H_SYNC2) else '0';
VIDEO_ON <= '1' when (H_Count <= H_VISIBLE_AREA OR  V_Count <= V_VISIBLE_AREA) else '0';

Whole_Lines:
process(CLK) begin
    if(rising_edge(CLK)) then
        if(H_Count = H_WHOLE_LINE) then
            H_Count<=0;
            if(V_Count = V_WHOLE_LINE) then
                V_Count<=0;
            else
                V_Count<=V_Count+1;
            end if;
        else
            H_Count<=H_Count+1;
        end if;
     end if;
end process;

Screen: 
process(CLK,V_Count,H_Count,VIDEO_ON) begin --Mimaride olusturdugumuz piksel araliklarini ilgili renklere boyariz    
    if(rising_edge(clk)) then
        if(VIDEO_ON = '1') then
            -- Arka plan varsayılan olarak siyah
            RED   <= "0000";
            GREEN <= "0000";
            BLUE  <= "0000";
            -- Tüm dikdörtgenler için ortak dikey aralık
            if((V_Count >= 384) and (V_Count <= 640)) then
                -- İlk dikdörtgen
                if ((H_Count >= 355) and (H_Count <= 425)) then
                    RED   <= "1111";
                -- İkinci dikdörtgen
                elsif ((H_Count >= 445) and (H_Count <= 515)) then
                    RED   <= "1111";
                -- Üçüncü dikdörtgen
                elsif ((H_Count >= 535) and (H_Count <= 605)) then
                    RED   <= "1111";
                -- Dördüncü dikdörtgen
                elsif ((H_Count >= 625) and (H_Count <= 695)) then
                    RED   <= "1111";
                -- Beşinci dikdörtgen
                elsif ((H_Count >= 715) and (H_Count <= 785)) then
                    RED   <= "1111";
                -- Altıncı dikdörtgen
                elsif ((H_Count >= 805) and (H_Count <= 875)) then
                    RED   <= "1111";
                end if;
            end if;
        else
            -- Sync dışında ekran kapalı (tam siyah)
            RED   <= "0000";
            GREEN <= "0000";
            BLUE  <= "0000";
        end if;
end if;
end process;

end Behavioral;
