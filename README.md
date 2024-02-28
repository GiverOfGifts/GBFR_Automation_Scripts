# GBFR Hacky Automation Scripts

These are the scripts I wrote for myself to automate some farming aspects of GBFR.

Some of the scripts (see below) utilize PixelGetColor to check certain pixels for certain colors, allowing to for example recognize that the "Continue playing this quest?" prompt is on screen and subsequently handling it.

As a result, the scripts that utilize this (`Slimepede_Repeat` and `Repeat_Quest`) only work on a 3440x1440 resolution. For other resolutions you will have to change the pixels and colors the script looks for. I'm not sure whether the [resolution fix by Lyall](https://github.com/Lyall/GBFRelinkFix/tree/v1.0.4) is required but I haven't run my scripts without it and I highly recommend using that mod anyway if you're on ultrawide.

## Setup

You'll have to install [AHK](https://www.autohotkey.com/download/). Be sure to get a version that supports AHKv2 scripts.

Load the script you want to run by double-clicking it. You should have an icon for it in the system tray.

All scripts use `Shift+Escape` as an emergency abort. They're all started with `F1` and stopped with `Shift+F1`. Some of them have a fairly long routine (namely `Slimepede`) so just use abort.

### Wrightstone Seller

First off, I highly recommend installing the mod https://www.nexusmods.com/granbluefantasyrelink/mods/83?tab=description.

Script only works correctly on 60+ fps.

Then follow the following steps:

1. Lock all stones you intend to keep.
2. Set the filter to only show unlocked stones.
3. Go to the end of the list, i.e. the stone furthest down.
4. Press `F1` to start the script.
5. Press `Shift+F1` to stop it. The script will finish its current cycle (i.e. finish one more full sale).

### Repeat Quest

This script should work on all FPS settings, but I recommend setting your game to 30 fps if you're gonna afk grind to save electricity.

1. Go into the quest you want to grind.
2. Activate the script with `F1`.
3. Press `Shift+F1` to stop it.

The script will spam click through the clear screen and recognize when the "Continue playing this quest?" prompt is up and select yes.

### Repeat Slimepede Eugen

This script is intended to be used with Eugen, as on a proper setup he should oneshot most slimes. I regularly get **170 - 190 slime kills** with him using this script.

The script will spam click through the clear screen and recognize when the "Continue playing this quest?" prompt is up and select yes.
It also walks forward with Eugen to a spot where he can reach the slimes in the back where the prismatic slimes' spawnpoint is. It pause buffers at the start of each quest to sync with random load times.

This script only works on 30 fps because of a racy button spam. Might fix this at some point but I haven't had it not work on 30 fps.

1. Go into the slime quest.
2. Activate the script with `F1` asap.
3. Press `Shift+F1` to stop it. Note that this will have the script run until the start of the next slime quest. If you want to quit right away, use `Shift+Escape` to abort the script.
