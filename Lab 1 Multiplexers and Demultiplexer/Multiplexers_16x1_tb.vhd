library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexers_16x1_tb is
end Multiplexers_16x1_tb;

architecture Behavioral of Multiplexers_16x1_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component Multiplexers_16x1
        Port (
            d  : in  STD_LOGIC_VECTOR(15 downto 0);
            S  : in  STD_LOGIC_VECTOR(3 downto 0);
            Y  : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal d_tb : STD_LOGIC_VECTOR(15 downto 0) := "0101010101010101" ;
    signal s_tb : STD_LOGIC_VECTOR(3 downto 0 ) := (OTHERS => '0') ;
    signal Y_tb : STD_LOGIC := '0';
    CONSTANT ClockPeriod	: time	:= 16 ms ;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Multiplexers_16x1
        Port map (
            d => d_tb,
            S => s_tb,
            Y => Y_tb
        );

    	s_tb(3) <= not s_tb(3) after ClockPeriod ;
	s_tb(2) <= not s_tb(2) after ClockPeriod / 2 ;
	s_tb(1) <= not s_tb(1) after ClockPeriod / 4 ;
	s_tb(0) <= not s_tb(0) after ClockPeriod / 8 ;
    

end Behavioral;