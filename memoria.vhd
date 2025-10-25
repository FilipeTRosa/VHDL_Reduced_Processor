library ieee;                 
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memoria is 
	port(
		endereco	: in std_logic_vector (7 downto 0);
		saida		: out std_logic_vector (7 downto 0);
		op_code		: in std_logic_vector (3 downto 0);
			
	
	);
end entity;
architecture behavior of memoria is 
begin






end behavior;