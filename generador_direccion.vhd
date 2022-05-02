
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity generador_direccion is
	port(
		clkC : in std_logic_vector(0 downto 0 );
		addr_ram: out std_logic_vector (11 downto 0);
		escritura: out std_logic:='1'
	);
end generador_direccion;

architecture Behavioral of generador_direccion is
signal contador_mem: integer range 0 to 3072:= 0;
	signal clk_int: std_logic;
begin


clk_int <= '0' when clkC = "0" else
			  '1' when clkC = "1" else
			  '0';

 process (clk_int)
 begin 
	if(rising_edge(clk_int)) then 
		escritura<= '1';
		contador_mem<= contador_mem + 1;	
		if(contador_mem = 3071) then 
			contador_mem <= 0;		
			escritura <= '0';
		end if;
		
	end if;
		
 end process;
 
addr_ram <= std_logic_vector(to_unsigned(contador_mem,addr_ram'length));

end Behavioral;

