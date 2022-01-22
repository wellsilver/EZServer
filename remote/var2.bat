REM PLUGINS YAY
rem also, some users may have .ps1 disabled so it would be very difficult to use wget

if not exist %APPDATA%/mcserversimplified/plugins mkdir plugins
:pluginz
echo Extra cmd: "Exit"-Duh "Del"-delete
echo 1. Worldedit
echo 2. EssentialsX bundle
echo 3. Luckperms
REM submit a pull request to add more!
set /p plugin=$ 
if %plugin% == 1 goto worldedit
if %plugin% == 2 goto EssentialsX
if %plugin% == 3 goto luckperms

if %plugin% == del goto delete
if %plugin% == Exist goto :eof
goto pluginz

REM PLUGINZ
:worldedit
if exist %APPDATA%/mcserversimplified/plugins/worldedit.jar goto installedallready
bitsadmin /transfer "Download worldedit" /download /priority foreground https://dev.bukkit.org/projects/worldedit/files/latest %APPDATA%/mcserversimplified/plugins/worldedit.jar
rem bukkit is so convenient
rem Unlike others, *intense staring at "buildtools"*
goto finished

:EssentialsX
if exist %APPDATA%/mcserversimplified/plugins/Essentials.jar goto installedallready
bitsadmin /transfer "Download core" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsX-2.19.2.jar %APPDATA%/mcserversimplified/plugins/essentials.jar
bitsadmin /transfer "Download chat" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsXChat-2.19.2.jar %APPDATA%/mcserversimplified/plugins/essentialsC.jar
bitsadmin /transfer "Download spawn" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsXSpawn-2.19.2.jar %APPDATA%/mcserversimplified/plugins/essentialsS.jar
goto finished
:EssentialsXdel

:luckperms
if exist %APPDATA%/mcserversimplified/plugins/luckperms.jar goto installedallready
bitsadmin /transfer "Download luckperms bukkit5.3.98" /download /priority foreground https://ci.lucko.me/job/LuckPerms/1398/artifact/bukkit/loader/build/libs/LuckPerms-Bukkit-5.3.98.jar %APPDATA%/mcserversimplified/plugins/luckperms.jar
goto finished
:installedallready
cls
echo %plugin% has allready been installed.
pause
goto pluginz

:delete
cls
echo What plugin would you like to delete? (back to go back)
if exist %APPDATA%/mcserversimplified/plugins/worldedit.jar echo 1. Worldedit
if exist %APPDATA%/mcserversimplified/plugins/essentials.jar echo 2. EssentialsX bundle
if exist %APPDATA%/mcserversimplified/plugins/luckperms.jar echo 3. Luckperms
set /p delplugin=$ 
if %delplugin% == 1 del %APPDATA%/mcserversimplified/plugins/worldedit.jar
if %delplugin% == 2 goto EssentialsXDEL
if %delplugin% == 3 del %APPDATA%/mcserversimplified/plugins/luckperms.jar
if %delplugin% == back goto pluginz
goto delete
:EssentialsXDEL
del %APPDATA%/mcserversimplified/plugins/essentials.jar
del %APPDATA%/mcserversimplified/plugins/essentials.jar
del %APPDATA%/mcserversimplified/plugins/essentials.jar
goto delete
:finished
cls
echo Finished!
echo go back to plugin selection to get more plugins?
echo Y/N
set /p e=$ 
if %e%==Y goto pluginz
if %e%==N goto :eof
goto finished
