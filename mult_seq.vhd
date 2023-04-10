LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY mult_seq IS
	GENERIC(N : INTEGER := 8);
	PORT(
		MD, MR	: IN  STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
		comeca 	: IN  STD_LOGIC;
		clk 		: IN 	STD_LOGIC;
		limpa 	: IN  STD_LOGIC;
		saida		: OUT STD_LOGIC_VECTOR(N + N - 1 DOWNTO 0)
	);
END mult_seq;

ARCHITECTURE behavior OF mult_seq IS
  
    COMPONENT registrador IS
	GENERIC(N : INTEGER := 8);
	PORT(
		entrada	: IN  STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
		clk		: IN  STD_LOGIC;
		permite	: IN  STD_LOGIC;
		limpa 	: IN  STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
	);
END COMPONENT;
component mux_2_1 IS
	GENERIC(N : INTEGER := 8);
	PORT(
		in_1, in_2	: IN  STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
		sel			: IN  STD_LOGIC;
		saida 		: OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
	);
END component;

	
--	TYPE t_estados IS (PP0, PP1, PP2, PP3, PP4, PP5, PP6, PP7, PP8);
--	
--	SIGNAL estado : t_estados := PP0;
	SIGNAL contador : INTEGER := 0;
	
	SIGNAL result : STD_LOGIC_VECTOR(N + N - 1 DOWNTO 0);
	CONSTANT zero : STD_LOGIC_VECTOR(N - 1 DOWNTO 0) := (OTHERS => '0');
	
	SIGNAL saida_primeiro_reg : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	SIGNAL saida_mux_1, saida_mux_2, saida_mux_3: STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	SIGNAL saida_mux_4: STD_LOGiC_VECTOR(N + N - 1 DOWNTO 0);
	SIGNAL soma : STD_LOGIC_VECTOR(N DOWNTO 0);
	
	SIGNAL numero_deslocado, numero_nao_deslocado : STD_LOGIC_VECTOR(N + N - 1 DOWNTO 0);
	
	SIGNAL pronto : std_logic;
BEGIN

	PRIMEIRO_REG : registrador PORT MAP(
		entrada => MD,
		clk => clk,
		permite => comeca,
		limpa => limpa,
		saida => saida_primeiro_reg
	);
	
	MUX_1: mux_2_1 PORT MAP(
		in_1 => saida_primeiro_reg,
		in_2	=> zero,
		sel => result(0),
		saida => saida_mux_1
	);
	
	soma <= ( '0' & result(N + N - 1 DOWNTO N)) + ('0' & saida_mux_1);
	
	MUX_2: mux_2_1 PORT MAP(
		in_1 => zero,
		in_2	=> soma(N - 1 DOWNTO 0),
		sel => comeca,
		saida => saida_mux_2
	);
	
	MUX_3: mux_2_1 PORT MAP(
		in_1 => MR,
		in_2	=> result(N - 1 DOWNTO 0),
		sel => comeca,
		saida => saida_mux_3
	);
	
	numero_deslocado <= soma(N) & saida_mux_2 & saida_mux_3(N - 1 DOWNTO 1);
	numero_nao_deslocado <= saida_mux_2 & saida_mux_3;
	
	MUX_4: mux_2_1 
		GENERIC map(N => 16)
		PORT MAP(
			in_1 	=> numero_nao_deslocado,
			in_2	=> numero_deslocado,
			sel 	=> comeca,
			saida => saida_mux_4
		);
		
	ULTIMO_REG: registrador 
	GENERIC map(N => 16)
	PORT MAP(
		entrada => saida_mux_4,
		clk => clk,
		permite => '1',
		limpa => limpa,
		saida => result
	);
	
	saida <= result;
	
	PROCESS(comeca, clk)
	BEGIN
	  IF rising_edge(clk) THEN
	     IF comeca = '1' THEN
	       pronto <= '0';
	       contador <= 0;
	      ELSIF contador = 7 THEN
	       pronto <= '1';
	       contador <= 0;
	      ELSE
	       contador <= contador + 1;
	       pronto <= '0';  
	      END IF;
	  END IF;
	  
	END PROCESS;
	
END behavior;