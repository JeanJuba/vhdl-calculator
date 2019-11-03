--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:52:41 06/27/2018
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/ALU-CSM-POW-master/mult_block_tb.vhd
-- Project Name:  trab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mult_block
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mult_block_tb IS
END mult_block_tb;
 
ARCHITECTURE behavior OF mult_block_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal set_base : std_logic := '0';
   signal reset_base : std_logic := '0';
   signal set_result : std_logic := '0';
   signal reset_result : std_logic := '0';
   signal set_vezes : std_logic := '0';
   signal reset_vezes : std_logic := '0';
   signal base_value : std_logic_vector(3 downto 0) := (others => '0');
   signal vezes_value : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(3 downto 0);
   signal result_ready : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
  
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.mult_block PORT MAP (
          clock => clock,
          reset => reset,
			 mult_zero => '0',
          start => start,
          set_base => set_base,
          reset_base => reset_base,
          set_result => set_result,
          reset_result => reset_result,
          set_vezes => set_vezes,
          reset_vezes => reset_vezes,
          base_value => base_value,
          vezes_value => vezes_value,
          result => result,
          result_ready => result_ready
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
  start <= '1', '0' after 10 ns;
  reset <= '1', '0' after 5 ns;
  base_value <= "0010";
  vezes_value <= "0011";
  set_base <= '1';
  reset_base<= '1', '0' after 5 ns;
  set_result <= '1';
  reset_result<= '1', '0' after 5 ns;
  set_vezes<= '1';
  reset_vezes<= '0';--'1', '0' after 5 ns;

END;
