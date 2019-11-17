library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory is
    Port ( clock, reset, enviar :in STD_LOGIC;
		     valor : out  STD_LOGIC_VECTOR(22 downto 0);
           memoria_vazia : out  STD_LOGIC);
end memory;

architecture Behavioral of memory is
	
	type ROM is array (0 to 2) of STD_LOGIC_VECTOR(22 downto 0);
								 
	constant mem : ROM := ("00000000001000000010000", "10100000000000000100001", "11111111111111111111111");
	signal mem_value : STD_LOGIC_VECTOR(22 downto 0);
	signal empty : STD_LOGIC := '0';
	
begin
	process(clock, reset)
		variable counter : integer := 0;
	begin
	
		if reset = '1' then
			empty <= '0';
			
		elsif rising_edge(clock) and enviar = '1' then 
			 mem_value <= mem(counter);	
		    counter := counter + 1;		 
		end if;
		
		if mem_value = "11111111111111111111111" then
			empty <= '1';
			
		else
			empty <= '0';
		end if;
	end process;
	
	valor <= mem_value; 
	memoria_vazia <= empty;

end Behavioral;