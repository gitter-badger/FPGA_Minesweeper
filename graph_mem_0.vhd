library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity graph_mem_0 is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	   en : in STD_LOGIC;
		line1 : out  STD_LOGIC_VECTOR (8 downto 0);
		line2 : out  STD_LOGIC_VECTOR (8 downto 0);
		line3 : out  STD_LOGIC_VECTOR (8 downto 0);
		line4 : out  STD_LOGIC_VECTOR (8 downto 0);
		line5 : out  STD_LOGIC_VECTOR (8 downto 0);
		line6 : out  STD_LOGIC_VECTOR (8 downto 0);
		line7 : out  STD_LOGIC_VECTOR (8 downto 0);
		line8 : out  STD_LOGIC_VECTOR (8 downto 0);
           	line9 : out  STD_LOGIC_VECTOR (7 downto 0));
end graph_mem_0;

architecture Behavioral of graph_mem_0 is

constant line1_cst: std_logic_vector ( 8 downto 0):= "111111111";
constant line2_cst: std_logic_vector ( 8 downto 0):= "111111111";
constant line3_cst: std_logic_vector ( 8 downto 0):= "111111111";
constant line4_cst: std_logic_vector ( 8 downto 0):= "111111111";
constant line5_cst: std_logic_vector ( 8 downto 0):= "111111111";
constant line6_cst: std_logic_vector ( 8 downto 0):= "111111111";
constant line7_cst: std_logic_vector ( 8 downto 0):= "111111111";
constant line8_cst: std_logic_vector ( 8 downto 0):= "111111111";
constant line9_cst: std_logic_vector ( 7 downto 0):= "11111111";

begin

	process(clock,reset)

	begin

		if reset='1' then	-- Reset the data

				line1<=(others => '0');
				line2<=(others => '0');
				line3<=(others => '0');
				line4<=(others => '0');
				line5<=(others => '0');
				line6<=(others => '0');
				line7<=(others => '0');
				line8<=(others => '0');
				line9<=(others => '0');			
	
		elsif rising_edge(clock) then

			if en='1' then 

				line1<=line1_cst;
				line2<=line2_cst;
				line3<=line3_cst;
				line4<=line4_cst;
				line5<=line5_cst;
				line6<=line6_cst;
				line7<=line7_cst;
				line8<=line8_cst;
				line9<=line9_cst;

			else

				line1<=(others => '0');
				line2<=(others => '0');
				line3<=(others => '0');
				line4<=(others => '0');
				line5<=(others => '0');
				line6<=(others => '0');
				line7<=(others => '0');
				line8<=(others => '0');
				line9<=(others => '0');	

			end if;
	
		end if;

	end process;

end Behavioral;

