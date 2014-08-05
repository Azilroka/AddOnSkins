local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end

local select = select
local T, C, L

AddOnSkins_Options = {
-- Embeds
	['EmbedOoC'] = false, 
	['EmbedCoolLine'] = false,
	['EmbedSexyCooldown'] = false,
	['EmbedSystem'] = false,
	['EmbedSystemDual'] = false,
	['EmbedMain'] = 'Skada',
	['EmbedLeft'] = 'Skada',
	['EmbedRight'] = 'Skada',
	['EmbedLeftWidth'] = 200,
	['EmbedBelowTop'] = false,
	['TransparentEmbed'] = false,
-- Misc
	['RecountBackdrop'] = true,
	['SkadaBackdrop'] = true,
	['OmenBackdrop'] = true,
	['MiscFixes'] = true,
	['DBMSkinHalf'] = false,
	['DBMFont'] = 'Tukui',
	['DBMFontSize'] = 12,
	['DBMFontFlag'] = 'OUTLINE',
	['EmbedLeftChat'] = false,
	['WeakAuraAuraBar'] = false,
	['WeakAuraIconCooldown'] = true,
	['AuctionHouse'] = true,
}

function AS:UpdateMedia()
	T, C, L = Tukui:unpack()
	AS.Locale = L
	AS.PixelPerfect = C['General']['InOut']
	AS.HideShadows = C['General']['HideShadows']

	AS.DataTextFontSize = 12 -- T['DataTexts']['Size']
	AS.DataTexts = T['DataTexts']
	AS.InfoLeft = T['Panels']['DataTextLeft']
	AS.InfoRight = T['Panels']['DataTextRight']
	AS.ChatBackgroundRight = T['Panels']['RightChatBG']
	AS.ChatBackgroundLeft = T['Panels']['LeftChatBG']
	AS.TabsRightBackground = T['Panels']['TabsBGRight']
	AS.TabsLeftBackground = T['Panels']['TabsBGLeft']
	AS.Minimap = T['Minimap']
	AS.ActionBar1 = T['ActionBar1']
	AS.ActionBar2 = T['ActionBar2']
	AS.ActionBar3 = T['ActionBar3']
	AS.ActionBar4 = T['ActionBar4']

	AS.GlossTex = C['Medias']['Normal']
	AS.Blank = C['Medias']['Blank']
	AS.NormTex = C['Medias']['Normal']
	AS.GlowTex = C['Medias']['Glow']
	AS.Font = C['Medias']['Font']
	AS.PixelFont = C['Medias']['PixelFont']
	AS.ActionBarFont = C['Medias']['ActionBarFont']
	AS.UIScale = UIParent:GetScale()
	AS.BackdropColor = C['General']['BackdropColor']
	AS.BorderColor = C['General']['BorderColor']
end

function AS:CheckOption(optionName, ...)
	for i = 1, select('#', ...) do
		local addon = select(i, ...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	return AddOnSkins_Options[optionName]
end

function AS:SetOption(optionName, value)
	AddOnSkins_Options[optionName] = value
end

function AS:DisableOption(optionName)
	AS:SetOption(optionName, false)
end

function AS:EnableOption(optionName)
	AS:SetOption(optionName, true)
end

function AS:ToggleOption(optionName)
	AddOnSkins_Options[optionName] = not AddOnSkins_Options[optionName]
end

function AS:Delay(delay, func, ...)
	T.Delay(delay, func, ...)
end

function AS:CreateEmbedSystem()
	if not AS.EmbedSystemCreated then
		local EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
		local EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
		local EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)

		AS:EmbedSystem_WindowResize()

		self:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
		self:RegisterEvent('PLAYER_REGEN_ENABLED', 'EmbedExitCombat')

		EmbedSystem_MainWindow:SetScript('OnShow', AS.Embed_Show)
		EmbedSystem_MainWindow:SetScript('OnHide', AS.Embed_Hide)

		AS:CreateToggleButton('RightToggleButton', '►', AS.InfoRight, AS.ChatBackgroundRight, L.ToggleRightChat, L.ToggleEmbed)
		RightToggleButton:Point('RIGHT', AS.InfoRight, 'RIGHT', -2, 0)

		RightToggleButton:HookScript('OnClick', function(self, button)
			if button == 'RightButton' then
				if EmbedSystem_MainWindow:IsShown() then
					EmbedSystem_MainWindow:Hide()
				else
					EmbedSystem_MainWindow:Show()
				end
			end
		end)

		AS:CreateToggleButton('LeftToggleButton', '◄', AS.InfoLeft, AS.ChatBackgroundLeft, L.ToggleLeftChat, L.ToggleOptions)
		LeftToggleButton:Point('LEFT', AS.InfoLeft, 'LEFT', 2, 0)
		LeftToggleButton:HookScript('OnClick', function(self, button)
			if button == 'RightButton' then
				Enhanced_Config[1]:ToggleConfig()
			end
		end)

		AS.EmbedSystemCreated = true
	end
end

