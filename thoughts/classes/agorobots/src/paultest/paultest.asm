	include "robot.h"
	
	useoutput portb,3	; use B3 as an output

loop
	bsf	portb,3		; set the output B3
	delay250		; wait 250 ms
	bcf	portb,3		; clear the output B3
	delay250		; wait 250 ms
	goto	loop		; and repeat!

	END
