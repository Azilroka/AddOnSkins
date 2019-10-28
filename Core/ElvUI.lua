local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end
local E

-- Cache global variables
--Lua functions
local pairs = pairs
--WoW API / Variables
-- GLOBALS:

local ElvUISkinTable = {
	["Blizzard_AchievementUI"] = { 'achievement' },
	["Blizzard_AddonManager"] = { 'addonManager' },
	["Blizzard_ArchaeologyUI"] = { 'archaeology' },
	["Blizzard_AuctionHouse"] = { 'auctionhouse' },
	["Blizzard_Bags"] = { 'bags' },
	["Blizzard_BlackMarket"] = { 'bmah' },
	["Blizzard_BarberShop"] = { 'barber' },
	["Blizzard_Calendar"] = { 'calendar' },
	["Blizzard_ChallengesUI"] = { 'lfg'},
	['Blizzard_CharacterFrame'] = { 'character' },
	["Blizzard_Collections"] = { 'collections' },
	["Blizzard_DeathRecap"] = { 'deathRecap' },
	["Blizzard_DebugTools"] = { 'debug' },
	["Blizzard_DressUpFrame"] = { 'dressingroom' },
	["Blizzard_EncounterJournal"] = { 'encounterjournal' },
	["Blizzard_Friends"] = { 'friends' },
	["Blizzard_Garrison"] = { 'garrison' },
	["Blizzard_Gossip"] = { 'gossip' },
	["Blizzard_Guild"] = { 'gbank', 'guild', 'guildcontrol', 'guildregistrar' },
	["Blizzard_Inspect"] = { 'inspect' },
	["Blizzard_ItemSocketing"] = { 'socket' },
	["Blizzard_LootFrames"] = { 'loot' },
	["Blizzard_MacroUI"] = { 'macro' },
	["Blizzard_Mail"] = { 'mail' },
	["Blizzard_Merchant"] = { 'merchant' },
	["Blizzard_Options"] = { 'misc'},
	["Blizzard_PvE"] = { 'lfg' },
	["Blizzard_PVPUI"] = { 'pvp' },
	["Blizzard_Quest"] = { 'quest' },
	["Blizzard_RaidUI"] = { 'raid' },
	["Blizzard_Spellbook"] = { 'spellbook' },
	["Blizzard_StackSplit"] = { 'misc' },
	["Blizzard_Talent"] = { 'talent' },
	["Blizzard_Taxi"] = { 'taxi' },
	["Blizzard_TimeManager"] = { 'timemanager' },
	["Blizzard_TradeSkill"] = { 'tradeskill' },
	["Blizzard_TradeWindow"] = { 'trade' },
	["Blizzard_Trainer"] = { 'trainer' },
	["Blizzard_VoidStorage"] = { 'voidstorage' },
	["Blizzard_WorldMap"] = { 'worldmap' },
	["Blizzard_Others"] = { 'misc' },
}

function AS:SetElvUIBlizzardSkinOption(skin, value)
	if ElvUISkinTable[skin] then
		for _, option in pairs(ElvUISkinTable[skin]) do
			E.private.skins.blizzard[option] = value
		end
	end
end

function AS:GetElvUIBlizzardSkinOption(skin)
	if ElvUISkinTable[skin] then
		for _, option in pairs(ElvUISkinTable[skin]) do
			if E.private.skins.blizzard[option] == true then
				return true
			end
		end
	end
	return false
end

function AS:UpdateMedia()
	if not ElvUI then return end
	if not E then
		E = unpack(ElvUI)
	end

	AS.Blank = AS.LSM:Fetch('background', 'ElvUI Blank')
	AS.Font = AS.LSM:Fetch('font', E.db.general.font)
	AS.NormTex = AS.LSM:Fetch('statusbar', E.private.general.normTex)
	AS.BackdropColor = E['media'].backdropcolor
	AS.BorderColor = E['media'].bordercolor
	AS.Color = E["media"].rgbvaluecolor or AS.ClassColor
	AS.HideShadows = false

	AS.TexCoords = {0, 1, 0, 1}
	local modifier = 0.04 * _G.ElvUI[1].db.general.cropIcon
	for i, v in ipairs(AS.TexCoords) do
		if i % 2 == 0 then
			AS.TexCoords[i] = v - modifier
		else
			AS.TexCoords[i] = v + modifier
		end
	end
end
