library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourbitadder is
    Port ( A   : in  std_logic_vector(3 downto 0);
           B   : in  std_logic_vector(3 downto 0); 
           Co  : out std_logic;
           LED : out std_logic_vector(6 downto 0);
           AN  : out std_logic_vector(7 downto 0));
end fourbitadder;

architecture Behavioral of fourbitadder is
component full_adder is
    port (A, B, Ci : in  std_logic;
          S, Co    : out std_logic);
end component;

component sevseg_1 is
    Port ( int : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal S : std_logic_vector (3 downto 0);
signal C : std_logic_vector (4 downto 0);

begin
    AN <= "11111110";
    C(0) <= '0';
    Co <= C(4);
    
    adders: for i in 0 to 3 generate
        addx: full_adder port map
            (A  => A(i), B  => B(i), Ci => C(i), S  => S(i), Co => C(i+1)); 
    end generate adders;
    
    sev_seg_decoder: sevseg_1 port map
        (int => S, seg => LED);
end Behavioral;
