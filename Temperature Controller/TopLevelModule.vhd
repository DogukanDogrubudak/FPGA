library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
--------------------------------------------------PORTS------------------------------------------------------------------------------------------
entity TopLevelModule is
  generic (
    RS232_DATA_BITS : integer := 8;
    SYS_CLK_FREQ    : integer := 100_000_000;
    BAUD_RATE       : integer := 115200;
	sys_clk         : INTEGER := 100_000_000;
    pwm_freq        : INTEGER := 100_000;            
    phases          : INTEGER := 1;
    CLK_FREQ           : integer := 100000000; -- 100 MHz
    MAX_ECHO_TIME      : integer := 2330000;  -- 23.3 ms 
    TRIG_PULSE_WIDTH   : integer := 1000;     -- 10 us
    TRIG_WAIT_TIME     : integer := 5_000_000 -- 50 ms 
  );
  port (
    Clk             		: in std_logic;
    Rst             		: in std_logic;
    rs232_rx_pin    		: in std_logic;
    rs232_tx_pin    		: out std_logic;
    TX_done                 : out std_logic;
    RX_done                 : out std_logic;
	enable      			: IN  STD_LOGIC;                                    
    pwm_out   				: OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0);          
    pwm_n_out 				: OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0);
	sensor_reading_async	: in std_logic; --gpio1
	sensor_writing			: inout std_logic; --gpio3
	Echo                    : in STD_LOGIC;
	Trigger                 : out STD_LOGIC;
	AN                      : inout STD_LOGIC_VECTOR (7 downto 0);
    display                 : out STD_LOGIC_VECTOR(6 downto 0);
    LED       		   		: out std_logic_vector(2 downto 0);
	hilo 					: in std_logic;
	input 					: in std_logic;
	waveform 				: out std_logic);
end entity;

architecture rtl of TopLevelModule is

----------------------------------------------------COMPONENT--------------------------------------------------------------------------------

  component risingedge_detector is
	 port 
	 (
		clk		: in std_logic;
		rst		: in std_logic;
		input 	: in std_logic;
		output 	: out std_logic
	 );
  end component;

  component dht_sensor is
    port (
          clk     					: in  std_logic;
		  rst		 					: in  std_logic;
		  start						: in  std_logic;
		  sensor_reading_async	: in std_logic;
		  sensor_writing  		: inout std_logic:='Z';
		  data_out					: out std_logic_vector(7 downto 0);
		  data_flag					: out std_logic
		);
  end component;

  component pwm

  GENERIC(
            sys_clk         : INTEGER ; --system clock frequency in Hz
            pwm_freq        : INTEGER ;    --PWM switching frequency in Hz
            bits_resolution : INTEGER ;          --bits of resolution setting the duty cycle
            phases          : INTEGER );         --number of output pwms and phases
    PORT(
            clk       : IN  STD_LOGIC;                                    --system clock
            reset_n   : IN  STD_LOGIC;                                    --asynchronous reset
            ena       : IN  STD_LOGIC;                                    --latches in new duty cycle
            duty      : IN  STD_LOGIC_VECTOR(bits_resolution-1 DOWNTO 0); --duty cycle
            pwm_out   : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0);          --pwm outputs
            pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
        );
  end component;

  component UART_tx is
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
        data     : in std_logic_vector(TOTAL_BITS-2 downto 0);
        TX       : out std_logic;
        TX_done  : out std_logic
    );
  end component;

  component UART_rx is
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
    end component;
  
  component buzzer
	Port ( 
			  clk_50 : in std_logic;
			  reset : in std_logic;
			  hilo : in std_logic;
			  input : in std_logic; -- Yeni giriş portu
			  waveform : out std_logic 
		 );
  end component;

  component HCSR04_sensor_interface
	 port
	 (
		-- Input ports
		i_Clock			: in std_logic;
		i_Reset_n		: in std_logic;
		i_Echo			: in std_logic;--measurement pulse from sensor. En bit eftersom det är ett pinne i sensor som skickar echo signal
		
		--Output ports
		o_Trigger		: out std_logic;
		o_Sen_interface_Ones	: out std_logic_vector(3 downto 0);
		o_Sen_interface_Tens	: out std_logic_vector(3 downto 0);
		o_Sen_interface_Hundreds	: out std_logic_vector(3 downto 0);
		o_DV_n			: out std_logic
	);
  end component;
  
  component Seven_Segment
    Port ( 
            clk      : in STD_LOGIC;
            rst      : in STD_LOGIC;
            inputs   : in integer range 0 to 9999;
            outputs  : out STD_LOGIC_VECTOR (6 downto 0);
            X        : inout STD_LOGIC_VECTOR (7 downto 0)
          );          
end component;

component HCSR04
    Generic (
                CLK_FREQ           : integer; -- 100 MHz
                MAX_ECHO_TIME      : integer;   -- 23.3 ms 
                TRIG_PULSE_WIDTH   : integer;   -- 10 us
                TRIG_WAIT_TIME     : integer    -- 50 ms
            );
    Port    (   
                Trigger : out STD_LOGIC;
                Echo    : in STD_LOGIC;  
                Distance : out STD_LOGIC_VECTOR (31 downto 0);
                clk     : in STD_LOGIC;
                rst   : in STD_LOGIC
            );
