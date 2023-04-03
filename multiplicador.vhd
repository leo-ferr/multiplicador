LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_SIGNED.ALL;

ENTITY multiplicador IS
	PORT(
		MD: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		negativo : IN STD_LOGIC;
		saida : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END multiplicador;

ARCHITECTURE behavior OF multiplicador IS
	SIGNAL resultado : STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN
	
	PROCESS(MD)
		VARIABLE aux : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
		IF(negativo = '0') THEN
			aux := MD;
			
		ELSIF(negativo = '1') THEN
			aux := (NOT MD) + 1;
			
		END IF;
		
		saida <= aux & '0';
		
	END PROCESS;
	
END behavior;