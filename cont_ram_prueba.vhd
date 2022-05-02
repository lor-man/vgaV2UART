--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:29:31 05/02/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_vm/VGARAM/PE6/cont_ram_prueba.vhd
-- Project Name:  PE6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generador_direccion
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cont_ram_prueba IS
END cont_ram_prueba;
 
ARCHITECTURE behavior OF cont_ram_prueba IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generador_direccion
    PORT(
         clkC : IN  std_logic;
         addr_ram : OUT  std_logic_vector(11 downto 0);
         escritura : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clkC : std_logic := '0';

 	--Outputs
   signal addr_ram : std_logic_vector(11 downto 0);
   signal escritura : std_logic;

   -- Clock period definitions
   constant clkC_period : time := 80 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generador_direccion PORT MAP (
          clkC => clkC,
          addr_ram => addr_ram,
          escritura => escritura
        );

   -- Clock process definitions
   clkC_process :process
   begin
		clkC <= '0';
		wait for clkC_period/2;
		clkC <= '1';
		wait for clkC_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clkC_period*10;

       

      wait;
   end process;

END;
