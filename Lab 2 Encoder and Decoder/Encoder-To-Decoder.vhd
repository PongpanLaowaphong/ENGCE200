library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Top-level entity declaration
entity EncoderToDecoder is
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
end EncoderToDecoder;

-- Top-level architecture
architecture Behavioral of EncoderToDecoder is
    -- Internal signals
    signal Encoder_out_D : STD_LOGIC;
    signal Encoder_out_C : STD_LOGIC;
    signal Encoder_out_B : STD_LOGIC;
    signal Encoder_out_A : STD_LOGIC;
begin
    -- Instantiate the Encoder
    encoder_inst : entity work.Encoder
        Port map (
            I  => DataInputs,
            D  => Encoder_out_D,
	    C  => Encoder_out_C,
	    B  => Encoder_out_B,
	    A  => Encoder_out_A
        );

    -- Instantiate the Decoder
    decoder_inst : entity work.Decoder
        Port map (
            D_input  => Encoder_out_D,
	    C_input  => Encoder_out_C,
	    B_input  => Encoder_out_B,
	    A_input  => Encoder_out_A,
	    g_output => Decoder_Outputs_g,
	    f_output => Decoder_Outputs_f,
	    e_output => Decoder_Outputs_e,
	    d_output => Decoder_Outputs_d,
	    c_output => Decoder_Outputs_c,
	    b_output => Decoder_Outputs_b,
	    a_output => Decoder_Outputs_a
        );

end Behavioral;