library IEEE;
use IEEE.std_logic_1164.all;

entity mu8 is
	port(
		I_0: 	in std_logic_vector(3 downto 0);
		I_1: 	in std_logic_vector(3 downto 0);
		I_2: 	in std_logic_vector(3 downto 0);
		I_3: 	in std_logic_vector(3 downto 0);
		I_4: 	in std_logic_vector(3 downto 0);
		I_5: 	in std_logic_vector(3 downto 0);
		I_6: 	in std_logic_vector(3 downto 0);
		I_7: 	in std_logic_vector(3 downto 0);
		SEL:	in std_logic_vector(3 downto 0);
		SAL: 	out std_logic_vector(3 downto 0)
	);
end;

architecture mux8_arq of mux8 is
	signal sal0 : std_logic_vector(3 downto 0);
	signal sal1 : std_logic_vector(3 downto 0);
	signal sal2 : std_logic_vector(3 downto 0);
	signal sal3 : std_logic_vector(3 downto 0);
	signal sal4 : std_logic_vector(3 downto 0);
	signal sal5 : std_logic_vector(3 downto 0);
	signal sal6 : std_logic_vector(3 downto 0);
begin 
	mux0_inst: entity work.mux
		port map(
			I0=>	I_0,
			I1=>	I_1,
			sal=>	sal0,
			sel=>	SEL(0)
		);
	mux1_inst: entity work.mux
		port map(
			I0=>	I_2,
			I1=>	I_3,
			sal=>	sal1,
			sel=>	SEL(0)
		);
	mux2_inst: entity work.mux
		port map(
			I0=>	I_4,
			I1=>	I_5,
			sal=>	sal2,
			sel=>	SEL(0)
		);
	mux3_inst: entity work.mux
		port map(
			I0=>	I_6,
			I1=>	I_7,
			sal=>	sal3,
			sel=>	SEL(0)
		);
	mux4_inst: entity work.mux
		port map(
			I0=>	sal0,
			I1=>	sal1,
			sal=>	sal4,
			sel=>	SEL(1)
		);
	mux5_inst: entity work.mux
		port map(
			I0=>	sal2,
			I1=>	sal3,
			sal=>	sal5,
			sel=>	SEL(1)
		);
	mux6_inst: entity work.mux
		port map(
			I0=>	sal4,
			I1=>	sal5,
			sal=>	sal6,
			sel=>	SEL(2)
		);
SAL<=sal6;
end;