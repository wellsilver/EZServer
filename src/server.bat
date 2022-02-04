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
echo Type list for supported versions
echo Type extra for more commands
echo Type start to begin creating a MC server

set /p e=$ 

if %e%==list goto list
if %e%==doc goto doc
if %e%==start goto start

goto home

:outdated
cls
echo Outdated files have been detected.
echo Update?
set /p e=Y/N: 
if %e%==y call install
if %e%==n goto :eof
goto outdated
