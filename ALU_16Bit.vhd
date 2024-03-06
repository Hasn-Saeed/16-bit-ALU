Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

Entity ALU_16Bit is
port(	
		A		:	in		std_logic_vector(15 downto 0);
		B		:	in		std_logic_vector(15 downto 0);
		Cin     :   in      std_logic;
		S		:	in		std_logic_vector(1 downto 0);
		Sout	:	out 	std_logic_vector(15 downto 0);
		Cout	:	out	std_logic;
		Overflow:   out std_logic;
		zeroFlag:   out std_logic
);
End;

Architecture behavior of ALU_16Bit is
	COMPONENT ALU
	port(	
		A		:	in		std_logic;
		B		:	in		std_logic;
		Cin	    :	in		std_logic;
		S		:	in		std_logic_vector(1 downto 0);
		Sout	:	out 	std_logic;
		Cout	:	out	    std_logic
	);
	END COMPONENT;

	signal Carry		:	std_logic_vector(14 downto 0);

begin
    alu00 : ALU port map(A => A(0), B => B(0), Cin => Cin, S => S, Sout => Sout(0), Cout => Carry(0));
    alu01 : ALU port map(A => A(1), B => B(1), Cin => Carry(0), S => S, Sout => Sout(1), Cout => Carry(1));
    alu02 : ALU port map(A => A(2), B => B(2), Cin => Carry(1), S => S, Sout => Sout(2), Cout => Carry(2));
    alu03 : ALU port map(A => A(3), B => B(3), Cin => Carry(2), S => S, Sout => Sout(3), Cout => Carry(3));
    
    alu04 : ALU port map(A => A(4), B => B(4), Cin => Carry(3), S => S, Sout => Sout(4), Cout => Carry(4));
    alu05 : ALU port map(A => A(5), B => B(5), Cin => Carry(4), S => S, Sout => Sout(5), Cout => Carry(5));
    alu06 : ALU port map(A => A(6), B => B(6), Cin => Carry(5), S => S, Sout => Sout(6), Cout => Carry(6));
    alu07 : ALU port map(A => A(7), B => B(7), Cin => Carry(6), S => S, Sout => Sout(7), Cout => Carry(7));
    
    alu08 : ALU port map(A => A(8), B => B(8), Cin => Carry(7), S => S, Sout => Sout(8), Cout => Carry(8));
    alu09 : ALU port map(A => A(9), B => B(9), Cin => Carry(8), S => S, Sout => Sout(9), Cout => Carry(9));
    alu10 : ALU port map(A => A(10), B => B(10), Cin => Carry(9), S => S, Sout => Sout(10), Cout => Carry(10));
    alu11 : ALU port map(A => A(11), B => B(11), Cin => Carry(10), S => S, Sout => Sout(11), Cout => Carry(11));
    
    alu12 : ALU port map(A => A(12), B => B(12), Cin => Carry(11), S => S, Sout => Sout(12), Cout => Carry(12));
    alu13 : ALU port map(A => A(13), B => B(13), Cin => Carry(12), S => S, Sout => Sout(13), Cout => Carry(13));
    alu14 : ALU port map(A => A(14), B => B(14), Cin => Carry(13), S => S, Sout => Sout(14), Cout => Carry(14));
    alu15 : ALU port map(A => A(15), B => B(15), Cin => Carry(14), S => S, Sout => Sout(15), Cout => Cout);
end;

	