LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

PACKAGE utils IS
	COMPONENT multiplicador IS
		PORT(
			MD: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			negativo : IN STD_LOGIC;
			saida : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT gerador_operando IS
		PORT(
			MD: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			MR: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			saida	: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT somador IS
		PORT(
			a, b		: IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
			carry_in	: IN  STD_LOGIC;
			Ov, Cout	: OUT STD_LOGIC;
			saida 	: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT somador_completo IS
		PORT(
			a, b 		: IN  STD_LOGIC;
			carry_in	: IN  STD_LOGIC;
			carry_out: OUT STD_LOGIC;
			saida		: OUT STD_LOGIC
		);
	END COMPONENT;
	
END PACKAGE utils;
