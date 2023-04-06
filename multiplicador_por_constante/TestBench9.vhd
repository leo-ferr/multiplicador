LIBRARY ieee;
USE std.textio.ALL;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY TestBench9 IS
  
END TestBench9;

ARCHITECTURE behavior OF TestBench9 IS
   COMPONENT mult_9 IS
   PORT(
      operando: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      saida	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
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

  SIGNAL op1: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL result: STD_LOGIC_VECTOR(15 DOWNTO 0);
  
BEGIN
  
  DUT: mult_9 PORT MAP(
     operando => op1,
     saida => result
  );
  
  PROCESS
    FILE fileIn : TEXT;
    VARIABLE lineFile : LINE;
    VARIABLE number : STRING(8 DOWNTO 1);
    --VARIABLE result : STRING(16 DOWNTO 1);

  BEGIN

      op1 <= "11111111";
      wait for 0.5 ns;

      op1 <= "01111111";
      wait for 0.5 ns;

      op1 <= "10000000";
      wait for 0.5 ns;

      op1 <= "00000000";
      wait for 0.5 ns;

      FILE_OPEN(fileIn, "numeros.txt", READ_MODE);
      
      WHILE NOT endfile(fileIn) LOOP
        readline(fileIn, lineFile);
        read(lineFile, number);
        --read(lineFile, result);
        
        op1 <= str_to_stdvec(number);
        
        WAIT FOR 0.5 ns;

        --assert result = str_to_stdvec(result) report "DEU RUIM : " & INTEGER'IMAGE(number) & " * 9 ,deu : " & INTEGER'IMAGE(result);

      END LOOP;
      
      FILE_CLOSE(fileIn);

      WAIT;
  END PROCESS;
  
END behavior;
