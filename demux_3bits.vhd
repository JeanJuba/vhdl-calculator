library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity demux_3bits is
    Port ( input : in  STD_LOGIC;
			  option : in  STD_LOGIC_VECTOR(2 downto 0);
           a : out  STD_LOGIC;
           b : out  STD_LOGIC;
           c : out  STD_LOGIC;
           d : out  STD_LOGIC;
           e : out  STD_LOGIC;
           f : out  STD_LOGIC;
           g : out  STD_LOGIC;
           h : out  STD_LOGIC);
end demux_3bits;

architecture Behavioral of demux_3bits is

begin

		a <= '1' when option = "000" and input = '1' else '0';
		b <= '1' when option = "001" and input = '1' else '0';
		c <= '1' when option = "010" and input = '1' else '0';
		d <= '1' when option = "011" and input = '1' else '0';
		e <= '1' when option = "100" and input = '1' else '0';
		f <= '1' when option = "101" and input = '1' else '0';
		g <= '1' when option = "110" and input = '1' else '0';
		h <= '1' when option = "111" and input = '1' else '0';

end Behavioral;

