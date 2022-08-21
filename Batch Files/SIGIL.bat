@echo off

set enginePath=..\GZDoom
set /p engineVersion=<%enginePath%/version.txt
set title=SI6IL

:: when using these variables, remember to put a forward slash after them
set iwadsPath=%enginePath%/IWADs
set modsPath=%enginePath%/Mods
set globalPath=%modsPath%/#GLOBAL
set megawadsPath=%iwadsPath%/Megawads

:: when using this variable, remember to put a hyphen after it
set configsPath=%enginePath%/Configs/gzdoom

title %title%

echo %title%
echo by John Romero - https://romero.com/
echo.
echo Running on %engineVersion%
echo.
echo.

:: Use the caret (^) as a delimiter in case you want the parameters on different lines
:: -iwad 	= Path to IWAD for GZDoom to use (can be commercial, shareware or freedoom)
:: -file 	= Path to files, addons or mods to use
:: -config 	= Path to user config (.ini) file
:: +set 	= Set console variables on startup
cd
%enginePath%\gzdoom.exe ^
-iwad 	"%iwadsPath%/DOOM.wad" ^
-file 	"%iwadsPath%/SIGIL.wad" ^
		"%globalPath%/D1SPFX19.wad" ^
-config "%configsPath%-__Vanilla__.ini" ^
+set dmflags 4259840 ^
+set compatflags -1172751421 ^
+set compatflags2 523 ^
+set vid_rendermode 0
