library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demultiplexers_1x16_tb is
end Demultiplexers_1x16_tb;

architecture Behavioral of Demultiplexers_1x16_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component Demultiplexers_1x16
        Port (
            D   : in  STD_LOGIC;
            S   : in  STD_LOGIC_VECTOR(3 downto 0);
            Y   : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- Testbench signals
    signal D_tb : STD_LOGIC := '1';
    signal S_tb : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Y_tb : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    CONSTANT ClockPeriod	: time	:= 16 ms ;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Demultiplexers_1x16
        Port map (
            D => D_tb,
            S => S_tb,
            Y => Y_tb
        );

	S_tb(3) <= not S_tb(3) after ClockPeriod ;
	S_tb(2) <= not S_tb(2) after ClockPeriod / 2 ;
	S_tb(1) <= not S_tb(1) after ClockPeriod / 4 ;
	S_tb(0) <= not S_tb(0) after ClockPeriod / 8 ;
    

end Behavioral;