function AS:CreateToggleButton(Name, Text, Panel1, Panel2, TooltipText1, TooltipText2)
	local Frame = CreateFrame('Button', Name, UIParent)
	Frame:SetFrameStrata("DIALOG")
	Frame:SetTemplate('Transparent')
	Frame:Size(17, Panel1:GetHeight() - 4)
	Frame:FontString('Text', AS.ActionBarFont, 12)
	Frame.Text:SetText(Text)
	Frame.Text:SetPoint('CENTER', 0, 1)
	Frame:RegisterForClicks('LeftButtonDown', 'RightButtonDown')
	UIFrameFadeOut(Frame, 0.2, Frame:GetAlpha(), 0)
	Frame:SetScript('OnEnter', function(self, ...)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
		if self.Faded then
			UIFrameFadeIn(Panel1, 0.2, Panel1:GetAlpha(), 1)
			UIFrameFadeIn(Panel2, 0.2, Panel2:GetAlpha(), 1)
			if Name == 'LeftToggleButton' then UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1) end
		end
		GameTooltip:SetOwner(self, Name == 'LeftToggleButton' and 'ANCHOR_TOPLEFT' or 'ANCHOR_TOPRIGHT', 0, 4)
		GameTooltip:ClearLines()
		if IsAddOnLoaded('Tukui_ChatTweaks') and ChatTweaksOptions['ChatHider'] then
			if AS.ChatBackgroundRight then
				GameTooltip:AddDoubleLine('Left Click:', TooltipText1, 1, 1, 1)
			end
		end
		GameTooltip:AddDoubleLine('Right Click:', TooltipText2, 1, 1, 1)
		GameTooltip:Show()
	end)
	Frame:SetScript('OnLeave', function(self, ...)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		if self.Faded then
			UIFrameFadeOut(Panel1, 0.2, Panel1:GetAlpha(), 0)
			UIFrameFadeOut(Panel2, 0.2, Panel2:GetAlpha(), 0)
			if Name == 'LeftToggleButton' then UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0) end
		end
		GameTooltip:Hide()
	end)
end

function AS:EmbedSystem_WindowResize()
	if not AS.ChatBackgroundRight then
		EmbedSystem_MainWindow:SetPoint('BOTTOM', AS.InfoRight, 'TOP', 0, 2)
		EmbedSystem_MainWindow:SetSize(AS.InfoRight:GetWidth(), 142)
	else
		EmbedSystem_MainWindow:SetPoint('BOTTOM', AS.InfoRight, 'TOP', 0, 3)
		EmbedSystem_MainWindow:SetSize(AS.InfoRight:GetWidth(), AS.ChatBackgroundRight:GetHeight() - (AS:CheckOption('EmbedBelowTop') and (AS.InfoRight:GetHeight()*3) - 5 or (AS.InfoRight:GetHeight()*2) - 8))
	end
	EmbedSystem_LeftWindow:SetPoint('RIGHT', EmbedSystem_RightWindow, 'LEFT', -2, 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)
	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth') - 1, EmbedSystem_MainWindow:GetHeight())
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight())

	if Enhanced_Config and Enhanced_Config[1].Options.args.addonskins then
		Enhanced_Config[1].Options.args.addonskins.args.embed.args.EmbedLeftWidth.min = floor(EmbedSystem_MainWindow:GetWidth() * .25)
		Enhanced_Config[1].Options.args.addonskins.args.embed.args.EmbedLeftWidth.max = floor(EmbedSystem_MainWindow:GetWidth() * .75)
	end
end

if AS:CheckAddOn('CoolLine') then
	function AS:Embed_CoolLine()
		if not CoolLineDB.vertical then
			if DuffedUI then
				CoolLine:Point('BOTTOM', AS.ActionBar2, 'TOP', 0, 3)
				CoolLineDB.h = ActionButton1:GetHeight()
				CoolLineDB.w = AS.ActionBar2:GetWidth()
			elseif Tukui then
				local function OnShow()
					CoolLine:Point('BOTTOM', AS.ActionBar4, 'TOP', 0, 1)
					CoolLineDB.h = ActionButton1:GetHeight()
					CoolLineDB.w = AS.ActionBar4:GetWidth()
					CoolLine.updatelook()
				end

				local function OnHide()
					CoolLine:Point('BOTTOM', AS.ActionBar1, 'TOP', 0, 1)
					CoolLineDB.h = ActionButton1:GetHeight()
					CoolLineDB.w = AS.ActionBar1:GetWidth()
					CoolLine.updatelook()
				end

				if AS.ActionBar4:IsShown() then
					OnShow()
				else
					OnHide()
				end
				AS.ActionBar4:HookScript('OnShow', OnShow)
				AS.ActionBar4:HookScript('OnHide', OnHide)
			end
			CoolLine.updatelook()
		end
	end
end

function AS:CreateDataText()
	local DataText = AS["DataTexts"]

	local OnClick = function(self, button)
		if EmbedSystem_MainWindow:IsShown() then
			EmbedSystem_MainWindow:Hide()
		else
			EmbedSystem_MainWindow:Show()
		end
	end

	local Update = function(self)
		local L = AS.Locale
		self.Text:SetText(format('%s %s', L.DataTextToggle, L.DataTextEmbed))
	end

	local OnEnter = function(self)
		local Panel, Anchor, xOff, yOff = self:GetTooltipAnchor()
		GameTooltip:SetOwner(Panel, Anchor, xOff, yOff)
		GameTooltip:ClearLines()
		GameTooltip:AddLine('Left Click to Show')
		GameTooltip:AddLine('Right Click to Hide')
		GameTooltip:Show()
	end

	local Enable = function(self)
		self:RegisterEvent('PLAYER_ENTERING_WORLD')
		self:SetScript('OnEvent', Update)
		self:SetScript('OnMouseDown', OnClick)
		self:SetScript('OnEnter', OnEnter)
		self:SetScript('OnLeave', GameTooltip_Hide)
		self:Update()
	end

	local Disable = function(self)
		self.Text:SetText('')
		self:SetScript('OnEvent', nil)
		self:UnregisterAllEvents()
	end

	DataText:Register('EmbedSystem', Enable, Disable, Update)
end
