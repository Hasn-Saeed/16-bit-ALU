library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourbitadder_tb is
end fourbitadder_tb;

architecture Behavioral of fourbitadder_tb is
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
    begin
        A <= "0000";
        B <= "0000";
    
        wait for 100 ns;
        A <= "0010";
        B <= "1011";
        wait for 100 ns;
        
        A <= "0011";
        B <= "1011";
        wait for 100 ns;
        
        wait;
    end process test_bench;
end Behavioral;
