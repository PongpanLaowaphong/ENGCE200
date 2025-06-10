library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity Multiplexers_16x1 is
    Port (
        d  : in  STD_LOGIC_VECTOR(15 downto 0);
        S  : in  STD_LOGIC_VECTOR(3 downto 0);
        Y  : out STD_LOGIC
    );
end Multiplexers_16x1;

-- Architecture declaration
architecture Behavioral of Multiplexers_16x1 is
begin
    process(d, S)
        -- Intermediate signals for the selection logic
        variable notS : STD_LOGIC_VECTOR(3 downto 0);
        variable and_result : STD_LOGIC_VECTOR(15 downto 0);
        variable result : STD_LOGIC;
    begin
        -- NOT gates for the select lines
        notS := not S;

        -- AND gates to select the correct input
        and_result(0)  := d(0)  and notS(0) and notS(1) and notS(2) and notS(3);
        and_result(1)  := d(1)  and S(0)    and notS(1) and notS(2) and notS(3);
        and_result(2)  := d(2)  and notS(0) and S(1)    and notS(2) and notS(3);
        and_result(3)  := d(3)  and S(0)    and S(1)    and notS(2) and notS(3);
        and_result(4)  := d(4)  and notS(0) and notS(1) and S(2)    and notS(3);
        and_result(5)  := d(5)  and S(0)    and notS(1) and S(2)    and notS(3);
        and_result(6)  := d(6)  and notS(0) and S(1)    and S(2)    and notS(3);
        and_result(7)  := d(7)  and S(0)    and S(1)    and S(2)    and notS(3);
        and_result(8)  := d(8)  and notS(0) and notS(1) and notS(2) and S(3);
        and_result(9)  := d(9)  and S(0)    and notS(1) and notS(2) and S(3);
        and_result(10) := d(10) and notS(0) and S(1)    and notS(2) and S(3);
        and_result(11) := d(11) and S(0)    and S(1)    and notS(2) and S(3);
        and_result(12) := d(12) and notS(0) and notS(1) and S(2)    and S(3);
        and_result(13) := d(13) and S(0)    and notS(1) and S(2)    and S(3);
        and_result(14) := d(14) and notS(0) and S(1)    and S(2)    and S(3);
        and_result(15) := d(15) and S(0)    and S(1)    and S(2)    and S(3);

        -- OR gate to produce the output
        result := and_result(0) or and_result(1) or and_result(2) or and_result(3) or
                  and_result(4) or and_result(5) or and_result(6) or and_result(7) or
                  and_result(8) or and_result(9) or and_result(10) or and_result(11) or
                  and_result(12) or and_result(13) or and_result(14) or and_result(15);
        Y <= result;
    end process;
end Behavioral;