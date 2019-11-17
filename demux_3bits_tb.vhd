LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY demux_3bits_tb IS
END demux_3bits_tb;
 
ARCHITECTURE behavior OF demux_3bits_tb IS 
   signal clock : std_logic := '0';
   --Inputs
   signal input : std_logic := '0';
   signal option : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal a : std_logic;
   signal b : std_logic;
   signal c : std_logic;
   signal d : std_logic;
   signal e : std_logic;
   signal f : std_logic;
   signal g : std_logic;
   signal h : std_logic;
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.demux_3bits PORT MAP (
          input => input,
          option => option,
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
          f => f,
          g => g,
          h => h
        );

    -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
 

	input <= '1';
	option <= "000", "010" after 30 ns, "110" after 60 ns;
 
 

END;
