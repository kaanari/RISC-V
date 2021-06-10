library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Memory is

	generic(
				DATA_WIDTH 		: integer := 16;
				ADDRESS_WIDTH 	: integer := 16
			 );
	
	port(
			data_in			: in std_logic_vector((DATA_WIDTH-1) downto 0);
			Mem_write		: in std_logic;
			CLK				: in std_logic;
			address			: in std_logic_vector((ADDRESS_WIDTH-1) downto 0);
			data_out		: out std_logic_vector((DATA_WIDTH-1) downto 0)
		 );


end Memory;

architecture Behavioral of Memory is

	-- Memory Definition
	type mem_type is array(0 to (2**ADDRESS_WIDTH-1)) of std_logic_vector((DATA_WIDTH-1) downto 0);
	signal RAM : mem_type := ( 0 	=> x"F007", 1 	=> x"F105",
										2 	=> x"F20B", 3 	=> x"1310",
										4 	=> x"F50D", 5 	=> x"D402",
										6 	=> x"0000", 7 	=> x"6643",
										8 	=> x"0462", 9 	=> x"A054",
										10 => x"B003", 11 => x"0000",
										12 => x"0000", 13 => x"5536",
										14 => x"4250", 15 => x"9820",
										others => (others => '0'));
										
	signal read_address_temp : std_logic_vector((DATA_WIDTH-1) downto 0);

begin

	process(CLK)
	begin
	
		if rising_edge(CLK) then
		
			if Mem_write = '1' then
				RAM(to_integer(unsigned(address))) <= data_in;
			end if;
			

			data_out <= RAM(to_integer(unsigned(address)));
			
		end if;

	end process;
	
	
			

end Behavioral;