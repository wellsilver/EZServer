@echo off
where java >nul 2>nul
if %errorlevel%==1 (
    echo Java not found
    echo It is required you download java from Oracle
    pause
    goto eof
)


set /a version=6
if not exist %APPDATA%\EZServer6 goto install
call %APPDATA%/EZServer6/var.bat
:home
cls
:hom2
echo.
echo Welcome
echo By using this you agree to Mojangs EULA
echo ver, start
echo.
set /p r=$ 
if %r%==ver goto ver
if %r%==start goto start
goto home
:hom
echo.
echo The server has stopped (read above for more info)
echo If there is a issue do not be afraid to open a issue on the github!
echo.
goto hom2
:ver
::dwnl verlite.bat?
if exist %APPDATA%/EZServer6/bin/bin.bat del %APPDATA%/EZServer6/bin/bin.bat
bitsadmin /transfer "Download" /download /priority foreground https://wellsilver.github.io/a/EZServer/verzionz.bat %APPDATA%/EZServer6/bin/bin.bat
call %APPDATA%/EZServer6/bin/bin.bat
goto home

:start
cls
echo What to do on crash?
echo 1. Log and restart
echo 2. Restart
echo 3. Return home
echo 4. Exit
set /p conf=$ 
for /f %%a in ('powershell Invoke-RestMethod api.ipify.org') do set IP=%%a
if not exist %APPDATA%\EZServer6\serv\lol.jar goto error
copy "%APPDATA%\EZServer6\config" "%APPDATA%\EZServer6\serv 
:strt
cls
echo Launcher: %version%
echo IP: %IP%
echo.
cd %APPDATA%/EZServer6/serv
java -Dlog4j2.formatMsgNoLookups=true -jar lol.jar --nogui
if %conf%==1 goto log
if %conf%==2 goto strt
if %conf%==3 goto hom
goto error
:log
cls
echo Server stopped %TIME% >>%APPDATA%/EZServer6/out/%DATE%.txt
goto strt

:error
echo There was a error
echo This is most likely because..
echo you failed to select a version
pause
goto home

:install

echo Download at %APPDATA%/EZServer6
set /p w=Y/N:
if %w%==N goto eof
::files
mkdir %APPDATA%\EZServer6
mkdir %APPDATA%\EZServer6\bin
mkdir %APPDATA%\EZServer6\out
mkdir %APPDATA%\EZServer6\plugins
mkdir %APPDATA%\EZServer6\config
::config files
powershell -command "wget https://wellsilver.000webhostapp.com/docs/eula.txt -outfile %APPDATA%/EZServer6/config/eula.txt"
powershell -command "wget https://wellsilver.000webhostapp.com/docs/server.properties -outfile %APPDATA%/EZServer6/config/server.properties"
::back to files
mkdir %APPDATA%\EZServer6\serv
mkdir %APPDATA%\EZServer6\world
::check version
echo @echo off>>%APPDATA%\EZServer6\var.bat
echo if %version% GTR 6 goto outdated>>%APPDATA%\EZServer6\var.bat
echo goto eof>>%APPDATA%\EZServer6\var.bat
echo :outdated>>%APPDATA%\EZServer6\var.bat
echo echo This version is outdated->>%APPDATA%\EZServer6\var.bat
echo echo You should enter "reinstall" at the home menu.>>%APPDATA%\EZServer6\var.bat
echo pause>>%APPDATA%\EZServer6\var.bat
goto home
