library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
    Port ( a, b : in  STD_LOGIC_VECTOR(3 downto 0);
           s 	: out  STD_LOGIC);
end comparator; 

architecture Behavioral of comparator is

begin

	s <= '1' when b > a else '0'; --When b is greater than a the output is '1' else '0'


end Behavioral;

