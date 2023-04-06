LIBRARY ieee;
USE std.textio.ALL;
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
		MD: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		negativo : IN STD_LOGIC;
		saida : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);

END COMPONENT;
  function str_to_stdvec(input: string) return std_logic_vector is
	   variable temp: std_logic_vector(input'range);
	begin
	   for i in input'range loop
	     if(input(i) = '1') then
	         temp(i) := '1';
	     elsif(input(i) = '0') then
	         temp(i) := '0'; 
	     
	     end if;
	   end loop;
	   
	   return temp;
	end function str_to_stdvec;
	
	
	function stdvec_to_str(input: std_logic_vector) return string is
	   variable temp: string(input'left + 1 downto 1);
	begin
	   for i in input'reverse_range loop
	     if(input(i) = '1') then
	         temp(i + 1) := '1';
	     elsif(input(i) = '0') then
	         temp(i + 1) := '0'; 
	     
	     end if;
	   end loop;
	   
	   return temp;
	end function stdvec_to_str;

  SIGNAL op1, op2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL result_main: STD_LOGIC_VECTOR(15 DOWNTO 0);
  
BEGIN
  
  DUT: main PORT MAP(
     operando_1 => op1,
     operando_2 => op2,
     saida => result_main
  );
  
  PROCESS
    FILE fileIn : TEXT;
    VARIABLE lineFile : LINE;
    VARIABLE number1, number2 : STRING(8 DOWNTO 1);
    VARIABLE result : STRING(16 DOWNTO 1);

  BEGIN
      FILE_OPEN(fileIn, "numeros.txt", READ_MODE);
      
      WHILE NOT endfile(fileIn) LOOP
        readline(fileIn, lineFile);
        read(lineFile, number1);
        read(lineFile, number2);
        read(lineFile, result);
        
        op1 <= str_to_stdvec(number1);
        op2 <= str_to_stdvec(number2);
        
        WAIT FOR 0.5 ns;

        --assert result_main = str_to_stdvec(result) report "DEU RUIM : " & op1 & " e " & op2 " deu : " & result_main;

      END LOOP;
      
      FILE_CLOSE(fileIn);

      WAIT;
  END PROCESS;
  
END behavior;
