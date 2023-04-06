LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_SIGNED.ALL;

ENTITY multiplicador IS
	PORT(
		MD: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		negativo : IN STD_LOGIC;
		saida : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END multiplicador;

ARCHITECTURE behavior OF multiplicador IS

BEGIN
	
	PROCESS(MD, negativo)
		VARIABLE aux : STD_LOGIC_VECTOR(9 DOWNTO 0);
	BEGIN

		aux := MD(7) & MD(7) & MD;
		
		IF(negativo = '1') THEN
			aux := (NOT aux) + 1;
		  
		END IF;

		saida <= aux(8 DOWNTO 0) & '0'; -- REALIZA O ShIFT (MD * 2)

	END PROCESS;

END behavior;
