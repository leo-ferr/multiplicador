LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_SIGNED.ALL;

ENTITY multiplicador IS
	PORT(
		MD: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		negativo : IN STD_LOGIC;
		saida : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END multiplicador;

ARCHITECTURE behavior OF multiplicador IS
	SIGNAL resultado : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL aux : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
	
	PROCESS(MD, negativo)
		--VARIABLE aux : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
		IF(negativo = '0') THEN
			aux <= MD(4) & MD(4) & MD;
			
		ELSIF(negativo = '1') THEN
			aux <= ((NOT (MD(4) & MD(4) & MD)) + 1);
		  
		END IF;
			
	END PROCESS;
	saida <= aux(5 DOWNTO 0) & '0';
END behavior;