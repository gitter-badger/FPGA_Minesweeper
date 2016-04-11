library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_4bit is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end register_4bit;

architecture Behavioral of register_4bit is

signal out_tmp : std_logic_vector ( 3 downto 0);

begin

	process(clock,reset)

	begin

		if reset='1' then	-- Reset the data

			out_tmp<="0100";				
	
		elsif rising_edge(clock) then

			out_tmp<=out_tmp;
	
		end if;

	end process;

output<=out_tmp;

end Behavioral;

