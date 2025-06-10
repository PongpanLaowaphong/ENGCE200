library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EncoderToDecoder_tb is
end EncoderToDecoder_tb;

architecture Behavioral of EncoderToDecoder_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component EncoderToDecoder
        Port (
            DataInputs : in  STD_LOGIC_VECTOR(9 downto 0);
            Decoder_Outputs_g    : out STD_LOGIC ;
	    Decoder_Outputs_f    : out STD_LOGIC ;
	    Decoder_Outputs_e    : out STD_LOGIC ;
	    Decoder_Outputs_d    : out STD_LOGIC ;
	    Decoder_Outputs_c    : out STD_LOGIC ;
	    Decoder_Outputs_b    : out STD_LOGIC ;
	    Decoder_Outputs_a    : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal DataInputs_tb : STD_LOGIC_VECTOR(9 downto 0) := "0000000000" ;
    signal Decoder_Outputs_g_tb  : STD_LOGIC := '0' ;
    signal Decoder_Outputs_f_tb  : STD_LOGIC := '0' ;
    signal Decoder_Outputs_e_tb  : STD_LOGIC := '0' ;
    signal Decoder_Outputs_d_tb  : STD_LOGIC := '0' ;
    signal Decoder_Outputs_c_tb  : STD_LOGIC := '0' ;
    signal Decoder_Outputs_b_tb  : STD_LOGIC := '0' ;
    signal Decoder_Outputs_a_tb  : STD_LOGIC := '0' ;
    CONSTANT ClockPeriod	 : time	:= 16 ms ;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: EncoderToDecoder
        Port map (
            DataInputs 		=> DataInputs_tb,
            Decoder_Outputs_g   => Decoder_Outputs_g_tb,
            Decoder_Outputs_f   => Decoder_Outputs_f_tb,
	    Decoder_Outputs_e   => Decoder_Outputs_e_tb,
	    Decoder_Outputs_d   => Decoder_Outputs_d_tb,
	    Decoder_Outputs_c   => Decoder_Outputs_c_tb,
	    Decoder_Outputs_b   => Decoder_Outputs_b_tb,
            Decoder_Outputs_a   => Decoder_Outputs_a_tb
        );

    stim_proc: process

	begin

	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '1' ; wait for 1 ms ;
	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '1' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;
	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '1' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;
	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '1' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;
	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '1' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;
    	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '1' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;
	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '1' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;
	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '1' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;
	DataInputs_tb(9) <= '0' ; DataInputs_tb(8) <= '1' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;
	DataInputs_tb(9) <= '1' ; DataInputs_tb(8) <= '0' ; DataInputs_tb(7) <= '0' ; DataInputs_tb(6) <= '0' ; DataInputs_tb(5) <= '0' ; DataInputs_tb(4) <= '0' ; DataInputs_tb(3) <= '0' ; DataInputs_tb(2) <= '0' ; DataInputs_tb(1) <= '0' ; DataInputs_tb(0) <= '0' ; wait for 1 ms ;

    end process ;

end Behavioral;
