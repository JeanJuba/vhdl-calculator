LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY lau_ob_tb IS
END lau_ob_tb;
 
ARCHITECTURE behavior OF lau_ob_tb IS 
    
   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal mux_option : std_logic_vector(1 downto 0) := (others => '0');
   signal first_value : std_logic_vector(7 downto 0) := (others => '0');
   signal second_value : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal division_ready : std_logic;
   signal multiplication_ready : std_logic;
   signal result : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.lau_ob PORT MAP (
          clock => clock,
          reset => reset,
          start => start,
          mux_option => mux_option,
          first_value => first_value,
          second_value => second_value,
          division_ready => division_ready,
          multiplication_ready => multiplication_ready,
          result => result
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

	reset <= '1', '0' after 10 ns, '1' after 100 ns, '0' after 110 ns;
	start <= '0', '1' after 20 ns, '0' after 130 ns;
	first_value <= "00000100";
	second_value <= "00000010";
	mux_option <= "00", "01" after 20 ns, "10" after 30 ns, "11" after 120 ns;

END;
