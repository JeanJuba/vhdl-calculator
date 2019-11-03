----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:34:36 06/27/2018 
-- Design Name: 
-- Module Name:    mult_block - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult_block is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  mult_zero : in STD_LOGIC;
			  start : in STD_LOGIC;
			  set_base : in  STD_LOGIC;
			  reset_base : in  STD_LOGIC;
			  set_vezes : in  STD_LOGIC;
			  reset_vezes : in  STD_LOGIC;
			  set_result : in  STD_LOGIC;
			  reset_result : in  STD_LOGIC;
           base_value : in  STD_LOGIC_VECTOR(3 downto 0); 
           vezes_value : in  STD_LOGIC_VECTOR(3 downto 0);
           result : out  STD_LOGIC_VECTOR(3 downto 0);
           result_ready : out  STD_LOGIC);
end mult_block;

architecture Behavioral of mult_block is

	component reg 
    Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC;   --allow the register value to change
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(3 downto 0 ); --the new value to be stored
			 stored 	: BUFFER  STD_LOGIC_VECTOR(3 downto 0)); --the stored value
	end component;
	
	component adder
	port (a: in STD_LOGIC_VECTOR(3 downto 0);
			b: in STD_LOGIC_VECTOR(3 downto 0);
			s : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component subtractor
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
           s : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component mux
    Port ( a, b	: in  STD_LOGIC_VECTOR(3 downto 0);
           opt 	: in  STD_LOGIC;
           s 	: out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component comparator_zero
	Port (
		input	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		zero: OUT STD_LOGIC
	);
	end component;
	
	component commutator
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
			  opt : in STD_LOGIC;
			  l : out  STD_LOGIC_VECTOR(3 downto 0);
           r : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;

	component comparator
    Port ( a, b : in  STD_LOGIC_VECTOR(3 downto 0);
           s 	: out  STD_LOGIC);
	end component; 


	component logic_not 
    Port ( a : in  STD_LOGIC;
           s : out  STD_LOGIC);
	end component;
	
	
	
	signal base_val, vezes_val, result_val, adder_val, sub_val, mux_vezes_val, left_commut, right_commut : STD_LOGIC_VECTOR(3 downto 0);
	signal comp_out, not_mult_zero, or_out : STD_LOGIC;
begin
	
	compar : comparator port map (base_value, vezes_value, comp_out);
	commut : commutator port map (base_value, vezes_value, comp_out, left_commut, right_commut);
	reg_base : reg port map (clock, set_base, reset_base, left_commut, base_val);
	reg_vezes : reg port map (clock, set_vezes, reset_vezes, mux_vezes_val, vezes_val);
	reg_resultado : reg port map (clock, set_result, reset_result, adder_val, result_val);
	
	mux_vezes : mux port map (sub_val, right_commut, start, mux_vezes_val);
	add : adder port map (base_val, result_val, adder_val);
	sub : subtractor port map (vezes_val, "0001", sub_val);
	
	comparat : comparator_zero port map (vezes_val, result_ready);
	
	result <= result_val;
	
end Behavioral;

