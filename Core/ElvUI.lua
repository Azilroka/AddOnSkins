local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end

local E, L
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

function AS:UpdateMedia()
	E, L = unpack(ElvUI)

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

function AS:EmbedSystemHooks()
	hooksecurefunc(E:GetModule('Chat'), 'PositionChat', function(self, override)
		if override then
			AS:Embed_Check()
		end
	end)
	hooksecurefunc(E:GetModule('Layout'), 'ToggleChatPanels', function() AS:Embed_Check() end)

	if RightChatToggleButton and LeftChatToggleButton then
		RightChatToggleButton:RegisterForClicks('AnyDown')
		RightChatToggleButton:SetScript('OnClick', function(self, btn)
			if btn == 'RightButton' then
				if AS:CheckOption('EmbedRightChat') then
					if EmbedSystem_MainWindow:IsShown() then
						AS:SetOption('EmbedIsHidden', true)
						EmbedSystem_MainWindow:Hide()
					else
						AS:SetOption('EmbedIsHidden', false)
						EmbedSystem_MainWindow:Show()
					end
				end
			else
				if E.db[self.parent:GetName()..'Faded'] then
					E.db[self.parent:GetName()..'Faded'] = nil
					UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
					UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
					if AS:CheckOption('EmbedRightChat') and not AS:CheckOption('EmbedIsHidden') then
						EmbedSystem_MainWindow:Show()
					end
				else
					E.db[self.parent:GetName()..'Faded'] = true
					UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
					UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
					self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)

		RightChatToggleButton:HookScript('OnEnter', function(self, ...)
			if AS:CheckOption('EmbedRightChat') then
				GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
				GameTooltip:Show()
			end
		end)

		LeftChatToggleButton:RegisterForClicks('AnyDown')
		LeftChatToggleButton:SetScript('OnClick', function(self, btn)
			if btn == 'RightButton' then
				if not AS:CheckOption('EmbedRightChat') then
					if EmbedSystem_MainWindow:IsShown() then
						AS:SetOption('EmbedIsHidden', true)
						EmbedSystem_MainWindow:Hide()
					else
						AS:SetOption('EmbedIsHidden', false)
						EmbedSystem_MainWindow:Show()
					end
				end
			else
				if E.db[self.parent:GetName()..'Faded'] then
					E.db[self.parent:GetName()..'Faded'] = nil
					UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
					UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
					if not AS:CheckOption('EmbedRightChat') and not AS:CheckOption('EmbedIsHidden') then
						EmbedSystem_MainWindow:Show()
					end
				else
					E.db[self.parent:GetName()..'Faded'] = true
					UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
					UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
					self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)

		LeftChatToggleButton:HookScript('OnEnter', function(self, ...)
			if not AS:CheckOption('EmbedRightChat') then
				GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
				GameTooltip:Show()
			end
		end)

		function HideLeftChat()
			LeftChatToggleButton:Click()
		end

		function HideRightChat()
			RightChatToggleButton:Click()
		end

		function HideBothChat()
			LeftChatToggleButton:Click()
			RightChatToggleButton:Click()
		end
	end
end

function AS:EmbedSystem_WindowResize()
	if UnitAffectingCombat('player') or not AS.EmbedSystemCreated then return end
	local ChatPanel = AS:CheckOption('EmbedRightChat') and RightChatPanel or LeftChatPanel
	local ChatTab = AS:CheckOption('EmbedRightChat') and RightChatTab or LeftChatTab
	local ChatData = AS:CheckOption('EmbedRightChat') and RightChatDataPanel or LeftChatToggleButton
	local TopRight = ChatData == RightChatDataPanel and (E.db.datatexts.rightChatPanel and 'TOPLEFT' or 'BOTTOMLEFT') or ChatData == LeftChatToggleButton and (E.db.datatexts.leftChatPanel and 'TOPLEFT' or 'BOTTOMLEFT')
	local yOffset = (ChatData == RightChatDataPanel and E.db.datatexts.rightChatPanel and (E.PixelMode and 1 or 0)) or (ChatData == LeftChatToggleButton and E.db.datatexts.leftChatPanel and (E.PixelMode and 1 or 0)) or (E.PixelMode and 0 or -1)

	EmbedSystem_MainWindow:SetParent(ChatPanel)
	EmbedSystem_MainWindow:ClearAllPoints()
	EmbedSystem_MainWindow:SetPoint('BOTTOMLEFT', ChatData, TopRight, 0, yOffset)
	EmbedSystem_MainWindow:SetPoint('TOPRIGHT', ChatTab, AS:CheckOption('EmbedBelowTop') and 'BOTTOMRIGHT' or 'TOPRIGHT', 0, AS:CheckOption('EmbedBelowTop') and -1 or 0)
	
	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth'), EmbedSystem_MainWindow:GetHeight())
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight())

	EmbedSystem_LeftWindow:SetPoint('LEFT', EmbedSystem_MainWindow, 'LEFT', 0, 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)

	-- Dynamic Range
	if IsAddOnLoaded('ElvUI_Config') then
		E.Options.args.addonskins.args.embed.args.EmbedLeftWidth.min = floor(EmbedSystem_MainWindow:GetWidth() * .25)
		E.Options.args.addonskins.args.embed.args.EmbedLeftWidth.max = floor(EmbedSystem_MainWindow:GetWidth() * .75)
	end
end

if AS:CheckAddOn('CoolLine') then
	function AS:Embed_CoolLine()
		if not CoolLineDB.vertical then
			CoolLine:SetPoint('BOTTOMRIGHT', ElvUI_Bar1, 'TOPRIGHT', 0, 4)
			CoolLine:SetPoint("BOTTOMLEFT", ElvUI_Bar1, "TOPLEFT", 0, 4)
		end
	end
end
