library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador30 is 
	generic(
		M: natural:=4
	);
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		Q_o: out std_logic_vector(M-1 downto 0);
		salida_0: out std_logic;
		salida_1: out std_logic
	);
end;
architecture contador30_arq of contador30 is 
	signal salInc: std_logic_vector(M-1 downto 0);
	signal salReg: std_logic_vector(M-1 downto 0);
	signal salOr:  std_logic;
	signal salComp0: std_logic;
	signal salComp1: std_logic;
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
	sal_0_inst: entity work.compNb
		generic map(
			N=>M
		)
		port map(
			a_i =>	salReg,
			b_i =>	"1001",
			s_o =>	salcomp0
		);
	sal_1_inst: entity work.compNb
		generic map(
			N=>M
		)
		port map(
			a_i =>	salReg,
			b_i =>	"1010",
			s_o =>	salComp1
		);
	salida_0<=salComp0;
	salida_1<= salComp1;
	salOr <=(ena_i and salComp1)or rst_i;
	Q_o<=salReg;
end;			