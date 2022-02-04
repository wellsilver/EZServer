
@echo off
:: This is the EXE, it downloads and runs server.bat
:h
set /a launcherv=5
if exist %APPDATA%/mcserversimplified goto installoutdated
if not exist %APPDATA%/EZServer5 goto install
call %APPDATA%/EZServer5/server.bat
if %ERRORLEVEL%==1 goto corrupted
goto eof

:install
cls
echo Welcome to the install wizard!
echo The files will download at:
echo.
echo %APPDATA%/EZServer5
echo.
pause
mkdir %APPDATA%\EZServer5
bitsadmin /transfer "Download" /download /priority foreground https://wellsilver.github.io/a/EZServer/server.bat %APPDATA%/EZServer5/server.bat
mkdir %APPDATA%\EZServer5\bin
mkdir %APPDATA%\EZServer5\plugins
mkdir %APPDATA%\EZServer5\configs
mkdir %APPDATA%\EZServer5\injar
mkdir %APPDATA%\EZServer5\serv
goto h
:corrupted
cls
echo oops! looks like the files are corrupted
echo The installer will delete any residual files 
echo and go back to the installation prompt
echo.
pause
if exist %APPDATA%/EZServer5 goto corrupted1
goto install
:corrupted1
del %APPDATA%/EZServer5
goto install
:installoutdated
cls
echo Welcome to the install wizard!
echo.
echo The files that will be deleted:
echo.
echo %APPDATA%\mcserversimplified
echo.
echo the files that will be downloaded:
echo.
echo %APPDATA%\EZServer5
echo.
echo When deleting files you may be prompted.
pause
del %APPDATA%\mcserversimplified
mkdir %APPDATA%\EZServer5
bitsadmin /transfer "Download" /download /priority foreground https://wellsilver.github.io/a/EZServer/server.bat %APPDATA%/EZServer5/server.bat
mkdir %APPDATA%\EZServer5\bin
mkdir %APPDATA%\EZServer5\plugins
mkdir %APPDATA%\EZServer5\configs
mkdir %APPDATA%\EZServer5\injar
mkdir %APPDATA%\EZServer5\serv
goto h
