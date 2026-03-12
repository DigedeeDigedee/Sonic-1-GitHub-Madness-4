REM Custom build process to re-compress all art assets, for space saving$
REM Comment out to do so

REM cls
REM cd "artkos"
REM call recmp.bat
REM cd ..

REM cd "artnem"
REM call recmp.bat
REM cd ..

REM cd "ATOGKSpongeBob"
REM call recmp.bat
REM cd "Objects\Enemy"
REM call recmp.bat
REM cd ..\..\..\

REM cd "ATOGKTitle"
REM cd "Enigma"
REM call recmp.bat
REM cd ..
REM cd "Nemesis"
REM call recmp.bat
REM cd ..\..\

REM cd "conimodes"
REM cd "cold brew"
REM call recmp.bat
REM cd ..
REM cd "fetus"
REM call recmp.bat
REM cd ..
REM cd "splash"
REM call recmp.bat
REM cd ..
REM cd "winxp"
REM call recmp.bat
REM cd ..\..

REM cd "ContinueScreen"
REM cd "Graphics\Tile"
REM cd "Decision"
REM call recmp.bat
REM cd ..
REM cd "GameOver"
REM call recmp.bat
REM cd ..\..\..\..\

REM cd "CrazyRemilia"
REM cd "Remi"
REM call recmp.bat
REM cd ..\..\

REM cd "eurosega"
REM call recmp.bat
REM cd ..

REM cd "hipncoolstuff"
REM cd "ThanatosCredits"
REM call recmp.bat
REM cd ..\..\

REM cd "LiquidSplashes"
REM cd "2kki"
REM call recmp.bat
REM cd ..
REM cd "EagleSoft"
REM call recmp.bat
REM cd ..
REM cd "Rerto"
REM cd "GFX"
REM call recmp.bat
REM cd ..
REM cd "Tilemaps"
REM call recmp.bat
REM cd ..\..\
REM cd "SSRG"
REM call recmp.bat
REM cd ..\..\

REM cd "map16"
REM call recmp.bat
REM cd ..

REM cd "map256"
REM call recmp.bat
REM cd ..

REM cd "segadoodoo"
REM call recmp.bat
REM cd ..

REM cd "SolidSplashes"
REM call recmp.bat
REM cd ..

REM cd "sslayout"
REM call recmp.bat
REM cd ..

REM cd "tilemaps"
REM call recmp.bat
REM cd ..

@ECHO OFF
REM // This file has been gutted and replaced with the Lua build script.
REM // It has been kept around for ease-of-use for Windows users.
"build_tools/Lua/lua.exe" build.lua || pause REM // Pause on Lua parse failure so that the user can read the error message.


