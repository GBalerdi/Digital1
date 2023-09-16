library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_tb is
end;

architecture registro_tb_arq of registro_tb is
	signal clk_tb:	std_logic:='0';
	signal rst_tb: 	std_logic:='1';
	signal q0_tb:	std_logic_vector(3 downto 0);
	signal q1_tb:	std_logic_vector(3 downto 0);
	signal q2_tb:	std_logic_vector(3 downto 0);
	signal rstB_tb:	std_logic;
	signal enaR_tb:	std_logic;

begin
	clk_tb <= not clk_tb after 1 ns;
	rst_tb <= '0' after 10 ns;
		DUT: entity work.registro
			port map(
				clk=>clk_tb,
				rst=>rst_tb,
				Q0=> q0_tb,
				Q1=> q1_tb,
				Q2=> q2_tb,
				rstB=>rstB_tb,
				enaR=>enaR_tb
			);
end;