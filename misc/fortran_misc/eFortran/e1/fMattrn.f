		SUBROUTINE MATTRN(A,IROW,ICOL,AT)
		IMPLICIT REAL*8 (A-H)
		IMPLICIT REAL*8 (O-Z)
		REAL*8 A(IROW,ICOL),AT(ICOL,IROW)
		DO 105 I=1,IROW
		DO 105 J=1,ICOL
		AT(J,I)=A(I,J)
105 	CONTINUE
		RETURN
		END