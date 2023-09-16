library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
	generic(
		N: natural:=4
	);
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		D_i: in std_logic_vector(N-1 downto 0);
		Q_o: out std_logic_vector(N-1 downto 0)
	);
end;
architecture reg_arq of reg is 
begin 
	process(clk_i)
	begin
		if rising_edge(clk_i) then 
			if rst_i='1' then
				Q_o<=(N-1 downto 0=>'0');
			elsif ena_i ='1' then
				Q_o<= D_i;
			end if;
		end if;
	end process;
end;