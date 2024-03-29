LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY control_block_tb IS
END control_block_tb;
 
ARCHITECTURE behavior OF control_block_tb IS 
 
    COMPONENT control_block
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         temp_result : IN  std_logic_vector(7 downto 0);
         ready : IN  std_logic;
         set_base : OUT  std_logic;
         reset_base : OUT  std_logic;
         set_times : OUT  std_logic;
         reset_times : OUT  std_logic;
         set_counter : OUT  std_logic;
         reset_counter : OUT  std_logic;
         set_result : OUT  std_logic;
         reset_result : OUT  std_logic;
         final_result : OUT  std_logic_vector(7 downto 0);
         operation_ready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal temp_result : std_logic_vector(7 downto 0) := (others => '0');
   signal ready : std_logic := '0';

 	--Outputs
   signal set_base : std_logic;
   signal reset_base : std_logic;
   signal set_times : std_logic;
   signal reset_times : std_logic;
   signal set_counter : std_logic;
   signal reset_counter : std_logic;
   signal set_result : std_logic;
   signal reset_result : std_logic;
   signal final_result : std_logic_vector(7 downto 0);
   signal operation_ready : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_block PORT MAP (
          clock => clock,
          reset => reset,
          start => start,
          temp_result => temp_result,
          ready => ready,
          set_base => set_base,
          reset_base => reset_base,
          set_times => set_times,
          reset_times => reset_times,
          set_counter => set_counter,
          reset_counter => reset_counter,
          set_result => set_result,
          reset_result => reset_result,
          final_result => final_result,
          operation_ready => operation_ready
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
