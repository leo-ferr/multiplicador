LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.somador_completo;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY somador IS
	PORT(
		a, b		: IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		carry_in	: IN  STD_LOGIC;
		Ov, Cout	: OUT STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END somador;

ARCHITECTURE behavior OF somador IS

	SIGNAL c0, c1, c2, c3, c4, c5, c6, c7, c8: STD_LOGIC;
	
BEGIN
	
	bit0: somador_completo PORT MAP(a => a(0), b => b(0), carry_in => carry_in, carry_out => c0, saida => saida(0));
	bit1: somador_completo PORT MAP(a => a(1), b => b(1), carry_in => c0, carry_out => c1, saida => saida(1));
	bit2: somador_completo PORT MAP(a => a(2), b => b(2), carry_in => c1, carry_out => c2, saida => saida(2));
	bit3: somador_completo PORT MAP(a => a(3), b => b(3), carry_in => c2, carry_out => c3, saida => saida(3));
	bit4: somador_completo PORT MAP(a => a(4), b => b(4), carry_in => c3, carry_out => c4, saida => saida(4));
	bit5: somador_completo PORT MAP(a => a(5), b => b(5), carry_in => c4, carry_out => c5, saida => saida(5));
	bit6: somador_completo PORT MAP(a => a(6), b => b(6), carry_in => c5, carry_out => c6, saida => saida(6));
	bit7: somador_completo PORT MAP(a => a(7), b => b(7), carry_in => c6, carry_out => c7, saida => saida(7));
	bit8: somador_completo PORT MAP(a => a(8), b => b(8), carry_in => c7, carry_out => c8, saida => saida(8));
	
	Cout <= c8;
	Ov <= c8 XOR c7;
	
END behavior;