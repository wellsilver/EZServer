@echo off
::THIS IS NOT A PORTABLE VERSION
if not exist EZServerlite goto inst


:inst
echo Download at %APPDATA%/EZServerlite
set /p w=Y/N:
if %w%=N goto eof
