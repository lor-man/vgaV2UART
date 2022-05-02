--- 640*480 60Hz
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;
--imagen de 64 filas x 48 columnas
entity VGA_sync is
generic(
	--Sincronismo horizontal
	Ha: INTEGER := 96; -- Hpulse
	Hb: INTEGER := 144;-- Hpulse + HBack_Porch  144
	Hc: INTEGER := 784; --Hpulse + HBack_Porch + Enable  784
	Hd: INTEGER := 800; --Hpulse + HBack_Porch + Enable + HFront_Porch =800 pixels, 1 linea
	--Sincronismo vertical 
	Va: INTEGER := 2; --Vpulse
	Vb: INTEGER := 31; --Vpulse + VBack_porch  35
	Vc: INTEGER := 511; --Vpulse + VBack_porch + Enable  515
	Vd: INTEGER := 521 --Vpulse + VBack_porch + Enable + VFront_Porch = 1 frame
	);
-- Area visible reducida para aumentar el tamao de una imagen de 16x16	
port(
	clk_in: IN STD_LOGIC;
	hsync,vsync: OUT STD_LOGIC:='0';--,clk_3_prueba 
	columna: out std_logic_vector(0 to 5) ; --std_logic_vector(1023 downto 0);
	fila: out std_logic_vector(0 to 5) ;--std_logic_vector(511 downto 0);
	enable: OUT STD_LOGIC:='0'
);
end VGA_sync;

architecture Behavioral of VGA_sync is
	signal ENABLE_H,ENABLE_V,enable_HV: std_logic:='0'; --se;ales de control
	signal clk_2,clk_3: std_logic:='0'; --seal de contador -- antes '1'
	signal v_count:integer range 0 to Vd; --contador vertical
	signal h_count:integer range 0 to Hd; --contador horizontal
	signal clk_2_cnt, clk_3_cnt:integer range 0 to 10:=0;--contador de periodo clk_2 y clk_3e
	signal fila_cnt:integer range 0 to 47:=0; --contador vertical imagen
	signal columna_cnt:integer range 0 to 64:=0; --contador horizontal imagen
	signal h_sync: std_logic:='0'; --seal de activacion para la sincronizacion vertical
	
	BEGIN
	--Sincronismo horizontal (columnas)
-------------------------------------------------------------------------------------------	
	PROCESS(clk_in)
	BEGIN	
		 IF rising_edge(clk_in) THEN			
			h_count<=h_count+1;
			if(h_count = Ha-1)then
				hsync<= '1'; --habilita el hsync
				h_sync<='1';
			elsif(h_count=Hd-1)then
				hsync<='0';  --deshabilita el hsync
				h_sync<='0';
				h_count<=0;  --reinicia el conteo
			elsif(h_count=Hb-1)then 
					ENABLE_H<='1'; -- habilita la parte visible
			elsif(h_count=Hc-1)then 
					ENABLE_H<='0';-- deshabilita la parte visible
		   END IF;
		 END IF;			
	END PROCESS;
-----------------------------------------------------------------------------------------	
	--sincronismo vertical (filas)
	PROCESS(h_sync)
	BEGIN	
		IF falling_edge(h_sync) THEN
			v_count<=v_count+1;
			IF(v_count=Va-1)then -- habilita el vsync
				vsync<='1';
			elsif(v_count=Vd-1)then
				vsync<='0';  --desabilita el vsync
				v_count<=0;  --reinicia el contador
			elsif(v_count=Vb-1)THEN 
				Enable_V<='1';      --habilita la parte visible
			elsif(v_count=Vc-1)then  
				Enable_V<='0'; -- deshabilita la parte visible
			end if;
		END IF;		
	END PROCESS;  
	enable_HV<=ENABLE_H AND ENABLE_V;
	enable<=enable_HV;
-----------------------------------------------------------------------
	process(clk_in)  -- contador para repetir pixel
	begin
		if(rising_edge(clk_in))then
			clk_2_cnt<=clk_2_cnt+1;  --aumenta el contador  -- 1-- cambiando orden de 0 a 1 y de 1 a 0
			if(clk_2_cnt = 4)then
				clk_2<='1';           --inicia una se;al de reloj
			elsif(clk_2_cnt=9)then
				clk_2<='0';           -- pone en alto la se;la de reloj
				clk_2_cnt<=0;         -- reinicia el contador
			end if;
		end if;
	end process;
-------------------------------------------------------------------------------	
	process(h_sync) -- contador para fila
	begin
		--clk_3_prueba<=clk_3;
		if(falling_edge(h_sync))then      -- 1-- cambiando orden de 0 a 1 y de 1 a 0
			clk_3_cnt<=clk_3_cnt+1;  --aumenta el contador
			if(clk_3_cnt = 4)then
				clk_3<='1';           --inicia una se;la de reloj
			elsif(clk_3_cnt=9)then
				clk_3<='0';           --pone en estado alto la se;al de reloj
				clk_3_cnt<=0;         -- resetea el contador
			end if;
		end if;
	end process;	
------------------------------------------------------------------------------------
	--contador columna  de 0 a 15 sirve para escoger la direccion de la memoria rom
	process(enable_HV,clk_2,columna_cnt,ENABLE_H)
	begin
	columna<=std_logic_vector(to_unsigned(columna_cnt,columna'length));
		if(rising_edge(clk_2))then
				if(ENABLE_H = '1')then
					columna_cnt<= columna_cnt + 1;  --aumenta la columna cada 10 pixeles contados con el clk_2
					if(columna_cnt=63)then         
						columna_cnt<=0;                  -- reinicia la columna al llegar a 15
					end if;
				else
					columna_cnt<=0;
			end if;
		end if;
	end process;
------------------------------------------------------------------------------------
	--contador fila de 0 a 15 debido a que la memoria alberga una imagen de 16 x 16 pixeles
	process(enable_HV,clk_3,fila_cnt,ENABLE_V)
	begin
	fila<= std_logic_vector(to_unsigned(fila_cnt,fila'length));
		if(rising_edge(clk_3))then
			if(ENABLE_V = '1')then
				fila_cnt<=fila_cnt + 1;      --aumenta la fila cada 25 filas 
				if(fila_cnt=47)then
					fila_cnt<=0;              -- reinicia la columna al llegar a 15
				end if;
			else
				fila_cnt<=0;
			end if;
		end if;
	end process;
end Behavioral;
