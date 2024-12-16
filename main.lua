local mod = RegisterMod("Custom Coop Ghosts", 1)
local game = Game()

-------------------
--  GHOST SKINS  --
-------------------

local ghostSkinPath = "gfx/characters/ghost/base/ghost_"
local ghostCostumePath = "gfx/characters/ghost/ghost_"
local moddedPath = "gfx/characters/ghost/modded/ghost_"
local coopGhostFile = "gfx/characters/coop_ghost.anm2"
local supportedCustomChars = {
	["Andromeda"] = { "andromeda" },
	["Arachna"] = { "arachna", "arachna_hair" },
	["Bertran"] = { "bertran" },
	["Charon"] = { "charon", "charon_hair" },
	["China"] = { "china", "chair_horns" },
	["Dante"] = { "", "dante_hair" },
	["Deleted"] = { "deleted_HAPPY99" },
	["Duke"] = { "duke" },
	["Edith"] = { "edith", "edith_cloak" },
	["Fiend"] = { "fiend", "fiend_horns" },
	["Godhead"] = { "godhead" },
	["Golem"] = { "golem" },
	["Henry"] = { "henry" },
	["Hollow"] = { "hollow" },
	["Job"] = { "", "job_rags" },
	["Mammon"] = { "mammon", "mammon_hair" },
	["Mastema"] = { "mastema", "mastema_horns" },
	["Icarus"] = { "", "icarus_hair" },
	["Mei"] = { "mei", "mei_hair" },
	["Samael"] = { "samael", "samael_hood" },
	["Sarah"] = { "sarah", "sarah_hair" },
	["Slippy"] = { "slippy" },
	["Stranger"] = { "thestranger" },
	["Steven"] = { "steven" },
	["Zach"] = { "zacchaeus", "zacchaeus_hair" },
}
local supportedCustomTainteds = {
	["AndromedaB"] = { "andromeda_b" },
	["Arachna"] = { "arachna_b", "arachna_b_hair" },
	["DukeB"] = { "duke_b" },
	["Fiend"] = { "fiend_b", "fiend_b_horns" },
	["Edith"] = { "edith_b", "edith_b_cloak" },
	["Deleted"] = { "deleted_b" },
	["Decayed"] = { "decayed" },
	["Henry"] = { "henry", "henry_b_halo" },
	["Job"] = { "job_b", "job_b_cloak" },
	["MastemaB"] = { "mastema_b", "mastema_b_horns" },
	["Tainted Mei"] = { "mei_b", "mei_b_hair" },
	["Tainted Zach"] = { "zacchaeus_b", "zacchaeus_b_blindfold" },
	["Tainted Stranger"] = { "thestranger_b" },
}

---@type table<PlayerType, string>
local coopGhostSkinPath = {
	--NORMAL
	--Isaac
	--Maggy
	--Cain
	--Judas
	[PlayerType.PLAYER_XXX] = "bluebaby",
	--Eve
	--Samson
	[PlayerType.PLAYER_AZAZEL] = "black",
	--Laz
	--Eden
	[PlayerType.PLAYER_THELOST] = "thelost",
	--Laz2
	[PlayerType.PLAYER_BLACKJUDAS] = "shadow",
	[PlayerType.PLAYER_LILITH] = "black_blind",
	[PlayerType.PLAYER_KEEPER] = "keeper",
	[PlayerType.PLAYER_APOLLYON] = "apollyon",
	[PlayerType.PLAYER_THEFORGOTTEN] = "theforgotten",
	[PlayerType.PLAYER_THESOUL] = "theforgotten",
	--Bethany
	--Jacob
	[PlayerType.PLAYER_ESAU] = "red",
	--TAINTED
	--BIsaac
	--BMaggy
	--BCain
	[PlayerType.PLAYER_JUDAS_B] = "shadow",
	[PlayerType.PLAYER_XXX_B] = "bluebaby_b",
	--BEve
	--BSamson
	[PlayerType.PLAYER_AZAZEL_B] = "black",
	--BLaz
	[PlayerType.PLAYER_EDEN_B] = "eden_b",
	[PlayerType.PLAYER_THELOST_B] = "grey",
	--BLaz2
	[PlayerType.PLAYER_LILITH_B] = "black_blind",
	[PlayerType.PLAYER_KEEPER_B] = "keeper",
	[PlayerType.PLAYER_APOLLYON_B] = "apollyon_b",
	[PlayerType.PLAYER_THEFORGOTTEN_B] = "thesoul_b",
	[PlayerType.PLAYER_THESOUL_B] = "thesoul_b",
}

