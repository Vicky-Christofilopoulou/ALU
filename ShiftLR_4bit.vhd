library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;


entity ShiftLR_4bit is
    Port ( a        : in STD_LOGIC_VECTOR (3 downto 0);
           Control  : in STD_LOGIC;
           Result   : out STD_LOGIC_VECTOR (3 downto 0));      
end ShiftLR_4bit;

architecture Behavioral of ShiftLR_4bit is

signal Result_temp    : STD_LOGIC_VECTOR(3 downto 0); 

begin

with Control select
Result_temp <=  a(2 downto 0) & '0'     when '0',  --SLL
                '0' & a(3 downto 1)     when '1',  --SRL
                (others => 'X')         when others;
                
Result <= Result_temp;

end Behavioral;
