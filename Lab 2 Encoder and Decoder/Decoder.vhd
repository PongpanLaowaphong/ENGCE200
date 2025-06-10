library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity Decoder is
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
end Decoder;

-- Architecture declaration
architecture Behavioral of Decoder is
begin
    
	g_output <= D_input OR (C_input AND (NOT B_input)) OR ((NOT C_input) AND B_input) OR (B_input AND (NOT A_input)) ;
	f_output <= D_input OR ((NOT A_input) AND C_input) OR ((NOT B_input) AND (NOT A_input)) OR ((NOT B_input) AND C_input) ;
	e_output <= ((NOT A_input) AND (NOT C_input)) OR (B_input AND (NOT A_input)) ;
	d_output <= D_input OR ((NOT A_input) AND (NOT C_input)) OR (B_input AND (NOT C_input)) OR (B_input AND (NOT A_input)) OR ((NOT B_input) AND A_input AND C_input) ;
	c_output <= A_input OR (NOT B_input) OR C_input OR D_input ;
	b_output <= D_input OR ((NOT D_input) AND (NOT C_input)) OR ((NOT B_input) AND (NOT A_input)) OR (B_input AND A_input) ;
	a_output <= D_input OR B_input OR ((NOT A_input) AND (NOT C_input)) OR (A_input AND C_input) ;

end Behavioral;
