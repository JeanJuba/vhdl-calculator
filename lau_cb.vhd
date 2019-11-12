library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity lau_cb is
    Port ( clock : in  STD_LOGIC;
           expression : in  STD_LOGIC_VECTOR (14 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           ready : out  STD_LOGIC);
end lau_cb;

architecture Behavioral of lau_cb is
	type state_type is (IDLE, CONFIGURE);
	
	signal estado : state_type;
begin


end Behavioral;

