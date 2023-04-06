LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.utils.gerador_operando;
USE work.utils.somador;

ENTITY main IS
	PORT(
		operando_1, operando_2: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		saida	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END main;

ARCHITECTURE behavior OF main IS
	SIGNAL op_2_9_bits : STD_LOGIC_VECTOR(8 DOWNTO 0); -- operando com o bit damy
	
	SIGNAL saida_gera_operando1, saida_gera_operando2: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL saida_gera_operando3, saida_gera_operando4: STD_LOGIC_VECTOR(9 DOWNTO 0);
	
	SIGNAL saida_soma_1, saida_soma_2, saida_soma_3: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL cout1 : STD_LOGIC;
	
	SIGNAL entrada_correta_somador1, entrada_correta_somador2, entrada_correta_somador3 : STD_LOGIC_VECTOR(9 DOWNTO 0); -- usadas para simular no modelsim
BEGIN
	
	op_2_9_bits <= operando_2 & '0';
	
   entrada_correta_somador1 <= saida_gera_operando1(9) & saida_gera_operando1(9) & saida_gera_operando1(9 DOWNTO 2);
	entrada_correta_somador2 <= saida_soma_1(9) & saida_soma_1(9) & saida_soma_1(9 DOWNTO 2);
	entrada_correta_somador3 <= saida_soma_2(9) & saida_soma_2(9) & saida_soma_2(9 DOWNTO 2);
	
	gera_operando1: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2_9_bits(2 DOWNTO 0),
						saida => saida_gera_operando1
						);
	gera_operando2: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2_9_bits(4 DOWNTO 2),
						saida => saida_gera_operando2
						);
	soma1: somador PORT MAP(
							a => entrada_correta_somador1,
							b => saida_gera_operando2,
							carry_in => '0',
							Ov => open,
							Cout => open,
							saida => saida_soma_1
						);
						
	gera_operando3: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2_9_bits(6 DOWNTO 4),
						saida => saida_gera_operando3
						);
	soma2: somador PORT MAP(
							a => entrada_correta_somador2,
							b => saida_gera_operando3,
							carry_in => '0',
							Ov => open,
							Cout => open,
							saida => saida_soma_2
						);
						
	gera_operando4: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2_9_bits(8 DOWNTO 6),
						saida => saida_gera_operando4
						);
	soma3: somador PORT MAP(
							a => entrada_correta_somador3,
							b => saida_gera_operando4,
							carry_in => '0',
							Ov => open,
							Cout => cout1,
							saida => saida_soma_3
						);
	
	
	
	saida <= saida_soma_3 & saida_soma_2(1 DOWNTO 0) & saida_soma_1(1 DOWNTO 0) & saida_gera_operando1(1 DOWNTO 0);
	
END behavior;
