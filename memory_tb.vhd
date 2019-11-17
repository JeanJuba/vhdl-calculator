LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY memory_tb IS
END memory_tb;
 
ARCHITECTURE behavior OF memory_tb IS 
 
   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal enviar : std_logic := '0';

 	--Outputs
   signal valor : std_logic_vector(22 downto 0);
   signal memoria_vazia : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.memory PORT MAP (
          clock => clock,
          reset => reset,
          enviar => enviar,
          valor => valor,
          memoria_vazia => memoria_vazia
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

	enviar <= '0', '1' after 30 ns, '0' after 90 ns, '1' after 120 ns;
   
END;
