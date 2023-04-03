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
  
  COMPONENT multiplicador IS
	PORT(
		MD: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		negativo : IN STD_LOGIC;
		saida : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
  
  
  SIGNAL op1, op2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL result: STD_LOGIC_VECTOR(6 DOWNTO 0);
  
BEGIN
  
  mu: multiplicador PORT MAP(
      MD => op1,
      negativo => '1',
      saida => result
  );
  
  --mu: main PORT MAP(
--      operando_1 => op1,
--      operando_2 => op2,
--      saida => result
--  );
  
  PROCESS
  BEGIN
    
    op1 <= "10000";
     wait;
     --op1 <= "11110110"; -- 10
--     op2 <= "00001010"; -- 13
--     
--     wait for 0.5 ns;
     --
--     op2 <= "00000011"; -- 10
--     op1 <= "11110110"; -- 13
--     
--     wait for 0.5 ns;
--       
--     op1 <= "11111011"; -- 10
--     op2 <= "00000011"; -- 13
--     
--     wait for 0.5 ns;
--     
--     op2 <= "10000000"; -- 10
--     op1 <= "00000010"; -- 13
--     
--     wait for 0.5 ns;
--     
--     op1 <= "11001111";
--     op2 <= "00000011";
--     
--     wait for 0.5 ns;
--     
--     op1 <= "11110110"; -- 10
--     op2 <= "00001010"; -- 13
--     
--     wait for 0.5 ns;
--     
--     op1 <= "00000000";
--     op2 <= "00000000";
--     
--     wait for 0.5 ns;
--     
--     op1 <= "11110110";
--     op2 <= "11111101";
--     
--     wait for 0.5 ns;
--     
--     op1 <= "10000000";
--     op2 <= "10011110";
--     
--     wait for 0.5 ns;
--     
--     op1 <= "10000000";
--     op2 <= "10011110";
--     
--     wait for 0.5 ns;
--     
--     op1 <= "10000000";
--     op2 <= "10011110";
--     
--     
--     wait for 0.5 ns;
--     
--     op1 <= "00011010";
--     op2 <= "01100011";
--     
--     wait;
  END PROCESS;
  
END behavior;