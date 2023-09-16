library IEEE;
use IEEE.std_logic_1164.all;

entity mux8_tb is
end;
	
architecture mux8_tb_arq of mux8_tb is
		signal i_0: std_logic_vector(3 downto 0):="0000";
		signal i_1: std_logic_vector(3 downto 0):="0001";
		signal i_2: std_logic_vector(3 downto 0):="0010";
		signal i_3: std_logic_vector(3 downto 0):="0011";
		signal i_4: std_logic_vector(3 downto 0):="0100";
		signal i_5: std_logic_vector(3 downto 0):="0101";
		signal i_6: std_logic_vector(3 downto 0):="0110";
		signal i_7: std_logic_vector(3 downto 0):="0111";
		signal sel: std_logic_vector(3 downto 0):="0010";
		signal sal: std_logic_vector(3 downto 0);
begin
	DUT: entity work.mux8
		port map(
			I_0	=>i_0,
			I_1	=>i_1,
			I_2	=>i_2,
			I_3	=>i_3,
			I_4	=>i_4,
			I_5	=>i_5,
			I_6	=>i_6,
			I_7	=>i_7,
			SEL	=>sel,
			SAL	=>sal
		);
end;