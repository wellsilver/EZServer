@echo off
if "%b2eprogramfilename%"==""  (
  echo There WILL be issues when using the .bat
  echo It is recommended you download the .exe in releases
  pause
)

:load
set /a launcher_version = v1
title MC
REM check if the server has been installed before
if not exist %APPDATA%/mcserversimplified goto install
cd %APPDATA%/mcserversimplified
REM bitsadmin /addfile myDownloadJob https://downloadsrv/10mb.zip c:\10mb.zip

:home
cls
echo Welcome!
echo Only 1.18 downloads are available on this version
echo Put P before 1.18 (P1.18) to use paper.
echo "Configure" to configure the launcher
echo And "Delete" to delete any saved server files
set /p i=ver$ 
if %i% == reinstall goto reinstall
if %i% == delete goto delete
:start
cls
echo What to do when the server stops?
echo 1 for auto restart 2 for close and 3 to return to home
echo After deciding it will download the selected version
set /p s=num$ 
cls
if not exist /prim mkdir prim
cd prim
if not exist %i%.jar goto injar
:injarend
if %ERRORLEVEL%==1 goto blank
cls
if not exist server.properties bitsadmin /transfer "Download Extras" /download /priority foreground https://wellsilver.000webhostapp.com/docs/server.properties %APPDATA%/mcserversimplified/prim/server.properties
if %ERRORLEVEL%==1 goto blank
cls
if not exist eula.txt bitsadmin /transfer "Download Extras" /download /priority foreground https://wellsilver.000webhostapp.com/docs/eula.txt %APPDATA%/mcserversimplified/prim/eula.txt
if %ERRORLEVEL%==1 goto blank
:start2
cls
echo All checks done, capped at 2 gigabytes of ram
echo Minecraft version is %i% 
echo Launcher version is %launcher_version%
echo.
cd %APPDATA%/mcserversimplified/prim
java -jar lol.jar --nogui
echo.
echo Server stopped, waiting 3 seconds
timeout /t 3 >nul
if %s% == 1 goto start2
if %s% == 2 goto blank
if %s% == 3 goto home2
echo you didnt configure it properly!
echo.
echo Dont worry, click any button and go back to home
set /p pauseripoff=$
goto home2

:home2
cd ..
goto home



:reinstall
cd %APPDATA%
del /mcserversimplified
:install
cls
echo Welcome to the install wizard
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
goto load

:injar
REM DOWNLOAD JAR
cd ..
if exist bin del bin
mkdir bin
if exist var.bat del var.bat
if exist var2.bat del var2.bat
REM init setup
bitsadmin /transfer "Download variables" /download /priority foreground https://wellsilver.000webhostapp.com/docs/var.zip %APPDATA%/mcserversimplified/bin/var.zip
%extd% /unzip %APPDATA%/mcserversimplified/bin/var.zip %APPDATA%/mcserversimplified
call var.bat
goto injarend
:delete
cd %APPDATA%
del mcserversimplified

REM DO NOT PLACE ANY FUNCTIONS UNDER BLANK, IT KICKS THE THING OUT
:blank
