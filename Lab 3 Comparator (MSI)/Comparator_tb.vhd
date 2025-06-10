library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_tb is
end Comparator_tb;

architecture Behavioral of Comparator_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component Comparator
        Port (
            	A           : in  STD_LOGIC_VECTOR(3 downto 0):= "0000";    -- 4-bit input A
        	B           : in  STD_LOGIC_VECTOR(3 downto 0):= "0000";    -- 4-bit input B
        	B_MORE_A      : out STD_LOGIC := '0' ;                  -- Output when A > B
        	B_LESS_A      : out STD_LOGIC := '0' ;                    -- Output when A < B
        	B_EQUAL_A     : out STD_LOGIC := '0'                      -- Output when A = B
        );
    end component;

    -- Testbench signals
    signal A_tb : STD_LOGIC_VECTOR(3 downto 0 ) := (OTHERS => '0') ;
    signal B_tb : STD_LOGIC_VECTOR(3 downto 0 ) := (OTHERS => '0') ;
    signal B_MORE_A_tb : STD_LOGIC := '0';
    signal B_LESS_A_tb : STD_LOGIC := '0';
    signal B_EQUAL_A_tb : STD_LOGIC := '0';

    CONSTANT ClockPeriod	: time	:= 16 ms ;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Comparator
        Port map (
            	A => A_tb,
            	B => B_tb,
		B_MORE_A => B_MORE_A_tb,
		B_LESS_A => B_LESS_A_tb,
            	B_EQUAL_A => B_EQUAL_A_tb
        );

    	A_tb(3) <= not A_tb(3) after ClockPeriod ;
	A_tb(2) <= not A_tb(2) after ClockPeriod / 2 ;
	A_tb(1) <= not A_tb(1) after ClockPeriod / 4 ;
	A_tb(0) <= not A_tb(0) after ClockPeriod / 8 ;

	B_tb(3) <= not B_tb(3) after ClockPeriod / 16;
	B_tb(2) <= not B_tb(2) after ClockPeriod / 32;
	B_tb(1) <= not B_tb(1) after ClockPeriod / 64 ;
	B_tb(0) <= not B_tb(0) after ClockPeriod / 128 ;
    

end Behavioral;
