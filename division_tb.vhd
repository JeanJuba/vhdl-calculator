-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY division_tb IS
  END division_tb;

  ARCHITECTURE behavior OF division_tb IS 

  --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal first_value : std_logic_vector(7 downto 0) := (others => '0');
   signal second_value : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   signal ready : std_logic;

   constant clock_period : time := 10 ns;
          
  BEGIN
  
  uut: entity work.division PORT MAP (
          clock => clock,
          reset => reset,
          start => start,
          first_value => first_value,
          second_value => second_value,
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
 

   reset <= '0';
   start <= '0', '1' after 10 ns, '0' after 20 ns;
   first_value  <= "00001000";
   second_value <= "00000010";
 

  END;
