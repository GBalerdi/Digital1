library IEEE;
use IEEE.std_logic_1164.all;

entity compNb is 
	generic(
		N: natural:=4
	);
	port(
		a_i: in std_logic_vector(N-1 downto 0);
		b_i: in std_logic_vector(N-1 downto 0);
		s_o: out std_logic
	);
end;
architecture compNb_arq of compNb is
	signal 	aux: std_logic_vector (N downto 0);
begin
	aux(0) <= '1';
	aaa: for i in 0 to N-1 generate
		aux(i+1)<= not(a_i(i) xor b_i(i)) and aux(i);
	end generate;
	
	s_o <= aux(N);
end;