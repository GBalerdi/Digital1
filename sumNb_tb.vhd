library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumNb_tb is
end;

architecture sumNb_tb_arq of sumNb_tb is
	constant N_tb:natural :=5;
	signal a_tb: std_logic_vector(N_tb-1 downto 0):="00111";
	signal b_tb: std_logic_vector(N_tb-1 downto 0):="11010";
	signal ci_tb: std_logic:='0';
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic;
begin
	ci_tb <= '1' after 500 ns;
	DUT: entity.work sumNb
		generic map(
			N=>N_tb
		)
		port map(
			a_i	=> a_tb,
			b_i	=> b_tb,
			ci_i	=> ci_tb,
			s_o	=> s_tb,
			co_o	=> co_tb
		);
end;
