@echo off
cls
echo A stable version has been released-
echo N Will bring you to the original
echo Y Will bring you to the github releases page
echo Keep in mind pre 1.0(internally dubbed "5")versions are no longer supported.
set /p e=Y/N: 
if %e%==N goto b
start https://github.com/wellsilver/EZServer/releases
:b
::original here
