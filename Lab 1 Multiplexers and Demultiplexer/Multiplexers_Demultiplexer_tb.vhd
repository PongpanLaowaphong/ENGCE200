library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexers_Demultiplexer_tb is
end Multiplexers_Demultiplexer_tb;

architecture Behavioral of Multiplexers_Demultiplexer_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component Multiplexers_Demultiplexer
        Port (
            DataInputs : in  STD_LOGIC_VECTOR(15 downto 0);
            SelectMux  : in  STD_LOGIC_VECTOR(3 downto 0);
            SelectDemux: in  STD_LOGIC_VECTOR(3 downto 0);
            Outputs    : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- Testbench signals
    signal DataInputs_tb : STD_LOGIC_VECTOR(15 downto 0) := "0101010101010101" ;
    signal SelectMux_tb  : STD_LOGIC_VECTOR(3 downto 0) := (OTHERS => '0') ;
    signal SelectDemux_tb: STD_LOGIC_VECTOR(3 downto 0) := (OTHERS => '0') ;
    signal Outputs_tb    : STD_LOGIC_VECTOR(15 downto 0) := (OTHERS => '0') ;
    CONSTANT ClockPeriod	: time	:= 16 ms ;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Multiplexers_Demultiplexer
        Port map (
            DataInputs => DataInputs_tb,
            SelectMux  => SelectMux_tb,
            SelectDemux => SelectDemux_tb,
            Outputs    => Outputs_tb
        );

	SelectMux_tb(3) <= not SelectMux_tb(3) after ClockPeriod ;
	SelectMux_tb(2) <= not SelectMux_tb(2) after ClockPeriod / 2 ;
	SelectMux_tb(1) <= not SelectMux_tb(1) after ClockPeriod / 4 ;
	SelectMux_tb(0) <= not SelectMux_tb(0) after ClockPeriod / 8 ;

	SelectDemux_tb(3) <= not SelectDemux_tb(3) after ClockPeriod / 16;
	SelectDemux_tb(2) <= not SelectDemux_tb(2) after ClockPeriod / 32;
	SelectDemux_tb(1) <= not SelectDemux_tb(1) after ClockPeriod / 64;
	SelectDemux_tb(0) <= not SelectDemux_tb(0) after ClockPeriod / 128;

end Behavioral;
