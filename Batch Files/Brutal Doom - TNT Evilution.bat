@echo off

set enginePath=..\GZDoom
set /p engineVersion=<%enginePath%/version.txt
set title=Brutal Doom (v21 Gold) - TNT Evilution

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
echo * Additional addon: Customized "Dox778" Standalone BDV21 Mod - https://www.moddb.com/mods/brutal-doom/downloads/customized-dox778-standalone-bdv21-mod
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
-iwad 	"%iwadsPath%/TNT.wad" ^
-file	"%modsPath%/Brutal Doom/Dox778sPersonalizedBrutalDoom_V15.pk3" ^
		"%globalPath%/DoomMetalVol5.wad" ^
		"%modsPath%/Brutal Doom/brutalv21ADSpatch.pk3" ^
		"%modsPath%/Brutal Doom/HXRTCHUD_FIXED_BDV21.pk3" ^
		"%modsPath%/Brutal Doom/DoxsBrutalDeagle_FIXED_SPAWNER_V15.pk3" ^
		"%modsPath%/Brutal Doom/DoxsRevolver_FIXED_SPAWNER_V15.pk3" ^
		"%modsPath%/Brutal Doom/Various_Fixes_for_Doxs_V15.pk3" ^
		"%modsPath%/Brutal Doom/PlatinumRifleReskin.pk3" ^
		"%globalPath%/TiltPlusPlus v1.65.pk3" ^
		"%globalPath%/Damage Indicator.pk3" ^
		"%enginePath%/lights.pk3" ^
-config "%configsPath%-BrutalDoom.ini" ^
+set vid_fps 1
