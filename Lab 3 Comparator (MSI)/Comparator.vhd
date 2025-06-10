library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator is
    Port (
        A           : in  STD_LOGIC_VECTOR(3 downto 0):= "0000";    -- 4-bit input A
        B           : in  STD_LOGIC_VECTOR(3 downto 0):= "0000";    -- 4-bit input B
        B_MORE_A      : out STD_LOGIC := '0' ;                  -- Output when A > B
        B_LESS_A      : out STD_LOGIC := '0' ;                    -- Output when A < B
        B_EQUAL_A     : out STD_LOGIC := '0'                      -- Output when A = B
    );
end Comparator;

architecture Behavioral of Comparator is
   
begin

    -- Implement logic for B_MORE_A
    process (B)
    begin
        case B(3 downto 2) is
            when "00" =>
                case B(1 downto 0) is
                    when "00" => B_MORE_A <= '0';
                    when "01" => B_MORE_A <= (not A(0)) and (not A(1)) and (not A(2)) and (not A(3));
                    when "10" => B_MORE_A <= (not A(1)) and (not A(2)) and (not A(3));
                    when "11" => B_MORE_A <= ((not A(1)) and (not A(2)) and (not A(3))) or ((not A(0)) and (not A(2)) and (not A(3)));
                    when others => B_MORE_A <= '0';
                end case;
            when "01" =>
                case B(1 downto 0) is
                    when "00" => B_MORE_A <= (not A(2)) and (not A(3));
                    when "01" => B_MORE_A <= ((not A(2)) and (not A(3))) or ((not A(0)) and (not A(1)) and (not A(3)));
                    when "10" => B_MORE_A <= ((not A(2)) and (not A(3))) or ((not A(1)) and (not A(3)));
                    when "11" => B_MORE_A <= ((not A(1)) and (not A(3))) or ((not A(2)) and (not A(3))) or ((not A(0)) and (not A(3)));
                    when others => B_MORE_A <= '0';
                end case;
            when "10" =>
                case B(1 downto 0) is
                    when "00" => B_MORE_A <= (not A(3));
                    when "01" => B_MORE_A <= ((not A(0)) and (not A(1)) and (not A(2))) or (not A(3));
                    when "10" => B_MORE_A <= ((not A(1)) and (not A(2))) or (not A(3));
                    when "11" => B_MORE_A <= ((not A(1)) and (not A(2))) or ((not A(0)) and (not A(2))) or (not A(3));
                    when others => B_MORE_A <= '0';
                end case;
            when "11" =>
                case B(1 downto 0) is
                    when "00" => B_MORE_A <= (not A(2)) or (not A(3));
                    when "01" => B_MORE_A <= ((not A(0)) and (not A(1))) or (not A(2)) or (not A(3));
                    when "10" => B_MORE_A <= (not A(1)) or (not A(2)) or (not A(3));
                    when "11" => B_MORE_A <= (not A(0)) or (not A(1)) or (not A(2)) or (not A(3));
                    when others => B_MORE_A <= '0';
                end case;
            when others => B_MORE_A <= '0';
        end case;
    end process;

    -- Implement logic for B_LESS_A
    process (B, A)
    begin
        case B(3 downto 2) is
            when "00" =>
                case B(1 downto 0) is
                    when "00" => B_LESS_A <= A(0) or A(1) or A(2) or A(3);
                    when "01" => B_LESS_A <= A(1) or A(2) or A(3);
                    when "10" => B_LESS_A <= (A(0) and A(1)) or A(2) or A(3);
                    when "11" => B_LESS_A <= A(2) or A(3);
                    when others => B_LESS_A <= '0';
                end case;
            when "01" =>
                case B(1 downto 0) is
                    when "00" => B_LESS_A <= (A(1) and A(2)) or (A(0) and A(2)) or A(3);
                    when "01" => B_LESS_A <= (A(1) and A(2)) or A(3);
                    when "10" => B_LESS_A <= (A(0) and A(1) and A(2)) or A(3);
                    when "11" => B_LESS_A <= A(3);
                    when others => B_LESS_A <= '0';
                end case;
            when "10" =>
                case B(1 downto 0) is
                    when "00" => B_LESS_A <= (A(1) and A(3)) or (A(0) and A(3)) or (A(2) and A(3));
                    when "01" => B_LESS_A <= (A(1) and A(3)) or (A(2) and A(3));
                    when "10" => B_LESS_A <= (A(2) and A(3)) or (A(0) and A(1) and A(3));
                    when "11" => B_LESS_A <= A(2) and A(3);
                    when others => B_LESS_A <= '0';
                end case;
            when "11" =>
                case B(1 downto 0) is
                    when "00" => B_LESS_A <= (A(0) and A(2) and A(3)) or (A(1) and A(2) and A(3));
                    when "01" => B_LESS_A <= A(1) and A(2) and A(3);
                    when "10" => B_LESS_A <= A(0) and A(1) and A(2) and A(3);
                    when "11" => B_LESS_A <= '0';
                    when others => B_LESS_A <= '0';
                end case;
            when others => B_LESS_A <= '0';
        end case;
    end process;

    -- Implement logic for B_EQUAL_A
    process (B, A)
    begin
        case B(3 downto 2) is
            when "00" =>
                case B(1 downto 0) is
                    when "00" => B_EQUAL_A <= (not A(0)) and (not A(1)) and (not A(2)) and (not A(3));
                    when "01" => B_EQUAL_A <= A(0) and (not A(1)) and (not A(2)) and (not A(3));
                    when "10" => B_EQUAL_A <= (not A(0)) and A(1) and (not A(2)) and (not A(3));
                    when "11" => B_EQUAL_A <= A(0) and A(1) and (not A(2)) and (not A(3));
                    when others => B_EQUAL_A <= '0';
                end case;
            when "01" =>
                case B(1 downto 0) is
                    when "00" => B_EQUAL_A <= (not A(0)) and (not A(1)) and A(2) and (not A(3));
                    when "01" => B_EQUAL_A <= A(0) and (not A(1)) and A(2) and (not A(3));
                    when "10" => B_EQUAL_A <= (not A(0)) and A(1) and A(2) and (not A(3));
                    when "11" => B_EQUAL_A <= A(0) and A(1) and A(2) and (not A(3));
                    when others => B_EQUAL_A <= '0';
                end case;
            when "10" =>
                case B(1 downto 0) is
                    when "00" => B_EQUAL_A <= (not A(0)) and (not A(1)) and (not A(2)) and A(3);
                    when "01" => B_EQUAL_A <= A(0) and (not A(1)) and (not A(2)) and A(3);
                    when "10" => B_EQUAL_A <= (not A(0)) and A(1) and (not A(2)) and A(3);
                    when "11" => B_EQUAL_A <= A(0) and A(1) and (not A(2)) and A(3);
                    when others => B_EQUAL_A <= '0';
                end case;
            when "11" =>
                case B(1 downto 0) is
                    when "00" => B_EQUAL_A <= (not A(0)) and (not A(1)) and A(2) and A(3);
                    when "01" => B_EQUAL_A <= A(0) and (not A(1)) and A(2) and A(3);
                    when "10" => B_EQUAL_A <= (not A(0)) and A(1) and A(2) and A(3);
                    when "11" => B_EQUAL_A <= A(0) and A(1) and A(2) and A(3);
                    when others => B_EQUAL_A <= '0';
                end case;
            when others => B_EQUAL_A <= '0';
        end case;
    end process;

end Behavioral;

