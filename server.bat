@echo off
set /a launcher_version = v1
echo Loading
timeout /t 3 >nul
title MC
REM check if the server has been installed before
if not exist %APPDATA%/mcserversimplified goto install
cd %APPDATA%/mcserversimplified
call var.bat
pause
REM bitsadmin /addfile myDownloadJob https://downloadsrv/10mb.zip c:\10mb.zip

:home
cls
echo Welcome!
echo Legacy not available on this version
echo Only 1.17 and 1.18 downloads are available on this version
echo You also agree to Mojangs Terms Of Service
set /p i=ver$
:start
cls
echo What to do when the server stops?
echo 1 for auto restart 2 for close and 3 to return to home
echo After deciding it will download the selected version
set /p s=num$
cls
if not exist /prim mkdir prim
cd prim
if not exist %i%.jar bitsadmin /transfer "Download %i%" /download /priority foreground https://wellsilver.000webhostapp.com/docs/%i%.jar %APPDATA%/mcserversimplified/prim/%i%.jar
cls
if not exist server.properties bitsadmin /transfer "Download Extras" /download /priority foreground https://wellsilver.000webhostapp.com/docs/server.properties %APPDATA%/mcserversimplified/prim/server.properties
cls
if not exist eula.txt bitsadmin /transfer "Download Extras" /download /priority foreground https://wellsilver.000webhostapp.com/docs/eula.txt %APPDATA%/mcserversimplified/prim/eula.txt
:start2
cls
echo All checks done, capped at 2 gigabytes of ram
echo Minecraft version is %i% 
echo Launcher version is %launcher_version%
echo.
java -Xms2G -Xmx2G -jar %i%.jar --nogui
echo.
echo Server stopped, waiting 3 seconds
timeout /t 3 >nul
if %s% == 1 goto start2
if %s% == 2 goto blank
if %s% == 3 goto home2
echo you didnt configure it properly!
timeout /t 2 >nul
echo Dont worry, click any button and go back to home
pause
goto home2

:home2
cd ..
goto home





:install
cls
echo Looks like theres no installation
echo will you be fine with C://programfiles/mcserversimplified
set /p i=Y/N: 
if %i% == Y goto install2
if %i% == N goto blank
goto install
:install2
echo Installing
timeout /t 1 >nul
cd %APPDATA%
mkdir mcserversimplified
cd mcserversimplified
mkdir jar
echo REM Start >>var.bat

REM DO NOT PLACE ANY FUNCTIONS UNDER BLANK, IT KICKS THE THING OUT
:blank
