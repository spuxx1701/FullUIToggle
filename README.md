# FullUIToggle

## Description
This addon was built for the WoW the 1.12 Client and is supposed to help with taking better screenshots! It works similar to the default UI Toggle (that is bound to Alt+Z by default), but also hides overhead player or NPC names.

## How to use it
Download this repository by clicking on Code -> Download ZIP. Extract the archive to your game's Interface folder and remove the -master from the folder name.
Afterwards, start up your game and bind the addon's hotkey `FullUIToggle` to a key of your liking. I like to override the game's default UI Toggle Hotkey and bind it to Alt+Z (or Alt+Y because I play on a QUERTY keyboard). When hiding the UI, the addon will remember your current interface settings regarding NPC and player names (specifically the values of `UnitNameOwn`, `UnitNameNPC` and `UnitNamePlayer`) and restore them when showing the UI again.

## Final note
If you quit the game while having the UI hidden, unit names will be not visible after restarting the game and you will have to re-enable your