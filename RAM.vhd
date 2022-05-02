
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.NUMERIC_STD.ALL;


entity RAM is
    Port ( clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  data_out : out  STD_LOGIC_VECTOR (7 downto 0);
           addr_wr : in  STD_LOGIC_VECTOR (9 downto 0);
           addr_rd : in  STD_LOGIC_VECTOR (9 downto 0);
           wr : in  STD_LOGIC);
end RAM;

architecture Behavioral of RAM is
type ram is array(0 to 1023) of std_logic_vector (7 downto 0);
signal ram_data: ram;

begin
	process (clk) 
	begin
		if (rising_edge(clk)) then 
			if (wr='0')then 
				ram_data(to_integer(unsigned(addr_wr))) <=data_in;
			end if;
		end if;
	end process;
		
	data_out <= ram_data(to_integer(unsigned(addr_rd)));
end Behavioral;

