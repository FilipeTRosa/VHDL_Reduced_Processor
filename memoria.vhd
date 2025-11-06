library ieee;                 
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memoria is 
	port(
		endereco	: in std_logic_vector (15 downto 0);
		saida		: out std_logic_vector (7 downto 0);
		opcode		: in std_logic_vector (3 downto 0);
		valor 		: in std_logic_vector (15 downto 0);
	);
end entity;
architecture behavior of memoria is 

--component decod8x256 is
--	port(
--		endereco	: in std_logic_vector(7 downto 0);
--		saida		: out integer range 0 to 255;
--	);
--end component;

type mem is array (integer range 0 to 255) of std_logic_vector(15 downto 0);
signal mem_ram 	: mem;
signal endInt	: integer range 0 to 255;

begin

inst_dec : decod8x256
port map(
	endereco => endereco;
	saida => endInt
);
-- convertendo o endereço de entrada em binário para endereçar a memória
endInt <= conv_integer(endereco);

saida <= mem_ran(endInt);

process(clock)
begin
-- ideia de acesso a memoria leitura
if opcode = "0111" then
	 mem_ram(endInt) <= valor;
end if;
-- ideia de acesso a memoria escrita
-- if op_code yyy then







end process;
end behavior;