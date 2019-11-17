library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_3bits is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : in  STD_LOGIC_VECTOR (7 downto 0);
           d : in  STD_LOGIC_VECTOR (7 downto 0);
			  e : in  STD_LOGIC_VECTOR (7 downto 0);
			  f : in  STD_LOGIC_VECTOR (7 downto 0);
			  g : in  STD_LOGIC_VECTOR (7 downto 0);
			  h : in  STD_LOGIC_VECTOR (7 downto 0);
           option : in  STD_LOGIC_VECTOR(2 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0));
end mux_3bits;

architecture Behavioral of mux_3bits is

begin
	
	s <= a when option = "000" else
	b when option = "001" else
	c when option = "010" else
	d when option = "011" else
	e when option = "100" else
	f when option = "101" else
	g when option = "110" else
	h when option = "111";

end Behavioral;
