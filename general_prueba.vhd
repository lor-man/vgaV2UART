--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:50:39 05/02/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_vm/VGARAM/PE6/general_prueba.vhd
-- Project Name:  PE6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: General
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
 
ENTITY general_prueba IS
END general_prueba;
 
ARCHITECTURE behavior OF general_prueba IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT General
    PORT(
         clk_g : IN  std_logic;
         hsync : OUT  std_logic;
         vsync : OUT  std_logic;
         red : OUT  std_logic_vector(2 downto 0);
         green : OUT  std_logic_vector(2 downto 0);
         blue : OUT  std_logic_vector(2 downto 1);
         CLKIN_IBUFG_OUT : OUT  std_logic;
         LOCKED_OUT : OUT  std_logic;
         en_tx : IN  std_logic;
         datos_enviar : IN  std_logic_vector(7 downto 0);
         RX_pin : IN  std_logic;
         TX_pin : OUT  std_logic;
         ocupado_ram : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_g : std_logic := '0';
   signal en_tx : std_logic := '0';
   signal datos_enviar : std_logic_vector(7 downto 0) := (others => '0');
   signal RX_pin : std_logic := '0';

 	--Outputs
   signal hsync : std_logic;
   signal vsync : std_logic;
   signal red : std_logic_vector(2 downto 0);
   signal green : std_logic_vector(2 downto 0);
   signal blue : std_logic_vector(2 downto 1);
   signal CLKIN_IBUFG_OUT : std_logic;
   signal LOCKED_OUT : std_logic;
   signal TX_pin : std_logic;
   signal ocupado_ram : std_logic;

   -- Clock period definitions
   constant clk_g_period : time := 83 ns;
  -- constant CLKIN_IBUFG_OUT_period : time := 11 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: General PORT MAP (
          clk_g => clk_g,
          hsync => hsync,
          vsync => vsync,
          red => red,
          green => green,
          blue => blue,
          CLKIN_IBUFG_OUT => CLKIN_IBUFG_OUT,
          LOCKED_OUT => LOCKED_OUT,
          en_tx => en_tx,
          datos_enviar => datos_enviar,
          RX_pin => RX_pin,
          TX_pin => TX_pin,
          ocupado_ram => ocupado_ram
        );

   -- Clock process definitions
   clk_g_process :process
   begin
		clk_g <= '0';
		wait for clk_g_period/2;
		clk_g <= '1';
		wait for clk_g_period/2;
   end process;
 
--   CLKIN_IBUFG_OUT_process :process
--   begin
--		CLKIN_IBUFG_OUT <= '0';
--		wait for CLKIN_IBUFG_OUT_period/2;
--		CLKIN_IBUFG_OUT <= '1';
--		wait for CLKIN_IBUFG_OUT_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_g_period*10;

      en_tx<='1';

   end process;

END;
