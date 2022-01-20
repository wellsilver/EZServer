REM THIS MAY NOT BE WHAT IS ACTUALLY REMOTELY, IT IS (AND SHOULD BE) VERY SIMILAR.

REM original jars [no prefix]
if %i%==1.18 bitsadmin /transfer "Download 1.18" /download /priority foreground https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar %APPDATA%/mcserversimplified/prim/jar.jar
REM paper (may be outdated lol) [P before begining]
if %i%==P1.18 bitsadmin /transfer "Download Laper 1.18#140" /download /priority foreground https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/140/downloads/paper-1.18.1-140.jar %APPDATA%/mcserversimplified/prim/jar.jar
