LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

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
	
--	TYPE t_estados IS (PP0, PP1, PP2, PP3, PP4, PP5, PP6, PP7, PP8);
--	
--	SIGNAL estado : t_estados := PP0;
	SIGNAL contador : INTEGER := 0;
	
	SIGNAL result : STD_LOGIC_VECTOR(N + N - 1 DOWNTO 0);
	CONSTANT zero : STD_LOGIC_VECTOR(N - 1 DOWNTO 0) := (OTHERS => '0');
	
	SIGNAL saida_primeiro_reg : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	SIGNAL saida_mux_1, saida_mux_2, saida_mux_3, saida_mux_4 : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	SIGNAL soma : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	
	SIGNAL numero_deslocado, numero_nao_deslocado : STD_LOGIC_VECTOR(N + N - 1 DOWNTO 0);
BEGIN

	PRIMEIRO_REG : registrador PORT MAP(
		entrada => MD,
		clk => clk,
		permite => comeca,
		limpa => limpa,
		saida => saida_primeiro_reg
	);
	
	MUX_1: mux_2_1 PORT MAP(
		in_1 => zero,
		in_2	=> saida_primeiro_reg,
		sel => result(0),
		saida => saida_mux_1
	);
	
	soma <= result(N + N - 1 DOWNTO N) + saida_mux_1;
	
	MUX_2: mux_2_1 PORT MAP(
		in_1 => zero,
		in_2	=> soma,
		sel => start,
		saida => saida_mux_2
	);
	
	MUX_3: mux_2_1 PORT MAP(
		in_1 => MR,
		in_2	=> result(N - 1 DOWNTO 0),
		sel => start,
		saida => saida_mux_3
	);
	
	numero_deslocado <= saida_mux_2(N - 1) & saida_mux_2 & saida_mux_3(N - 1 DOWNTO 1);
	numero_nao_deslocado <= saida_mux_2 & saida_mux_3;
	
	MUX_4: mux_2_1 
		GENERIC(N => 16)
		PORT MAP(
			in_1 	=> numero_nao_deslocado,
			in_2	=> numero_deslocado,
			sel 	=> start,
			saida => saida_mux_4
		);
		
	ULTIMO_REG: registrador 
	GENERIC(N => 16)
	PORT MAP(
		entrada => saida_mux_4,
		clk => clk,
		permite => '1',
		limpa => limpa,
		saida => result
	);
	
	PROCESS(comeca)
	BEGIN
		IF count <= 8 THEN
		
		END IF;
		
--		IF estado = PP0 THEN
--			
--			estado <= PP;
--		IF estado = PP1 THEN
--		
--		IF estado = PP2 THEN
--		
--		IF estado = PP3 THEN
--		
--		IF estado = PP4 THEN
--		
--		IF estado = PP5 THEN
--		
--		IF estado = PP6 THEN
--		
--		IF estado = PP7 THEN
--		
--		IF estado = PP8 THEN
--		
--		END IF;
	END PROCESS;
	
END behavior;