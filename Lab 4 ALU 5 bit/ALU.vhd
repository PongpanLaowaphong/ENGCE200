library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port (
        M  			: in  STD_LOGIC;
        S  			: in  STD_LOGIC_VECTOR(1 downto 0);
        Ci 			: in  STD_LOGIC;
	A  			: in  STD_LOGIC_VECTOR(4 downto 0);
	B  			: in  STD_LOGIC_VECTOR(4 downto 0);
	Co_FA_1			: inout  STD_LOGIC;
	Co_FA_2			: inout  STD_LOGIC;
	Sum_FA_1		: inout  STD_LOGIC_VECTOR(4 downto 0);
	Sum_FA_2		: inout  STD_LOGIC_VECTOR(4 downto 0);
	Check_Co		: inout  STD_LOGIC;
	Check_WA		: inout  STD_LOGIC;
	Check_WB		: inout  STD_LOGIC;
	Check_WA_XOR_WB		: inout  STD_LOGIC;
	Check_Ci_AND_WA_XOR_WB	: inout  STD_LOGIC;
	Y			: out  STD_LOGIC_VECTOR(4 downto 0)
    );
end ALU;

architecture Behavioral of ALU is

    	component Enable_B
        	port (
            		B: in std_logic;
            		S: in std_logic_vector(1 downto 0);
            		EB : inout std_logic;
            		GB : inout std_logic
        	);
    	end component;
	signal Ena_B : std_logic_vector(4 downto 0);
----------------------------------------------------------------------
	component Complement_B
        	port (
            		B: in std_logic;
            		S: in std_logic_vector(1 downto 0);
            		WB : inout std_logic;
            		FB : inout std_logic
        	);
    	end component;
	signal Com_B : std_logic_vector(4 downto 0);
----------------------------------------------------------------------	
	component Complement_A
        	port (
            		A: in std_logic;
            		S: in std_logic_vector(1 downto 0);
            		WA : inout std_logic;
            		FA : inout std_logic
        	);
    	end component;
	signal Com_A : std_logic_vector(4 downto 0);	
----------------------------------------------------------------------
	component Full_Adder
        	port (
            		A	: in  STD_LOGIC;
			B	: in  STD_LOGIC;
			Ci	: in  STD_LOGIC;
			Sum	: out  STD_LOGIC;
			Co	: out  STD_LOGIC
        	);
    	end component;
	signal Cout_FA_1 	: std_logic_vector(4 downto 0);
	signal Cin_FA_1 	: std_logic;
	signal Cout_FA_2 	: std_logic_vector(4 downto 0);
	signal Cin_FA_2 	: std_logic;
----------------------------------------------------------------------
	component Complement_Result
        	port (
            		Sum_Result	: in  STD_LOGIC;
			Check_Co	: in  STD_LOGIC;
			Com_Result	: inout  STD_LOGIC
        	);
    	end component;
	signal Com_Res : std_logic_vector(4 downto 0);	
----------------------------------------------------------------------
	component Logic_Gate
        	port (
            		A 	: in  STD_LOGIC;
			B	: in  STD_LOGIC;
			S  	: in  STD_LOGIC_VECTOR(1 downto 0);
			AandB	: inout STD_LOGIC;
			AorB	: inout STD_LOGIC;
			AxorB	: inout STD_LOGIC;
			AxnorB	: inout STD_LOGIC;
			Y	: out STD_LOGIC
        	);
    	end component;
	signal Logic_Y : std_logic_vector(4 downto 0);
----------------------------------------------------------------------	

