library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Enable_B is
    Port (
        B  : in  STD_LOGIC;
        S  : in  STD_LOGIC_VECTOR(1 downto 0);
        EB  : inout STD_LOGIC;
	GB  : inout STD_LOGIC
    );
end Enable_B;

architecture Behavioral of Enable_B is
begin
	EB <= S(1) OR S(0);
	GB <= EB AND B ;
end Behavioral;