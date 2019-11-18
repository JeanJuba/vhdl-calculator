library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity lau_block is
	port (clock : in STD_LOGIC;
			reset  : in STD_LOGIC;
			start : in STD_LOGIC;
			result : out STD_LOGIC_VECTOR(7 downto 0);
			ready : out STD_LOGIC
	);
end lau_block;

architecture Behavioral of lau_block is
	
	component memory is
    Port ( clock, reset, enviar :in STD_LOGIC;
		     valor : out  STD_LOGIC_VECTOR(22 downto 0);
           memoria_vazia : out  STD_LOGIC);
	end component;
	
	component lau_ob is
	port( clock : in STD_LOGIC;
			reset: in STD_LOGIC;
			start: in STD_LOGIC;
			mux_option: in STD_LOGIC_VECTOR(1 downto 0);
			first_value: in STD_LOGIC_VECTOR(7 downto 0);
			second_value: in STD_LOGIC_VECTOR(7 downto 0);
			division_ready: out STD_LOGIC;
			multiplication_ready: out STD_LOGIC;
			result: out STD_LOGIC_VECTOR(7 downto 0)
	);
	end component;
	
	component lau_cb is
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
	end component;
	
	component register_bank is
   Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC; 
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(7 downto 0 );
			 index   : in STD_LOGIC_VECTOR(2 downto 0);
			 stored 	: BUFFER  STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	--memory signals
	signal reset_operation, memory_request, memory_empty : STD_LOGIC;
	signal memory_value : STD_LOGIC_VECTOR(22 downto 0);
	
	--register bank signals
	signal set_register : STD_LOGIC;
	signal register_index : STD_LOGIC_VECTOR(2 downto 0);
	signal value_stored, value_to_store : STD_LOGIC_VECTOR(7 downto 0);
	
	--lau_ob signals
	signal start_operation, multiplication_ready, division_ready : STD_LOGIC;
	signal mux_option : STD_LOGIC_VECTOR(1 downto 0);
	signal first_value, second_value, operation_result : STD_LOGIC_VECTOR(7 downto 0);

begin

	mem : memory port map (clock, reset_operation, memory_request, memory_value, memory_empty);
	regs : register_bank port map (clock, set_register, reset_operation, value_to_store, register_index, value_stored);
	ob : lau_ob port map (clock, reset, start_operation, mux_option, first_value, second_value, division_ready, multiplication_ready, operation_result);
	cb : lau_cb port map (clock, start, reset, memory_empty, memory_value, value_stored, operation_result, multiplication_ready, division_ready,
									first_value, second_value, memory_request, register_index, set_register, reset_operation, mux_option, start_operation,
									value_to_store, ready);
	
	result <= value_to_store;

end Behavioral;

