library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity lau_cb is
    Port ( clock 			: in  STD_LOGIC;
			  start        : in STD_LOGIC;
			  reset        : in STD_LOGIC;
			  memory_empty : in STD_LOGIC;
           instruction   : in  STD_LOGIC_VECTOR (22 downto 0);
			  register_value : in STD_LOGIC_VECTOR(7 downto 0);
			  operation_value : in STD_LOGIC_VECTOR(7 downto 0);
			  multiplication_ready : in STD_LOGIC;
			  division_ready : in STD_LOGIC;
			  
			  first_value    : out STD_LOGIC_VECTOR(7 downto 0);
			  second_value   : out STD_LOGIC_VECTOR(7 downto 0);
			  memory_request : out STD_LOGIC;
			  register_index : out STD_LOGIC_VECTOR(2 downto 0);
			  set_register   : out STD_LOGIC;
			  reset_operation          : out STD_LOGIC;
			  operation 	  : out STD_LOGIC_VECTOR(1 downto 0);
			  start_operation : out STD_LOGIC;
           result         : out  STD_LOGIC_VECTOR (7 downto 0);
           ready          : out  STD_LOGIC);
end lau_cb;

architecture Behavioral of lau_cb is
	type state_type is (IDLE, CONFIGURE, REQUEST, DECODE_FIRST, GET_FIRST_VALUE, SEND_FIRST_VALUE_MEM,   SEND_FIRST_VALUE_INST,
																			DECODE_SECOND, GET_SECOND_VALUE, SEND_SECOND_VALUE_MEM, SEND_SECOND_VALUE_INST,
																			CHECK_OP, SUM, SUBTRACT, MULTIPLY, DIVIDE, CHECK_MULT, CHECK_DIVIDE,
																			STORE, FINISH);
	
	signal estado : state_type;
	signal last_register : STD_LOGIC_VECTOR(2 downto 0);
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
				estado <= DECODE_FIRST;
			
			when DECODE_FIRST =>
				if memory_empty = '1' then
					estado <= FINISH;
				else
			
				if instruction(20) = '1' then
					estado <= GET_FIRST_VALUE;
				else
					estado <= SEND_FIRST_VALUE_INST;
				end if;
				
				end if;
			
			when GET_FIRST_VALUE =>
				estado <= SEND_FIRST_VALUE_MEM;
			
			when SEND_FIRST_VALUE_MEM =>
				estado <= DECODE_SECOND;
			
			when SEND_FIRST_VALUE_INST =>
				estado <= DECODE_SECOND;
			
			when DECODE_SECOND =>
				if instruction(11) = '1' then
					estado <= GET_SECOND_VALUE;
				else
					estado <= SEND_SECOND_VALUE_INST;
				end if;
			
			when GET_SECOND_VALUE =>
				estado <= SEND_SECOND_VALUE_MEM;			
			
			when SEND_SECOND_VALUE_MEM =>
				estado <= CHECK_OP;
			
			when SEND_SECOND_VALUE_INST =>
				estado <= CHECK_OP;
			
			when CHECK_OP =>
				if instruction(22 downto 21) = "00" then
					estado <= SUM;
				elsif instruction(22 downto 21) = "01" then
					estado <= SUBTRACT;
				elsif instruction(22 downto 21) = "10" then
					estado <= MULTIPLY;
				else
					estado <= DIVIDE;
				end if;
				
			when SUM =>
				estado <= STORE;
			
			when SUBTRACT =>
				estado <= STORE;
			
			when MULTIPLY =>
				estado <= CHECK_MULT;
				
			when CHECK_MULT =>
				if multiplication_ready = '1' then
					estado <= STORE;
				else
					estado <= CHECK_MULT;
				end if;
			
			when DIVIDE =>
				estado <= CHECK_DIVIDE;
			
			when CHECK_DIVIDE =>
				if division_ready = '1' then
					estado <= STORE;
				else
					estado <= CHECK_DIVIDE;
				end if;
			
			when STORE =>
				estado <= REQUEST;
			
			
			when FINISH =>
				estado <= FINISH;
		
		end case;
	
	
	end if;
	

end process;


process (estado)
	begin 
	
	case (estado) is

		when IDLE =>
			first_value  <= "00000000";
			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';
				
		when CONFIGURE =>
			first_value  <= "00000000";
			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '1';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';

		when REQUEST =>
			--first_value  <= "00000000";
			--second_value <= "00000000";
			memory_request <= '1';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';
				
			
		when DECODE_FIRST =>
			--first_value  <= "00000000";
			--second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';
				
			
		when GET_FIRST_VALUE =>
			--first_value  <= "00000000";
			--second_value <= "00000000";
			memory_request <= '0';
			register_index <= instruction(14 downto 12);
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';
				
			
		when SEND_FIRST_VALUE_MEM =>
			first_value  <= register_value;
			--second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';
			
		when SEND_FIRST_VALUE_INST =>
			first_value  <= instruction(19 downto 12);
			--second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';	
			
		when DECODE_SECOND =>
--			first_value  <= "00000000";
			--second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';	
			
		when GET_SECOND_VALUE =>
--			first_value  <= "00000000";
			--second_value <= "00000000";
			memory_request <= '0';
			register_index <= instruction(5 downto 3);
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';			
			
		when SEND_SECOND_VALUE_MEM =>
--			first_value  <= "00000000";
			second_value <= register_value;
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';		
			
		when SEND_SECOND_VALUE_INST =>
--			first_value  <= "00000000";
			second_value <= instruction(10 downto 3);
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';	
			
		when CHECK_OP =>
--			first_value  <= "00000000";
--			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= "00";
			start_operation <= '0';
         result <= "00000000";
         ready <= '0';		
				
		when SUM =>
--			first_value  <= "00000000";
--			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= instruction(22 downto 21);
			start_operation <= '0';
         result <= operation_value;
         ready <= '0';	
			
		when SUBTRACT =>
--			first_value  <= "00000000";
--			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= instruction(22 downto 21);
			start_operation <= '0';
         result <= operation_value;
         ready <= '0';		
			
		when MULTIPLY =>
--			first_value  <= "00000000";
--			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= instruction(22 downto 21);
			start_operation <= '1';
         result <= operation_value;
         ready <= '0';	
			
		when DIVIDE =>
--			first_value  <= "00000000";
--			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= instruction(22 downto 21);
			start_operation <= '1';
         result <= operation_value;
         ready <= '0';	
			
		when CHECK_MULT =>
--			first_value  <= "00000000";
--			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= instruction(22 downto 21);
			start_operation <= '1';
         result <= operation_value;
         ready <= '0';	
			
		when CHECK_DIVIDE =>
--			first_value  <= "00000000";
--			second_value <= "00000000";
			memory_request <= '0';
			register_index <= "000";
			set_register   <= '0';
			reset_operation <= '0';
			operation <= instruction(22 downto 21);
			start_operation <= '0';
         result <= operation_value;
         ready <= '0';	
			
		when STORE =>
--			first_value  <= "00000000";
--			second_value <= "00000000";
			memory_request <= '0';
			register_index <= instruction(2 downto 0);
			set_register   <= '1';
			reset_operation <= '0';
			operation <= instruction(22 downto 21);
			start_operation <= '0';
         result <= operation_value;
         ready <= '0';	
			last_register <= instruction(2 downto 0);
			
		when FINISH =>
			ready <= '1';
			register_index <= last_register;
			set_register   <= '0';
			result <= register_value;
		
	end case;

end process;

end Behavioral;

