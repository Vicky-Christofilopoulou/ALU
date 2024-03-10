library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity ShiftLR is
    Port ( a        : in STD_LOGIC_VECTOR (1 downto 0);
           LR_in    : in STD_LOGIC;
           Control  : in STD_LOGIC;
           Result   : out STD_LOGIC_VECTOR (1 downto 0)); 
end ShiftLR;

architecture Behavioral of ShiftLR is

begin

-- We use Control = 0  for SLL and Control = 1 for SRL
-- We use LR_in if we have to change this set of bits

alu: process (a,LR_in,Control) is

variable Result_var  : STD_LOGIC_VECTOR (1 downto 0);

begin
if Control = '0' then       --SLL
     if LR_in = '0' then    --This means we do not have to change anything 
        Result_var := a;          
     else
        Result_var := '0'& a(0);             
     end if; 
elsif Control = '1' then    --SLR
     if LR_in = '0' then    --This means we do not have to change anything
        Result_var := a;
     else
        Result_var :=a(1) & '0'; 
     end if;
else 
     Result_var :=(others => 'X');
end if;

Result <= Result_var;

end process alu;
end Behavioral;
