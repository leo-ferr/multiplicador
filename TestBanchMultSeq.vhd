LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TestBanchMultSeq IS
END TestBanchMultSeq;

ARCHITECTURE behavior OF TestBanchMultSeq IS
  COMPONENT mult_seq IS
	 GENERIC(N : INTEGER := 8);
	 PORT(
		  MD, MR	: IN  STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
		  comeca 	: IN  STD_LOGIC;
		  clk 		: IN 	STD_LOGIC;
	   	limpa 	: IN  STD_LOGIC;
		  saida		: OUT STD_LOGIC_VECTOR(N + N - 1 DOWNTO 0)
	 );
  END COMPONENT;
  
  


  
  
  SIGNAL md, mr: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL clk, limpa, comeca : STD_LOGIC;
BEGIN
  
  DUT : mult_seq PORT MAP(
      MD => md,
      MR => mr,
		  comeca => comeca,
		  clk => clk,
	   	limpa => limpa,
		  saida => open
  );
	
	sinal_clock : PROCESS
	 BEGIN
	   clk <= '0', '1' AFTER 0.5 ns;
	   wait for 1 ns;
	   
	  END PROCESS;
	
	PROCESS
	BEGIN
	    limpa <= '1', '0' after 0.5 ns;
	    md <= "00000010";
	    mr <= "00000101";
	    
	    wait for 1 ns;
	    comeca <= '1' , '0' after 0.75 ns;
	    
	    wait for 10 ns;
	    mr <= "01100010";
	    md <= "10010101";
	    
	    wait for 1 ns;
	    comeca <= '1' , '0' after 0.75 ns;
	    
	    wait for 10 ns;
	    
	    md <= "00110111";
	    mr <= "01100101";
	    
	    wait for 1 ns;
	    comeca <= '1' , '0' after 0.75 ns;
	    
	    wait for 10 ns;
	    
	    md <= "00110010";
	    mr <= "11000101";
	    
	    wait for 1 ns;
	    comeca <= '1' , '0' after 0.75 ns;
	    
	    wait for 10 ns;
	    
	    md <= "00001110";
	    mr <= "00000111";
	    
	    wait for 1 ns;
	    comeca <= '1' , '0' after 0.75 ns;
	    wait;
	END PROCESS;
	
END behavior;
