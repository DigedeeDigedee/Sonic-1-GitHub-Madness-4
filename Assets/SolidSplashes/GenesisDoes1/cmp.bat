cls
call KENSSharp.exe -c n FG_tiles.unc FG_tiles.nem
call KENSSharp.exe -c e FG_map.unc FG_map.eni
copy /y FG_tiles.nem "..\..\..\SolidSplashes\Art - GenesisDoes1.nem
copy /y FG_map.eni "..\..\..\SolidSplashes\Map - GenesisDoes1.eni
copy /y pal.bin "..\..\..\SolidSplashes\Pal - GenesisDoes1.bin
pause