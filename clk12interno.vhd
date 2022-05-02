----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:16:28 05/02/2022 
-- Design Name: 
-- Module Name:    clk12interno - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk12interno is
    Port ( clkInt : in  STD_LOGIC;
           clkoutint : out  STD_LOGIC);
end clk12interno;

architecture Behavioral of clk12interno is

begin
clkoutint <= '1' when clkInt = '1' else
					'0' when clkInt= '0' else
					'0';

end Behavioral;

