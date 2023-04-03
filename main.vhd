LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- USE ieee.std_logic_signed.all
USE work.utils.gerador_operando;
USE work.utils.somador;

ENTITY main IS
	PORT(
		operando_1, operando_2: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		saida	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END main;

ARCHITECTURE behavior OF main IS
  --CONSTANT op1 : STD_LOGIC_VECTOR(8 DOWNTO 0) := operando_1(8) & operando_1;
--  CONSTANT op2 : STD_LOGIC_VECTOR(8 DOWNTO 0) := operando_2(8) & operando_2;
--  CONSTANT notop1 : STD_LOGIC_VECTOR(8 DOWNTO 0) := NOT op1 + 1;
	
	SIGNAL op_2_9_bits : STD_LOGIC_VECTOR(8 DOWNTO 0);
	
	SIGNAL saida_gera_operando1, saida_gera_operando2: STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL saida_gera_operando3, saida_gera_operando4: STD_LOGIC_VECTOR(8 DOWNTO 0);
	
	SIGNAL saida_soma_1, saida_soma_2, saida_soma_3: STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL cout1 : STD_LOGIC;
	
	SIGNAL aux1, aux2, aux3 : STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN
	
	op_2_9_bits <= operando_2 & '0';
	
  aux1 <= saida_gera_operando1(8) & saida_gera_operando1(8) & saida_gera_operando1(8 DOWNTO 2);
	aux2 <= saida_soma_1(8) & saida_soma_1(8) & saida_soma_1(8 DOWNTO 2);
	aux3 <= saida_soma_2(8) & saida_soma_2(8) & saida_soma_2(8 DOWNTO 2);
	
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
							a => aux1,
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
							a => aux2,
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
							a => aux3,
							b => saida_gera_operando4,
							carry_in => '0',
							Ov => open,
							Cout => cout1,
							saida => saida_soma_3
						);
	
	
	saida <= saida_soma_3(8) & saida_soma_3 & saida_soma_2(1 DOWNTO 0) & saida_soma_1(1 DOWNTO 0) & saida_gera_operando1(1 DOWNTO 0);
	
END behavior;