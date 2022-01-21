REM THIS MAY NOT BE WHAT IS ACTUALLY REMOTELY, IT IS (AND SHOULD BE) VERY SIMILAR.
REM I can use archive.org to easily find the original jar files its backed up all the way to 2016
REM original jars [no prefix]
if %i%==1.18 bitsadmin /transfer "Download Mojang 1.18" /download /priority foreground https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar %APPDATA%/mcserversimplified/prim/jar.jar


REM paper (may be outdated lol) [P before begining]
if %i%==P1.18 bitsadmin /transfer "Download paper 1.18#167" /download /priority foreground https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/167/downloads/paper-1.18.1-167.jar %APPDATA%/mcserversimplified/prim/jar.jar



REM About bukkit and spigot, they dont provide any kind of direct link and this causes alot of issues
REM There is a possible workaround though, just using the buildtools to build them normally, I know that for sure this will require some extra work but it might actually work?
