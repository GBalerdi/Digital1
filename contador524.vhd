library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contadorNb is 
	generic(
		M: natural:=4
	);
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		max_count: in std_logic_vector(M-1  downto 0);
		Q_o: out std_logic_vector(M-1 downto 0);
		C_o: out std_logic
	);
end;
architecture contadorNb_arq of contadorNb is 
	signal salInc: std_logic_vector(M-1 downto 0);
	signal salReg: std_logic_vector(M-1 downto 0);
	signal salOr:  std_logic;
	signal salComp: std_logic;
	constant INC:  std_logic_vector(M-1 downto 0):=(M-2 downto 0 => '0') & '1';	
begin
	reg_inst: entity work.reg
		generic map(
			N=>M
		)
		port map(
			clk_i=> clk_i,
			rst_i=> salOr,
			ena_i=> ena_i,
			D_i=>  salInc,
			Q_o=> salReg
		);
	sum_inst: entity work.sumNb
		generic map(
			N=>M
		)
		port map(
			a_i=>salReg,
			b_i=>INC,
			ci_i=>'0',
			s_o=>salInc,
			Co_o=> open
		);
	equ_inst: entity work.compNb
		generic map(
			N=>M
		)
		port map(
			a_i =>	salReg,
			b_i =>	max_count,
			s_o =>	salComp
		);
	C_o <= salComp;
	salOr <= (ena_i and salComp)or rst_i;
	Q_o<=salReg;
end;		