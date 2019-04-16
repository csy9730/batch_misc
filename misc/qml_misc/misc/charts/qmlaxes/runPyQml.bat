set path=%path%;C:\Qt\Qt5.9.0\5.9\mingw53_32\bin\
rem cd /d %~dp0
echo %~n1
python  %~dp0\main.py  %~n1.qml
pause