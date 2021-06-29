ENTITY ADDER IS 
	PORT (        
		A, B, C_IN : IN BIT;
		C_OUT, S   : OUT BIT
	);
END ENTITY;

ARCHITECTURE RTL OF ADDER IS

	SIGNAL AUX : BIT;

BEGIN

	AUX <= (A XOR B);
	S <= (AUX XOR C_IN);
	C_OUT <= ((AUX AND C_IN) OR (A AND B));

END ARCHITECTURE;