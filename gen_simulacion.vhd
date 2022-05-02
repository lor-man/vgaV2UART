--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:00:03 05/02/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_vm/VGARAM/PE6/gen_simulacion.vhd
-- Project Name:  PE6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Generador_magen
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
 
ENTITY gen_simulacion IS
END gen_simulacion;
 
ARCHITECTURE behavior OF gen_simulacion IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Generador_magen
    PORT(
         columna_in : IN  std_logic_vector(0 to 5);
         fila_in : IN  std_logic_vector(0 to 5);
         addr_out : OUT  std_logic_vector(0 to 11)
        );
    END COMPONENT;
    

   --Inputs
   signal columna_in : std_logic_vector(0 to 5) := (others => '0');
   signal fila_in : std_logic_vector(0 to 5) := (others => '0');

 	--Outputs
   signal addr_out : std_logic_vector(0 to 11);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Generador_magen PORT MAP (
          columna_in => columna_in,
          fila_in => fila_in,
          addr_out => addr_out
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

 columna_in<="101011";
 fila_in<="100101";
 wait for 50 ns;
 columna_in<="001011";
 fila_in<="100101";
 wait for 50 ns; 
   end process;

END;
