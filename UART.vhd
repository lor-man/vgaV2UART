
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UART is	
	port(
			clk12: in std_logic;
			TX: out std_logic;
			RX: in std_logic:='0';
			habilitar_tx: in std_logic;
			ocupado_rx: out std_logic_vector(0 downto 0);
			datos_envio: in std_logic_vector(7 downto 0);
			datos_recibidos: out std_logic_vector(7 downto 0)
	);
	

end UART;

architecture Behavioral of UART is
--instanciacion rx
	COMPONENT uart_rx
	PORT(
		pinRX : IN std_logic;
		Clk : IN std_logic;          
		salida_datos : OUT std_logic_vector(7 downto 0);
		ocupado_bandera : OUT std_logic_vector(0 downto 0)
		);
	END COMPONENT;
--instanciacion tx
	COMPONENT uart_tx
	PORT(
		entrada_datos : IN std_logic_vector(7 downto 0);
		enable : IN std_logic;
		clk : IN std_logic;          
		pinTX : OUT std_logic
		);
	END COMPONENT;
--
--signal loopRXTX: std_logic;-- para prueba se creo un bucle del rx y tx  se debe de eliminar en la implementacion



begin
	Inst_uart_rx: uart_rx PORT MAP(
		pinRX => RX,--conectar a RX
		salida_datos =>datos_recibidos ,
		ocupado_bandera => ocupado_rx,
		Clk => clk12
	);
	Inst_uart_tx: uart_tx PORT MAP(
		pinTX => TX,--conectar a TX
		entrada_datos => datos_envio,
		enable => habilitar_TX,
		clk => clk12
	);
	
end Behavioral;

