library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fourbitadder_tb_loop is
end fourbitadder_tb_loop;

architecture Behavioral of fourbitadder_tb_loop is
component fourbitadder is
    Port ( A   : in  std_logic_vector(3 downto 0);
           B   : in  std_logic_vector(3 downto 0); 
           Co  : out std_logic;
           LED : out std_logic_vector(6 downto 0);
           AN  : out std_logic_vector(7 downto 0));
end component;

signal A, B : std_logic_vector(3 downto 0);
signal Co   : std_logic;
signal LED  : std_logic_vector(6 downto 0);
signal AN   : std_logic_vector(7 downto 0);

begin
    uut: fourbitadder port map 
        (A => A, B => B, Co => Co, LED => LED, AN => AN);
        
    test_bench: process
    variable vec : std_logic_vector(7 downto 0);
    begin
        
        for i in 0 to 255 loop
            vec := std_logic_vector(to_unsigned(i,8));
            A <= vec(7 downto 4);
            B <= vec(3 downto 0);
            wait for 10 ns;    
        end loop;
    wait;
    end process test_bench;
end Behavioral;