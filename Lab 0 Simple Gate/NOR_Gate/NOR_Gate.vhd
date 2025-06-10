library IEEE;
use IEEE.std_logic_1164.all;

entity NOR_Gate is
    port(
        X, Y : in std_logic;
        Z : out std_logic
    );
end NOR_Gate;

architecture data_NOR of NOR_Gate is 
begin
    Z <= X NOR Y;
end data_NOR;