# Doom Launcher Mods Package
This is a personal repository, and its contents are intended to help you and/or my future self to set up Doom mods and IWADs to run with Doom Launcher via Steam. It includes all the necessary folder structure, custom configuration files and database to get them working. It DOES NOT INCLUDE the Doom Launcher, source ports or any mod files! However, the provided SQLite database file already has a few of those that I've setup personally.

Below is a step-by-step tutorial on how to get Doom Launcher to work with the Steam version of [DOOM (1993)](https://store.steampowered.com/app/2280/DOOM_1993/).

## Setting up Doom Launcher
**1.** Download the ZIP version of [Doom Launcher](https://github.com/nstlaurent/DoomLauncher), go to Steam, right click `DOOM (1993) > Manage > Browse local files` and extract the files inside of it.

**2.** Download the contents of this repository and place them inside of DOOM (1993)'s folder from Step 1.

**3.** Download your source port of choice, open the `Sourceports` folder of this repository, create a new folder with the name of the source port and extract its files inside of it.
* I've setup my Doom Launcher to work with [GZDoom](https://zdoom.org/downloads), [VKDoom](https://vkdoom.org/download) and [DSDA-Doom](https://github.com/kraflab/dsda-doom). As such, the `DoomLauncher.sqlite` file will already have my own configurations for those three. If you're not using any of these, you can delete the folders that came with this repository.

**4.** Download the necessary IWADs from my [Google Drive](https://drive.google.com/drive/folders/1e1fbEjVGYPP10DRqNxhUlgQVdjPGuwqq?usp=sharing) and extract them inside of the `IWADs` folder of this repository.

If you've done everything correctly, the game's folder should look something like this:

![Doom Launcher folder structure](https://i.imgur.com/fqWNHUV.png)

**5.** On Steam, right click `DOOM (1993) > Properties... > General > Launch Options` and type the following command:
```
"PATH_TO_DOOM'S_FOLDER\DoomLauncher.exe" %Command%
```
Replace `PATH_TO_DOOM'S_FOLDER` with the complete path of DOOM (1993)'s folder from Step 1 and that's it! Doom Launcher has been setup to work when launched via Steam. Now let's start configuring it to launch your IWADs and mods.

If you'd like to use the provided `DoomLauncher.sqlite` database, follow [these steps](#using-my-own-doom-launcher-database-file) instead. This will save you a bit of time.

## Configuring a source port
First things first, we need to configure a source port in order to launch any WAD/mod.

Once Doom Launcher is opened, click the hamburger menu icon on the top left corner and click `Source Ports > New`. On the `Executable` field, click `Browse` and then search for the EXE of the source port you've downloaded earlier. You can then give it a custom name that will show up when creating profiles, and if you want your save files to be in a specific folder, you can select it in the `Alt Save Directory` field.

## Creating your own profile
Doom Launcher uses profiles to store all the necessary configuration for each mod/WAD in the SQLite database. If you want to create your own, follow these steps:

**1.** Download the mods/megawads you want from the internet or from [this section](#mods-and-megawads) and extract their files into `Mods` or `IWADs/Megawads`. Remember to create a folder with its name so that it stays organized!

**2.** In Doom Launcher, click the hamburger menu on the top left and then on `Add Files Recursively`. Select the Mods folder and click "OK". Do the same for the Megawads folder.

**3.** In the "Recent" or "Local" tab of Doom Launcher, double click the file you want to use.
* If you don't see these tabs, click the hamburger menu on the top left, then go to `Settings > View > Visible Views` and select them. Hit `Save` once you're done.

**4.** In the Launch window:
- Set **Port** to the source port of your choice
- Set **IWAD** to the required WAD specified by the mod. Most of them use `DOOM2.wad`
- Set **Extra Params** with any parameters you'd like to use for that specific profile. Such as compatibility level, config file, etc.
	- For example, if you're using GZDoom and would like to use my very own config files, use these params:
	```
	-config "PATH_TO_DOOM'S_FOLDER\Sourceports\GZDoom\Configs\NAME_OF_CONFIG_FILE.ini"
	```

	Replace `PATH_TO_DOOM'S_FOLDER` with the complete path of your DOOM (1993)'s installation folder.

	Replace `NAME_OF_CONFIG_FILE.ini` with the file name of the config you wish to use. If it is a vanilla WAD, I recommend using `gzdoom-Vanilla.ini`. If you want to see the ones I've created, go into `Sourceports/GZDoom/Configs`.

	If you want to create your own, you can make a copy of any of the INI files provided and rename them to your liking (I'd recommend using `gzdoom-BrutalDoom.ini` or `gzdoom-EoA.ini` as a template). Remember to set the command above to use the file you've created!

	- If you're running a **vanilla** WAD with GZDoom, add:
	```
	+dmflags 4259840 +compatflags -1172751401 +compatflags2 49673
	```
	These will set the Compatibility Flags to "Doom (strict)". In case you're running a regular/modern mod, there's no need to use them.

	- If you want to use the software renderer for **vanilla** WADs, add:
	```
	+vid_rendermode #
	```
	Replace `#` with either the number `0` (Doom Software Renderer) or `1` (True Color Software Renderer). If you're running a modern mod, there's no need to use it as it'll default to `4` (Hardware Accelerated).

	Make sure all of these commands are in the same line! Otherwise, GZDoom will crash.

- If a mod needs multiple files or if you want to use custom addons, in the **Additional Files / Load Order** section, click the file icon and select the ones you've imported in Step 2.

- Hit `Save Settings` at the bottom when you're done, and then `OK` to start playing.

## Organizing WADs and Mods
In order to make Doom Launcher not look like a complete clusterfuck of files, you can create tabs and add your own WADs/Mods to them. To do this:

**1.** Click the hamburger menu icon on the top left corner, click `Manage Tags` and create the ones you want.

**2.** To add a WAD/Mod to its own tab, go into either the "Recent" or "Local" tab, look for the WAD/mod file you want, right click it, then click `Edit > Tags > Select...` and choose the newly created tag. It'll now show up in a separate tab in Doom Launcher.

**3.** If you want the WAD/mod to show the correct name instead of its file name, right click the file then click on `Edit` and set its name in the `Title` field. Additionally, you can also add the release date, author and a description that will show up when selecting it.

## Using my own Doom Launcher database file
I've included a `DoomLauncher.sqlite` database file which has all of my configs and mods already setup and ready to go. In this section, I'll show you how to use that one instead of having to setup everything yourself.

Download [DB Browser for SQLite](https://sqlitebrowser.org/), open `DoomLauncher.sqlite` with it, go to `Execute SQL` and paste the following commands:
```sql
CREATE TEMP TABLE IF NOT EXISTS Folder (
	DoomPath TEXT NOT NULL
);

INSERT INTO Folder (DoomPath)
VALUES ("PATH_TO_DOOM'S_FOLDER");

UPDATE GameFiles
SET FileName = REPLACE(FileName, "G:\SteamLibrary\steamapps\common\Ultimate Doom", (SELECT DoomPath FROM Folder));

UPDATE SourcePorts
SET Directory = REPLACE(Directory, "G:\SteamLibrary\steamapps\common\Ultimate Doom", (SELECT DoomPath FROM Folder)),
	AltSaveDirectory = REPLACE(Directory, "G:\SteamLibrary\steamapps\common\Ultimate Doom", (SELECT DoomPath FROM Folder));

UPDATE GameProfiles
SET SettingsExtraParams = REPLACE(SettingsExtraParams, "G:\SteamLibrary\steamapps\common\Ultimate Doom", (SELECT DoomPath FROM Folder)),
	SettingsFiles = REPLACE(SettingsFiles, "G:\SteamLibrary\steamapps\common\Ultimate Doom", (SELECT DoomPath FROM Folder)),
	SettingsSpecificFiles = REPLACE(SettingsSpecificFiles, "G:\SteamLibrary\steamapps\common\Ultimate Doom", (SELECT DoomPath FROM Folder));
```

Replace `PATH_TO_DOOM'S_FOLDER` with the complete path of DOOM (1993)'s folder in which you have it installed. Hit `F5` to execute the commands and then `CTRL + S` to save the changes. You can now launch the game through Steam and Doom Launcher will display the files and tabs correctly. Simply double click one, select a profile and hit "OK" to get Doomin'!

**REMINDER:** If you choose to replace the database file with an updated version from the most recent push, YOU WILL LOSE ALL SETTINGS, FOLDER STRUCTURES AND PROFILES THAT YOU'VE CREATED YOURSELF! Although Doom Launcher creates occasional backups of the database, I recommend creating your own backup just in case something goes wrong with your files.

Another thing to note is that if you reinstall DOOM (1993) in a different directory, you'll have to run the SQL script above to update the folder paths in the database again.

## Issues
1. In case you're running a GZDoom game and it opens on any of your monitors besides your primary, open the console and type `vid_adapter #` where `#` is the number of the monitor you wish to use. If you don't know which one it is, press `Windows Key + I` and go to `System > Display`. Usually, the primary monitor should be number 1.

2. Some of the profiles that come with the database might not work for you, since I've organized them in a way that makes more sense to me. If you want to use those profiles, you must first know the exact folder structure. Open DB Browser for SQLite, select the `DoomLauncher.sqlite` file, go to `Execute SQL` and run the following command:
```sql
SELECT
	Name AS 'Profile',
	REPLACE(
		REPLACE(
			SettingsFiles, "PATH_TO_DOOM'S_FOLDER", ''
		), ';', '  -  '
	) AS 'Folder Structure'
FROM GameProfiles;
```

Replace `PATH_TO_DOOM'S_FOLDER` with the complete path of DOOM (1993)'s folder from Step 1 of [this section](#setting-up-doom-launcher) then hit `F5` to execute the command. Expand the "Folder Structure" column and you should see the exact path in which the files need to be. Alter the folders in your directory accordingly.

## Mods and Megawads
Below is a list of mods that I enjoy:
* [Ashes: 2063 - Episode One](https://www.moddb.com/mods/ashes-2063/downloads)
* [Ashes: Afterglow - Episode Two](https://www.moddb.com/mods/ashes-2063/downloads)
* [Brutal Doom Platinum](https://github.com/EmeraldCoasttt/BrutalDoomPlatinum)
	* [Extermination Day](https://www.moddb.com/mods/brutal-doom/forum/thread/extermination-day-beta-001-download)
* [Brutal Doom 64](https://www.moddb.com/mods/brutal-doom-64)
	* [v2.5 Patch](https://www.moddb.com/mods/brutal-doom-64/addons/brutal-doom-64-v2-patched)
	* [DOOM 64 ULTIMATE MUSIC PACK](https://www.moddb.com/mods/brutal-doom-64/addons/the-doom-64-ultimate-music-pack)
* [Brutal Heretic RPG](https://nzdoom.net/showthread.php?tid=3)
* [Brutal Hexen RPG](https://nzdoom.net/showthread.php?tid=2)
* [Brutal Wolfenstein](https://www.moddb.com/mods/brutal-wolfenstein-3d)
* [Doom 64: Retribution](https://www.moddb.com/mods/doom-64-retribution)
* [Embers of Armageddon](https://www.moddb.com/mods/embers-of-armageddon)
* [Lambda](https://www.moddb.com/mods/lambda-for-doom-and-d00m-2)
* [Live Through Doom](https://discord.gg/sAE7jDT)
* [My House](https://www.doomworld.com/forum/topic/134292-myhousewad/)
* [Project Brutality](https://github.com/pa1nki113r/Project_Brutality)
* [Siren](https://www.moddb.com/mods/siren-doom-tc)
* [Wolfenstein 3D TC](https://www.afadoomer.com/wolf3d/downloads.html)

Below is a list of wads/megawads that I enjoy:
* [Ancient Aliens](https://www.doomworld.com/idgames/levels/doom2/Ports/megawads/aaliens)
* [AUGER;ZENITH](https://www.doomworld.com/idgames/levels/doom2/Ports/megawads/dbp37_augzen)
* [Back to Saturn X Episode 1: Get Out Of My Stations](https://www.doomworld.com/forum/topic/62529)
* [Back to Saturn X Episode 2: Tower In The Fountain Of Sparks](https://www.doomworld.com/forum/topic/69960)
* [Eviternity](https://www.doomworld.com/idgames/levels/doom2/Ports/megawads/eviternity)
* [Stardate 20X6](https://www.doomworld.com/idgames/levels/doom2/Ports/s-u/stardate)
* [Stardate 20X7](https://www.doomworld.com/idgames/levels/doom2/Ports/s-u/sd20x7)
* [Sunlust](https://www.doomworld.com/idgames/levels/doom2/Ports/megawads/sunlust)
* [Valiant](https://www.doomworld.com/idgames/levels/doom2/Ports/megawads/valiant)
* [SIGIL + SIGIL II](https://romero.com/sigil)

Below is a list of extra/optional mods that I enjoy:
* [Brutal Doom v21 Monsters Only](https://www.moddb.com/mods/brutal-doom/downloads/bdv21-monsters-only-version)
* [Brutal Doom 64 Monsters Only](https://www.moddb.com/mods/brutal-doom-64/addons/brutal-doom-64-monsters-gzdoom-only)
* [GZSprFix 2.0 (Revenant100's sprite fixes repacked for GZDoom)](https://forum.zdoom.org/viewtopic.php?t=74649)
* [Doom Metal Soundtrack Volume 5](https://www.moddb.com/mods/brutal-doom/downloads/doom-metal-soundtrack-mod-volume-5)
* [IDKFA Soundtrack](https://www.moddb.com/mods/brutal-doom/addons/idkfa-doom-soundtrack)
* [Hitmarkers](https://www.wad-archive.com/wad/782cb71865e196ea2e4c99b27eb7ce292d42f6b4)
* [ZMovement 3.2.1](https://forum.zdoom.org/viewtopic.php?t=65095)
* [Smooth Doom](https://www.doomworld.com/forum/topic/69451-smooth-doom-update-41420/)
* [Alternate Dark Ambient Music Pack](https://www.moddb.com/mods/brutal-doom/addons/alternate-dark-ambient-music-pack)
* [DoomGals Companion Mod](https://s20-tbl.itch.io/doomgals)
* [Plutonia MIDI Pack](https://www.doomworld.com/idgames/music/plutmidi)
	* [Plutonia MIDI Pack Metal Cover](https://mega.nz/#!rt9lWQ5S!KigeOsjGNqQntAc60HKLV95MloqhBIMjRUz0R2nDiNI)
* [Tilt++](https://forum.zdoom.org/viewtopic.php?t=55413)
* [HXRTC HUD Platinum](https://github.com/FelesNoctis/HXRTCHUD_Platinum)
* [Damage Indicator](https://www.moddb.com/mods/qol-power-trip/addons/damage-indicator1)
* [Bolognese Gore Mod](https://www.moddb.com/mods/brutal-doom/downloads/bolognese-gore-mod-v20)