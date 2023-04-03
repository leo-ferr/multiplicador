LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY somador_completo IS
	PORT(
		a, b 		: IN  STD_LOGIC;
		carry_in	: IN  STD_LOGIC;
		carry_out: OUT STD_LOGIC;
		saida		: OUT STD_LOGIC
	);
END somador_completo;

ARCHITECTURE behavior OF somador_completo IS
BEGIN
	
	saida <= carry_in XOR a XOR b;
	carry_out <= (a AND b) OR (a AND carry_in) OR (b AND carry_in);
END behavior;