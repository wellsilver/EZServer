@echo off
:: This is the EXE, it downloads and runs server.bat
:h
set /a launcherv=betafive
if exist %APPDATA%/mcserversimplified goto outdated
if not exist %APPDATA%/EZServer5 goto install
call %APPDATA%/EZServer5/server.bat
if %ERRORLEVEL%==1 goto corrupted
goto eof

:install
cls
echo.
echo Welcome to the install wizard!
echo.
pause
echo The files will be downloaded at %APPDATA%/EZServer5
echo Are you okay with this?
echo.
set /p jkh=Y/N: 
if %jkh%==Y goto inst
if %jkh%==N goto eof
goto install

:outdated
echo Looks like you have the old EZServer
echo from when all the code was INEFFICIENT
pause
echo We will say goodbye to that and install
echo The new version.
pause
del %APPDATA%/mcserversimplified
goto inst

:inst
mkdir %APPDATA%/EZServerTEMP
bitsadmin /transfer "Download EZServer" /download /priority foreground https://wellsilver.github.io/a/EZServer.zip %APPDATA%/EZServerTEMP/EZServer.zip
%extd% /unzip %APPDATA%/EZServerTEMP/EZServer.zip %APPDATA%
goto h
