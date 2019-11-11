LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY div_block_tb IS
END div_block_tb;
 
ARCHITECTURE behavior OF div_block_tb IS   

   --Inputs
   signal clock : std_logic := '0';
   signal start : std_logic := '0';
   signal base_value : std_logic_vector(7 downto 0) := (others => '0');
   signal divider_value : std_logic_vector(7 downto 0) := (others => '0');
   signal set_base : std_logic := '0';
   signal reset_base : std_logic := '0';
   signal set_divider : std_logic := '0';
   signal reset_divider : std_logic := '0';
   signal set_counter : std_logic := '0';
   signal reset_counter : std_logic := '0';
   signal set_result : std_logic := '0';
   signal reset_result : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   signal ready : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
   uut: entity work.div_block PORT MAP (
          clock => clock,
          start => start,
          base_value => base_value,
          divider_value => divider_value,
          set_base => set_base,
          reset_base => reset_base,
          set_divider => set_divider,
          reset_divider => reset_divider,
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
 

   start         <= '0', '1' after 10 ns, '0' after 20 ns;
   base_value    <= "00010000";
   divider_value <= "00000010";
   set_base      <= '0', '1' after 10 ns;
   reset_base    <= '1', '0' after 10 ns;
   set_divider   <= '0', '1' after 10 ns;
   reset_divider <= '1', '0' after 10 ns;
   set_counter   <= '0', '1' after 10 ns;
   reset_counter <= '1', '0' after 10 ns;
   set_result    <= '0', '1' after 10 ns;
   reset_result  <= '1', '0' after 10 ns;

END;
