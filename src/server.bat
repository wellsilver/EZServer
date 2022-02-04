@echo off
::first check if its outdated or uninstalled
if exist %APPDATA%/mcserversimplified goto outdated
if not exist %APPDATA%/EZServer5 goto install.bat
::version
set /a launcherv=Version-5-BETA
::generate job ID for bitsadmin
::for anyone copying code %random% is very predictable so is unsuitable for security
set /a bitsidv=%random%

:home
::for standardization only 5 echos
cls

echo Welcome!
echo version: %launcherv%
echo Type extra for more commands
echo Type start to begin creating a MC server
echo In any menu you can type "back" to go back.

set /p e=$ 

if %e%==list goto list
:: if %e%==doc call doc.bat
if %e%==start goto start
if %e%==back goto easteregg

goto home

:start
cls
echo Welcome to MCServer setup
echo To go with your current setup just type "start" again.
echo To add plugins type "plugin"
echo To download/change the verson type "ver"
echo Type "list" to list available versions
:: echo to configure ram, port, etc, type "config"
set /p r=$ 
if %r%==start goto s1
if %r%==plugin goto pluginz
if %r%==ver goto verdown
if %r%==back goto home

goto start


:verdown
if exist %APPDATA%/EZServer5/lol.jar
cls
echo.
echo Type the version to download:
echo.
set /p h=%e%
::stuff here to download verzionz.bat and run it
goto start

:s1
echo Version: %launcherv%
echo Minecraft version: %h%
:: echo IP: %?%
echo.
java -jar lol.jar --nogui
if %l%==1 goto s1
if %l%==2 goto start


:easteregg
::when your very bored
echo You found the easter egg! Or you looked through the github-
echo I hope youre pillow is allways the right temperature
echo I hope you never get too hot in your blanket
echo And I hope you never stray from what you believe in.
pause
goto home

:outdated
cls
echo Outdated files have been detected.
echo Update?
set /p e=Y/N: 
if %e%==y call install.bat
if %e%==n goto eof
goto outdated
