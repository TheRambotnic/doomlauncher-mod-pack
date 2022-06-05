@echo off

set enginePath=..\GZDoom
set /p engineVersion=<%enginePath%/version.txt
set title=Embers of Armageddon - Extermination Day

:: when using these variables, remember to put a forward slash after them
set iwadsPath=%enginePath%/IWADs
set modsPath=%enginePath%/Mods
set globalPath=%modsPath%/#GLOBAL
set megawadsPath=%iwadsPath%/Megawads

:: when using this variable, remember to put a hyphen after it
set configsPath=%enginePath%/Configs/gzdoom

title %title%

echo %title%
echo by DoomKrakken - https://www.moddb.com/mods/embers-of-armageddon
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
-file 	"%modsPath%/Embers of Armageddon/EOA Assets.pk3" ^
		"%modsPath%/Embers of Armageddon/EOA Code.pk3" ^
		"%modsPath%/Embers of Armageddon/STR_EOA_Combat_Rating.pk3" ^
		"%modsPath%/Embers of Armageddon/EOA_Keys.pk3" ^
		"%modsPath%/Embers of Armageddon/STR_EOA_D4_Monsters_v1_6_eoa_1.9_fix.pk3" ^
		"%modsPath%/Embers of Armageddon/BDv21_Enhancements_EOA.pk3" ^
		"%modsPath%/Brutal Doom/EdayTest001.pk3" ^
		"%modsPath%/Brutal Doom/EdayMusic001.wad" ^
		"%enginePath%/lights.pk3" ^
-config "%configsPath%-EoA.ini"
