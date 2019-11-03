----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:50 06/19/2018 
-- Design Name: 
-- Module Name:    commutator - Behavioral 
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

entity commutator is
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
			  opt : in STD_LOGIC;
			  l : out  STD_LOGIC_VECTOR(3 downto 0);
           r : out  STD_LOGIC_VECTOR(3 downto 0));
end commutator;

architecture Behavioral of commutator is

begin
	
	l <= a when opt = '0' else b;
	r <= b when opt = '0' else a;
	
end Behavioral;

