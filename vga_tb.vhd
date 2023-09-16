library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_tb is 
end;

architecture vga_tb_arq of vga_tb is
	signal ena_tb: std_logic:='0';
	signal clk_tb: std_logic:='1';
	signal rst_tb: std_logic:='1';
	signal hs_tb:	std_logic;
	signal vs_tb:	std_logic;
	signal pixelx_tb: std_logic_vector(10 downto 0);
	signal pixely_tb: std_logic_vector(10 downto 0);
	signal red:	std_logic;
	signal blue:	std_logic;
	signal green: 	std_logic;

begin 
	ena_tb <= '1' after 200 ns;
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 100 ns;
	DUT: entity work.vga
	port map(
		ena	=> ena_tb,
		clk	=> clk_tb,
		rst	=> rst_tb,
		red_i	=>'1',
		grn_i	=>'1',
		blu_i	=>'1',
		hs_o	=>hs_tb,
		vs_o	=>vs_tb,
		red_o	=>red,
		grn_o	=>green,
		blu_O	=>blue,
		pixel_x	=> pixelx_tb,
		pixel_y	=>pixely_tb
	);
end;