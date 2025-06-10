library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complement_Result is
    Port (
   	Sum_Result	: in  STD_LOGIC;
	Check_Co	: in  STD_LOGIC;
	Com_Result	: inout  STD_LOGIC
    );
end Complement_Result;

architecture Behavioral of Complement_Result is
begin
	Com_Result <= Sum_Result XOR Check_Co ;
end Behavioral;
