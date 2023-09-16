library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity volt_prueba is
	port(
		clk:		in std_logic;
		rst:		in std_logic;
		hsync:		out std_logic;
		vsync:		out std_logic;
		red_o:		out std_logic;
		grn_o:		out std_logic;
		blu_o:		out std_logic
	);
end;
architecture volt_prueba_arq of volt_prueba is
-------------------- señales internas ----------------
	signal BCD2: 	std_logic_vector(3 downto 0);
	signal BCD3: 	std_logic_vector(3 downto 0);
	signal BCD4: 	std_logic_vector(3 downto 0);
	signal reg0:	std_logic_vector(3 downto 0);
	signal reg1:	std_logic_vector(3 downto 0);
	signal reg2:	std_logic_vector(3 downto 0);
	signal mux_o:   std_logic_vector(3 downto 0);
	signal pix_x:	std_logic_vector(9 downto 0);
	signal pix_y:	std_logic_vector(9 downto 0);
	signal Qnb:	std_logic_vector(16 downto 0);
	signal ena_reg: std_logic;
	signal rst_reg: std_logic;
	signal ena_BCD:	std_logic;
	signal rst_BCD: std_logic;
	signal rom_o:	std_logic;
-------------------- señales de salida ----------------
	signal hs:	std_logic;
	signal vs:	std_logic;
	signal blu:	std_logic;
	signal grn:	std_logic;
	signal red:	std_logic;
begin
	gen_inst: entity work.genPulsos_voltimetro
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
			Q_2	=>BCD2,
			Q_3	=>BCD3,
			Q_4	=>BCD4,
			Q_5	=>open,
			Q_6	=>open
		);
	contadorbin_inst: entity work.contadorNb--contador con maxcount--
		generic map(
			M	=>17
		)
		port map(
			clk_i		=> clk,
			rst_i		=>rst,
			ena_i		=>'1',
			max_count	=>"01000001000110110",--33334--
			Q_o		=>Qnb,
			C_o		=>open
		);
	comparadorbin_inst: entity work.compNb--comparados de contador Nb que habilita el reg3"
		generic map(
			N	=>17
		)
		port map(
			a_i =>	Qnb,
			b_i =>	"01000001000110101",--33333
			s_o =>	ena_reg
		);	
	reg_inst: entity work.reg3
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
	mux_inst: entity work.mux8
		port map(
			I_0 	=>reg2,
			I_1	=>"1010",--.--
			I_2	=>reg1,
			I_3	=>reg0,
			I_4	=>"1011",--V--
			I_5	=>"1010",
			I_6	=>"1010",
			I_7	=>"1010",
			SEL	=>pix_x(9 downto 7),--dividiendo el eje x en 5 necesito los 3 bits mas significativos
			SAL	=>mux_o
		);
	rom_inst: entity work.rom
		port map(
			hor	=> pix_x(6 downto 4),--despues de elegir el caracter en el mux debo "escribir" con los siguientes bits"
			ver	=> pix_y(8 downto 6),--divido el eje y en 8 y tomo los valors mas grandes posibles para dividirlo"
			address => mux_o,
			sal	=> rom_o
		);
	vga_inst: entity work.vga
		port map(
			ena	=>'1',
			clk	=>clk,
			rst	=>rst,
			red_i	=>rom_o,
			grn_i	=>rom_o,
			blu_i	=>'1',
			hs_o	=>hs,
			vs_o	=>vs,
			red_o	=>red,
			grn_o	=>grn,
			blu_o	=>blu,
			pixel_x	=>pix_x,
			pixel_y	=>pix_y
	);
	hsync 	 <= hs;
	vsync  	 <= vs;
	red_o	 <= red;
	blu_o 	 <= blu;
	grn_o 	 <= grn;	

end;