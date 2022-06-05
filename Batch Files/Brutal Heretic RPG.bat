@echo off

set enginePath=..\GZDoom
set /p engineVersion=<%enginePath%/version.txt
set title=Brutal Heretic RPG

:: when using these variables, remember to put a forward slash after them
set iwadsPath=%enginePath%/IWADs
set modsPath=%enginePath%/Mods
set globalPath=%modsPath%/#GLOBAL
set megawadsPath=%iwadsPath%/Megawads

:: when using this variable, remember to put a hyphen after it
set configsPath=%enginePath%/Configs/gzdoom

title %title%

echo %title%
echo by ZDL_800 - https://nzdoom.net/showthread.php?tid=3
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
-iwad 	"%iwadsPath%/HERETIC.wad" ^
-file 	"%modsPath%/Brutal RPG/BrutalHereticRPG_V5.0.pk3" ^
		"%modsPath%/Brutal RPG/H20MUS.wad" ^
		"%enginePath%/lights.pk3" ^
-config "%configsPath%-BrutalRPG.ini"
