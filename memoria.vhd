library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria is
    Port ( clock, reset, enviar :in STD_LOGIC;
		     valor : out  STD_LOGIC_VECTOR(8 downto 0);
           memoria_vazia : out  STD_LOGIC);
end memoria;

architecture Behavioral of memoria is
	
	type ROM is array (0 to 10) of STD_LOGIC_VECTOR(8 downto 0); --Read only memory
								  --2x5         5x2					2x3		3^2				FIM			2^3				0^2			2x1			2^0				0x0		FIM
	constant mem : ROM := ("000100101", "001010010", "000100011", "100110010", "000110011", "100100011", "100000010", "000100001", "100100000", "000000000", "111111111"); --"11111111" is the stop value
	signal mem_value : STD_LOGIC_VECTOR(8 downto 0);
	signal empty : STD_LOGIC := '0';
	
begin
	process(clock, reset)
		variable counter : integer := 0;
	begin
	
		if reset = '1' then
			empty <= '0';
			
		elsif rising_edge(clock) and enviar = '1' then 
			 mem_value <= mem(counter);	
		    counter := counter + 1; --increases counter by one			 
		end if;
		
		if mem_value = "111111111" then --checks if the value read is the stop one
			empty <= '1';
			
		else
			empty <= '0';
		end if;
	end process;
	
	valor <= mem_value; 			--sends the memory value read to the output
	memoria_vazia <= empty;

end Behavioral;

