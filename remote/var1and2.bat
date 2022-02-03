@echo off
:a
cls
echo A stable version has been released-
echo Goto releases page?
set /p e=Y/N: 
if %e%==Y start https://github.com/wellsilver/EZServer/releases
if %e%==N goto a
goto a
