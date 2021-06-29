LIBRARY work;
USE work.MyPackage.all;

ENTITY TOP_BLOCK IS 
	PORT (        
		MK, MK1, Q0, Q1, CIN : IN BIT;
		COUT, SI   				: OUT BIT
	);
END ENTITY;

ARCHITECTURE RTL OF TOP_BLOCK IS

	SIGNAL S_A, S_B : BIT;

BEGIN
	
	S_A <= (MK AND Q1);
	S_B <= (MK1 AND Q0);
	
	
	ADDER_0 : ADDER
	PORT MAP(
		A		=> S_A, 
		B		=> S_B, 
		C_IN 	=> CIN,
		C_OUT	=> COUT, 
		S 		=> SI
	);

END ARCHITECTURE;