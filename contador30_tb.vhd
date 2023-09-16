library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador30_tb is
end;

architecture contador30_tb_arq of contador30_tb is
	signal clk_tb: std_logic :='0';
	signal rst_tb: std_logic :='1';
	signal ena_tb: std_logic :='1';
	signal Q_tb: std_logic_vector(7 downto 0);
	signal s0: std_logic;
	signal s1: std_logic;	
begin
	clk_tb<=not clk_tb after 10 ns;
	rst_tb<='0' after 100 ns;
	DUT: entity work.contador30
		generic map(
			M=>8
		)
		port map(
			clk_i		=> clk_tb,
			rst_i		=> rst_tb,
			ena_i		=> ena_tb,
			Q_o		=> Q_tb,
			salida_0	=> s0,
			salida_1	=> s1
		);
end;