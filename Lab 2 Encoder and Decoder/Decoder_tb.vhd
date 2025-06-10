library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_tb is
end Decoder_tb;

architecture Behavioral of Decoder_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component Decoder
        Port (
            	D_input  : in STD_LOGIC ;
		C_input  : in STD_LOGIC ;
		B_input  : in STD_LOGIC ;
		A_input  : in STD_LOGIC ;
		g_output  : out STD_LOGIC ;
		f_output  : out STD_LOGIC ;
		e_output  : out STD_LOGIC ;
		d_output  : out STD_LOGIC ;
		c_output  : out STD_LOGIC ;
		b_output  : out STD_LOGIC ;
		a_output  : out STD_LOGIC 
        );
    end component;

    -- Testbench signals
    signal D_input_tb : STD_LOGIC := '0' ;
    signal C_input_tb : STD_LOGIC := '0' ;
    signal B_input_tb : STD_LOGIC := '0' ;
    signal A_input_tb : STD_LOGIC := '0' ;
    signal g_output_tb : STD_LOGIC := '0' ;
    signal f_output_tb : STD_LOGIC := '0' ;
    signal e_output_tb : STD_LOGIC := '0' ;
    signal d_output_tb : STD_LOGIC := '0' ;
    signal c_output_tb : STD_LOGIC := '0' ;
    signal b_output_tb : STD_LOGIC := '0' ;
    signal a_output_tb : STD_LOGIC := '0' ;		

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Decoder
        Port map (
	    D_input => D_input_tb,
	    C_input => C_input_tb,
	    B_input => B_input_tb,
	    A_input => A_input_tb,
	    g_output => g_output_tb,
	    f_output => f_output_tb,
	    e_output => e_output_tb,
	    d_output => d_output_tb,
	    c_output => c_output_tb,
	    b_output => b_output_tb,
	    a_output => a_output_tb

        );

    stim_proc: process

	begin
	
	D_input_tb <= '0' ; C_input_tb <= '0' ; B_input_tb <= '0' ; A_input_tb <= '0' ; wait for 1 ms ; -- 0
	D_input_tb <= '0' ; C_input_tb <= '0' ; B_input_tb <= '0' ; A_input_tb <= '1' ; wait for 1 ms ; -- 1
	D_input_tb <= '0' ; C_input_tb <= '0' ; B_input_tb <= '1' ; A_input_tb <= '0' ; wait for 1 ms ; -- 2
	D_input_tb <= '0' ; C_input_tb <= '0' ; B_input_tb <= '1' ; A_input_tb <= '1' ; wait for 1 ms ; -- 3
	D_input_tb <= '0' ; C_input_tb <= '1' ; B_input_tb <= '0' ; A_input_tb <= '0' ; wait for 1 ms ; -- 4
	D_input_tb <= '0' ; C_input_tb <= '1' ; B_input_tb <= '0' ; A_input_tb <= '1' ; wait for 1 ms ; -- 5
	D_input_tb <= '0' ; C_input_tb <= '1' ; B_input_tb <= '1' ; A_input_tb <= '0' ; wait for 1 ms ; -- 6
	D_input_tb <= '0' ; C_input_tb <= '1' ; B_input_tb <= '1' ; A_input_tb <= '1' ; wait for 1 ms ; -- 7
	D_input_tb <= '1' ; C_input_tb <= '0' ; B_input_tb <= '0' ; A_input_tb <= '0' ; wait for 1 ms ; -- 8
	D_input_tb <= '1' ; C_input_tb <= '0' ; B_input_tb <= '0' ; A_input_tb <= '1' ; wait for 1 ms ; -- 9
	
    end process;	 

end Behavioral;
