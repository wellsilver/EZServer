REM PLUGINS YAY
if not exist %APPDATA%/mcserversimplified/plugins mkdir plugins
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
bitsadmin /transfer "Download worldedit" /download /priority foreground https://dev.bukkit.org/projects/worldedit/files/latest %APPDATA%/mcserversimplified/plugins/worldedit.jar
goto finished

:EssentialsX
if exist %APPDATA%/mcserversimplified/plugins/Essentials.jar goto installedallready
bitsadmin /transfer "Download core" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsX-2.19.2.jar %APPDATA%/mcserversimplified/plugins/worldedit.jar
bitsadmin /transfer "Download chat" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsXChat-2.19.2.jar %APPDATA%/mcserversimplified/plugins/worldedit.jar
bitsadmin /transfer "Download spawn" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsXChat-2.19.2.jar %APPDATA%/mcserversimplified/plugins/worldedit.jar
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
