	include "robot.h"
	

loop
	bsf	portb,0

	delay250

	bcf	portb,0

	delay250

	goto	loop

	