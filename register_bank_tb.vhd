LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY register_bank_tb IS
END register_bank_tb;
 
ARCHITECTURE behavior OF register_bank_tb IS 
 
   --Inputs
   signal clock : std_logic := '0';
   signal set : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal index : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal stored : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.register_bank PORT MAP (
          clock => clock,
          set => set,
          reset => reset,
          input => input,
          index => index,
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
 
	reset <= '1', '0' after 30 ns;
	set <= '0', '1' after 30 ns, '0' after 60 ns, '1' after 90 ns;
	index <= "011"  after 30 ns, "001" after 60 ns;
	input <= "00001001" after 30 ns, "00001111" after 60 ns;

END;
