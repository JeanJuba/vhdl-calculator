library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity div_cb is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           operation_ready : out  STD_LOGIC);
end div_cb;

architecture Behavioral of div_cb is

begin


end Behavioral;

