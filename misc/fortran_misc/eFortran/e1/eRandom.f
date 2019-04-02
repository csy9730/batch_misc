		PROGRAM fcode
		IMPLICIT None
		real :: x(3) =0.0,y(2)=0.0, a = 0.0
		integer :: i
		call random_seed()
		Do i = 1 , size(x)
			call random_number( x(i) )
		end do
		!call random(y)
		call random_number( y )
		call random_number( a )
		write(*,*) a
		write(*,*) x
		write(*,*) y
		End PROGRAM fcode