@echo off
REM why? This is because the free hoster limits bandwith so I need to download the files from their source

REM original jars [no prefix]

REM paper (may be outdated lol) [P before begining]
if %i%==P1.18 bitsadmin /transfer "Download Paper1.18#140" /download /priority foreground /api/v2/projects/paper/versions/1.18.1/builds/140/downloads/paper-1.18.1-140.jar
if %i%==P1.18.1 bitsadmin /transfer "Download Paper1.18#140" /download /priority foreground /api/v2/projects/paper/versions/1.18.1/builds/140/downloads/paper-1.18.1-140.jar
REM spigot (may be outdated lol)[s before begginging]