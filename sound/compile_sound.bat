@echo off
rem Build all 3 files
call compiler_functions\compile_file.bat Music
call compiler_functions\compile_file.bat SFX
call compiler_functions\compile_file.bat SFX_Special
pause
