library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
	port(
		I0: 	in std_logic_vector(3 downto 0);
		I1: 	in std_logic_vector(3 downto 0);
		sal: 	out std_logic_vector(3 downto 0);
		sel:	in std_logic
	);
end mux;

architecture mux_arq of mux is
begin
	
	aaa: for i in 0 to 3 generate
	
		sal(i) <= (I0(i) and (not(sel))) or (I1(i) and sel); 
		
	end generate;
end; 
