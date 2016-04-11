----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:42:31 03/10/2015 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_add_mem_vga is
    Port ( 	selection : in STD_LOGIC_VECTOR(1 downto 0);
		input1: in  STD_LOGIC_VECTOR (13 downto 0);
		input2 : in  STD_LOGIC_VECTOR (13 downto 0);
		input3 : in  STD_LOGIC_VECTOR(13 downto 0);

		output : out  STD_LOGIC_VECTOR (13 downto 0));
end mux_add_mem_vga ;

architecture Behavioral of mux_add_mem_vga is

begin
	process(selection,input1,input2,input3)
		begin 
		if selection = "00" then 	--first	register			
			output<= input1;

		elsif selection = "01" then	--2nd	register
			output<= input2; 

		else
			output<= input3; 

		end if;
	end process;

end Behavioral;

