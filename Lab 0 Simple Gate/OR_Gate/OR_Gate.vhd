library IEEE;
use IEEE.std_logic_1164.all;

entity OR_Gate is
    port(
        X, Y : in std_logic;
        Z : out std_logic
    );
end OR_Gate;

architecture data_OR of OR_Gate is 
begin
    Z <= X OR Y;
end data_OR;