library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registers is 
	port (
		ck: in std_logic;
		reg_write: in std_logic;
		read_reg_1, read_reg_2, write_reg: in std_logic_vector(4 downto 0);
		write_data: in std_logic_vector(31 downto 0);
		read_data_1, read_data_2: out std_logic_vector(31 downto 0)
	);
end registers;

architecture beh of registers is

    -- 128 byte register memory (32 rows * 4 bytes/row)
    type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
    signal reg_mem: mem_array := (
        "00000000000000000000000000000000", -- initialize register memory
        "00000000000000000000000000000000", -- mem 1
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000001",
        "00000000000000000000000000000001", 
        "00000000000000000000000000000000", -- mem 10 
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000", -- mem 20
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- mem 30
        "00000000000000000000000000000000"
    );

	begin

	process(ck)
		begin
		if ck='1' and ck'event then
			read_data_1 <= reg_mem(to_integer(unsigned(read_reg_1)));
			read_data_2 <= reg_mem(to_integer(unsigned(read_reg_2)));
		elsif ck='0' and ck'event and reg_write='1' then
			reg_mem(to_integer(unsigned(write_reg))) <= write_data;
		end if;
	end process;

end beh;