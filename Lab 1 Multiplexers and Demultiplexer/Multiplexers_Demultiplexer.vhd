library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Top-level entity declaration
entity Multiplexers_Demultiplexer is
    Port (
        DataInputs : in  STD_LOGIC_VECTOR(15 downto 0); -- 16 data inputs
        SelectMux  : in  STD_LOGIC_VECTOR(3 downto 0);  -- MUX select input
        SelectDemux: in  STD_LOGIC_VECTOR(3 downto 0);  -- DEMUX select input
        Outputs    : out STD_LOGIC_VECTOR(15 downto 0)  -- 16 output lines
    );
end Multiplexers_Demultiplexer;

-- Top-level architecture
architecture Behavioral of Multiplexers_Demultiplexer is
    -- Internal signals
    signal mux_out : STD_LOGIC;
begin
    -- Instantiate the 16-to-1 multiplexer
    mux_inst : entity work.Multiplexers_16x1
        Port map (
            d  => DataInputs,       -- Data inputs to MUX
            S  => SelectMux,        -- Select lines for MUX
            Y  => mux_out           -- Output from MUX
        );

    -- Instantiate the 1-to-16 demultiplexer
    demux_inst : entity work.Demultiplexers_1x16
        Port map (
            D   => mux_out,          -- Output from MUX
            S   => SelectDemux,      -- Select lines for DEMUX
            Y   => Outputs           -- Outputs from DEMUX
        );

end Behavioral;