library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is

 generic(
				HZ_reloj: integer:= 12000000; --Frecuencia del reloj a utilizar.
				Bits_data: integer:= 8;       -- N?mero de bits a enviar.
				BaudRate: integer:= 115200;     -- Bits por segundo. 
				tiempo_bit: integer:= 104		-- Tiempo de espera por bit, reloj/baudrate
	 );
    Port (  pinTX: out  STD_LOGIC; --salida de datos
			entrada_datos: in STD_LOGIC_VECTOR (Bits_data-1 downto 0);--datos a enviar
			enable: in STD_LOGIC;
            clk : in  STD_LOGIC);

end uart_tx;

architecture Behavioral of uart_tx is

	type uart_tx is (idle,data,start,stop);
	signal estado: uart_tx:= idle; 
   signal conteo: integer range 0 to tiempo_bit-1:= 0;
	signal puente: std_logic_vector (Bits_data-1 downto 0):= (others => '0');
	signal indice: integer range 0 to Bits_data-1:= 0;

begin
reloj: process(clk)
    begin
        if (rising_edge(clk)) then
            case estado is
					when idle =>
						pinTX <= '1'; 
						conteo <= 0;
						indice <= 0;
						puente <= (others => '0');
						if (enable = '0') then
							puente <= entrada_datos;
							estado <= start;
						else
							estado <= idle;
						end if;
						
					when start =>
						pinTX <= '0'; 
						if (conteo <  tiempo_bit-1) then
							conteo <= conteo + 1;
							estado <= start;
						else
							conteo <= 0;
							estado <= data;
						end if;
					when data =>
						pinTX <= puente(indice);
						if (conteo < tiempo_bit-1) then
							conteo <= conteo + 1;
							estado <= data;
						else
							conteo <= 0;
							if (indice<Bits_data-1) then 							
								indice <= indice + 1;
								estado <= data;	
							else		
								indice <= 0;
								estado <= stop;
							end if;
						end if;
					when stop =>
						pinTX <= '1';
						if (conteo < tiempo_bit-1) then
							conteo <= conteo + 1;
							estado <= stop;
						else
							conteo <= 0;
							estado <= idle;							
						end if;
					when others =>
						estado <= idle;
		    end case;
        end if;
    end process reloj;

end Behavioral;
