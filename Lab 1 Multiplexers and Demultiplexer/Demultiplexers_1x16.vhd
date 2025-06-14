library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity Demultiplexers_1x16 is
    Port (
        D   : in  STD_LOGIC;                   -- Data input
        S   : in  STD_LOGIC_VECTOR(3 downto 0); -- Select input (4 bits)
        Y   : out STD_LOGIC_VECTOR(15 downto 0) -- 16 outputs
    );
end Demultiplexers_1x16;

-- Architecture declaration
architecture Behavioral of Demultiplexers_1x16 is

    -- Intermediate signals
    signal notS : STD_LOGIC_VECTOR(3 downto 0);
    signal sel  : STD_LOGIC_VECTOR(15 downto 0);

begin

    -- Generate NOT gates for select signals
    notS(0) <= not S(0);
    notS(1) <= not S(1);
    notS(2) <= not S(2);
    notS(3) <= not S(3);

    -- Generate selection signals for each output using AND gates
    sel(0)  <= notS(0) and notS(1) and notS(2) and notS(3);  -- S = 0000
    sel(1)  <= S(0)    and notS(1) and notS(2) and notS(3);   -- S = 0001
    sel(2)  <= notS(0) and S(1)    and notS(2) and notS(3);   -- S = 0010
    sel(3)  <= S(0)    and S(1)    and notS(2) and notS(3);       -- S = 0011
    sel(4)  <= notS(0) and notS(1) and S(2)    and notS(3);   -- S = 0100
    sel(5)  <= S(0)    and notS(1) and S(2)    and notS(3);       -- S = 0101
    sel(6)  <= notS(0) and S(1)    and S(2)    and notS(3);   -- S = 0110
    sel(7)  <= S(0)    and S(1)    and S(2)    and notS(3);       -- S = 0111
    sel(8)  <= notS(0) and notS(1) and notS(2) and S(3);   -- S = 1000
    sel(9)  <= S(0)    and notS(1) and notS(2) and S(3);       -- S = 1001
    sel(10) <= notS(0) and S(1)    and notS(2) and S(3);   -- S = 1010
    sel(11) <= S(0)    and S(1)    and notS(2) and S(3);       -- S = 1011
    sel(12) <= notS(0) and notS(1) and S(2)    and S(3);   -- S = 1100
    sel(13) <= S(0)    and notS(1) and S(2)    and S(3);       -- S = 1101
    sel(14) <= notS(0) and S(1)    and S(2)    and S(3);   -- S = 1110
    sel(15) <= S(0)    and S(1)    and S(2)    and S(3);       -- S = 1111

    -- Generate output signals by ANDing data input with the selection signals
    Y(0)  <= D and sel(0);
    Y(1)  <= D and sel(1);
    Y(2)  <= D and sel(2);
    Y(3)  <= D and sel(3);
    Y(4)  <= D and sel(4);
    Y(5)  <= D and sel(5);
    Y(6)  <= D and sel(6);
    Y(7)  <= D and sel(7);
    Y(8)  <= D and sel(8);
    Y(9)  <= D and sel(9);
    Y(10) <= D and sel(10);
    Y(11) <= D and sel(11);
    Y(12) <= D and sel(12);
    Y(13) <= D and sel(13);
    Y(14) <= D and sel(14);
    Y(15) <= D and sel(15);

end Behavioral;

