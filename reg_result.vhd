----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:09:34 07/03/2018 
-- Design Name: 
-- Module Name:    reg_result - Behavioral 
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

entity reg_result is
   Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC;   --allow the register value to change
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(7 downto 0 ); --the new value to be stored
			 stored 	: BUFFER  STD_LOGIC_VECTOR(7 downto 0)); --the stored value
end reg_result;

architecture Behavioral of reg_result is

begin
process(clock, reset) 
 
begin
	if reset = '1' then
		stored <= "0000";
	elsif (clock'Event and clock = '1' and set = '1') then
		stored <= input;
	end if;
end process;


end Behavioral;

