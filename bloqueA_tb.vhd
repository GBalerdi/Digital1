library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bloqueA_tb is 
end;

architecture bloqueA_tb_arq of bloqueA_tb is
	signal clk_tb: std_logic :='0';
	signal rst_tb: std_logic :='1';
	signal ena_tb: std_logic :='1';
	signal Q0_tb: std_logic_vector(3 downto 0);
	signal Q1_tb: std_logic_vector(3 downto 0);
	signal Q2_tb: std_logic_vector(3 downto 0)
begin 
	clk_tb<=not clk_tb after 10 ns;
	rst_tb<='0' after 100 ns;
	DUT: entity work.bloqueA
		port map(
			clk_i	=>clk_tb,
			rst_i	=>rst_tb,
			ena_i	=>ena_tb,
			Q0_o	=>Q0_tb,
			Q1_o	=>Q1_tb,
			Q2_o	=>Q2_tb
		);
end;