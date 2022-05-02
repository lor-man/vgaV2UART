--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:30:03 05/02/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_vm/VGARAM/PE6/prueba_ram_ip.vhd
-- Project Name:  PE6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram
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
 
ENTITY prueba_ram_ip IS
END prueba_ram_ip;
 
ARCHITECTURE behavior OF prueba_ram_ip IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram
    PORT(
         clka : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         addra : IN  std_logic_vector(11 downto 0);
         dina : IN  std_logic_vector(7 downto 0);
         douta : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clka : std_logic := '0';
   signal wea : std_logic_vector(0 downto 0) := (others => '0');
   signal addra : std_logic_vector(11 downto 0) := (others => '0');
   signal dina : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal douta : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clka_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ram PORT MAP (
          clka => clka,
          wea => wea,
          addra => addra,
          dina => dina,
          douta => douta
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clka_period*10;
--		wea <="1";
--		dina <= "00000011";
--		addra <= "000000000000";
--		
--		wait for 50 ns;
--		addra <= "000000000001";
--		dina <= "00000111";
--		wait for 50 ns;
--		addra <= "000000000010";
--		dina <= "00001111";
--		wait for 50 ns;
--		addra <= "110000001000";
--		dina <= "00011111";
--		wait for 50 ns;
		wea<= "0";
		addra <=  "000000000000";
		wait for 50 ns;
		addra <=  "000000000001";
		wait for 50 ns;
		addra <=  "000000000010";
		wait for 50 ns;
	
		 
		
		
	
		
		

     
   end process;

END;
