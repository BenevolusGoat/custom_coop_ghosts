-----------------------------
Custom Co-op Ghosts v1.0
-----------------------------

Custom Co-op Ghosts is a mod that resolves the issue of every player ghost looking the same in a co-op game. Every character has been given their respective costumes that set them apart, custom-made for the smaller sprites!
All characters are supported, including the ability to add your own! Below is a guide on how to add your own co-op ghosts to the mod for your custom characters, or additionally, changing the look of the "vanilla" game's characters.

-----------------------------------------------------------------------

1) Make your sprites! 

-Decide what you want for your character. You can add an additional sprite layer to your ghost, referred to as "hair", and/or change the base skin of your ghost. 
-Go to resources/gfx/characters. This is where you'll find the template for the base skin and hair. 
-By default the skin is white, so don't make a new skin if you don't need to.
-When you're done, be sure to remove the colored background.

-----------------------------------------------------------------------

2) Correct naming and file directory

This step is obsolete as of the latest update. You can simply put your files whereever you want and name them as you wish. However, this method is still viable as explained in step 3 if you don't mind going by a preset directory and name.

-All  your sprites must go in a "ghost" folder, making this file path: resources/gfx/characters/ghost
-All files must have the prefix "ghost_"
-Hair pngs go inside the ghost folder. Skin pngs go inside a folder called "base" inside the ghost folder, so resources/gfx/characters/ghost/base

-----------------------------------------------------------------------

3) Actually adding the character's ghost

-A full example of code you would see to make your character compatible with this mod is described below:

local mod = RegisterMod("MyCharacter", 1) --Registering your mod as usual

local myPlayerType = Isaac.GetPlayerTypeByName("Character", false) --Grabbing the PlayerType of your character, first with their name and then if they're a Tainted character or not with true/false
local fileName = "character"

function mod:addCustomCoopGhostCompatibility()
      if CustomCoopGhost then
            CustomCoopGhost.ChangeSkin(myPlayerType, fileName)
            CustomCoopGhost.AddCostume(myPlayerType, fileName) --Optional if your character needs it
      end
end
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, mod.addCustomCoopGhostCompatibility)

-As of the latest update, the string for the name of your custom co-op ghost sprite (fileName in the example above) doesn't need the follow the rule of step #2. If you use a string that starts with "gfx/", the mod will simply follow the full length of the filepath you specify instead (e.g. if fileName was "gfx/characters/costumes/character_lilbabbyboobop.png"). Otherwise, the code will default to how it previously went about it below:

-For both the name of the skin and hair png, you just need to put the name of the file excluding the "ghost_" and ".png" (e.g. calling "ghost_thelost.png" would just need you to put "thelost").
-You can take advantage of existing bases and costumes if you wish, all names of which are located in this mod's files.

-----------------------------------------------------------------------

4) Test your character's ghost!

-Start as your character! If you have the debug console disabled, simply connect a controller and add a player, then kill the character you want to test.
-With the debug console, simply add another player via "addplayer" without the quotes followed by a space, and the ID of a character. "addplayer 0" adds Isaac, 1 adds Maggy, etc. For Modded characters, this ID starts at 41 but changes per character depending on how many you have and the order they're loaded in.
-Again in the console, type "lua Isaac.GetPlayer(0):Die()" without the quotes. This will kill the first player instantly. Isaac.GetPlayer(1) will kill the second player, and so on.
-If all is well, it should work fine! If not, re-check your file paths, png names, etc.

-----------------------------------------------------------------------

5) Animated costume!

There is now CustomCoopGhost.AddAnimatedCostume. Same as the other functions, insert your PlayerType and a string. However, this string must be an anm2 file. Tainted Apollyon is the only character with this feature, so you can reference their own anm2 to create your own.

Example: CustomCoopGhost.AddAnimatedCostume(PlayerType.PLAYER_APOLLYON_B, "gfx/characters/ghost/apollyon_b_void.anm2")