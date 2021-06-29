LIBRARY work;
USE work.MyPackage.all;

ENTITY MULTIPLIER IS
    PORT (
			M, Q : IN  BIT_VECTOR (3 DOWNTO 0);
			P     : OUT BIT_VECTOR (7 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE RTL OF MULTIPLIER IS

	SIGNAL S_M, S_Q : BIT_VECTOR (3 DOWNTO 0);
	SIGNAL S_CT0, S_CT1, S_CT2: BIT;
	SIGNAL S_PP1, S_PP2 : BIT;
	SIGNAL S_AUX0, S_AUX1 : BIT_VECTOR(2 DOWNTO 0);
	SIGNAL S_CM0, S_CM1, S_CM2: BIT;
	SIGNAL S_CB0, S_CB1, S_CB2: BIT;

BEGIN
	
	P(0) <= (M(0) AND Q(0));
	
	TOP_BLOCK_0 : TOP_BLOCK
	PORT MAP(
	  MK   	=> M(0),
	  MK1  	=> M(1), 
     Q0 	  	=> Q(0),
	  Q1		=> Q(1),
	  CIN    => '0',
	  COUT 	=> S_CT0,
	  SI 		=> P(1)
	);
	
	TOP_BLOCK_1 : TOP_BLOCK
	PORT MAP(
	  MK   	=> M(1),
	  MK1  	=> M(2), 
     Q0 	  	=> Q(0),
	  Q1		=> Q(1),
	  CIN    => S_CT0,
	  COUT 	=> S_CT1,
	  SI 		=> S_AUX0(0)
	);
	
	TOP_BLOCK_2 : TOP_BLOCK
	PORT MAP(
	  MK   	=> M(2),
	  MK1  	=> M(3), 
     Q0 	  	=> Q(0),
	  Q1		=> Q(1),
	  CIN    => S_CT1,
	  COUT 	=> S_CT2,
	  SI 		=> S_AUX0(1)
	);
	
	TOP_BLOCK_3 : TOP_BLOCK
	PORT MAP(
	  MK   	=> M(3),
	  MK1  	=> '0', 
     Q0 	  	=> Q(0),
	  Q1		=> Q(1),
	  CIN    => S_CT2,
	  COUT 	=> S_PP1,
	  SI 		=> S_AUX0(2)
	);
	
	MIDDLE_BLOCK_0 : BOTTOM_BLOCK
	PORT MAP(
	  MK   	=> M(0),
	  PPI  	=> S_AUX0(0), 
     QJ 	  	=> Q(2),
	  CIN    => '0',
	  COUT 	=> S_CM0,
	  SI 		=> P(2)
	);
	
	MIDDLE_BLOCK_1 : BOTTOM_BLOCK
	PORT MAP(
	  MK   	=> M(1),
	  PPI  	=> S_AUX0(1), 
     QJ 	  	=> Q(2),
	  CIN    => S_CM0,
	  COUT 	=> S_CM1,
	  SI 		=> S_AUX1(0)
	);
	
	MIDDLE_BLOCK_2 : BOTTOM_BLOCK
	PORT MAP(
	  MK   	=> M(2),
	  PPI  	=> S_AUX0(2), 
     QJ 	  	=> Q(2),
	  CIN    => S_CM1,
	  COUT 	=> S_CM2,
	  SI 		=> S_AUX1(1)
	);
	
	MIDDLE_BLOCK_3 : BOTTOM_BLOCK
	PORT MAP(
	  MK   	=> M(3),
	  PPI  	=> S_PP1, 
     QJ 	  	=> Q(2),
	  CIN    => S_CM2,
	  COUT 	=> S_PP2,
	  SI 		=> S_AUX1(2)
	);
	
	BOTTOM_BLOCK_0 : BOTTOM_BLOCK
	PORT MAP(
	  MK   	=> M(0),
	  PPI  	=> S_AUX1(0), 
     QJ 	  	=> Q(3),
	  CIN    => '0',
	  COUT 	=> S_CB0,
	  SI 		=> P(3)
	);
	
	BOTTOM_BLOCK_1 : BOTTOM_BLOCK
	PORT MAP(
	  MK   	=> M(1),
	  PPI  	=> S_AUX1(1), 
     QJ 	  	=> Q(3),
	  CIN    => S_CB0,
	  COUT 	=> S_CB1,
	  SI 		=> P(4)
	);
	
	BOTTOM_BLOCK_2 : BOTTOM_BLOCK
	PORT MAP(
	  MK   	=> M(2),
	  PPI  	=> S_AUX1(2), 
     QJ 	  	=> Q(3),
	  CIN    => S_CB1,
	  COUT 	=> S_CB2,
	  SI 		=> P(5)
	);
	
	BOTTOM_BLOCK_3 : BOTTOM_BLOCK
	PORT MAP(
	  MK   	=> M(3),
	  PPI  	=> S_PP2, 
     QJ 	  	=> Q(3),
	  CIN    => S_CB2,
	  COUT 	=> P(7),
	  SI 		=> P(6)
	);

END ARCHITECTURE;