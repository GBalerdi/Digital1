library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contadorNb_tb is
end;

architecture contadorNb_tb_arq of contadorNb_tb is
	constant N_tb: natural :=11;
	signal clk_tb: std_logic :='0';
	signal rst_tb: std_logic :='1';
	signal ena_tb: std_logic :='1';
	signal C_tb: std_logic :='0';
	signal Q_tb: std_logic_vector(N_tb-1 downto 0);
	signal Max_count:std_logic_vector(N_tb-1 downto 0):="01000001100";	
begin
	clk_tb<=not clk_tb after 10 ns;
	rst_tb<='0' after 100 ns;
	DUT: entity work.contadorNb
		generic map(
			M=>N_tb
		)
		port map(
			clk_i		=> clk_tb,
			rst_i		=> rst_tb,
			ena_i		=> ena_tb,
			max_count	=> Max_count,
			Q_o		=> Q_tb,
			C_o		=> C_tb
		);
end;
