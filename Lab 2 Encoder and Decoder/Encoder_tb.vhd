library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder_tb is
end Encoder_tb;

architecture Behavioral of Encoder_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component Encoder
        Port (
            	I  : in  STD_LOGIC_VECTOR(9 downto 0);
        	D  : out STD_LOGIC ;
		C  : out STD_LOGIC ;
		B  : out STD_LOGIC ;
		A  : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal I_tb : STD_LOGIC_VECTOR(9 downto 0) := "0000000000" ;
    signal D_tb : STD_LOGIC := '0' ;
    signal C_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0' ;
    signal A_tb : STD_LOGIC := '0';	

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Encoder
        Port map (
            I => I_tb,
            D => D_tb,
	    C => C_tb,
	    B => B_tb,
            A => A_tb
        );

    stim_proc: process

	begin

	I_tb(9) <= '0' ; I_tb(8) <= '0' ; I_tb(7) <= '0' ; I_tb(6) <= '0' ; I_tb(5) <= '0' ; I_tb(4) <= '0' ; I_tb(3) <= '0' ; I_tb(2) <= '0' ; I_tb(1) <= '0' ; I_tb(0) <= '1' ; wait for 1 ms ;
	I_tb(9) <= '0' ; I_tb(8) <= '0' ; I_tb(7) <= '0' ; I_tb(6) <= '0' ; I_tb(5) <= '0' ; I_tb(4) <= '0' ; I_tb(3) <= '0' ; I_tb(2) <= '0' ; I_tb(1) <= '1' ; I_tb(0) <= '0' ; wait for 1 ms ;
	I_tb(9) <= '0' ; I_tb(8) <= '0' ; I_tb(7) <= '0' ; I_tb(6) <= '0' ; I_tb(5) <= '0' ; I_tb(4) <= '0' ; I_tb(3) <= '0' ; I_tb(2) <= '1' ; I_tb(1) <= '0' ; I_tb(0) <= '0' ; wait for 1 ms ;
	I_tb(9) <= '0' ; I_tb(8) <= '0' ; I_tb(7) <= '0' ; I_tb(6) <= '0' ; I_tb(5) <= '0' ; I_tb(4) <= '0' ; I_tb(3) <= '1' ; I_tb(2) <= '0' ; I_tb(1) <= '0' ; I_tb(0) <= '0' ; wait for 1 ms ;
	I_tb(9) <= '0' ; I_tb(8) <= '0' ; I_tb(7) <= '0' ; I_tb(6) <= '0' ; I_tb(5) <= '0' ; I_tb(4) <= '1' ; I_tb(3) <= '0' ; I_tb(2) <= '0' ; I_tb(1) <= '0' ; I_tb(0) <= '0' ; wait for 1 ms ;
    	I_tb(9) <= '0' ; I_tb(8) <= '0' ; I_tb(7) <= '0' ; I_tb(6) <= '0' ; I_tb(5) <= '1' ; I_tb(4) <= '0' ; I_tb(3) <= '0' ; I_tb(2) <= '0' ; I_tb(1) <= '0' ; I_tb(0) <= '0' ; wait for 1 ms ;
	I_tb(9) <= '0' ; I_tb(8) <= '0' ; I_tb(7) <= '0' ; I_tb(6) <= '1' ; I_tb(5) <= '0' ; I_tb(4) <= '0' ; I_tb(3) <= '0' ; I_tb(2) <= '0' ; I_tb(1) <= '0' ; I_tb(0) <= '0' ; wait for 1 ms ;
	I_tb(9) <= '0' ; I_tb(8) <= '0' ; I_tb(7) <= '1' ; I_tb(6) <= '0' ; I_tb(5) <= '0' ; I_tb(4) <= '0' ; I_tb(3) <= '0' ; I_tb(2) <= '0' ; I_tb(1) <= '0' ; I_tb(0) <= '0' ; wait for 1 ms ;
	I_tb(9) <= '0' ; I_tb(8) <= '1' ; I_tb(7) <= '0' ; I_tb(6) <= '0' ; I_tb(5) <= '0' ; I_tb(4) <= '0' ; I_tb(3) <= '0' ; I_tb(2) <= '0' ; I_tb(1) <= '0' ; I_tb(0) <= '0' ; wait for 1 ms ;
	I_tb(9) <= '1' ; I_tb(8) <= '0' ; I_tb(7) <= '0' ; I_tb(6) <= '0' ; I_tb(5) <= '0' ; I_tb(4) <= '0' ; I_tb(3) <= '0' ; I_tb(2) <= '0' ; I_tb(1) <= '0' ; I_tb(0) <= '0' ; wait for 1 ms ;

    end process;	 

end Behavioral;