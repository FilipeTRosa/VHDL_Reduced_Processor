library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity processador_mono is
	port(
		clock		: in std_logic;
		reset		: in std_logic
		
	);
end entity;
architecture behavior of processador_mono is
--sinais da instrução                        
signal inst			: std_logic_vector(19 downto 0);
signal opcode		: std_logic_vector(3 downto 0);
signal reg0			: std_logic_vector(3 downto 0);
signal reg1			: std_logic_vector(3 downto 0);
signal regDest		: std_logic_vector(3 downto 0);
signal imm			: std_logic_vector(7 downto 0);

--sinal imm somado com reg1 e regdest
--signal valor		: std_logic_vector (15 downto 0);

--memoria de instruções
type mem is array (integer range 0 to 255) of std_logic_vector(19 downto 0);
signal memInst		: mem;

--sinais de controle
signal pc 			: integer range 0 to 255;
signal enableReg	: std_logic;

--sinais ULA
signal ulaOut 		: std_logic_vector(15 downto 0);
signal ulaIn0 		: std_logic_vector(7 downto 0);
signal ulaIn1 		: std_logic_vector(7 downto 0);
signal ulaOp  		: std_logic_vector(1 downto 0);
signal ulaComp  	: std_logic;

component ula is
    port(
        ulaOp   	: in std_logic_vector(1 downto 0);
        ulaIn_0 	: in std_logic_vector(7 downto 0);
        ulaIn_1 	: in std_logic_vector(7 downto 0);
        ulaOut  	: out std_logic_vector(15 downto 0);
        ulaComp 	: out std_logic
    );  
end component;

--memoria de dados
signal memDataEnd	: std_logic_vector(7 downto 0); -- para guardar o end do SW e LW
signal memDatain 	: std_logic_vector(15 downto 0);
signal memDataOut	: std_logic_vector(15 downto 0);

component memoria is 
	port(
		memDataEnd	: in std_logic_vector(7 downto 0);
		memDataOut	: out std_logic_vector(15 downto 0);
		opcode		: in std_logic_vector(3 downto 0);
		memDataIn 	: in std_logic_vector(15 downto 0);
		clock		: in std_logic
	);
end component;

-- BANCO DE REGISTRADORES --

signal brReg0 		: std_logic_vector (3 downto 0);
signal brReg1 		: std_logic_vector (3 downto 0);
signal brRegDest	: std_logic_vector (3 downto 0);
signal brData		: std_logic_vector (15 downto 0);
signal brEnable		: std_logic;
signal brOut		: std_logic_vector (15 downto 0);
signal brOut1		: std_logic_vector (15 downto 0);

component bregistradores is 
	port(
		brReg0 		:	in std_logic_vector (3 downto 0);
		brReg1 		:	in std_logic_vector (3 downto 0);
		brRegDest	:	in std_logic_vector (3 downto 0);
		brData		:	in std_logic_vector (15 downto 0);
		brEnable	:	in std_logic;
		clock		:	in std_logic;
		brOut0		:	out std_logic_vector (15 downto 0);
		brOut1		:	out std_logic_vector (15 downto 0)
		
);
end component;



begin

	-- ### PORTMAP ULA ### --
	ulaProcess : ula
	port map(
        -- Porta da ULA => processador
        ulaOp   => ulaOp,  
        ulaIn_0 => ulaIn0,   
        ulaIn_1 => ulaIn1,   
        ulaOut  => ulaOut, 
        ulaComp => ulaComp         
    );
    
    -- ### PORTMAP MEMORIA DE DADOS ### --
    memoriaProcess : memoria
    PORT MAP(
        -- Porta da Memoria => Sinal do Processador
        memDataEnd  => memDataEnd,
        memDataOut  => memDataOut,
        opcode   	=> opcode,
        memDataIn   => memDataIn,
        clock    	=> clock
    );

    -- ### PORTMAP BANCO DE REGISTRADORES ### --
	bregistradoresProcess : bregistradores
	port map(
        -- Porta do BR => processador
        brReg0    => brReg0,
        brReg1    => brReg1,
        brRegDest => brRegDest,
        brData    => brData,
        brEnable  => brEnable,
        clock     => clock, 
        brOut0    => brOut0;
        brOut1    => brOut1         
    );

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
				inst(15 downto 12) when (opcode = "0110" or opcode = "1000" or opcode = "1001" or opcode = "1010") -- LW e ADDI : SUBI : MULTI
		else
			(others => '0');
	-- 									JMP			//  		-- BEQ : BNE			//				 -- LDI : ADDI : SUBI : MULTI								// 			--LW e SW
	imm <= inst(7 downto 0) when (opcode = "0011" or opcode = "0100" or opcode = "0101" or opcode = "1011" or opcode = "1000" or opcode = "1001" or opcode = "1010" or opcode = "0110" or opcode = "0111")
		else
			(others => '0');
	--
	--memDataEnd <= inst(7 downto 0) when (opcode = "0110" or opcode = "0111")   --LW e SW
	--	else
	--		(others => '0');
			
	--ENABLE ESCRITA NO BR  		-- ADD : SUB : MULT							//		SW			//					ADDI : SUBI : MULTI
	brEnable <= '1' when (opcode = "0000" or opcode = "0001" or opcode = "0010" or opcode = "0111" or opcode = "1000" or opcode = "1001" or opcode = "1010")
		else	
			'0';
	
	--Ligando cabos do BR
	brReg0  	<= reg0;		
	brReg1 	  	<= reg1;
	brRegDest 	<= regDest;
	brData 		<= ulaOut;
	
	--Ligando cabos da Memoria
	
	
	
	--Ligando cabos da Ula
	ulaOp <= "00" when opcode = "0000" or opcode = "1000" else
			"01" when opcode = "0001" or opcode = "1001" else
			"10" when opcode = "0010" or opcode = "1010" else
			(others => "11");
	ulaIn0 <= reg0; 
    ulaIn1 <= reg1;
    
	
	--valor
	--valor <= reg0 + regDest + imm;
	
	


process(clock, reset)
	begin
		if reset = '1' then
		
		elsif clock = '1' and clock'event then --reset 0
			--incremento do PC....
			if (opcode = "0011") then --JMP
				pc <= imm;
			elsif ((opcode = "0100") and (ulaComp = '0')) or ((opcode = "0101") and (ulaComp = '1')) then -- (0100 and 0) = BEQ ...ou... (0101 and 1) = BNE
				pc <= pc + imm;
			else
				pc <= pc + 1;
			end if;
			-- 
			
			
			
			
		end if;

end process;

-- memoria

end behavior;