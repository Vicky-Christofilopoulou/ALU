library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( a        : in STD_LOGIC_VECTOR (3 downto 0);
           Control  : in STD_LOGIC_VECTOR (1 downto 0);
           Result   : out STD_LOGIC_VECTOR (3 downto 0));
end ALU;

--Case 1: Architecture Dataflow
architecture Dataflow of ALU is

signal Result_temp    : STD_LOGIC_VECTOR(3 downto 0); 

begin

with Control select
Result_temp <=  a(2 downto 0) & '0'     when "00",  --SLL
                '0' & a(3 downto 1)     when "01",  --SRL
                a(2 downto 0) & a(3)    when "10",  --ROL
                a(0) & a(3 downto 1)    when "11",  --ROR
                (others => 'X')         when others;
                
Result <= Result_temp;

end Dataflow;

--Case 2: Architecture Behavioral we must have a process
--architecture Behavioral of ALU is

--begin

--alu: process (a, Control) is

--variable Result_var    : STD_LOGIC_VECTOR(3 downto 0); 

--begin
--case Control is
--    when "00" => --SLL
--            Result_var := a(2 downto 0) & '0';
--    when "01" => --SRL
--            Result_var := '0' & a(3 downto 1);
--    when "10" => --ROL
--            Result_var := a(2 downto 0) & a(3);
--    when "11" => --ROR
--            Result_var := a(0) & a(3 downto 1);    
--    when others => Result_var :=(others => 'X');
--end case;

--Result <= Result_var;

--end process alu;
--end Behavioral;


--Case 3: Architecture Structural
--architecture Structural of ALU is

--component ShiftLR_4bit is
--    Port ( a        : in STD_LOGIC_VECTOR (3 downto 0);
--           Control  : in STD_LOGIC;
--           Result   : out STD_LOGIC_VECTOR (3 downto 0));   
--end component ShiftLR_4bit;

--component RotateLR_4bit is
--    Port ( a        : in STD_LOGIC_VECTOR (3 downto 0);
--           Control  : in STD_LOGIC;
--           Result   : out STD_LOGIC_VECTOR (3 downto 0));
--end component RotateLR_4bit;

--signal Result_temp1    : STD_LOGIC_VECTOR(3 downto 0); 
--signal Result_temp2    : STD_LOGIC_VECTOR(3 downto 0); 
--signal Result_temp3    : STD_LOGIC_VECTOR(3 downto 0); 
--signal Result_temp4    : STD_LOGIC_VECTOR(3 downto 0); 

--begin

--ShiftLR_4bit_test0: ShiftLR_4bit port map(a=>a, Control => '0', Result => Result_temp1); --SLL
--ShiftLR_4bit_test1: ShiftLR_4bit port map(a=>a, Control => '1', Result => Result_temp2); --SRL

--RotateLR_4bit_test0: RotateLR_4bit port map (a=>a, Control => '0', Result => Result_temp3); --ROL
--RotateLR_4bit_test1: RotateLR_4bit port map (a=>a, Control => '1', Result => Result_temp4); --ROR


--Result <= Result_temp1 when Control= "00" else  
--          Result_temp2 when Control= "01" else
--          Result_temp3 when Control= "10" else  
--          Result_temp4 when Control= "11";

--end Structural;

--Case 4: Architecture Structural with 2 bits
--architecture Structural of ALU is

--component ShiftLR is
--    Port ( a        : in STD_LOGIC_VECTOR (1 downto 0);
--           LR_in    : in STD_LOGIC;
--           Control  : in STD_LOGIC;
--           Result   : out STD_LOGIC_VECTOR (1 downto 0));
           
--end component ShiftLR;

--component RotateLR is
--    Port ( a        : in STD_LOGIC_VECTOR (1 downto 0);
--           LR_in    : in STD_LOGIC;
--           Control  : in STD_LOGIC;
--           Result   : out STD_LOGIC_VECTOR (1 downto 0));

--end component RotateLR;

--signal a_templ         : STD_LOGIC_VECTOR(1 downto 0);
--signal a_tempr         : STD_LOGIC_VECTOR(1 downto 0);
--signal Result_temp0    : STD_LOGIC_VECTOR(1 downto 0); 
--signal Result_temp1    : STD_LOGIC_VECTOR(1 downto 0); 
--signal Result_temp2    : STD_LOGIC_VECTOR(1 downto 0); 
--signal Result_temp3    : STD_LOGIC_VECTOR(1 downto 0); 
--signal Result_temp4    : STD_LOGIC_VECTOR(1 downto 0); 
--signal Result_temp5    : STD_LOGIC_VECTOR(1 downto 0); 
--signal Result_temp6    : STD_LOGIC_VECTOR(1 downto 0); 
--signal Result_temp7    : STD_LOGIC_VECTOR(1 downto 0); 

--begin

----The fist to digits from left to right
--a_templ  <= a(3)&a(2);
---- LR_in => '1' because we have to modify 
---- LR_in => '0' because we keep i as it is

--ShiftLR_test0: ShiftLR port map(a=>a_templ, LR_in => '1', Control => '0', Result => Result_temp0);      --SLL
--ShiftLR_test2: ShiftLR port map(a=>a_templ, LR_in => '0', Control => '1', Result => Result_temp2);      --SRL

--RotateLR_test4: RotateLR port map (a=>a_templ, LR_in => '1', Control => '0', Result => Result_temp4);   --ROL
--RotateLR_test6: RotateLR port map (a=>a_templ, LR_in => '0', Control => '1', Result => Result_temp6);   --ROR

--a_tempr  <= a(1)&a(0);
--ShiftLR_test1: ShiftLR port map(a=>a_tempr, LR_in => '0', Control => '0', Result => Result_temp1);      --SLL
--ShiftLR_test3: ShiftLR port map(a=>a_tempr, LR_in => '1', Control => '1', Result => Result_temp3);      --SRL

--RotateLR_test5: RotateLR port map (a=>a_tempr, LR_in => '0', Control => '0', Result => Result_temp5);   --ROL
--RotateLR_test7: RotateLR port map (a=>a_tempr, LR_in => '1', Control => '1', Result => Result_temp7);   --ROR

--Result <= Result_temp0(0)& Result_temp1 &'0'                when Control= "00" else  
--          '0' & Result_temp2 & Result_temp3(1)              when Control= "01" else
--          Result_temp4(1)& Result_temp5 & Result_temp4(0)   when Control= "10" else  
--          Result_temp7(1)& Result_temp6 & Result_temp7(0)   when Control= "11";

--end Structural;