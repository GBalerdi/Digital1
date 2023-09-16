library IEEE;
use IEEE.std_logic_1164.all;

entity mux_tb is
end mux_tb;

architecture mux_tb_arq of mux_tb is
	signal I0_aux: 	std_logic_vector(3 downto 0):="1000";
	signal I1_aux: 	std_logic_vector(3 downto 0):="1111";
	signal sal_aux: std_logic_vector(3 downto 0);
	signal sel_aux: std_logic:='1';
begin 
	DUT: entity work.mux
		port map(
			I0	=>I0_aux,
			I1	=>I1_aux,
			sal	=>sal_aux,
			sel	=>sel_aux
		);
end;
