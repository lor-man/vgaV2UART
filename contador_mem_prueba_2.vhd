--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:04:43 05/04/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_vm/VGARAM/PE6/contador_mem_prueba_2.vhd
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
 
ENTITY contador_mem_prueba_2 IS
END contador_mem_prueba_2;
 
ARCHITECTURE behavior OF contador_mem_prueba_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generador_direccion
    PORT(
         clk12MHz_G : IN  std_logic;
         clkC : IN  std_logic_vector(0 downto 0);
         addr_ram : OUT  std_logic_vector(11 downto 0);
         escritura : OUT  std_logic_vector(0 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk12MHz_G : std_logic := '0';
   signal clkC : std_logic_vector(0 downto 0) := (others => '0');

 	--Outputs
   signal addr_ram : std_logic_vector(11 downto 0);
   signal escritura : std_logic_vector(0 downto 0);

   -- Clock period definitions
   constant clk12MHz_G_period : time :=83 ns;
   --constant clkC_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generador_direccion PORT MAP (
          clk12MHz_G => clk12MHz_G,
          clkC => clkC,
          addr_ram => addr_ram,
          escritura => escritura
        );

   -- Clock process definitions
   clk12MHz_G_process :process
   begin
		clk12MHz_G <= '0';
		wait for clk12MHz_G_period/2;
		clk12MHz_G <= '1';
		wait for clk12MHz_G_period/2;
   end process;
 
   clkC_process :process
   begin
		clkC <= "0";
		wait for clk12MHz_G_period*10;
		clkC <= "1";
		wait for clk12MHz_G_period*104;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk12MHz_G_period*10;

      -- insert stimulus here 

   end process;

END;
