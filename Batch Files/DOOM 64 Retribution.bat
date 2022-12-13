@echo off

set enginePath=..\GZDoom
set /p engineVersion=<%enginePath%/version.txt
set title=DOOM 64: Retribution

:: when using these variables, remember to put a forward slash after them
set iwadsPath=%enginePath%/IWADs
set modsPath=%enginePath%/Mods
set globalPath=%modsPath%/#GLOBAL
set megawadsPath=%iwadsPath%/Megawads

:: when using this variable, remember to put a hyphen after it
set configsPath=%enginePath%/Configs/gzdoom

title %title%

echo %title%
echo by Nevander - https://www.moddb.com/mods/doom-64-retribution
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
-iwad 	"%iwadsPath%/DOOM2.wad" ^
-file 	"%modsPath%/Doom 64 TC/D64RTR[v1.5].wad" ^
		"%modsPath%/Doom 64 TC/D64RTR_BRIGHTMAPS.pk3" ^
-config "%configsPath%-__Vanilla__.ini" ^
+set dmflags 4259840 ^
+set compatflags -1172751421 ^
+set compatflags2 523 ^
+set vid_rendermode 1 ^
+set vid_fps 1
