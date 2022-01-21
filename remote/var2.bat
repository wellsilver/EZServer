REM PLUGINS YAY
:pluginz
echo 1. Worldedit
echo 2. EssentialsX bundle
REM submit a pull request to add more!
set /p plugin=$ 
if %plugin% == 1 goto worldedit
goto pluginz

REM PLUGINZ
:worldedit
if exist %APPDATA%/mcserversimplified/plugins/worldedit.jar goto installedallready
bitsadmin /transfer "Download Mojang worldedit" /download /priority foreground https://dev.bukkit.org/projects/worldedit/files/latest %APPDATA%/mcserversimplified/plugins/worldedit.jar
goto finished



:installedallready
cls
echo %plugin% has allready been installed.
pause
goto pluginz

:finished
cls
echo Finished!
echo go back to plugin selection to get more plugins?
echo Y/N
set /p e=$ 
if %e%==Y goto pluginz
if %e%==N goto :eof
goto finished