begin

    	EnaB4 : Enable_B port map( B => B(4), S(1) => S(1), S(0) => S(0), GB => Ena_B(4) );
    	EnaB3 : Enable_B port map( B => B(3), S(1) => S(1), S(0) => S(0), GB => Ena_B(3) );
    	EnaB2 : Enable_B port map( B => B(2), S(1) => S(1), S(0) => S(0), GB => Ena_B(2) );
    	EnaB1 : Enable_B port map( B => B(1), S(1) => S(1), S(0) => S(0), GB => Ena_B(1) );
   	EnaB0 : Enable_B port map( B => B(0), S(1) => S(1), S(0) => S(0), GB => Ena_B(0) );

	ComB4 : Complement_B port map( B => Ena_B(4), S(1) => S(1), S(0) => S(0), WB => Check_WB, FB => Com_B(4) );
    	ComB3 : Complement_B port map( B => Ena_B(3), S(1) => S(1), S(0) => S(0), WB => Check_WB, FB => Com_B(3) );
    	ComB2 : Complement_B port map( B => Ena_B(2), S(1) => S(1), S(0) => S(0), WB => Check_WB, FB => Com_B(2) );
    	ComB1 : Complement_B port map( B => Ena_B(1), S(1) => S(1), S(0) => S(0), WB => Check_WB, FB => Com_B(1) );
   	ComB0 : Complement_B port map( B => Ena_B(0), S(1) => S(1), S(0) => S(0), WB => Check_WB, FB => Com_B(0) );

	ComA4 : Complement_A port map( A => A(4), S(1) => S(1), S(0) => S(0), WA => Check_WA, FA => Com_A(4) );
    	ComA3 : Complement_A port map( A => A(3), S(1) => S(1), S(0) => S(0), WA => Check_WA, FA => Com_A(3) );
    	ComA2 : Complement_A port map( A => A(2), S(1) => S(1), S(0) => S(0), WA => Check_WA, FA => Com_A(2) );
    	ComA1 : Complement_A port map( A => A(1), S(1) => S(1), S(0) => S(0), WA => Check_WA, FA => Com_A(1) );
   	ComA0 : Complement_A port map( A => A(0), S(1) => S(1), S(0) => S(0), WA => Check_WA, FA => Com_A(0) );

	Cin_FA_1 <= Ci ;
	FA1_4 : Full_Adder port map( A => Com_A(4), B => Com_B(4), Ci => Cout_FA_1(3), Sum => Sum_FA_1(4), Co => Cout_FA_1(4) );
    	FA1_3 : Full_Adder port map( A => Com_A(3), B => Com_B(4), Ci => Cout_FA_1(2), Sum => Sum_FA_1(3), Co => Cout_FA_1(3) );
    	FA1_2 : Full_Adder port map( A => Com_A(2), B => Com_B(4), Ci => Cout_FA_1(1), Sum => Sum_FA_1(2), Co => Cout_FA_1(2) );
    	FA1_1 : Full_Adder port map( A => Com_A(1), B => Com_B(4), Ci => Cout_FA_1(0), Sum => Sum_FA_1(1), Co => Cout_FA_1(1) );
   	FA1_0 : Full_Adder port map( A => Com_A(0), B => Com_B(4), Ci => Cin_FA_1    , Sum => Sum_FA_1(0), Co => Cout_FA_1(0) );
	Co_FA_1 <= Cout_FA_1(4) ;
	
	Check_WA_XOR_WB		<= Check_WA 		XOR Check_WB ;
	Check_Ci_AND_WA_XOR_WB 	<= Check_WA_XOR_WB 	AND Ci ;
	Check_Co		<= (not Cout_FA_1(4)) 	AND Check_Ci_AND_WA_XOR_WB ;
	
	ComRe4 : Complement_Result port map( Sum_Result => Sum_FA_1(4), Check_Co => Check_Co, Com_Result => Com_Res(4) );
    	ComRe3 : Complement_Result port map( Sum_Result => Sum_FA_1(3), Check_Co => Check_Co, Com_Result => Com_Res(3) );
    	ComRe2 : Complement_Result port map( Sum_Result => Sum_FA_1(2), Check_Co => Check_Co, Com_Result => Com_Res(2) );
    	ComRe1 : Complement_Result port map( Sum_Result => Sum_FA_1(1), Check_Co => Check_Co, Com_Result => Com_Res(1) );
   	ComRe0 : Complement_Result port map( Sum_Result => Sum_FA_1(0), Check_Co => Check_Co, Com_Result => Com_Res(0) );

	Cin_FA_2 <= Check_Co ;
	FA2_4 : Full_Adder port map( A => Com_Res(4), B => '0', Ci => Cout_FA_2(3), Sum => Sum_FA_2(4), Co => Cout_FA_2(4) );
    	FA2_3 : Full_Adder port map( A => Com_Res(3), B => '0', Ci => Cout_FA_2(2), Sum => Sum_FA_2(3), Co => Cout_FA_2(3) );
    	FA2_2 : Full_Adder port map( A => Com_Res(2), B => '0', Ci => Cout_FA_2(1), Sum => Sum_FA_2(2), Co => Cout_FA_2(2) );
    	FA2_1 : Full_Adder port map( A => Com_Res(1), B => '0', Ci => Cout_FA_2(0), Sum => Sum_FA_2(1), Co => Cout_FA_2(1) );
   	FA2_0 : Full_Adder port map( A => Com_Res(0), B => '0', Ci => Cin_FA_2    , Sum => Sum_FA_2(0), Co => Cout_FA_2(0) );
	Co_FA_2 <= Cout_FA_2(4) ;

	Logic4 : Logic_Gate port map( A => A(4), B => B(4), S(1) => S(1), S(0) => S(0), Y => Logic_Y(4) );
    	Logic3 : Logic_Gate port map( A => A(3), B => B(3), S(1) => S(1), S(0) => S(0), Y => Logic_Y(3) );
    	Logic2 : Logic_Gate port map( A => A(2), B => B(2), S(1) => S(1), S(0) => S(0), Y => Logic_Y(2) );
    	Logic1 : Logic_Gate port map( A => A(1), B => B(1), S(1) => S(1), S(0) => S(0), Y => Logic_Y(1) );
   	Logic0 : Logic_Gate port map( A => A(0), B => B(0), S(1) => S(1), S(0) => S(0), Y => Logic_Y(0) );

	Y(4) <= (Sum_FA_2(4) AND (not M)) OR (Logic_Y(4) AND M);
	Y(3) <= (Sum_FA_2(3) AND (not M)) OR (Logic_Y(3) AND M);
	Y(2) <= (Sum_FA_2(2) AND (not M)) OR (Logic_Y(2) AND M);
	Y(1) <= (Sum_FA_2(1) AND (not M)) OR (Logic_Y(1) AND M);
	Y(0) <= (Sum_FA_2(0) AND (not M)) OR (Logic_Y(0) AND M);
	
end Behavioral;
