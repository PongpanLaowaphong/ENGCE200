library IEEE;
use IEEE.std_logic_1164.all;

entity NOT_Gate is
    port(
        A : in std_logic;
        Z : out std_logic
    );
end NOT_Gate;

architecture data_NOT of NOT_Gate is 
begin
    Z <= NOT A;
end data_NOT;