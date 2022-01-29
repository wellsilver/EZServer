@echo off

if %i%==1.18 goto 1.18
if %i%==P1.18 goto P1.18
goto error





REM About bukkit and spigot, they dont provide any kind of direct link and this causes alot of issues
REM There is a possible workaround though, just using the buildtools to build them normally, I know that for sure this will require some extra work but it might actually work?
:1.17
bitsadmin /transfer "Download 1.17" /download /priority foreground https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar %APPDATA%/mcserversimplified/prim/jar.jar
goto cool
:P1.18
bitsadmin /transfer "Download paper 1.18#177" /download /priority foreground https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/177/downloads/paper-1.18.1-177.jar %APPDATA%/mcserversimplified/prim/jar.jar
goto cool
:1.18
bitsadmin /transfer "Download Mojang 1.18" /download /priority foreground https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar %APPDATA%/mcserversimplified/prim/jar.jar
goto cool
:error
echo Looks like %i%
echo Isnt a valid version!
echo Pick a new one!
set /p i =$ 
pause


:cool
echo [EXT] Download - %i% -
echo.
