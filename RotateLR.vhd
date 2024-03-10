library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity RotateLR is
    Port ( a        : in STD_LOGIC_VECTOR (1 downto 0);
           LR_in    : in STD_LOGIC;
           Control  : in STD_LOGIC;
           Result   : out STD_LOGIC_VECTOR (1 downto 0));
end RotateLR;

architecture Behavioral of RotateLR is

begin

alu: process (a,LR_in,Control) is

variable Result_var  : STD_LOGIC_VECTOR (1 downto 0);

begin

--We do the same actions at any case. We do not care if it is ROR or ROL
if LR_in = '0' then    --This means we do not have to change anything 
    Result_var := a;          
elsif LR_in = '1' then
        --We change the order of the bits
    Result_var := a(0) & a(1);             
else 
    Result_var :=(others => 'X');
end if;

Result <= Result_var;

end process alu;
end Behavioral;
