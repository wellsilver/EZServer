@echo off
:home2
cls
:hom2
echo Type "list" to view available versions.
echo Type the version you wish to download to download it.
echo You may also type "anxiety" if you feel any anxiety towards updating to a different build/version
::LOLLLLL
set /p w=$ 
::commands
if %w%==anxiety goto anxiety
if %w%==list goto list

::versions
if %w%==P1.18 goto P1.18
if %w%==P1.17 goto 1.17
if %w%==1.18 goto 1.18
if %w%==1.17 goto 1.17
goto fail
::commands

:fail
cls
echo You didnt select a valid version/command.
echo.
goto hom2
:list
cls
echo Currently available versions:
echo 1.17 (and paper, "P1.17")
echo 1.18 (and paper, "P1.18")
echo.
pause
goto home2

:anxiety
echo When upgrading to a more recent version
echo The next version will automaticly convert the world so dont worry.
echo.
echo When converting to a build like paper, it also automaticly
echo Converts to the paper version.
echo.
echo Also all downloads are stable and log4j is patched on all minecraft versions
pause
goto home2

::downloads

:1.18
cls
echo Downloading Mojang 1.18,
echo.
powershell -command "wget https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar -outfile %APPDATA%/EZServer6/serv/lol.jar"
goto eof
:P1.18
cls
echo Downloading Paper 1.18 #187,
echo.
powershell -command "wget https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/187/downloads/paper-1.18.1-187.jar -outfile %APPDATA%/EZServer6/serv/lol.jar"
goto eof
:1.17
cls
echo Downloading Mojang 1.17,
echo.
powershell -command "wget https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar -outfile %APPDATA%/EZServer6/serv/lol.jar"
:P1.17
cls
echo Downloading Paper 1.17 #408,
echo.
powershell -command "wget https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/408/downloads/paper-1.17.1-408.jar -outfile %APPDATA%/EZServer6/serv/lol.jar"
goto eof
