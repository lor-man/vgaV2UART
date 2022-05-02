
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity vga is
	port(
		clk: in std_logic;--entrada de reloj de 12MHz
		rgb_memoria: in std_logic_vector(7 downto 0);
		hsync_out: out std_logic;
		vsync_out: out std_logic;		
		red_out: out std_logic_vector(2 downto 0);
		green_sout: out std_logic_vector(2 downto 0);
		blue_out: out std_logic_vector(2 downto 1);
		addr_ram: out std_logic_vector(0 to 11);
		
		CLKIN_IBUFG_OUT_x : OUT std_logic;
		CLK0_OUT_x : OUT std_logic;
		LOCKED_OUT_x : OUT std_logic
			
	);
end vga;

architecture Behavioral of vga is
---Instanciacion generador de seales de control vga
	COMPONENT VGA_sync
	PORT(
		clk_in : IN std_logic;          
		hsync : OUT std_logic;
		vsync : OUT std_logic;
		columna : OUT std_logic_vector(0 to 5);
		fila : OUT std_logic_vector(0 to 5);
		enable : OUT std_logic
		);
	END COMPONENT;
---generador de color	
		COMPONENT rgb
	PORT(
		en_rgb : IN std_logic;
		rgb_dato : IN std_logic_vector(7 downto 0);          
		red : OUT std_logic_vector(2 downto 0);
		green : OUT std_logic_vector(2 downto 0);
		blue : OUT std_logic_vector(2 downto 1)
		);
	END COMPONENT;
---generador de direccion
	COMPONENT Generador_magen
	PORT(
		columna_in : IN std_logic_vector(0 to 5);
		fila_in : IN std_logic_vector(0 to 5);          
		addr_out : OUT std_logic_vector(0 to 11)
		);
	END COMPONENT;
---reloj 25MHz

	COMPONENT clock25
	PORT(
		CLKIN_IN : IN std_logic;
		--RST_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;
	


signal col_s: std_logic_vector(0 to 5);
signal fil_s: std_logic_vector(0 to 5);
signal en_s: std_logic; 
signal clk25_s: std_logic;


begin
---Instanciacion generador de seales de control vga
	Inst_VGA_sync: VGA_sync PORT MAP(
		clk_in =>clk25_s ,
		hsync => hsync_out,
		vsync => vsync_out,
		columna =>col_s ,
		fila => fil_s ,
		enable => en_s
	);
---generador de color
	Inst_rgb: rgb PORT MAP(
		en_rgb => en_s,
		rgb_dato => rgb_memoria ,
		red => red_out,
		green => green_sout,
		blue => blue_out 
	);
---generador de direccion
	Inst_Generador_magen: Generador_magen PORT MAP(
		columna_in => col_s,
		fila_in => fil_s,
		addr_out =>addr_ram 
	);
--reloj 25MHz
	Inst_clock25: clock25 PORT MAP(
		CLKIN_IN => clk,
		--RST_IN => ,
		CLKFX_OUT =>clk25_s ,
		CLKIN_IBUFG_OUT =>CLKIN_IBUFG_OUT_x ,
		CLK0_OUT => CLK0_OUT_x,
		LOCKED_OUT =>LOCKED_OUT_x 
	);

end Behavioral;
