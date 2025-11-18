library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity ula is
	port(
		clock		: in std_logic;
		ulaOp 		: in std_logic_vector(1 downto 0);
		op0	        : in std_logic_vector(7 downto 0);
		op1         : in std_logic_vector(7 downto 0);
		ulaOut      : out std_logic_vector(15 downto 0);
		ulaComp     : out std_logic
	
	);	
end entity;

architecture behavior of ula is

--simais ULA

begin



end behavior;