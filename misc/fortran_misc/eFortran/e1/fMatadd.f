		SUBROUTINE MATADD(A,IROW,ICOL,B,C)
		IMPLICIT REAL*8 (A-H)
		IMPLICIT REAL*8 (O-Z)
		REAL*8 A(IROW,ICOL),B(IROW,ICOL),C(IROW,ICOL)
		DO 120 I=1,IROW
		DO 120 J=1,ICOL
		C(I,J)=A(I,J)+B(I,J)
120	CONTINUE
		RETURN
		END