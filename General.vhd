
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity General is
port(
	--generales
		clk_g: in std_logic;
		--rxocupado: out std_logic_vector(0 downto 0);
		
	--VGA
	hsync: out std_logic;
	vsync: out std_logic;
	red: OUT std_logic_vector(2 downto 0);
	green: OUT std_logic_vector(2 downto 0);
	blue: OUT std_logic_vector(2 downto 1);
	CLKIN_IBUFG_OUT : OUT std_logic;
	--CLK0_OUT : OUT std_logic;
	LOCKED_OUT : OUT std_logic;
	
	
	--UART
		en_tx: in std_logic;
		datos_enviar: in std_logic_vector(7 downto 0);
		RX_pin: in std_logic;
		TX_pin: out std_logic
--ram opcional
			--ocupado_ram: out std_logic
);
 
end General;

architecture Behavioral of General is

--Instanciacion de uart
	COMPONENT UART
	PORT(
		clk12 : IN std_logic;
		RX : IN std_logic;
		habilitar_tx : IN std_logic;
		datos_envio : IN std_logic_vector(7 downto 0);          
		TX : OUT std_logic;
		ocupado_rx : OUT std_logic_vector(0 downto 0);
		datos_recibidos : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
--Intanciacion de ram
	COMPONENT ram
	  PORT (
		 clka : IN STD_LOGIC;
		 wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
	END COMPONENT;
--instanciacion generador de direcciones ram
	COMPONENT generador_direccion
	PORT(
		clk12MHz_G : IN std_logic;
		clkC : IN std_logic_vector(0 downto 0);          
		addr_ram : OUT std_logic_vector(11 downto 0);
		escritura : OUT std_logic_vector(0 downto 0)
		);
	END COMPONENT;
--instanciacion de mux

	COMPONENT mux_wr
	PORT(
		w_r : IN std_logic_vector(0 downto 0);
		addr_w : IN std_logic_vector(11 downto 0);
		addr_r : IN std_logic_vector(11 downto 0);          
		addr_ram_wr : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;
--instancion de vga
	COMPONENT vga
	PORT(
		clk : IN std_logic;
		rgb_memoria : IN std_logic_vector(7 downto 0);          
		hsync_out : OUT std_logic;
		vsync_out : OUT std_logic;
		red_out : OUT std_logic_vector(2 downto 0);
		green_sout : OUT std_logic_vector(2 downto 0);
		blue_out : OUT std_logic_vector(2 downto 1);
		addr_ram : OUT std_logic_vector(0 to 11);
		CLKIN_IBUFG_OUT_x : OUT std_logic;
		CLK0_OUT_x : OUT std_logic;
		LOCKED_OUT_x : OUT std_logic
		);
	END COMPONENT;
--seales:
signal clk0: std_logic;
signal rx_ocupado,ram_wr_in: std_logic_vector (0 downto 0);
signal mux_ram_w,mux_ram_r,mux_ram_addr: std_logic_vector(11 downto 0);
signal uart_rx_datos,rgb_datos_ram: std_logic_vector(7 downto 0);


begin
--rxocupado<=rx_ocupado;
--Instanciacion de uart
	Inst_UART: UART PORT MAP(
		clk12 => clk0,
		TX =>TX_pin ,
		RX =>RX_pin ,
		habilitar_tx =>en_tx ,
		ocupado_rx => rx_ocupado,
		datos_envio => datos_enviar,
		datos_recibidos => uart_rx_datos
	);
--Instanciacion de ram
ram0 : ram PORT MAP (
    clka => clk0,
    wea => ram_wr_in,
    addra => mux_ram_addr,
    dina => uart_rx_datos ,
    douta => rgb_datos_ram
  );
--Instanciacion de generador de direcciones ram
	Inst_generador_direccion: generador_direccion PORT MAP(
		clk12MHz_G =>clk0 ,
		clkC => rx_ocupado,
		addr_ram =>mux_ram_w ,
		escritura =>ram_wr_in --ocupado_ram
	);
-- instanciacion de mux
	Inst_mux_wr: mux_wr PORT MAP(
		w_r =>rx_ocupado ,
		addr_w => mux_ram_w,
		addr_r => mux_ram_r ,
		addr_ram_wr => mux_ram_addr
	);
--instanciacion de vga
	Inst_vga: vga PORT MAP(
		clk =>clk_g ,
		rgb_memoria => rgb_datos_ram,
		hsync_out =>hsync ,
		vsync_out =>vsync ,
		red_out =>red ,
		green_sout =>green ,
		blue_out => blue,
		addr_ram => mux_ram_r,
		CLKIN_IBUFG_OUT_x => CLKIN_IBUFG_OUT,
		CLK0_OUT_x =>clk0,
		LOCKED_OUT_x => LOCKED_OUT
	);

	
end Behavioral;

