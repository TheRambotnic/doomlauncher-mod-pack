@echo off

set enginePath=..\GZDoom
set /p engineVersion=<%enginePath%/version.txt
set title=Project Brutality 3.0 (W.I.P) - The Ultimate DOOM

:: when using these variables, remember to put a forward slash after them
set iwadsPath=%enginePath%/IWADs
set modsPath=%enginePath%/Mods
set globalPath=%modsPath%/#GLOBAL
set megawadsPath=%modsPath%/#Megawads

:: when using this variable, remember to put a hyphen after it
set configsPath=%enginePath%/Configs/gzdoom

title %title%

echo %title%
echo by PA1NKI113R - https://github.com/pa1nki113r/Project_Brutality
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
-file 	"%modsPath%/Project Brutality/Project_Brutality.pk3" ^
		"%globalPath%/DoomMetalVol5.wad" ^
		"%enginePath%/lights.pk3" ^
-config "%configsPath%-ProjectBrutality.ini"
