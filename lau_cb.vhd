library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity lau_cb is
    Port ( clock : in  STD_LOGIC;
			  start : in STD_LOGIC;
			  memory_empty : in STD_LOGIC;
           expression : in  STD_LOGIC_VECTOR (22 downto 0);
			  first_value: out STD_LOGIC_VECTOR(7 downto 0);
			  second_value: out STD_LOGIC_VECTOR(7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           ready : out  STD_LOGIC);
end lau_cb;

architecture Behavioral of lau_cb is
	type state_type is (IDLE, CONFIGURE, REQUEST, DECODE, GET_FIRST_VALUE, SEND_FIRST_VALUE,
	GET_SECOND_VALUE, SEND_SECOND_VALUE, SUM, SUBTRACT, MULTIPLY, DIVIDE, CHECK_MULT, CHECK_DIVIDE, STORE, FINISH);
	
	signal estado : state_type;
begin

process (clock, reset)
begin
	
	if reset = '1' then
	
	elsif clock'Event and clock = '1' then
		
		case(estado) is
		
			when IDLE =>
				if start = '1' then
					estado <= CONFIGURE;
				else
					estado <= IDLE;
				end if;
				
			when CONFIGURE =>
				estado <= REQUEST;

			when REQUEST =>
				if mem_empty then
					estado <= FINISH;
				else
					estado <= DECODE;
				end if;
			
			when DECODE_FIRST =>
				if instruction(8) = '1' then
					estado <= GET_FIRST_VALUE;
				else
					estado <= SEND_FIRST_VALUE;
				end if;
			
			when GET_FIRST_VALUE =>
			
			
			when GET_SECOND_VALUE =>
			
			
			when CALCULATE =>
			
			
			when CHECK =>
			
			
			when STORE =>
			
			
			when FINISH =>
			
		
		end case;
	
	
	end if;
	

end process;


--process (estado)
--	begin 
--	
--	case (estado) is
--
--		when IDLE = >
--		
--			
--		
--	end case;
--
--end process;

end Behavioral;

