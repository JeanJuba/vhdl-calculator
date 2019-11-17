library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity register_bank is
   Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC; 
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(7 downto 0 );
			 index   : in STD_LOGIC_VECTOR(2 downto 0);
			 stored 	: BUFFER  STD_LOGIC_VECTOR(7 downto 0));
end register_bank;

architecture Behavioral of register_bank is

component reg is
    Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC;  
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(7 downto 0 );
			 stored 	: BUFFER  STD_LOGIC_VECTOR(7 downto 0));
end component;

component mux_3bits is
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
end component;

component demux_3bits is
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
end component;
	
	signal set_signal : STD_LOGIC_VECTOR(1 downto 0);
	signal set0, set1, set2, set3, set4, set5, set6, set7 : STD_LOGIC;
	signal out0, out1, out2, out3, out4, out5, out6, out7, output_signal: STD_LOGIC_VECTOR(7 downto 0);
	
begin
	
	demux3b: demux_3bits port map (set, index, set0, set1, set2, set3, set4, set5, set6, set7);
	
	reg0 : reg port map (clock, set0, reset, input, out0);
	reg1 : reg port map (clock, set1, reset, input, out1);
	reg2 : reg port map (clock, set2, reset, input, out2);
	reg3 : reg port map (clock, set3, reset, input, out3);
	reg4 : reg port map (clock, set4, reset, input, out4);
	reg5 : reg port map (clock, set5, reset, input, out5);
	reg6 : reg port map (clock, set6, reset, input, out6);
	reg7 : reg port map (clock, set7, reset, input, out7);
	
	mux3b : mux_3bits port map (out0, out1, out2, out3, out4, out5, out6, out7, index, output_signal);
	
	stored <= output_signal;
	
end Behavioral;


