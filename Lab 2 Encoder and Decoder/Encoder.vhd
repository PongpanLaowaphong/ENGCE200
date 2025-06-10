library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity Encoder is
    Port (
        I  : in  STD_LOGIC_VECTOR(9 downto 0);
        D  : out STD_LOGIC ;
	C  : out STD_LOGIC ;
	B  : out STD_LOGIC ;
	A  : out STD_LOGIC
    );
end Encoder;

-- Architecture declaration
architecture Behavioral of Encoder is
begin
    
	D <= (I(9) OR I(8)) ; 
	C <= (I(7) OR I(6)) OR (I(5) OR I(4)) ;
	B <= (I(7) OR I(6)) OR (I(3) OR I(2)) ;
	A <= (I(9) OR I(7)) OR (I(5) OR I(3)) OR I(1) ;

end Behavioral;