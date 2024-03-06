library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- A test bench does not have any input or output ports; 
-- always leave the entity field empty.
entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is

-- Declare the component that you will be testing.
-- Remember that this declaration must have an identical name and list of ports
-- as the unit under test (UUT).
component full_adder is
    port (A, B, Ci : in  std_logic;
          S, Co    : out std_logic);
end component;

-- Declare signals for each of the ports in the UUT. This allows your test
-- bench to interact with those ports.
signal A  : std_logic;
signal B  : std_logic;
signal Ci : std_logic;
signal S  : std_logic;
signal Co : std_logic;

-- Declare any other signals you may need. For any complex circuit, you will
-- need a clock signal (at 100 MHz) to emulate the on-board crystal oscillator.

signal clock : std_logic := '0';
signal clk_period : time := 10 ns; 

begin
-- Instantiating the Unit Under Test (UUT):
-- you must declare an instance of the component you are testing.
-- Map all of the component's ports to the signals defined above.
    uut: full_adder port map (
        A  => A,
        B  => B,
        Ci => Ci,
        S  => S,
        Co => Co
    );
    
-- Creating a clock process. 
    clk_process: process 
    begin
        clock <= '1';
        wait for clk_period / 2;
        clock <= '0';
        wait for clk_period / 2;
    end process clk_process;

-- Finally, the process where the test bench runs. 
    test_bench: process
    begin

-- the Artix-7 requires a 100 ns power-on time, during which logic elements and flip-flops are non-functional.
-- Behavioural simulations should work without this delay, but post-implementation simulations may fail.
    wait for 100 ns; 

-- actual test code goes here:
    A <= '0';
    B <= '0';
    Ci <= '0';
    wait for clk_period; -- must wait after setting signals to give system the time to propagate.
    
-- assert / report / severity functions: requires a conditional to test, outputs a string of a specified severity
-- severity levels can be note, warning, error, or failure. 'Failure' level normally aborts the simulation.
    assert (Co = '0' AND S = '0') report "000 failed." severity error;
    
    A <= '0';
    B <= '0';
    Ci <= '1';
    wait for clk_period;
    
    assert (Co = '0' AND S = '1') report "001 failed." severity error;
    
    A <= '0';
    B <= '1';
    Ci <= '0';
    wait for clk_period;
        
    assert (Co = '0' AND S = '1') report "010 failed." severity error;
    
    A <= '0';
    B <= '1';
    Ci <= '1';
    wait for clk_period;
        
    assert (Co = '1' AND S = '0') report "011 failed." severity error;
    
    A <= '1';
    B <= '0';
    Ci <= '0';
    wait for clk_period;
        
    assert (Co = '0' AND S = '1') report "100 failed." severity error;
    
    A <= '1';
    B <= '0';
    Ci <= '1';
    wait for clk_period;
        
    assert (Co = '1' AND S = '0') report "101 failed." severity error;
    
    A <= '1';
    B <= '1';
    Ci <= '0';
    wait for clk_period;
        
    assert (Co = '1' AND S = '0') report "000 failed." severity error;
    
    A <= '1';
    B <= '1';
    Ci <= '1';
    wait for clk_period;
        
    assert (Co = '1' AND S = '1') report "000 failed." severity error;

-- all test benches should end with a wait, or else they repeat.   
    wait;
    end process test_bench;
end Behavioral;
