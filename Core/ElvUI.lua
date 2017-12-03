local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end

local E = unpack(ElvUI)
local pairs, unpack, floor = pairs, unpack, floor
local hooksecurefunc = hooksecurefunc
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut
local IsAddOnLoaded = IsAddOnLoaded
local UnitAffectingCombat = UnitAffectingCombat

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
	AS.Blank = AS.LSM:Fetch('background', 'ElvUI Blank')
	AS.Font = AS.LSM:Fetch('font', E.db.general.font)
	AS.ActionBarFont = AS.LSM:Fetch('font', 'Arial')
	AS.PixelFont = AS.LSM:Fetch('font', 'ElvUI Pixel')
	AS.NormTex = AS.LSM:Fetch('statusbar', E.private.general.normTex)
	AS.BackdropColor = E['media'].backdropcolor
	AS.BorderColor = E['media'].bordercolor
	AS.PixelPerfect = E.PixelMode
	AS.ValueColor = E["media"].rgbvaluecolor
	AS.HideShadows = false

	E:GetModule('DataTexts'):RegisterLDB()
	E:GetModule('DataTexts'):LoadDataTexts()
	E:UpdateMedia()
end
