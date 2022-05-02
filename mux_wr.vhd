
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity mux_wr is
    Port ( w_r : in  STD_LOGIC_VECTOR (0 downto 0);
           addr_w : in  STD_LOGIC_VECTOR (11 downto 0);
           addr_r : in  STD_LOGIC_VECTOR (11 downto 0);
           addr_ram_wr : out  STD_LOGIC_VECTOR (11 downto 0));
end mux_wr;

architecture Behavioral of mux_wr is

begin
	addr_ram_wr<= addr_w when w_r = "1" else
						addr_r when w_r= "0" else
						"000000000000";


end Behavioral;

