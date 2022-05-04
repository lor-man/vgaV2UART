
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity generador_direccion is
	generic(
	tiempo_bit: integer:= 104;		-- Tiempo de espera por bit, reloj/baudrate
				tiempo_mbit: integer:= 52
	);
	
	port(
		clk12MHz_G: in std_logic;
		clkC : in std_logic_vector(0 downto 0 );
		addr_ram: out std_logic_vector (11 downto 0);
		escritura: out std_logic_vector(0 downto 0):="0"
	);
end generador_direccion;

architecture Behavioral of generador_direccion is
signal cntbit:integer range 0 to tiempo_bit:=0;
signal contador_mem,contador_mem2: integer range 0 to 3073:= 0;
	signal clk_int: std_logic;
begin


clk_int <= '0' when clkC = "0" else
			  '1' when clkC = "1" else
			  '0';

 process (clk_int)
 begin 
	if(rising_edge(clk_int)) then 
		--escritura<= '1';
		--contador_mem2<= contador_mem2 + 1;
		--contador_mem<= contador_mem2-1;
		contador_mem<=contador_mem+1;
		addr_ram <= std_logic_vector(to_unsigned(contador_mem,addr_ram'length));
		if(contador_mem = 3071) then 
			contador_mem <= 0;
			--contador_mem2 <= 0;
			--escritura <= '0';
		end if;
		--addr_ram <= std_logic_vector(to_unsigned(contador_mem,addr_ram'length));
	end if;
		
 end process;
 
 process (clk_int,clk12MHz_G)
 begin
	if(rising_edge(clk12MHz_G)) then
		if(clk_int='1') then
			cntbit<=cntbit+1;
			if(cntbit< tiempo_mbit-1)then
				escritura <="0";
			
			elsif(cntbit<tiempo_bit-20)then
				escritura <="1";	
			else 
				escritura <="0";
			end if;
			
		else 
			cntbit<= 0;
			escritura <="0" ;
		end if;
	end if;	
 end process;


end Behavioral;

