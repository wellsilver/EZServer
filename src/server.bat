@echo off
::first check if its outdated
if exist %APPDATA%/mcserversimplified goto outdated

::version
set /a launcherv=Version-5-BETA
::generate job ID for bitsadmin
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
if %e%==doc goto doc
if %e%==start goto start
if %e%==back goto easteregg

goto home

:start
cls
echo Welcome to MCServer setup
echo To go with your previous setup just type "start" again.
echo To add plugins type "plugin"
echo To download the verson type "ver"
echo Type "list" to list available versions
:: echo to configure ram, port, etc, type "config"
set /p r=$ 

goto start


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
if %e%==n goto :eof
goto outdated
