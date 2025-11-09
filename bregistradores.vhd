library ieee;                 
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity bregistradores is 
	port(
		registrador 	:	in std_logic_vector (3 downto 0);
		dado			:	in std_logic_vector (15 downto 0);
		enable			:	in std_logic;
		clock			:	in std_logic;
		saida			:	out std_logic_vector (15 downto 0);
	
);
end entity;

architecture behavior of bregistradores is

type br is array (integer range 0 to 15) of std_logic_vector(15 downto 0);
signal br_o 	: br;
signal endBr 	: std_logic;

begin

	endBr <= convert_integer(registador);
	
	saida <= br_o(endBr) when (enable = '0')
		else 
			(others => '0');

process(clock)

if enable = "1" then
	 br_o(endBr) <= dado;
end if;

end process;
end behavior;