---@type table<PlayerType, string>
local coopGhostCostumePath = {
	--NORMAL
	--Isaac
	[PlayerType.PLAYER_MAGDALENA] = "magdalene_hair",
	[PlayerType.PLAYER_CAIN] = "cain_eyepatch",
	[PlayerType.PLAYER_JUDAS] = "judas_fez",
	--Blue Baby
	[PlayerType.PLAYER_EVE] = "eve_hair",
	[PlayerType.PLAYER_SAMSON] = "samson_hair",
	[PlayerType.PLAYER_AZAZEL] = "azazel_hair",
	[PlayerType.PLAYER_LAZARUS] = "lazarus_hair",
	[PlayerType.PLAYER_EDEN] = "eden_hair",
	--The Lost
	[PlayerType.PLAYER_LAZARUS2] = "lazarus_risen_hair",
	--Dark Judas
	[PlayerType.PLAYER_LILITH] = "lilith_hair",
	--Keeper
	--Apollyon
	--The Forgotten
	--The Soul
	[PlayerType.PLAYER_BETHANY] = "bethany_hair",
	[PlayerType.PLAYER_JACOB] = "jacob_hair",
	[PlayerType.PLAYER_ESAU] = "esau_hair",
	--TAINTED
	[PlayerType.PLAYER_ISAAC_B] = "isaac_b_scars",
	[PlayerType.PLAYER_MAGDALENA_B] = "magdalene_b_hair",
	[PlayerType.PLAYER_CAIN_B] = "cain_b_eyepatch",
	[PlayerType.PLAYER_JUDAS_B] = "judas_b_fez",
	--BBlue Baby
	[PlayerType.PLAYER_EVE_B] = "eve_b_hair",
	[PlayerType.PLAYER_SAMSON_B] = "samson_b_hair",
	[PlayerType.PLAYER_AZAZEL_B] = "azazel_b_hair",
	[PlayerType.PLAYER_LAZARUS_B] = "lazarus_b_hair",
	--BEden
	[PlayerType.PLAYER_THELOST_B] = "thelost_b_cobweb",
	[PlayerType.PLAYER_LILITH_B] = "lilith_b_hair",
	[PlayerType.PLAYER_KEEPER_B] = "keeper_b_face",
	--BApollyon, handled via rendered animation
	[PlayerType.PLAYER_THEFORGOTTEN_B] = "theforgotten_b",
	[PlayerType.PLAYER_THESOUL_B] = "theforgotten_b",
	[PlayerType.PLAYER_BETHANY_B] = "bethany_b_hair",
	[PlayerType.PLAYER_JACOB_B] = "jacob_b_hair",
	[PlayerType.PLAYER_LAZARUS2_B] = "lazarus_risen_b_hair",
	[PlayerType.PLAYER_JACOB2_B] = "jacob2_b_hair",
}

---@type table<PlayerType, string>
local coopGhostAnimatedHair = {
	[PlayerType.PLAYER_APOLLYON_B] = ghostCostumePath .. "apollyon_b_void.anm2"
}

---------------------
--  API FUNCTIONS  --
---------------------

_G.CustomCoopGhost = {} --Global for other mods to detect

---@param playerType PlayerType
---@param ghostSkin string
function CustomCoopGhost.ChangeSkin(playerType, ghostSkin)
	if playerType ~= nil
		and playerType ~= -1
		and type(playerType) == "number"
		and ghostSkin ~= nil
		and type(ghostSkin) == "string"
	then
		coopGhostSkinPath[playerType] = ghostSkin
	end
end

---@param playerType PlayerType
---@param ghostCostume string
function CustomCoopGhost.AddCostume(playerType, ghostCostume)
	if playerType ~= nil
		and playerType ~= -1
		and type(playerType) == "number"
		and ghostCostume ~= nil
		and type(ghostCostume) == "string"
	then
		coopGhostCostumePath[playerType] = ghostCostume
	end
end

