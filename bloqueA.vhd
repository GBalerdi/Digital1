library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bloqueA is 
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		Q0_o: out std_logic_vector(3 downto 0);
		Q1_o: out std_logic_vector(3 downto 0);
		Q2_o: out std_logic_vector(3 downto 0)
	);

end;

architecture bloqueA_arq of bloqueA is
	signal Q0_aux: std_logic_vector(3 downto 0);
	signal Q1_aux: std_logic_vector(3 downto 0);
	signal Q2_aux: std_logic_vector(3 downto 0);
	signal ena:  std_logic;
	signal rst:  std_logic;
	signal BCD0: std_logic_vector(3 downto 0);
	signal BCD1: std_logic_vector(3 downto 0);
	signal BCD2: std_logic_vector(3 downto 0);
begin
	Contador_inst: entity work.contador30
		generic map(
			M=>4
		)
		port map(
			clk_i	=>clk_i,
			rst_i	=>rst_i,
			ena_i	=>ena_i,
			Q_o	=>open,
			salida_0=>ena,
			salida_1=>rst
		);
	BCD_inst: entity work.contadorBCD
		port map(
			clk_i	=>clk_i,
			rst_i	=>rst,
			ena_i	=>ena_i,
			Q_0	=>BCD0,
			Q_1	=>BCD1,
			Q_2	=>BCD2,
			Q_3	=>open,
			Q_4	=>open
		);
	reg_inst: entity work.reg3x4
		port map(
			clk_i	=>clk_i,
			rst_i	=>rst_i,
			ena_i	=>ena,
			D0_i	=>BCD0,
			D1_i	=>BCD1,
			D2_i	=>BCD2,
			Q0_o	=>Q0_aux,
			Q1_o	=>Q1_aux,
			Q2_o	=>Q2_aux
		);
Q0_o<=Q0_aux;
Q1_o<=Q1_aux;
Q2_o<=Q2_aux;
end;