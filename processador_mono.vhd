library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity processador_mono is
	port(
		clock		: in std_logic;
		reset		: in std_logic;
		
	);
end entity;
architecture behavior of processador_mono is
--sinais da instrução                        
signal inst			: std_logic_vector (19 downto 0);
signal opcode		: std_logic_vector (3 downto 0);
signal reg1			: std_logic_vector (3 downto 0);
signal reg0			: std_logic_vector (3 downto 0);
signal regDest		: std_logic_vector (3 downto 0);
signal imm			: std_logic_vector (7 downto 0);

--sinal imm somado com reg1 e regdest
signal valor		: std_logic_vector (15 downto 0);

--memoria de instruções
type mem is array (integer range 0 to 255) of std_logic_vector(19 downto 0);
signal memInst		: mem

--sinais de controle
signal pc 			: integer range 0 to 255;
signal enableReg	: std_logic;

	begin
	--valor
	valor <= reg0 + regDest + imm;
	



process(clock, reset)
	begin

end process;
	end behavior;