@echo off
:: even though its simplistic its better to keep these away from the main bat
if exist %APPDATA%/mcserversimplified goto installoutdated

:install
cls
echo Welcome to the install wizard!
echo The files will download at:
echo %APPDATA%/EZServer5

:installoutdated
cls
echo Welcome to the install wizard!
echo The files that will be deleted:
echo %APPDATA%/mcserversimplified
echo the files that will be downloaded:
echo %APPDATA%/EZServer5
echo When deleting files you may be prompted.
echo You may read if you like but please accept.
