# ���빤��

[TOC]

## ������ع��߰�����
* �ı�����
* Ԥ������
* ������
* �����
* ������
* ������
* IDE����
* ��֯����

##### c������
����c������������gcc(gnu)��msvc_cl, nvcc, mingw32-gcc,cygwin-gcc,llvm-cc, mingw-w64-gcc��clang

GCC ԭ��Ϊ GNU C ���Ա�������GNU C Compiler������Ϊ��ԭ��ֻ�ܴ��� C���ԡ���GCC �ܿ����չ����ÿɴ��� C++����������չ�ܹ�֧�ָ��������ԣ���Fortran��Pascal��Objective-C��Java��Ada��Go�Լ����ദ�����ܹ��ϵĻ�����Եȣ����Ը���GNU�������׼���GNU Compiler Collection����

TCC(Tiny C Compiler)���� TCC��һ����С������ı�׼C���Ա�������
##### ����������
    fortran��������gcc-fortran��
##### ���û����
ml.exe ml64.exe masm.exe

���msvc���ɻ������ļ���
Project->Setting->C/C++->Category->Listing Files->lISTING file type:ѡNo Listing����ļ��� 
��Ŀ����->��������->cc++->����ļ�->����ļ����->��Դ�������
gcc ����asm�ļ���
ִ��gcc -S ����
##### ������
һ�������������
lib�ļ���ͬ��pdb�ļ���lib�ļ����ڱ��룬pdb���ڵ��ԣ����Ը���Դ�롣


    
##### ��֯����
make��cmake��nmake��bjam(boost),qmake
* cmake ��� OpenCVConfig.cmake ·��������������OpenCVConfig.cmake��install��ͬ·��
* ͨ��FindOpenCV.cmake�ṩ·������
* cmakeͨ��findSwig.cmake������swig.exe,�����õ�swigĿ¼��

##### ide����
ǰ��IDE���ߣ�Sublime��Atom��VSCode,msvc��eclipse,


##### dumpbin
dumpbin.exe

##### �������lnk1104
�������lnk1104�� û��lib�ļ�
��dll�ļ���û��lib�ļ���˵��û�ж���dllexport��

#### msvc���빤��
msvc���빤��λ�ڣ�C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin
``` 
C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\vcvars32.bat
C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\amd64\vcvars64.bat
C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\x86_amd64\vcvarsx86_amd64.bat
C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64_x86\vcvarsamd64_x86.bat
C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\x86_arm\vcvarsx86_arm.bat
C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64_arm\vcvarsamd64_arm.bat
# ���ϱ��������һ�»���������
PATH=c:\Program Files (x86)\Microsoft F#\v4.0\;c:\Program Files (x86)\Microsoft
Visual Studio 10.0\VSTSDB\Deploy;c:\Program Files (x86)\Microsoft Visual Studio
10.0\Common7\IDE\;c:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\BIN;c:\
Program Files (x86)\Microsoft Visual Studio 10.0\Common7\Tools;C:\WINDOWS\Micros
oft.NET\Framework\v4.0.30319;C:\WINDOWS\Microsoft.NET\Framework\v3.5;c:\Program
Files (x86)\Microsoft Visual Studio 10.0\VC\VCPackages;C:\Program Files (x86)\HT
ML Help Workshop;c:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\bin\NETFX 4
.0 Tools;c:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\bin
```


```
 c:\program files (x86)\microsoft visual studio 11.0\vc\bin ��Ŀ¼
vcvars32.bat
bscmake.exe    cl.exe         cvtres.exe     dumpbin.exe    editbin.exe
lib.exe        link.exe       ml.exe         nmake.exe      pgocvt.exe
pgomgr.exe     pgosweep.exe   undname.exe    xdcmake.exe    
```

```
cl.exe
ml.exe
nmake.exe   

devenv.exe
blend.exe

bscmake.exe
lib.exe
nmake.exe
pgocvt.exe
editbin.exe
pgomgr.exe
dumpbin.exe
pgosweep.exe
undname.exe
cvtres.exe
cl.exe
xdcmake.exe
ml.exe
link.exe
vcvars32.bat
xdcmake.exe.config
cl.exe.config
link.exe.config
c1xx.dll
pgort100.dll
pgodb100.dll
c1.dll
c2.dll
atlprov.dll
```

##### lib
lib /machine:ix86 /def:libfftw3-3.def
rem ���ɶ�̬dll������Ӧ��.lib�ļ�


##### ������
CL.EXE

##### msvc��׼�����
C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\CRT

## VS2010�С�ת�����塱��ʾ��δ���ҵ����š��Ľ������
ԭ�� 2012��07��11�� 10:41:52 ��ǩ��2010 9685
��������������Һܾã����������ܲ����ˣ�����������һЩ����������ڸ㶨��
1���ر�VS2010����������
2��ɾ�����������Ӧ�� .sdf�ļ���

## fatal error lnk1123:ת����coff�ڼ�ʧ��
ɾ��cvtres.exe

1.�򿪸���Ŀ�ġ�����ҳ���Ի���
2.���������������ļ��С�
3.�����������С�����ҳ��
4.�� /SAFESEH:NO ���롰����ѡ����У�Ȼ����Ӧ��

��Ƕ���嵥�����⣬���ǶԸù����Լ������������̽������²���
�Ҽ�->��������->��������-> �嵥����->��������->Ƕ���嵥��ѡ��[��]
1>LINK : fatal error LNK1123: ת���� COFF �ڼ�ʧ��: �ļ���Ч����
1>CVTRES : fatal error CVT1100: ��Դ�ظ�������: MANIFEST������: 1������: 0x0409
�����������־�ļ�����ģ����Խ�
��Ŀ\����\��������\�嵥����\��������\Ƕ���嵥��ԭ���ǡ��ǡ����ĳɡ��񡱡�
���߽�
��Ŀ\����\��������\������\�嵥�ļ�\�����嵥��ԭ���ǡ��ǡ����ĳɡ���








#### misc



opencv��dll�汾��cxcore100.dll , cvcore240.dll,

