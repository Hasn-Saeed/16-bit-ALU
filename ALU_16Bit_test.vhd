LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY ALU_16Bit_test IS
END ALU_16Bit_test;
 
ARCHITECTURE behavior OF ALU_16Bit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT ALU_16Bit
		port(	
			A		:	in		std_logic_vector(15 downto 0);
			B		:	in		std_logic_vector(15 downto 0);
			Cin	    :	in		std_logic;
			S		:	in		std_logic_vector(1 downto 0);			
			Sout	:	out	std_logic_vector(15 downto 0);
			Cout	:	out	std_logic
			);
	END COMPONENT;

   --Inputs
   signal A 	: std_logic_vector(15 downto 0) := x"0000";
   signal B 	: std_logic_vector(15 downto 0) := x"0000";
   signal Cin 	: std_logic := '0';
   signal S : std_logic_vector(1 downto 0);
   
 	--Outputs
   signal Sout	: std_logic_vector(15 downto 0);
   signal Cout	: std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_16Bit PORT MAP (
			A		=>	A,
			B		=>	B,
			Cin	    =>	Cin,
			S		=>  S,
			Sout	=>	Sout,
			Cout	=>	Cout
        );

   -- Stimulus process
   stim_proc: process
   begin
       -- Test case 1: 100 + 230 ADD
       A <= x"0064"; -- 100 in hexadecimal
       B <= x"00E6"; -- 230 in hexadecimal
       S <= "00";
       Cin <= '0';
       wait for 100 ns;
   
       -- Test case 2: -20 + 60 ADD
       S <= "00";
       A <= x"FFEC";
       B <= x"003C";
       Cin <= '0';
       wait for 100 ns;
   
       -- Test case 3: 1 + 1 ADD
       S <= "00";
       A <= x"0001";
       B <= x"0001";
       Cin <= '0';
       wait for 100 ns;
   
       -- Test case 4: 500 + 340 SUB
       S <= "01";
       Cin <= '1';
       A <= x"01F4";
       B <= x"0154";
       wait for 100 ns;
   
       -- Test case 5: 55 + 70 SUB
       S <= "01";
       Cin <= '1';
       A <= x"0037"; -- 55 in hexadecimal
       B <= x"0046"; -- 70 in hexadecimal
       wait for 100 ns;
   
       -- Test case 6: -1 + 14 SUB
       S <= "01";
       Cin <= '1';
       A <= x"FFFF"; -- -1 in two's complement hexadecimal
       B <= x"000E"; -- 14 in hexadecimal
       wait for 100 ns;
   
       -- Test case 7: 128 + 512 AND
       S <= "10";
       Cin <= '0';
       A <= x"0080"; -- 128 in hexadecimal
       B <= x"0200"; -- 512 in hexadecimal
       wait for 100 ns;
   
       -- Test case 8: 3000 + 2 AND
       S <= "10";
       Cin <= '0';
       A <= x"0BB8"; -- 3000 in hexadecimal
       B <= x"0002"; -- 2 in hexadecimal
       wait for 100 ns;
   
       -- Test case 9: 5342 + 978 AND
       S <= "10";
       Cin <= '0';
       A <= x"14D6"; -- 5342 in hexadecimal
       B <= x"03D2"; -- 978 in hexadecimal
       wait for 100 ns;
   
       -- Test case 10: 16 + 8 OR
       S <= "11";
       Cin <= '0';
       A <= x"0010"; -- 16 in hexadecimal
       B <= x"0008"; -- 8 in hexadecimal
       wait for 100 ns;
   
       -- Test case 11: 0 + 2345 OR
       S <= "11";
       Cin <= '0';
       A <= x"0000"; -- 0 in hexadecimal
       B <= x"0929"; -- 2345 in hexadecimal
       wait for 100 ns;
   
       -- Test case 12: -1 + 5 OR
       S <= "11";
       Cin <= '0';
       A <= x"FFFF"; -- -1 in two's complement hexadecimal
       B <= x"0005"; -- 5 in hexadecimal
       wait for 100 ns;
   
       -- End simulation
           wait;
       end process stim_proc;


END;
