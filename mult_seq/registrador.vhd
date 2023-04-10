LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registrador IS
	GENERIC(N : INTEGER := 8);
	PORT(
		entrada	: IN  STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
		clk		: IN  STD_LOGIC;
		permite	: IN  STD_LOGIC;
		limpa 	: IN  STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	);
END registrador;

ARCHITECTURE behavior OF registrador IS
BEGIN
	
	PROCESS(clk)
	BEGIN
		
		IF (permite = '1' AND rising_edge(clk)) THEN
			entrada <= saida;
		END IF;
	END PROCESS;
	
END behavior;