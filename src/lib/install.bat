@echo off
:: even though its simplistic its better to keep these away from the main bat
if exist %APPDATA%/mcserversimplified goto installoutdated

:install
cls
echo Welcome to the install wizard!
echo The files will download at:
echo.
echo %APPDATA%/EZServer5
echo.
pause

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
mkdir %APPDATA%\EZServer5\bin
mkdir %APPDATA%\EZServer5\plugins
mkdir %APPDATA%\EZServer5\configs
mkdir %APPDATA%\EZServer5\injar
