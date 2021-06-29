LIBRARY work;
USE work.MyPackage.all;

ENTITY BOTTOM_BLOCK IS 
	PORT (        
		MK, PPI, QJ, CIN 	: IN BIT;
		COUT, SI   			: OUT BIT
	);
END ENTITY;

ARCHITECTURE RTL OF BOTTOM_BLOCK IS

	SIGNAL S_A : BIT;

BEGIN
	
	S_A <= (MK AND QJ);
	
	ADDER_0 : ADDER
	PORT MAP(
		A		=> S_A, 
		B		=> PPI, 
		C_IN 	=> CIN,
		C_OUT	=> COUT, 
		S 		=> SI
	);

END ARCHITECTURE;