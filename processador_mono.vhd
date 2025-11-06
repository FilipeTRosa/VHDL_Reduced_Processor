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
signal inst			: std_logic_vector (17 downto 0);
signal opcode		: std_logic_vector (3 downto 0);
signal reg0			: std_logic_vector (3 downto 0);
signal reg1			: std_logic_vector (3 downto 0);
signal regDest		: std_logic_vector (3 downto 0);
signal imm			: std_logic_vector (7 downto 0);

--sinal imm somado com reg1 e regdest
signal valor		: std_logic_vector (15 downto 0);

--memoria de instruções
type mem is array (integer range 0 to 255) of std_logic_vector(19 downto 0);
signal memInst		: mem
signal endMemRam	: integer range 0 to 255; -- para guardar o end do SW e LW
--sinais de controle
signal pc 			: integer range 0 to 255;
signal enableReg	: std_logic;

begin
	--separando a operação TENTANDO COM 20 bits	
	opcode <= inst(19 downto 16);
	--tentando com when
														-- ADD : SUB : MULT				   //   		-- BEQ e BNE			// 			 -- LDI : ADDI : SUBI : MULTI		
	reg0 <= inst(15 downto 12) when (opcode = "0000" or opcode = "0001" or opcode = "0010" or opcode = "0100" or opcode = "0101" or opcode = "1000" or opcode = "1001" or opcode = "1010" or opcode = "1011")
		else
			(others => '0');
	-- 												-- ADD : SUB : MULT					  //    		-- BEQ : BNE
	reg1 <= inst(11 downto 8) when (opcode = "0000" or opcode = "0001" or opcode = "0010" or opcode = "0100" or opcode = "0101") 
		else
			(others => '0');
	--	
	regDest <= inst(3 downto 0) when (opcode = "0000" or opcode = "0001" or opcode = "0010")  -- ADD : SUB : MULT
		else
				inst(15 downto 12) when (opcode = "0110" or opcode = "0111" ) --LW e SW
		else
			(others => '0');
	-- 									JMP			//  		-- BEQ : BNE			//				 -- LDI : ADDI : SUBI : MULTI
	imm <= inst(7 downto 0) when (opcode = "0011" or opcode = "0100" or opcode = "0101" or opcode = "1000" or opcode = "1001" or opcode = "1010" or opcode = "1011")
		else
			(others => '0');
	--
	endMemRam <= inst(7 downto 0) when (opcode = "0110" or opcode = "0111")   --LW e SW
		else
			(others => '0');
	--valor
	valor <= reg0 + regDest + imm;
	



process(clock, reset)
	begin

end process;
	end behavior;