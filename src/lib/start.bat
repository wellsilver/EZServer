@echo off
::seperate the cool things?

::TEMPORARY VARIABLES WHILE WAIT FOR SETTINGS
set RAM=1024


::logging?
echo V%launcherv%
echo Time: %time%
echo Version: %h%
echo Extra: %build%
echo.
java -Xmx%RAM%M -Xms%RAM%M -jar lol.jar -nogui
