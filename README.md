# GZDoom Mods Package
This is a personal repository, and its contents are intended to help you and/or my future self to set up GZDoom mods and IWADs to run with Doom Launcher via Steam. It includes the latest version of GZDoom along with all the necessary folder structure, custom configuration files and database to get them working. It **DOES NOT INCLUDE** the Doom Launcher or any mod files!

Below is a step-by-step tutorial on how to get Doom Launcher to work with the Steam version of [DOOM (1993)](https://store.steampowered.com/app/2280/DOOM_1993/).

## Contents
1. [Setting up Doom Launcher](#setting-up-doom-launcher)
2. [Creating your own profile](#creating-your-own-profile)
3. [Important information about the database](#important-information-about-the-database)
4. [Mods and Megawads](#mods-and-megawads)
5. [Issues](#issues)

## Setting up Doom Launcher
**1.** Download the ZIP version of [Doom Launcher](https://github.com/nstlaurent/DoomLauncher), go to Steam, right click `DOOM (1993) > Manage > Browse local files` and extract the files inside of it.

**2.** Download the contents of this repository and place them inside of DOOM (1993)'s folder from Step 1.

**3.** Download the necessary IWADs from my [Google Drive](https://drive.google.com/drive/folders/1e1fbEjVGYPP10DRqNxhUlgQVdjPGuwqq?usp=sharing) and extract them inside of `GZDoom/IWADs`.

**4.** Download the mods/megawads you want from [this section](#mods-and-megawads), go to `GZDoom/Mods`, create a folder with the name of the mod you've downloaded and place the files inside.

If done correctly, the game's folder should look like this:

![Doom Launcher folder structure](https://i.imgur.com/O7PpAuD.png)

**5.** On Steam, right click `DOOM (1993) > Properties... > General > Launch Options` and type the following command:
```
"PATH_TO_DOOM'S_FOLDER\DoomLauncher.exe" %Command%
```
Replace `PATH_TO_DOOM'S_FOLDER` with the complete path of DOOM (1993)'s folder from Step 1.

**6.** Download [DB Browser for SQLite](https://sqlitebrowser.org/), open `DoomLauncher.sqlite` with it, go to `Execute SQL` and type the following commands:
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

Replace `PATH_TO_DOOM'S_FOLDER` with the complete path of DOOM (1993)'s folder from Step 1, hit `F5` to execute the commands and then `CTRL + S` to save the changes.

**That's it!** You can now launch the game through Steam and Doom Launcher will display the files and tabs correctly. Simply double click one, hit "OK" and get Doomin'!

## Creating your own profile
Doom Launcher uses profiles to store all the necessary configuration for each mod/WAD in the SQLite database. If you want to create your own, follow these steps:

**1.** Download the mods/megawads you want from the internet and extract their files into `GZDoom/Mods` or `GZDoom/IWADs/Megawads`. Remember to create a folder with its name so that it stays organized!

**2.** On Doom Launcher, click the hamburger menu on the top left and then on "Add Files Recursively". Select the Mods folder inside of GZDoom and click "OK". Do the same for the Megawads folder.

**3.** In the "Recent" or "Local" tab of Doom Launcher, double click the file you want to use.
> If you don't see these tabs, click the hamburger menu on the top left, then go to `Settings > View > Visible Views` and select them. Hit `Save` once you're done.

**4.** In the Launch window:
- Set **Port** to GZDoom
- Set **IWAD** to the required WAD specified by the mod. Most of them use `DOOM2.wad`
- Set **Extra Params** with the following commands:
	- If you want to use the provided config files, use:
	```
	-config "PATH_TO_DOOM'S_FOLDER\GZDoom\Configs\NAME_OF_CONFIG_FILE.ini"
	```

	Replace `PATH_TO_DOOM'S_FOLDER` with the complete path of DOOM (1993)'s folder from Step 1 of [this section](#setting-up-doom-launcher).

	Replace `NAME_OF_CONFIG_FILE.ini` with the file name of the config you wish to use. If it is a vanilla WAD, I recommend using `gzdoom-Vanilla.ini`.

	If you want to create your own, you can make a copy of any of the INI files provided and rename them to your liking. Remember to set the command above to use the file you've created!

	- If you're running a **vanilla** WAD, add:
	```
	+dmflags 4259840 +compatflags -1172751405 +compatflags2 523
	```
	These will set the Compatibility Flags to "Doom (strict)". In case you're running a regular/modern mod, there's no need to use them.

	- If you want to use GZDoom's FPS counter, add:
	```
	+vid_fps 1
	```

	- If you want to use the software renderer for **vanilla** WADs, add:
	```
	+vid_rendermode #
	```
	Replace `#` with either `0` (Doom Software Renderer) or `1` (True Color Software Renderer). If you're running a modern mod, there's no need to use it as it'll default to `4` (Hardware Accelerated).

	> Make sure all of these commands are in the same line! Otherwise, GZDoom will crash. Hit `Save Settings` once you're done.

- If a mod needs multiple files or if you want to use custom addons:
	- In the **Additional Files / Load Order** section, click the file icon and select the ones you've imported in Step 2.

**That's it!** You now have everything fully set up to run your games.

### The following steps are **OPTIONAL**. Only follow them if you want to organize your files
**5.** In case you want to rename the file with which a profile is linked to, right click it and hit `Edit`. Set **Title** to the name of the mod/WAD.

**6.** If you want to create a separate tab for each of your mods/WADs, click the hamburger menu in the top left and then on `Manage Tags > Add`, type the name you want and hit "OK". (Make sure that "Show Tab" is set to "Yes")

**7.** Right click the mod/WAD you want, click `Edit > Tags > Select...` and choose the newly created tag. It'll now show up in a separate tab in Doom Launcher.

## Important information about the database
The provided `DoomLauncher.sqlite` database file contains all of my own personal profiles and settings and is intended to be used ONLY ONCE as a template for your first time setting up Doom Launcher. If you choose to replace this file with an updated version from the most recent push, **YOU WILL LOSE ALL SETTINGS AND PROFILES THAT YOU'VE CREATED YOURSELF!**.

Although Doom Launcher creates occasional backups of the database, I recommend creating your own backup ***just in case*** something goes wrong with your files.

Another thing to note is that if you reinstall DOOM (1993) in a different directory, you'll have to update the folder paths in the database as well.

## Mods and Megawads
Below is a list of mods that I enjoy:
* [Ashes: 2063 - Episode One](https://www.moddb.com/mods/ashes-2063/downloads)
* [Ashes: Afterglow - Episode Two](https://www.moddb.com/mods/ashes-2063/downloads)
* [Brutal Doom Platinum](https://github.com/EmeraldCoasttt/BrutalDoomPlatinum)
	* [Extermination Day](https://www.moddb.com/mods/brutal-doom/forum/thread/extermination-day-beta-001-download)
* [Brutal Doom 64](https://www.moddb.com/mods/brutal-doom-64)
	* [v2.5 Patch](https://www.moddb.com/mods/brutal-doom-64/addons/brutal-doom-64-v2-patched)
* [Brutal Heretic RPG](https://nzdoom.net/showthread.php?tid=3)
* [Brutal Hexen RPG](https://nzdoom.net/showthread.php?tid=2)
* [Brutal Wolfenstein](https://www.moddb.com/mods/brutal-wolfenstein-3d)
* [Doom 64: Retribution](https://www.moddb.com/mods/doom-64-retribution)
* [Embers of Armageddon](https://www.moddb.com/mods/embers-of-armageddon)
* [Lambda](https://www.moddb.com/mods/lambda-for-doom-and-d00m-2)
* [Live Through Doom](https://discord.gg/sAE7jDT)
* [My House](https://www.doomworld.com/forum/topic/134292-myhousewad/)
* [Project Brutality](https://github.com/pa1nki113r/Project_Brutality)
* [Wolfenstein 3D TC](https://www.afadoomer.com/wolf3d/downloads.html)

Below is a list of megawads that I enjoy:
* [Back to Saturn X Episode 1: Get Out Of My Stations](https://www.doomworld.com/forum/topic/62529)
* [Back to Saturn X Episode 2: Tower In The Fountain Of Sparks](https://www.doomworld.com/forum/topic/69960)
* [Eviternity](https://www.doomworld.com/idgames/levels/doom2/Ports/megawads/eviternity)
* [Stardate 20X6](https://www.doomworld.com/idgames/levels/doom2/Ports/s-u/stardate)
* [Stardate 20X7](https://www.doomworld.com/idgames/levels/doom2/Ports/s-u/sd20x7)
* [Sunlust](https://www.doomworld.com/idgames/levels/doom2/Ports/megawads/sunlust)
* [Valiant](https://www.doomworld.com/idgames/levels/doom2/Ports/megawads/valiant)

Below is a list of **extra/optional** mods that I enjoy:
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
* [Tilt++](https://forum.zdoom.org/viewtopic.php?t=55413)
* [HXRTC HUD Platinum](https://github.com/FelesNoctis/HXRTCHUD_Platinum)
* [Damage Indicator](https://www.moddb.com/mods/qol-power-trip/addons/damage-indicator1)

## Issues
1. In case the game opens on any of your monitors besides your primary, open the console and type `vid_adapter #` where `#` is the number of the monitor you wish to use. If you don't know which one it is, press `Windows Key + I` and go to `System > Display`. Usually, the primary monitor should be number 1.

2. Some of the profiles that come with the database might not work for you, since I've organized them in a way that makes more sense to me. If you want to use those profiles, you must first know the exact folder structure. Open DB Browser for SQLite, select the `DoomLauncher.sqlite` file, go to `Execute SQL` and run the following command:
```sql
SELECT
	Name AS 'Profile',
	REPLACE(
		REPLACE(
			SettingsFiles, "PATH_TO_DOOM'S_FOLDER", ''
		), ';', '   ---   '
	) AS 'Folder Structure'
FROM GameProfiles
WHERE Name IN ('NAME_OF_PROFILE');
```

Replace `PATH_TO_DOOM'S_FOLDER` with the complete path of DOOM (1993)'s folder from Step 1 of [this section](#setting-up-doom-launcher) and `NAME_OF_PROFILE` with the exact name of the profile listed in the Megawads/Mods tab, hit `F5` to execute the command and then `CTRL + S` to save the changes.
> If the profiles are not showing up, run the following command to list all of the available profiles:
> ```sql
> SELECT Name FROM GameProfiles
> ```
> Replace `NAME_OF_PROFILE` in the previous command with the result of the command you just executed. If you want to use multiple at once, surround them in single quotes and separate them by commas inside of the parenthesis in the previous command.

Expand the "Folder Structure" column and you should see the exact path in which the files need to be. Alter the folders in your directory accordingly.