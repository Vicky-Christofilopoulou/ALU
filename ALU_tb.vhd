library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Beh_ALU_tb of ALU_tb is
component ALU is
Port ( a        : in STD_LOGIC_VECTOR (3 downto 0);
       Control  : in STD_LOGIC_VECTOR (1 downto 0);
       Result   : out STD_LOGIC_VECTOR (3 downto 0));
end component ALU;

signal a_tb        : STD_LOGIC_VECTOR (3 downto 0);
signal Control_tb  : STD_LOGIC_VECTOR (1 downto 0);                
signal Result_tb   : STD_LOGIC_VECTOR (3 downto 0);


begin
test_entity: ALU port map(a=>std_logic_vector(a_tb),
                          Control=>Control_tb,
                          Result =>Result_tb);

test: process is
   
procedure sim_test (min: in integer; max: in integer; step: in  integer) is
begin
for i in min to max loop
    a_tb<=std_logic_vector(TO_UNSIGNED(i*step, a_tb'length));
    wait for 10ns;
end loop i;  
end procedure;

begin
Control_tb <= "00"; sim_test(0,2,1);
Control_tb <= "01"; sim_test(0,2,1);
Control_tb <= "10"; sim_test(0,2,1);
Control_tb <= "11"; sim_test(0,2,1);

end process test;
end Beh_ALU_tb;
