library IEEE;
use IEEE.std_logic_1164.all;

entity XNOR_Gate is
    port(
        X, Y : in std_logic;
        Z : out std_logic
    );
end XNOR_Gate;

architecture data_XNOR of XNOR_Gate is 
begin
    Z <= X XNOR Y;
end data_XNOR;