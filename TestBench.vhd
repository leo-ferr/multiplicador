LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY TestBench IS
  
END TestBench;

ARCHITECTURE behavior OF TestBench IS
  COMPONENT main IS
	 PORT(
	   	operando_1, operando_2: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		  saida	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	 );
  END COMPONENT;
  
  SIGNAL op1, op2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL result: STD_LOGIC_VECTOR(15 DOWNTO 0);
  
BEGIN
  
  mu: main PORT MAP(
      operando_1 => op1,
      operando_2 => op2,
      saida => result
  );
  
  PROCESS
  BEGIN
     op1 <= "00001010"; -- 10
     op2 <= "00001101"; -- 13
     
     wait for 0.5 ns;
     
     op1 <= "00000010";
     op2 <= "00000011";
     
     wait for 0.5 ns;
     
     op1 <= "11110110";
     op2 <= "00000011";
     
     wait for 0.5 ns;
     
     op1 <= "10000000";
     op2 <= "10011110";
     
     wait for 0.5 ns;
     
     op1 <= "00011010";
     op2 <= "01100011";
     
     wait;
  END PROCESS;
  
END behavior;