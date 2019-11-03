LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY reg_tb IS
END reg_tb;
 
ARCHITECTURE behavior OF reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    

   --Inputs
   signal clock : std_logic := '0';
   signal set : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal stored : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.reg PORT MAP (
          clock => clock,
          set => set,
          reset => reset,
          input => input,
          stored => stored
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

	input <= "0010", "1111" after 30ns, "1010" after 60 ns, "1100" after 75 ns, "1001" after 90 ns;
	set <= '1';
	reset <= '1' after 150 ns;

END;
