@echo off
::copy paste lol

@echo off
REM PLUGINS YAY
rem also, some users may have .ps1 disabled so it would be very difficult to use wget

:pluginz
cls
echo Extra cmd: "exit" "del"
echo 1. Worldedit
echo 2. EssentialsX bundle
echo 3. Luckperms
REM submit a pull request to add more!
set /p plugin=$ 
if %plugin% == 1 goto worldedit
if %plugin% == 2 goto EssentialsX
if %plugin% == 3 goto luckperms

if %plugin% == del goto delete
if %plugin% == exit goto :eof
goto pluginz

REM PLUGINZ
:worldedit
if exist %APPDATA%/EZServer5/plugins/worldedit.jar goto installedallready
bitsadmin /transfer "Download worldedit" /download /priority foreground https://github.com/wellsilver/test/releases/download/e/worldedit-mod-7.2.8.jar %APPDATA%/EZServer5/plugins/worldedit.jar
rem bukkit is so convenient
rem Unlike others, *intense staring at "buildtools"*
pause
goto finished

:EssentialsX
if exist %APPDATA%/EZServer5/plugins/Essentials.jar goto installedallready
bitsadmin /transfer "Download core" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsX-2.19.2.jar %APPDATA%/EZServer5/plugins/essentials.jar
bitsadmin /transfer "Download chat" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsXChat-2.19.2.jar %APPDATA%/EZServer5/plugins/essentialsC.jar
bitsadmin /transfer "Download spawn" /download /priority foreground https://github.com/EssentialsX/Essentials/releases/download/2.19.2/EssentialsXSpawn-2.19.2.jar %APPDATA%/EZServer5/plugins/essentialsS.jar
goto finished
:EssentialsXdel

:luckperms
if exist %APPDATA%/EZServer5/plugins/luckperms.jar goto installedallready
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
if exist %APPDATA%/EZServer5/plugins/worldedit.jar echo 1. Worldedit
if exist %APPDATA%/EZServer5/plugins/essentials.jar echo 2. EssentialsX bundle
if exist %APPDATA%/EZServer5/plugins/luckperms.jar echo 3. Luckperms
set /p delplugin=$ 
if %delplugin% == 1 del %APPDATA%\EZServer5\plugins\worldedit.jar
if %delplugin% == 2 goto EssentialsXDEL
if %delplugin% == 3 del %APPDATA%\EZServer5\plugins\luckperms.jar
if %delplugin% == back goto pluginz
goto delete
:EssentialsXDEL
del %APPDATA%\EZServer5\plugins\essentials.jar
del %APPDATA%\EZServer5\plugins\essentialsC.jar
del %APPDATA%\EZServer5\plugins\essentialsS.jar
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
