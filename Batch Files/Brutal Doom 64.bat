@echo off

set enginePath=..\GZDoom
set /p engineVersion=<%enginePath%/version.txt
set title=Brutal Doom 64 v2.5

:: when using these variables, remember to put a forward slash after them
set iwadsPath=%enginePath%/IWADs
set modsPath=%enginePath%/Mods
set globalPath=%modsPath%/#GLOBAL
set megawadsPath=%iwadsPath%/Megawads

:: when using this variable, remember to put a hyphen after it
set configsPath=%enginePath%/Configs/gzdoom

title %title%

echo %title%
echo by Sergeant_Mark_IV - https://www.moddb.com/mods/brutal-doom-64
echo with swc132994's v2.5 Patch - https://www.moddb.com/mods/brutal-doom-64/addons/brutal-doom-64-v2-patched
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
-file 	"%modsPath%/Brutal Doom 64/bd64game_v2.5-OLD_RIFLE.pk3" ^
		"%modsPath%/Brutal Doom 64/bd64maps_v2.5.pk3" ^
		"%modsPath%/Brutal Doom 64/ZBD64_v2_Intro_Music.pk3" ^
		"%modsPath%/Brutal Doom 64/ZD64MUSIC.pk3" ^
		"%enginePath%/lights.pk3" ^
-config "%configsPath%-BrutalDoom.ini"
