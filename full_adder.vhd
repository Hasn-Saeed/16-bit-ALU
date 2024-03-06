library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port (A, B, Ci : in  std_logic;
          S, Co    : out std_logic);
end full_adder;

architecture behav of full_adder is
begin
    S  <= A xor B xor Ci;
    Co <= (A and B) or (Ci and (A xor B));
end behav;