---@param playerType PlayerType
---@param ghostAnm2 string
function CustomCoopGhost.AddAnimatedCostume(playerType, ghostAnm2)
	if playerType ~= nil
		and playerType ~= -1
		and type(playerType) == "number"
		and ghostAnm2 ~= nil
		and type(ghostAnm2) == "string"
	then
		coopGhostAnimatedHair[playerType] = ghostAnm2
	end
end

-----------------------
--  REST OF THE MOD  --
-----------------------

---@param filePath string
---@param prefix string
---@param suffix string
local function getFilePath(filePath, prefix, suffix)
	if not filePath or filePath == "" then
		return ""
	elseif string.sub(filePath, 1, 4) == "gfx/" then
		return filePath
	else
		return prefix .. filePath .. suffix
	end
end

---@param player EntityPlayer
---@param offset Vector
function mod:renderAnimatedCostumes(player, offset)
	local playerType = player:GetPlayerType()

	if coopGhostAnimatedHair[playerType] ~= nil
		and player:IsCoopGhost()
	then
		local data = player:GetData()
		local sprite = player:GetSprite()
		local fullGhostCostumePath = getFilePath(coopGhostAnimatedHair[playerType], ghostCostumePath, ".anm2")
		local anims = {
			["Hit"] = true,
			["HeadLeft"] = true,
			["HeadDown"] = true,
			["HeadRight"] = true,
			["HeadUp"] = true,
			["GhostAppear"] = true,
			["LostDeath"] = true,
		}
		local animToPlay = anims[sprite:GetAnimation()] ~= nil and sprite:GetAnimation() or nil
		if not data.CoopGhostAnimatedHairSprite then
			data.CoopGhostAnimatedHairSprite = Sprite()
			data.CoopGhostAnimatedHairSprite:Load(fullGhostCostumePath, true)

			if animToPlay ~= nil then
				data.CoopGhostAnimatedHairSprite:Play(animToPlay, true)
			end
			data.CoopGhostAnimatedHairSprite.PlaybackSpeed = 0.5
		elseif animToPlay ~= nil then
			local screenpos = Isaac.WorldToRenderPosition(player.Position)
			local posOffset = Vector(player.PositionOffset.X, player.PositionOffset.Y * 1.25) --Floating uses PositionOffset but even then it doesn't match up when used 1:1
			local headAnims = {
				["HeadLeft"] = true,
				["HeadDown"] = true,
				["HeadRight"] = true,
				["HeadUp"] = true,
			}

			if headAnims[sprite:GetAnimation()] then
				if sprite:GetFrame() == 2 then
					animToPlay = animToPlay .. "_Shoot"
				end
				data.CoopGhostAnimatedHairSprite:SetAnimation(animToPlay, false)
			end

			if game:IsPaused() and data.CoopGhostAnimatedHairSprite:IsPlaying(data.CoopGhostAnimatedHairSprite:GetAnimation()) then
				data.CoopGhostAnimatedHairSprite:Stop()
			elseif not game:IsPaused() and not data.CoopGhostAnimatedHairSprite:IsPlaying(animToPlay) then
				data.CoopGhostAnimatedHairSprite:Play(animToPlay, true)
			end

			data.CoopGhostAnimatedHairSprite:Render(screenpos + posOffset + offset, Vector.Zero, Vector.Zero)

			if not player:HasEntityFlags(EntityFlag.FLAG_INTERPOLATION_UPDATE) then
				data.CoopGhostAnimatedHairSprite:Update()
			end
		end
	end
end

---@param player EntityPlayer
local function addCoopGhostCostume(player)
	local sprite = player:GetSprite()
	local playerType = player:GetPlayerType()
	local data = player:GetData()

	if coopGhostCostumePath[playerType] ~= nil then
		local fullGhostCostumePath = getFilePath(coopGhostCostumePath[playerType], ghostCostumePath, ".png")

		if not data.CoopGhostSkinUpdated then
			sprite:Load(coopGhostFile, true)
		end

		sprite:ReplaceSpritesheet(2, fullGhostCostumePath)
		sprite:LoadGraphics()
	end
end

