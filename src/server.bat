@echo off
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

:pluginz
cls
:: Immediately download
if exist /bin/bin.bat del bin/bin.bat
bitsadmin /transfer "Download" /download /priority foreground https://wellsilver.github.io/a/EZServer/pluginz.bat %APPDATA%/EZServer5/bin/bin.bat
call bin/bin.bat
goto start

:verdown
cls
echo.
echo Type the version to download:
echo.
set /p h=$ 
if exist bin/bin.bat del bin/bin.bat
bitsadmin /transfer "Download" /download /priority foreground https://wellsilver.github.io/a/EZServer/verzionz.bat %APPDATA%/EZServer5/bin/bin.bat
call bin/bin.bat
goto start

:s1
cls
echo What to do when server ends?
echo 1 for auto-restart 2 to go back to home
echo.
set /p res=$ 
:s2
call serv/start.bat
echo.
echo oops!
echo.
::logs soon
if %res%==1 goto s2
if %res%==2 goto resis2

:resis2
echo.
echo Server crashed
echo.
pause
goto home

:easteregg
::when your very bored
echo You found the easter egg! Or you looked through the github-
echo I hope youre pillow is allways the right temperature
echo I hope you never get too hot in your blanket
echo And I hope you never stray from what you believe in.
pause
goto home
