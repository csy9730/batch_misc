		!Simulation of differential equation using second-order Runge–Kutta numerical integration
		IMPLICIT REAL*8(A-H)
		IMPLICIT REAL*8(O-Z)
		OPEN(1,STATUS='UNKNOWN',FILE='DATFIL')
		W=2.
		T=0.
		S=0.
		X=0.
		XD=W
		H=.01
		DO WHILE(T<=10.)
			S=S+H
			XOLD=X
			XDOLD=XD
			XDD=-W*W*X
			X=X+H*XD
			XD=XD+H*XDD
			T=T+H
			XDD=-W*W*X
			X=.5*(XOLD+X+H*XD)
			XD=.5*(XDOLD+XD+H*XDD)
			IF(S>=.09999)THEN
				S=0.
				XTHEORY=SIN(W*T)
				WRITE(9,*)T,X,XTHEORY
				WRITE(1,*)T,X,XTHEORY
			ENDIF
		END DO
		!PAUSE
		CLOSE(1)
		END