---@param player EntityPlayer
local function addSupportedModdeds(player)
	local normal = Isaac.GetPlayerTypeByName(player:GetName(), false)
	local tainted = Isaac.GetPlayerTypeByName(player:GetName(), true)

	if normal ~= -1 and player:GetPlayerType() == normal and supportedCustomChars[player:GetName()] ~= nil then
		local skinPath = getFilePath(supportedCustomChars[player:GetName()][1], moddedPath, ".png")
		local costumePath = getFilePath(supportedCustomChars[player:GetName()][2], moddedPath, ".png")

		if skinPath ~= "" then
			coopGhostSkinPath[normal] = skinPath
		end

		if costumePath ~= nil and costumePath ~= "" then
			coopGhostCostumePath[normal] = costumePath
		end
	elseif tainted ~= -1 and player:GetPlayerType() == tainted and supportedCustomTainteds[player:GetName()] ~= nil then
		local skinPath = getFilePath(supportedCustomTainteds[player:GetName()][1], moddedPath, ".png")
		local costumePath = getFilePath(supportedCustomTainteds[player:GetName()][2], moddedPath, ".png")

		if skinPath ~= "" then
			coopGhostSkinPath[tainted] = skinPath
		end

		if costumePath ~= nil and costumePath ~= "" then
			coopGhostCostumePath[tainted] = costumePath
		elseif tainted == Isaac.GetPlayerTypeByName("AndromedaB", true) then
			coopGhostAnimatedHair[tainted] = "gfx/characters/ghost/modded/andromeda_b_head.anm2"
		end
	end
end

---@param player EntityPlayer
local function replaceCoopGhostSpritesheet(player)
	local data = player:GetData()
	local sprite = player:GetSprite()
	local playerType = player:GetPlayerType()

	if coopGhostSkinPath[playerType] ~= nil then
		local fullGhostSkinPath = getFilePath(coopGhostSkinPath[playerType], ghostSkinPath, ".png")
		if playerType == Isaac.GetPlayerTypeByName("Deleted", false) and theDeletedMode ~= nil then
			fullGhostSkinPath = getFilePath("deleted_" .. theDeletedMode, moddedPath, ".png")
		end
		sprite:Load(coopGhostFile, true)
		sprite:ReplaceSpritesheet(0, fullGhostSkinPath)
		sprite:ReplaceSpritesheet(1, fullGhostSkinPath)
		sprite:LoadGraphics()
		data.CoopGhostSkinUpdated = true
	end
	addCoopGhostCostume(player)
	data.CoopGhostSpriteUpdated = playerType
end

---@param player EntityPlayer
function mod:detectCoopGhost(player)
	local playerType = player:GetPlayerType()
	local data = player:GetData()

	if player:IsCoopGhost()
		and (coopGhostSkinPath[playerType] ~= nil
			or coopGhostCostumePath[playerType] ~= nil)
		and not data.CoopGhostSpriteUpdated then
		return true
	end
	return false
end

function mod:initCoopGhost(player)
	local sprite = player:GetSprite()
	local playerType = player:GetPlayerType()
	local data = player:GetData()

	if (
			supportedCustomChars[player:GetName()]
			or supportedCustomTainteds[player:GetName()]
		)
		and (
			coopGhostSkinPath[playerType] == nil
			and coopGhostCostumePath[playerType] == nil
		)
	then
		addSupportedModdeds(player)
	end

	if data.CoopGhostSpriteUpdated ~= nil
		and playerType ~= data.CoopGhostSpriteUpdated
	then
		data.CoopGhostSpriteUpdated = playerType
		local anim = sprite:GetAnimation()
		local frame = sprite:GetFrame()
		replaceCoopGhostSpritesheet(player)
		sprite:SetFrame(anim, frame)
		sprite:Play(anim, false)
	end

	if mod:detectCoopGhost(player) then
		replaceCoopGhostSpritesheet(player)
		sprite:Play("GhostAppear", true)
	elseif not player:IsCoopGhost() then
		if data.CoopGhostSpriteUpdated then
			data.CoopGhostSpriteUpdated = nil
		end
		if data.CoopGhostSkinUpdated then
			data.CoopGhostSkinUpdated = nil
		end
		if data.CoopGhostAnimatedHairSprite then
			data.CoopGhostAnimatedHairSprite = nil
		end
	end
end

mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, function()
	for i = 0, Game():GetNumPlayers() - 1 do
		local player = Isaac.GetPlayer(i)
		if player:IsCoopGhost() then
			replaceCoopGhostSpritesheet(player)
		end
	end
end)
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, mod.initCoopGhost)
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, mod.renderAnimatedCostumes)
