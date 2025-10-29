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

component decod8x256 is
	port(
		endereco	: in std_logic_vector(7 downto 0);
		saida		: out integer range 0 to 255;
	);
end component;

type mem is array (integer range 0 to 255) of std_logic_vector(7 downto 0);
signal mem_o 	: mem;
signal endInt	: integer range 0 to 255;

begin

inst_dec : decod8x256
port map(
	endereco => endereco;
	saida => endInt
);






end behavior;