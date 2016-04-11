----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:07 03/25/2016 
-- Design Name: 
-- Module Name:    top_grille - Behavioral 
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

entity top_grille is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  select_case_in : in STD_LOGIC_VECTOR (6 downto 0);
           vga_hs : out  STD_LOGIC;
           vga_vs : out  STD_LOGIC;
			  select_case_out : in STD_LOGIC_VECTOR (6 downto 0);
           vga_red : out  STD_LOGIC_VECTOR (3 downto 0);
           vga_green : out  STD_LOGIC_VECTOR (3 downto 0);
           vga_blue : out  STD_LOGIC_VECTOR (3 downto 0);
           data_out : out  STD_LOGIC_VECTOR (2 downto 0));
			  
end top_grille;

architecture Behavioral of top_grille is


component VGA_bitmap_160x100 is

  generic(bit_per_pixel : integer range 1 to 12 := 3;    -- number of bits per pixel
          grayscale     : boolean := false);           -- should data be displayed in grayscale
  port(clk          : in  std_logic;
       reset        : in  std_logic;
       VGA_hs       : out std_logic;   -- horisontal vga syncr.
       VGA_vs       : out std_logic;   -- vertical vga syncr.
       VGA_red      : out std_logic_vector(3 downto 0);   -- red output
       VGA_green    : out std_logic_vector(3 downto 0);   -- green output
       VGA_blue     : out std_logic_vector(3 downto 0);   -- blue output

       ADDR         : in  std_logic_vector(13 downto 0);
       data_in      : in  std_logic_vector(bit_per_pixel - 1 downto 0);
       data_write   : in  std_logic;
       data_out     : out std_logic_vector(bit_per_pixel - 1 downto 0));
		 
end component VGA_bitmap_160x100;



component vga_grille is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  select_case : in STD_LOGIC_VECTOR (6 downto 0);
           ADDR : out  STD_LOGIC_VECTOR (13 downto 0);
           data_in : out  STD_LOGIC_VECTOR (2 downto 0);
           data_write : out  STD_LOGIC);
end component vga_grille;


signal sig_data_in : STD_LOGIC_VECTOR (2 downto 0);
signal sig_data_write : STD_LOGIC;
signal sig_ADDR : STD_LOGIC_VECTOR (13 downto 0);



begin



gestion_affichage : VGA_bitmap_160x100 port map (  clk 			=> clk,       
																	reset  		=> rst,    
																	VGA_hs   	=> vga_hs,  
																	VGA_vs   	=> vga_vs,  
																	VGA_red  	=> vga_red,  
																	VGA_green	=> vga_green,  
																	VGA_blue 	=> vga_blue,  
																	
																	ADDR       	=> sig_ADDR, 
																	data_in    	=> sig_data_in,
																	data_write 	=> sig_data_write,
																	data_out   	=> data_out);
														

affichage_grille : vga_grille port map (  			clk 			=> clk,       
																	rst  		   => rst,   
																	select_case => select_case_out,
																	ADDR       	=> sig_ADDR, 
																	data_in    	=> sig_data_in,
																	data_write 	=> sig_data_write);
																														
														
														




end Behavioral;

