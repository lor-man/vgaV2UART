
-- VHDL Instantiation Created from source file generador_direccion.vhd -- 01:24:44 05/04/2022
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT generador_direccion
	PORT(
		clk12MHz_G : IN std_logic;
		clkC : IN std_logic_vector(0 to 0);          
		addr_ram : OUT std_logic_vector(11 downto 0);
		escritura : OUT std_logic
		);
	END COMPONENT;

	Inst_generador_direccion: generador_direccion PORT MAP(
		clk12MHz_G => ,
		clkC => ,
		addr_ram => ,
		escritura => 
	);


