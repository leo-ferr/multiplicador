LIBRARY ieee;
LIBRARY work;
USE work.utils.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_SIGNED.ALL;


ENTITY gerador_operando IS
	PORT(
		MD: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		MR: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		saida	: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)

	);
END gerador_operando;

ARCHITECTURE behavior OF gerador_operando IS
	SIGNAL saida_mult: STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN
	mult: multiplicador PORT MAP(
		MD => MD,
		negativo => MR(2),
		saida => saida_mult
	);

	PROCESS(MR, MD, saida_mult)
		VARIABLE aux : STD_LOGIC_VECTOR(9 DOWNTO 0);
	BEGIN
		IF(MR = "000" OR MR = "111") THEN
			aux := (OTHERS => '0');
			
		ELSIF(MR = "001" OR MR = "010") THEN
			aux := MD(7) & MD(7) & MD; -- EXTENDE O SINAL 
		
		ELSIF(MR = "011" OR MR = "100") THEN
			-- USAR O BIT MAIS SIGNIFICATIVO PARA INDICAR O NEGATIVO (-2 * operando)
			-- operand <= multiplicador(negativo => MR(2))
			
			aux := saida_mult;
		
		ELSIF(MR = "101" OR MR = "110") THEN
			aux := MD(7) & MD(7) & MD; -- EXTENDE O SINAL 
			aux := (NOT aux) + 1;	-- COMPLEMENTO DE 2

		END IF;
		
		saida <= aux;
	END PROCESS;
	
END behavior;
