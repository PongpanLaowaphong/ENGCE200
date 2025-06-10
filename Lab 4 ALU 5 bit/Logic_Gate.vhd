library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Logic_Gate is
    Port (
   	A	: in  STD_LOGIC;
	B	: in  STD_LOGIC;
	S  	: in  STD_LOGIC_VECTOR(1 downto 0);
	AandB	: inout STD_LOGIC;
	AorB	: inout STD_LOGIC;
	AxorB	: inout STD_LOGIC;
	AxnorB	: inout STD_LOGIC;
	Y	: out STD_LOGIC
    );
end Logic_Gate;

architecture Behavioral of Logic_Gate is
begin
	AandB 	<= A AND B ;
	AorB 	<= A OR B ;
	AxorB 	<= A XOR B ;
	AxnorB 	<= A XNOR B ;

	Y 	<= ( 	( AandB		AND ((not S(1)) AND (not S(0))) ) OR
			( AorB 		AND ((not S(1)) AND S(0)) 	) OR 
			( AxorB		AND (S(1) AND (not S(0))) 	) OR
			( AxnorB	AND (S(1) AND S(0)) 		)
		);

end Behavioral;
