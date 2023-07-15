@echo off

set enginePath=..\GZDoom
set /p engineVersion=<%enginePath%/version.txt
set title=Brutal Doom - The Ultimate DOOM

:: when using these variables, remember to put a forward slash after them
set iwadsPath=%enginePath%/IWADs
set modsPath=%enginePath%/Mods
set globalPath=%modsPath%/#GLOBAL
set megawadsPath=%iwadsPath%/Megawads

:: when using this variable, remember to put a hyphen after it
set configsPath=%enginePath%/Configs/gzdoom

title %title%

echo %title%
echo by Sergeant_Mark_IV - https://www.moddb.com/mods/brutal-doom
echo.
echo * Additional addon: Brutal Doom Platinum - https://github.com/EmeraldCoasttt/BrutalDoomPlatinum
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
-file	"%modsPath%/Brutal Doom/BrutalDoomPlatinumv3.1.1.pk3" ^
		"%globalPath%/IDKFAv2.wad" ^
		"%modsPath%/Brutal Doom/HXRTCHUD_FIXED_BDV21.pk3" ^
		"%modsPath%/Brutal Doom/PlatinumRifleReskin.pk3" ^
		"%globalPath%/Damage Indicator.pk3" ^
		"%enginePath%/lights.pk3" ^
-config "%configsPath%-BrutalDoom.ini" ^
+set vid_fps 1
