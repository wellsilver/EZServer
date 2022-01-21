@echo off
:lolaw
cls
echo Welcome to the installation wizard
echo The files will be saved at %APPDATA%/mcserversimplified
echo Are you okay with this?
echo Y/N

set /p f=$ 
if %f%==Y goto inst
if %f%==N goto :eof
goto lolaw

:inst
cls
cd %APPDATA%
mkdir mcserversimplified
cd mcserversimplified
mkdir prim
mkdir bin
mkdir plugins
mkdir logs
echo Finished!
pause
