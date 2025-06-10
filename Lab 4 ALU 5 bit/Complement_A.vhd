library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complement_A is
    Port (
        A  : in  STD_LOGIC;
        S  : in  STD_LOGIC_VECTOR(1 downto 0);
        WA  : inout STD_LOGIC;
	FA  : inout STD_LOGIC
    );
end Complement_A;

architecture Behavioral of Complement_A is
begin
	WA <= S(1) AND S(0);
	FA <= WA XOR A;
end Behavioral;
