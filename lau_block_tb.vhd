LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY lau_block_tb IS
END lau_block_tb;
 
ARCHITECTURE behavior OF lau_block_tb IS 
 
   --Inputs
   signal clock : std_logic := '0';
   signal start : std_logic := '0';
	signal reset : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   signal ready : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.lau_block PORT MAP (
          clock => clock,
			 reset => reset,
          start => start,
          result => result,
          ready => ready
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
	
   start <= '1', '0' after 15 ns;
	reset <= '0';
	
END;
