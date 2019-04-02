Module Random_Mod
  Implicit None
  !// ʹ���ڲ��������int64��Kindֵ
  Integer , parameter :: int64 = Selected_Int_Kind( 10 )
contains

  Subroutine Init_Random_Seed()    
    integer :: ised , i , pid
    integer(int64) :: t 
    integer , allocatable :: sed(:)
    call random_seed( size = ised ) !// ������Ӵ�С
    allocate( sed(ised) ) !// ��������
    call system_clock(t) !// ���ʱ��
    pid = getpid() !// ��ô�����ID
    t = ieor(t, int(pid, kind(t))) !// �� pid ��������XOR����
    do i = 1, ised
        sed(i) = lcg(t) !// ������ͬ���������
    end do
    call random_seed( put=sed ) !// ��������  
  End Subroutine Init_Random_Seed  
  
  Function lcg(s) !// ����ͬ���㷨 Linear congruential generator
    integer :: lcg
    integer(int64) :: s
    if (s == 0) then
       s = 104729
    else
       s = mod(s, 4294967296_int64)
    end if
    s = mod(s * 279470273_int64, 4294967291_int64)
    lcg = int(mod(s, int(huge(0), int64)), kind(0))
  End Function lcg

End Module Random_Mod

Program www_fcode_cn
  use Random_Mod
  Real :: x(8)
  call Init_Random_Seed()
  call random_number(x)
  write(*,*) x
End Program www_fcode_cn