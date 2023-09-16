library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
	port(
		clk:		in std_logic;
		rst:		in std_logic;
		Q0:		out std_logic_vector(3 downto 0);
		Q1:		out std_logic_vector(3 downto 0);
		Q2:		out std_logic_vector(3 downto 0);
		rstB:		out std_logic;
		enaR:		out std_logic
	);
end;

architecture registro_arq of registro is
	signal ena_BCD: std_logic;
	signal rst_BCD:	std_logic;
	signal rst_aux: std_logic;
	signal ena_reg:	std_logic;
	signal BCD2: 	std_logic_vector(3 downto 0);
	signal BCD3: 	std_logic_vector(3 downto 0);
	signal BCD4: 	std_logic_vector(3 downto 0);
	signal reg0:	std_logic_vector(3 downto 0);
	signal reg1:	std_logic_vector(3 downto 0);
	signal reg2:	std_logic_vector(3 downto 0);
	signal Qnb:	std_logic_vector(16 downto 0);
begin
	genpulsos_inst: entity work.genPulsos_voltimetro
		generic map(
			N	=>4,
			M	=>2
		)
		port map(
			clk_i	=>clk,
			sal_o	=>ena_BCD
		);
	contador1_inst:	entity work.contadorBCD
		port map(
			clk_i	=> clk,
			rst_i	=>rst_BCD,
			ena_i	=>ena_BCD,
			Q_0	=>open,		-- solo necesito los numeros mas grandes--
			Q_1	=>open,
			Q_2	=>open,
			Q_3	=>BCD2,
			Q_4	=>BCD3,
			Q_5	=>BCD4,
			Q_6	=>open
		);
	contadorbin_inst: entity work.contadorNb--contador con maxcount--
		generic map(
			M	=>17
		)
		port map(
			clk_i		=>clk,
			rst_i		=>rst,
			ena_i		=>'1',
			max_count	=>"01000001000110110",--33334--
			Q_o		=>Qnb,
			C_o		=>rst_aux
		);
	comparadorbin_inst: entity work.compNb--comparados de contador Nb que habilita el reg3"
		generic map(
			N	=>17
		)
		port map(
			a_i =>	Qnb,
			b_i =>	"01000001000110010",--33330
			s_o =>	ena_reg
		);	
	reg_inst: entity work.reg3x4
		port map(
			clk_i	=>clk,
			rst_i	=>rst,
			ena_i	=>ena_reg,
			D0_i	=>BCD2,
			D1_i	=>BCD3,
			D2_i	=>BCD4,
			Q0_o	=>reg0,
			Q1_o	=>reg1,
			Q2_o	=>reg2
		);
	rst_BCD <= rst_aux or rst;
	rstB<=rst_BCD;
	enaR<= ena_reg;
	Q0<=reg0;
	Q1<=reg1;
	Q2<=reg2;
end;
