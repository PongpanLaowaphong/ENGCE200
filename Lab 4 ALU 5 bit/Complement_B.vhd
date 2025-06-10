library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complement_B is
    Port (
        B  : in  STD_LOGIC;
        S  : in  STD_LOGIC_VECTOR(1 downto 0);
        WB  : inout STD_LOGIC;
	FB  : inout STD_LOGIC
    );
end Complement_B;

architecture Behavioral of Complement_B is
begin
	WB <= S(1) AND (not S(0));
	FB <= WB XOR B;
end Behavioral;
