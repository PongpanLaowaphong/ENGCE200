library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity MSI is
    Port (
        d  : in  STD_LOGIC_VECTOR(3 downto 0);
        S  : in  STD_LOGIC_VECTOR(1 downto 0);
        Y  : out STD_LOGIC
    );
end MSI;

-- Architecture declaration
architecture Behavioral of MSI is
begin
    process(d, S)
        -- Intermediate signals for the selection logic
        variable notS : STD_LOGIC_VECTOR(1 downto 0);
        variable and_result : STD_LOGIC_VECTOR(3 downto 0);
        variable result : STD_LOGIC;
    begin
        -- NOT gates for the select lines
        notS := not S;

        -- AND gates to select the correct input

	and_result(0)  := d(0)  and notS(1) and notS(0);
	and_result(1)  := d(1)  and notS(1) and S(0);
	and_result(2)  := d(2)  and S(1) and notS(0);
	and_result(3)  := d(3)  and S(1) and S(0);
	
        -- OR gate to produce the output
        result := and_result(0) or and_result(1) or and_result(2) or and_result(3); 
        Y <= result;
    end process;
end Behavioral;