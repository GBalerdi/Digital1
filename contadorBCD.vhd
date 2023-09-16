library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contadorBCD is 
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		Q_0: out std_logic_vector(3 downto 0);
		Q_1: out std_logic_vector(3 downto 0);
		Q_2: out std_logic_vector(3 downto 0);
		Q_3: out std_logic_vector(3 downto 0);
		Q_4: out std_logic_vector(3 downto 0);
		Q_5: out std_logic_vector(3 downto 0);
		Q_6: out std_logic_vector(3 downto 0) 
	);
end;

architecture contadorBCD_arq of contadorBCD is
	signal Q0_aux: std_logic_vector(3 downto 0);
	signal Q1_aux: std_logic_vector(3 downto 0);
	signal Q2_aux: std_logic_vector(3 downto 0);
	signal Q3_aux: std_logic_vector(3 downto 0);
	signal Q4_aux: std_logic_vector(3 downto 0);
	signal Q5_aux: std_logic_vector(3 downto 0);
	signal Q6_aux: std_logic_vector(3 downto 0);
	signal ena_aux: std_logic_vector(6 downto 0);
	signal flag_out: std_logic_vector(6 downto 0);
begin
	ena_aux(0)<= ena_i;
	ena_aux(1)<=ena_aux(0) and flag_out(0);
	ena_aux(2)<=ena_aux(1) and flag_out(1);
	ena_aux(3)<=ena_aux(2) and flag_out(2);
	ena_aux(4)<=ena_aux(3) and flag_out(3);
	ena_aux(5)<=ena_aux(4) and flag_out(4);
	ena_aux(6)<=ena_aux(5) and flag_out(5);
	contador0: entity work.contadorNb
		generic map(
			M => 4
		)
		port map(
			clk_i		=>clk_i,
			rst_i		=>rst_i,
			ena_i		=>ena_aux(0),
			max_count	=>"1001",
			Q_o		=>Q0_aux,
			C_o		=>flag_out(0)
		);

	contador1: entity work.contadorNb
		generic map(
			M => 4
		)
		port map(
			clk_i		=>clk_i,
			rst_i		=>rst_i,
			ena_i		=>ena_aux(1),
			max_count	=>"1001",
			Q_o		=>Q1_aux,
			C_o		=>flag_out(1)
		);

	contador2: entity work.contadorNb
		generic map(
			M => 4
		)
		port map(
			clk_i		=>clk_i,
			rst_i		=>rst_i,
			ena_i		=>ena_aux(2),
			max_count	=>"1001",
			Q_o		=>Q2_aux,
			C_o		=>flag_out(2)
		);

	contador3: entity work.contadorNb
		generic map(
			M => 4
		)
		port map(
			clk_i		=>clk_i,
			rst_i		=>rst_i,
			ena_i		=>ena_aux(3),
			max_count	=>"1001",
			Q_o		=>Q3_aux,
			C_o		=>flag_out(3)
		);
	contador4: entity work.contadorNb
		generic map(
			M => 4
		)
		port map(
			clk_i		=>clk_i,
			rst_i		=>rst_i,
			ena_i		=>ena_aux(4),
			max_count	=>"1001",
			Q_o		=>Q4_aux,
			C_o		=>flag_out(4)
		);
	contador5: entity work.contadorNb
		generic map(
			M => 4
		)
		port map(
			clk_i		=>clk_i,
			rst_i		=>rst_i,
			ena_i		=>ena_aux(5),
			max_count	=>"1001",
			Q_o		=>Q5_aux,
			C_o		=>flag_out(5)
		);
	contador6: entity work.contadorNb
		generic map(
			M => 4
		)
		port map(
			clk_i		=>clk_i,
			rst_i		=>rst_i,
			ena_i		=>ena_aux(6),
			max_count	=>"1001",
			Q_o		=>Q6_aux,
			C_o		=>open
		);
Q_0 <=Q0_aux;
Q_1 <=Q1_aux;
Q_2 <=Q2_aux;
Q_3 <=Q3_aux;
Q_4 <=Q4_aux;
Q_5 <=Q5_aux;
Q_6 <=Q6_aux;
end;