Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

Entity ALU is
port(	
		A	:	in	std_logic;
		B	:	in	std_logic;
		Cin	:	in	std_logic;
		S	:	in	std_logic_vector(1 downto 0);
		Sout:	out std_logic;
		Cout:	out	std_logic
);
End;

Architecture behavior of ALU is
    COMPONENT full_adder
	port(	
		A	:	in	std_logic;
		B	:	in	std_logic;
		Ci	:	in	std_logic;
		S	:	out std_logic;
		Co  :	out	std_logic
		);
    END COMPONENT;
	
	component MUX31
	port(	
		Input1		:	in	std_logic;
		Input2		:	in	std_logic;
		Input3		:	in	std_logic;
		S			:	in	std_logic_vector(1 downto 0);
		Sout		:	out	std_logic
		);
	end component;
	
	component and_gate
	port(	
		In1		:	in	std_logic;
		In2		:	in	std_logic;
		Sout	:	out	std_logic
		);
	end component;	
	
	component or_gate
	port(	
		In1		:	in	std_logic;
		In2		:	in	std_logic;
		Sout	:	out	std_logic
		);
	end component;
	
	component xor_gate
	port (
	      In1  :   in std_logic;
	      In2  :   in std_logic;
	      Z    :   out std_logic
	);
	end component;
	      
	
--Signals Defination
	signal Sout_full_adder :	std_logic;
	signal Sout_or_gate    :	std_logic;
	signal Sout_and_gate   :	std_logic;
	signal NB              :	std_logic;
	signal zeroFlag        :    std_logic;
	
Begin

	NB <= B xor S(0);
	
	C1:full_adder	port map(
		A		=>	A,
		B		=>	NB,
		Ci	=>	Cin,
		S	=>	Sout_full_adder,
		Co	=>	Cout
	);

	C2:and_gate	port map(
		In1	=>	A,
		In2	=> B,
		Sout	=> Sout_and_gate
	);
	
	C3:or_gate		port map(
		In1	=>	A,
		In2	=>	B,
		Sout	=>	Sout_or_gate
	);
	
	C4: xor_gate    port map(
            In1 => Cin,
            In2 => B,
            Z => zeroFlag
     );
	
	C5:MUX31		port map(
		Input1	=>	Sout_full_adder,
		Input2	=>	Sout_and_gate,
		Input3	=>	Sout_or_gate,
		S			=>	S,
		Sout		=>	Sout
    );
    
    
	
End;
	