library IEEE;
use IEEE.std_logic_1164.all;

entity XOR_Gate is
    port(
        X, Y : in std_logic;
        Z : out std_logic
    );
end XOR_Gate;

architecture data_XOR of XOR_Gate is 
begin
    Z <= X XOR Y;
end data_XOR;