@echo off
:: This is the EXE, it downloads and runs server.bat

where java >nul 2>nul
if %errorlevel%==1 (
    echo Java not found
    echo It is required you download java from Oracle
    pause
    goto eof
)

:h
set /a launcherv=betafive
if exist %APPDATA%\mcserversimplified goto outdated
if not exist %APPDATA%\EZServer5 goto install
set /a w=%cd%
cd %APPDATA%
call EZServer5\server.bat
cd w
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

:corrupted
echo Looks like the files are corrupted
echo Delete all and restart?
set /p e=Y/N:
if %e%==Y goto corrupted2
if %e%==N goto eof
:corrupted2
del %APPDATA%\EZServer5
goto inst

:outdated
echo Looks like you have the old EZServer
echo from when all the code was INEFFICIENT
pause
echo We will say goodbye to that and install
echo The new version.
pause
del %APPDATA%\mcserversimplified
goto inst

:inst
::change to wget? Does winXP have wget??? Idk
mkdir %APPDATA%\EZServer5
cd %APPDATA%\EZServer5
bitsadmin /transfer "Download EZServer" /download /priority foreground https://wellsilver.github.io/a/EZServer/server.bat %APPDATA%/EZServer5/server.bat
mkdir plugins
mkdir injar
mkdir serv
bitsadmin /transfer "Download EZServer" /download /priority foreground https://wellsilver.github.io/a/EZServer/start.bat %APPDATA%/EZServer5/serv/start.bat
goto h
