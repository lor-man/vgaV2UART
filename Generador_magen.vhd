----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:45:53 10/25/2020 
-- Design Name: 
-- Module Name:    Generador_magen - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use ieee.std_logic_unsigned.all;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Generador_magen is
generic(
sum: std_logic_vector:="0001";
mult: std_logic_vector:="1111"
);
port(

	columna_in: in std_logic_vector(0 to 5);
	fila_in: in std_logic_vector(0 to 5) ;
	addr_out: out std_logic_vector(0 to 11) 
);
end Generador_magen;
architecture Behavioral of Generador_magen is
	signal fila,columna: integer range 0 to 64:=0;
	signal addr_res:integer range 0 to 3024:=0;
	
	begin
		fila<=to_integer(unsigned(fila_in));
		columna<=to_integer(unsigned(columna_in));
		addr_res<=fila*64 +columna;
		addr_out<=std_logic_vector(to_unsigned(addr_res,addr_out'length));
		--addr_out<= ((fila_in*mult)+fila_in)+columna_in;	-- para convertir de 2 dimensiones a 1 se usa la siguiente ecuacion
end Behavioral;                                       -- addr=fila*Col_max+columna


