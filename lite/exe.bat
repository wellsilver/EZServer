@echo off
::THIS IS NOT A PORTABLE VERSION
if not exist %APPDATA%\EZServerlite goto inst
:home
cls
echo Welcome
echo ver, start
echo.
set /p r=$ 
if %r%==ver goto ver
if %r%==start goto start

:ver
::dwnl verlite.bat?





:inst
echo Download at %APPDATA%/EZServerlite
set /p w=Y/N:
if %w%=N goto eof
::files
mkdir %APPDATA%\EZServerlite
mkdir %APPDATA%\EZServerlite\bin
mkdir %APPDATA%\EZServerlite\out
mkdir %APPDATA%\EZServerlite\plugins
mkdir %APPDATA%\EZServerlite\config
::config files
bitsadmin /transfer "Download" /download /priority foreground https://wellsilver.000webhostapp.com/docs/server.properties %APPDATA%/EZServerlite/config/server.properties
bitsadmin /transfer "Download" /download /priority foreground https://wellsilver.000webhostapp.com/docs/eula.txt %APPDATA%/EZServerlite/config/eula.txt
::back to files
mkdir %APPDATA%\EZServerlite\serv
mkdir %APPDATA%\EZServerlite\world
::check version
echo @echo off                                          >>%APPDATA%\EZServerlite\var.bat
echo if %ver% GTR 1 goto outdated                       >>%APPDATA%\EZServerlite\var.bat
echo goto eof                                           >>%APPDATA%\EZServerlite\var.bat
echo :outdated                                          >>%APPDATA%\EZServerlite\var.bat
echo echo This version is outdated-                     >>%APPDATA%\EZServerlite\var.bat
echo echo You should enter "reinstall" at the home menu.>>%APPDATA%\EZServerlite\var.bat
echo pause>>%APPDATA%\EZServerlite\var.bat
goto home
