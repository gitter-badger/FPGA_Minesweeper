----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:03 03/25/2016 
-- Design Name: 
-- Module Name:    vga_grille - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_grille is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  select_case : in STD_LOGIC_VECTOR (6 downto 0);
           ADDR : out  STD_LOGIC_VECTOR (13 downto 0);
           data_in : out  STD_LOGIC_VECTOR (2 downto 0);
           data_write : out  STD_LOGIC);
			  
end vga_grille;

architecture Behavioral of vga_grille is

signal sig_ADDR : integer range 0 to 15999 := 0;
signal cnt_enable : std_logic;

begin

process(clk, rst)	

	begin
		if (rst = '1') then				-- Init
			data_in <= "000";
			data_write <= '0';
			sig_ADDR <= 0;
			
		elsif rising_edge(clk) then
		if cnt_enable = '1' then
			if sig_ADDR >= 159999 then -- Compteur parcourant tous les pixels
				sig_ADDR <= 0;
			else
				sig_ADDR <= sig_ADDR + 1;
				
			end if;
		end if;
		end if;
	end process;
		
-----------------Trace la grille------------

process(clk,rst)
begin
		if (rst = '1') then				-- Init
			data_in <= "000";
			data_write <= '0';
			sig_ADDR <= 0;
			cnt_enable <= '0';
			
		elsif rising_edge(clk) then
			
			if ( (sig_ADDR >= 1470 AND sig_ADDR <= 1570) OR (sig_ADDR >= 3070 AND sig_ADDR <= 3170) OR (sig_ADDR >= 4670 AND sig_ADDR <= 4770) OR (sig_ADDR >= 6270 AND sig_ADDR <= 6370)OR(sig_ADDR >= 7870 AND sig_ADDR <=7970)OR (sig_ADDR >= 9470 AND sig_ADDR <= 9570) OR (sig_ADDR >= 11070 AND sig_ADDR <= 11170) OR (sig_ADDR >= 12670 AND sig_ADDR <= 12770) OR  (sig_ADDR >= 14270 AND sig_ADDR <= 14370)  ) then
				ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));-- trace les lignes
				data_in <= "001"; -- bleu
				data_write <= '1';
				cnt_enable <= '1';
				
			elsif( (sig_ADDR >= 30 AND sig_ADDR <= 15869) AND (((sig_ADDR MOD 160) = 30) OR ((sig_ADDR MOD 160) = 40) OR ((sig_ADDR MOD 160) = 50) OR ((sig_ADDR MOD 160) = 60) OR ((sig_ADDR MOD 160) = 70) OR ((sig_ADDR MOD 160) = 80) OR ((sig_ADDR MOD 160) = 90) OR ((sig_ADDR MOD 160) = 100) OR ((sig_ADDR MOD 160) = 110) OR ((sig_ADDR MOD 160) = 120) OR ((sig_ADDR MOD 160) = 130))) then 
				ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));--trace les colonnes
				data_in <= "001"; -- bleu
				data_write <= '1';
				cnt_enable <= '1';
			
			end if;
			
----------------------------------------------

--		
----------Trace la case en surbrillance----------
else
				case select_case is -- Gestion position barre de selection
					when "0000000" => -- case 0
						if (sig_ADDR >= 1311 AND sig_ADDR <= 1319) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; --jaune
							data_write <= '1';
							cnt_enable <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000";--noir
							data_write <= '1';
							cnt_enable <= '1';
						end if;
					when "0000001" => -- case 1
						if (sig_ADDR >= 1321 AND sig_ADDR <= 1329) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; --jaune
							data_write <= '1';
							cnt_enable <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; --noir
							data_write <= '1';
							cnt_enable <= '1';
						end if;
					when "0000010" => -- case 2
						if (sig_ADDR >= 1331 AND sig_ADDR <= 1339) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
							cnt_enable <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; -- noir
							data_write <= '1';
							cnt_enable <= '1';
						end if;
					when "0000011" => -- case 3
						if (sig_ADDR >= 1341 AND sig_ADDR <= 1349) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; -- noir
							data_write <= '1';
						end if;
					when "0000100" => -- case 4
						if (sig_ADDR >= 1351 AND sig_ADDR <= 1359) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; -- noir
							data_write <= '1';
						end if;
					when "0000101" => -- case 5
						if (sig_ADDR >= 1361 AND sig_ADDR <= 1369) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; -- noir
							data_write <= '1';
						end if;
					when "0000110" => -- case 6
						if (sig_ADDR >= 1371 AND sig_ADDR <= 1379) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; -- noir
							data_write <= '1';
						end if;
					when "0000111" => -- case 7
						if (sig_ADDR >= 1381 AND sig_ADDR <= 1389) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; -- noir
							data_write <= '1';
						end if;
					when "0001000" => -- case 8
						if (sig_ADDR >= 1391 AND sig_ADDR <= 1399) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; --noir
							data_write <= '1';
							end if;
							
					when "0001001" => -- case 9
						if (sig_ADDR >= 1401 AND sig_ADDR <= 1409) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; --noir
							data_write <= '1';
							end if;
							
					when "0001010" => -- case 10
						if (sig_ADDR >= 2911 AND sig_ADDR <= 2919) then
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "110"; -- jaune
							data_write <= '1';
						else
							ADDR <= std_logic_vector(to_unsigned(sig_ADDR,14));
							data_in <= "000"; --noir
							data_write <= '1';
						end if;
					when others => data_write <= '0';
				end case;



-----------------------------------------------
			
		end if;
		
	
	
end process;

		
end Behavioral;

