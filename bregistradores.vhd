library ieee;                 
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity bregistradores is 
	port(
		brReg 			:	in std_logic_vector (3 downto 0);
		brData			:	in std_logic_vector (15 downto 0);
		brEnable		:	in std_logic;
		clock			:	in std_logic;
		brOut			:	out std_logic_vector (15 downto 0)
	
);
end entity;

architecture behavior of bregistradores is

type br is array (integer range 0 to 15) of std_logic_vector(15 downto 0);
signal br_o 	: br;
signal endBr 	: integer range 0 to 15;

begin

	endBr <= conv_integer(brReg);
	
	brOut <= br_o(endBr) when (brEnable = '0')
		else 
			(others => '0');

process(clock, brEnable)
begin
if clock = '1' and clock'event then
	if brEnable = '1' then
		 br_o(endBr) <= brData;
	end if;
end if;
end process;
end behavior;