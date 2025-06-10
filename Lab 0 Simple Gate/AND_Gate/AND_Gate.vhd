library IEEE;
use IEEE.std_logic_1164.all;

entity AND_Gate is
    port(
        X, Y : in std_logic;
        Z : out std_logic
    );
end AND_Gate;

architecture data_AND of AND_Gate is 
begin
    Z <= X AND Y;
end data_AND;