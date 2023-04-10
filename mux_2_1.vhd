LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_2_1 IS
	GENERIC(N : INTEGER := 8);
	PORT(
		in_1, in_2	: IN  STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
		sel			: IN  STD_LOGIC;
		saida 		: OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
	);
END mux_2_1;

ARCHITECTURE behavior OF mux_2_1 IS
BEGIN
	
	saida <= in_1 WHEN (sel = '1') ELSE in_2;
	
END behavior;