end component;
	

--------------------------------------------------------------SIGNALS-----------------------------------------------------------------------
  
  signal N_reset		 		: std_logic;
  signal dht_start				: std_logic;
  signal dht_interrupt			: std_logic;
  signal temp_temp_2			: integer range 0 to 60:=0;
  signal temp_temp				: integer range 0 to 60:=0;
  signal measured_temp  		: std_logic_vector(7 downto 0);
  signal count					: integer range 0 to 75000001:=0;
  signal actual_measured_temp   : std_logic_vector(7 downto 0);
  signal RxData       			: std_logic_vector(RS232_DATA_BITS - 1 downto 0);
  signal duty         			: STD_LOGIC_VECTOR(RS232_DATA_BITS-1 DOWNTO 0);
  signal buzzer_in 				: std_logic;
  signal selection				: std_logic;
  signal Distance               : STD_LOGIC_VECTOR(31 downto 0); -- Distance value in cm
  signal distance_int           : integer; -- Distance value as integer

-------------------------------------------------PORTMAP--------------------------------------------------------------------------- 
begin
  
    component1 : UART_tx 					 
    generic map (TOTAL_BITS=>(RS232_DATA_BITS+1), BAUD_RATE =>BAUD_RATE, SYS_FREQ =>SYS_CLK_FREQ)
	port map (Clk=>Clk,enable=>enable,data=>actual_measured_temp,TX=>rs232_tx_pin, TX_Done=>Tx_Done);

    component2 : UART_rx 					 
    generic map (TOTAL_BITS=>RS232_DATA_BITS,SYS_FREQ=> SYS_CLK_FREQ,BAUD_RATE=>BAUD_RATE)
	port map (Clk=>Clk,enable=>enable,RX=>rs232_rx_pin,Rx_Done=>Rx_Done,data=>RxData);
	 
    component3 : pwm 							 
    generic map (sys_clk=>sys_clk,pwm_freq=>pwm_freq,bits_resolution=>RS232_DATA_BITS,phases=>phases)          
	port map(clk=>Clk,reset_n=>N_reset,ena=>enable,duty=>duty,pwm_out=>pwm_out,pwm_n_out=>pwm_n_out);

    component4	:dht_sensor 					 
    port map(Clk=>clk,Rst=>rst,start=>dht_start,sensor_reading_async=>sensor_reading_async,sensor_writing=>sensor_writing,data_out=>measured_temp,data_flag=>dht_interrupt);
	
    component5: HCSR04
    generic map(CLK_FREQ => CLK_FREQ, MAX_ECHO_TIME => MAX_ECHO_TIME, TRIG_PULSE_WIDTH => TRIG_PULSE_WIDTH, TRIG_WAIT_TIME => TRIG_WAIT_TIME)
    port map(Trigger => Trigger, Echo => Echo, Distance => Distance, clk => clk, rst => rst);

    distance_int <= to_integer(unsigned(Distance));
    
    component6: Seven_Segment
    port map(clk => clk, rst => rst, inputs => distance_int, outputs => display, X => AN);

	component7 : buzzer 						 
	port map(clk_50=>Clk,reset=>Rst,hilo=>hilo,input=>buzzer_in,waveform=>waveform );
	
	N_reset <= Not Rst;
	
	temp_temp <=to_integer(unsigned(measured_temp));

	temp_temp_2<=temp_temp-3;

	actual_measured_temp<=std_logic_vector(to_unsigned(temp_temp_2, 8));

-----------------------------------------------------PROCESS---------------------------------------------------------------------------------		


	generate_clk_dht:process(Rst,Clk)
	begin
		if Rst='1' then
			count<=0;
			dht_start<='0';
		elsif rising_edge(Clk) then
			dht_start<='0';
			count<=count+1;
				if count= 75000000 then
					dht_start<='1';
					count<=0;
				end if;
		end if;
	end process;

	PWM_Speed : process(Clk)
		begin
			 if Rst = '1' then
				  duty <= (others => '0'); -- Reset durumunda tüm LED'leri kapat
			 elsif rising_edge(Clk) then
				  case RxData is
						when "00110001" =>
							 duty <= "10000000";
						when "00110010" =>
							 duty <= "11000000";
						when "00110011" =>
							 duty <= "11100000";
						when "00110100" =>
							 duty <= "11110000";
						when "00110101" =>
							 duty <= "11111000";
						when "00110110" =>
							 duty <= "11111100";
						when "00110111" =>
							 duty <= "11111110";
						when "00111000" =>
							 duty <= "11111111";
						when "00110000" =>
							 selection <= '0';
							 duty <= "10000000";
						when "00111001" =>
							 selection <= '1';
							 duty <= "10000000";
						when others =>
							 duty <= "10000000";
				  end case;
			 end if;
	end process;
	
end rtl;