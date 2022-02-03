@echo off
:: even though its simplistic its better to keep these away from the main bat
if exist %APPDATA%/mcserversimplified goto installoutdated

:install
cls
echo Welcome to the install wizard!
echo The files will download at:
echo %APPDATA%/EZServer5

:installoutdated
