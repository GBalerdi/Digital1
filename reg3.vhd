library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg3x4 is
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		D0_i: in std_logic_vector(3 downto 0);
		D1_i: in std_logic_vector(3 downto 0);
		D2_i: in std_logic_vector(3 downto 0);
		Q0_o: out std_logic_vector(3 downto 0);
		Q1_o: out std_logic_vector(3 downto 0);
		Q2_o: out std_logic_vector(3 downto 0)
	);
end;
architecture reg3x4_arq of reg3x4 is
begin
	reg0_inst: entity work.reg
		generic map(
			N	=> 4
		)
		port map(
			clk_i	=> clk_i,
			rst_i	=> rst_i,
			ena_i	=> ena_i,
			D_i	=> D0_i,
			Q_o	=> Q0_o
		);
	reg1_inst: entity work.reg
		generic map(
			N	=> 4
		)
		port map(
			clk_i	=> clk_i,
			rst_i	=> rst_i,
			ena_i	=> ena_i,
			D_i	=> D1_i,
			Q_o	=> Q1_o
		);
	reg2_inst: entity work.reg
		generic map(
			N	=> 4
		)
		port map(
			clk_i	=> clk_i,
			rst_i	=> rst_i,
			ena_i	=> ena_i,
			D_i	=> D2_i,
			Q_o	=> Q2_o
		);
end;
