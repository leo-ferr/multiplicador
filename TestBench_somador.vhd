
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY TestBench_somador IS
  
END TestBench_somador;

ARCHITECTURE behavior OF TestBench_somador IS
  COMPONENT somador IS
	PORT(
		a, b		: IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		carry_in	: IN  STD_LOGIC;
		Ov, Cout	: OUT STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;
  
  SIGNAL op1, op2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL result: STD_LOGIC_VECTOR(8 DOWNTO 0);
  
BEGIN
  
  mu: somador PORT MAP(
      a => op1,
      b => op2,
      carry_in => '0',
      Ov => open,
      Cout => open,
      saida => result
  );
  
  PROCESS
  BEGIN
     op1 <= "000001010"; -- 10
     op2 <= "000001101"; -- 13
     
     wait for 0.5 ns;
     
     op1 <= "000000010";
     op2 <= "000000011";
     
     wait for 0.5 ns;
     
     op1 <= "111110110";
     op2 <= "000000011";
     
     wait for 0.5 ns;
     
     op1 <= "100000000";
     op2 <= "100011110";
     
     wait for 0.5 ns;
     
     op1 <= "000011010";
     op2 <= "011000011";
     
     wait;
  END PROCESS;
  
END behavior;
