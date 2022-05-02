--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:34:56 05/01/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_vm/VGARAM/PE6/vga_prueba.vhd
-- Project Name:  PE6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vga
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
 
ENTITY vga_prueba IS
END vga_prueba;
 
ARCHITECTURE behavior OF vga_prueba IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vga
    PORT(
         clk : IN  std_logic;
         rgb_memoria : IN  std_logic_vector(7 downto 0);
         hsync_out : OUT  std_logic;
         vsync_out : OUT  std_logic;
         red_out : OUT  std_logic_vector(2 downto 0);
         green_sout : OUT  std_logic_vector(2 downto 0);
         blue_out : OUT  std_logic_vector(2 downto 1);
         addr_ram : OUT  std_logic_vector(0 to 11);
         CLKIN_IBUFG_OUT_x : OUT  std_logic;
         CLK0_OUT_x : OUT  std_logic;
         LOCKED_OUT_x : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rgb_memoria : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal hsync_out : std_logic;
   signal vsync_out : std_logic;
   signal red_out : std_logic_vector(2 downto 0);
   signal green_sout : std_logic_vector(2 downto 0);
   signal blue_out : std_logic_vector(2 downto 1);
   signal addr_ram : std_logic_vector(0 to 11);
   signal CLKIN_IBUFG_OUT_x : std_logic;
   signal CLK0_OUT_x : std_logic;
   signal LOCKED_OUT_x : std_logic;

   -- Clock period definitions
   constant clk_period : time := 83 ns;
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vga PORT MAP (
          clk => clk,
          rgb_memoria => rgb_memoria,
          hsync_out => hsync_out,
          vsync_out => vsync_out,
          red_out => red_out,
          green_sout => green_sout,
          blue_out => blue_out,
          addr_ram => addr_ram,
          CLKIN_IBUFG_OUT_x => CLKIN_IBUFG_OUT_x,
          CLK0_OUT_x => CLK0_OUT_x,
          LOCKED_OUT_x => LOCKED_OUT_x
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      rgb_memoria <= "00001111";
		wait for 100 ns;
		rgb_memoria <= "00000111";
		wait for 100 ns;
		rgb_memoria <= "11001111";
		wait for 100 ns;
		
   end process;

END;
