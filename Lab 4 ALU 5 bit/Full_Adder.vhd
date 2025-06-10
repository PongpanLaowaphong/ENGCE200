library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port (
   	A	: in  STD_LOGIC;
	B	: in  STD_LOGIC;
	Ci	: in  STD_LOGIC;
	Sum	: out  STD_LOGIC;
	Co	: out  STD_LOGIC
    );
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
	Sum	<= Ci XOR (A XOR B);
	Co	<= (A AND B) OR (Ci AND (A OR B));
end Behavioral;
