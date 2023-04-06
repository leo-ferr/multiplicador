LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_signed.all;

ENTITY mult_9 IS
	PORT(
		operando: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		saida	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END mult_9;

ARCHITECTURE behavior OF mult_9 IS	
	
BEGIN
	PROCESS(operando)
		VARIABLE aux : STD_LOGIC_VECTOR(11 DOWNTO 0); -- aux de 12 bits (8 do operando + 4 para mult por 8)
	BEGIN
		-- multiplica por 8
		--aux := std_logic_vector(resize(signed(operando), 12));
		aux := operando(7) & operando(7) & operando(7) & operando(7) & operando;
		aux := aux(8 DOWNTO 0)  & "000";
		
		aux := aux + operando;

		-- extende o sinal
		saida <= std_logic_vector(resize(signed(aux), 16));
		
	END PROCESS;
	
END behavior;
