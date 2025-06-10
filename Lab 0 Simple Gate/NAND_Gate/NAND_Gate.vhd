library IEEE;
use IEEE.std_logic_1164.all;

entity NAND_Gate is
    port(
        X, Y : in std_logic;
        Z : out std_logic
    );
end NAND_Gate;

architecture data_NAND of NAND_Gate is 
begin
    Z <= X NAND Y;
end data_NAND;