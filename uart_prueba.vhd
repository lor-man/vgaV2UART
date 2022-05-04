--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:36:31 05/01/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_vm/VGARAM/PE6/uart_prueba.vhd
-- Project Name:  PE6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UART
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
 
ENTITY uart_prueba IS
END uart_prueba;
 
ARCHITECTURE behavior OF uart_prueba IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UART
    PORT(
         clk12 : IN  std_logic;
         habilitar_tx : IN  std_logic;
         ocupado_rx : OUT  std_logic_vector (0 downto 0);
         datos_envio : IN  std_logic_vector(7 downto 0);
         datos_recibidos : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk12 : std_logic := '0';
   signal habilitar_tx : std_logic := '1';
   signal datos_envio : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ocupado_rx : std_logic_vector (0 downto 0 );
   signal datos_recibidos : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk12_period : time := 83 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UART PORT MAP (
          clk12 => clk12,
          habilitar_tx => habilitar_tx,
          ocupado_rx => ocupado_rx,
          datos_envio => datos_envio,
          datos_recibidos => datos_recibidos
        );

   -- Clock process definitions
   clk12_process :process
   begin
		clk12 <= '0';
		wait for clk12_period/2;
		clk12 <= '1';
		wait for clk12_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk12_period*10;

     datos_envio <= "10101010";
	  wait for 5 ns;
	  habilitar_tx <= '0';
	  wait for clk12_period*3;
	  habilitar_tx <= '1';
	  wait for 100 us;
	  datos_envio <= "00001111";
	  wait for 5 ns;
	  habilitar_tx <= '0';
	  wait for clk12_period*3;
	  habilitar_tx <= '1';
	  wait for 100 us;
	  

 
   end process;

END;
