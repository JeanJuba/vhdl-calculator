LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY mult_block_tb IS
END mult_block_tb;
 
ARCHITECTURE behavior OF mult_block_tb IS 
 
   --Inputs
   signal clock : std_logic := '0';
	signal base_value : std_logic_vector(7 downto 0) := (others => '0');
   signal times_value : std_logic_vector(7 downto 0) := (others => '0');
   signal set_base : std_logic := '0';
	signal reset_base : std_logic := '0';
	signal set_times : std_logic := '0';
	signal reset_times : std_logic := '0';
   signal set_counter: std_logic := '0';
   signal reset_counter: std_logic := '0';
   signal set_result : std_logic := '0';
	signal reset_result : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(7 downto 0) := (others => '0');
   signal ready : std_logic := '0';

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
  
   uut: entity work.mult_block PORT MAP (
		clock => clock,
		base_value => base_value,
		times_value => times_value,
		set_base => set_base,
		reset_base => reset_base,
		set_times => set_times,
		reset_times => reset_times,
		set_counter => set_counter,
		reset_counter => reset_counter,
		set_result => set_result,
		reset_result => reset_result,
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
 
	base_value    <= "00000111";
	times_value   <= "00000111";
	set_base      <= '1', '0' after 10 ns;
	reset_base    <= '0';
	set_times     <= '1', '0' after 10 ns;
	reset_times   <= '0';
	set_counter   <= '0', '1' after 10 ns;
	reset_counter <= '1', '0' after 10 ns;
	set_result    <= '0', '1' after 10 ns;
	reset_result  <= '1', '0' after 10 ns;

END;
