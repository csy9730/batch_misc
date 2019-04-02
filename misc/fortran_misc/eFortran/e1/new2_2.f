		IMPLICIT REAL*8 (A-H)
		IMPLICIT REAL*8 (O-Z)
		REAL*8 T(4),X(4),A(3,3),AINV(3,3),B(3,1),ANS(3,1)
		T(1)=0
		T(2)=1
		T(3)=2
		T(4)=3
		X(1)=1.2
		X(2)=0.2
		X(3)=2.9
		X(4)=2.1
		N=4
		SUM1=0
		SUM2=0
		SUM3=0
		SUM4=0
		SUM5=0
		SUM6=0
		SUM7=0
		DO 10 I=1,4
			SUM1=SUM1+T(I)
			SUM2=SUM2+T(I)*T(I)
			SUM3=SUM3+X(I)
			SUM4=SUM4+T(I)*X(I)
			SUM5=SUM5+T(I)*T(I)*T(I)
			SUM6=SUM6+T(I)*T(I)*T(I)*T(I)
			SUM7=SUM7+T(I)*T(I)*X(I)
10 	CONTINUE
		A(1,1)=N
		A(1,2)=SUM1
		A(1,3)=SUM2
		A(2,1)=SUM1
		A(2,2)=SUM2
		A(2,3)=SUM5
		A(3,1)=SUM2
		A(3,2)=SUM5
		A(3,3)=SUM6
		DET1=A(1,1)*A(2,2)*A(3,3)+A(1,2)*A(2,3)*A(3,1)
		DET2=A(1,3)*A(2,1)*A(3,2)-A(1,3)*A(2,2)*A(3,1)
		DET3=-A(1,2)*A(2,1)*A(3,3)-A(1,1)*A(2,3)*A(3,2)
		DET=DET1+DET2+DET3
		AINV(1,1)=(A(2,2)*A(3,3)-A(2,3)*A(3,2))/DET
		AINV(1,2)=(A(1,3)*A(3,2)-A(1,2)*A(3,3))/DET
		AINV(1,3)=(A(1,2)*A(2,3)-A(2,2)*A(1,3))/DET
		AINV(2,1)=(A(3,1)*A(2,3)-A(2,1)*A(3,3))/DET
		AINV(2,2)=(A(1,1)*A(3,3)-A(3,1)*A(1,3))/DET
		AINV(2,3)=(A(2,1)*A(1,3)-A(1,1)*A(2,3))/DET
		AINV(3,1)=(A(2,1)*A(3,2)-A(3,1)*A(2,2))/DET
		AINV(3,2)=(A(3,1)*A(1,2)-A(1,1)*A(3,2))/DET
		AINV(3,3)=(A(1,1)*A(2,2)-A(1,2)*A(2,1))/DET
		B(1,1)=SUM3
		B(2,1)=SUM4
		B(3,1)=SUM7
		CALL MATMUL(AINV,3,3,B,3,1,ANS)
		WRITE(9,*)ANS(1,1),ANS(2,1),ANS(3,1)
		!PAUSE
		END
!C SUBROUTINE MATMUL IS SHOWN IN LISTING 1.4