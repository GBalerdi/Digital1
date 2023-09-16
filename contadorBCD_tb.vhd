library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contadorBCD_tb is
end;

architecture contadorBCD_tb_arq of contadorBCD_tb is
	constant N_tb: natural :=4;
	signal clk_tb: std_logic :='0';
	signal rst_tb: std_logic :='1';
	signal ena_tb: std_logic :='1';
	signal Q0_tb: std_logic_vector(N_tb-1 downto 0);
	signal Q1_tb: std_logic_vector(N_tb-1 downto 0);
	signal Q2_tb: std_logic_vector(N_tb-1 downto 0);
	signal Q3_tb: std_logic_vector(N_tb-1 downto 0);
begin
	clk_tb<=not clk_tb after 10 ns;
	rst_tb<='0' after 100 ns;
	DUT: entity work.contadorBCD
		port map(
			clk_i		=>clk_tb,
			rst_i		=>rst_tb,
			ena_i		=>ena_tb,
			Q_0		=> Q0_tb,
			Q_1		=> Q1_tb,
			Q_2		=> Q2_tb,
			Q_3		=> Q3_tb
		);
end;