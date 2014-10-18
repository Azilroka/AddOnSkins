local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end

local E, L, V, P, G, LSM, ES, S
local select = select

function AS:CheckOption(optionName, ...)
	for i = 1, select('#', ...) do
		local addon = select(i, ...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	
	return E.private.addonskins[optionName]
end

function AS:SetOption(optionName, value)
	E.private.addonskins[optionName] = value
end

function AS:ToggleOption(optionName)
	E.private.addonskins[optionName] = not E.private.addonskins[optionName]
end

function AS:DisableOption(optionName)
	AS:SetOption(optionName, false)
end

function AS:EnableOption(optionName)
	AS:SetOption(optionName, true)
end

function AS:InjectProfile()
	E, L, V, P, G = unpack(ElvUI)

	V['addonskins'] = {
	-- Embeds
		['EmbedOoC'] = false, 
		['EmbedOoCDelay'] = 10,
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
		['DBMFont'] = 'ElvUI Norm',
		['DBMFontSize'] = 12,
		['DBMFontFlag'] = 'OUTLINE',
		['EmbedLeftChat'] = false,
		['WeakAuraAuraBar'] = false,
		['WeakAuraIconCooldown'] = true,
		['AuctionHouse'] = true,
		['ParchmentRemover'] = false,
		['IntegrateMyRolePlayTooltip'] = true,
		['SkinTemplate'] = 'Transparent',
		['HideChatFrame'] = 'NONE',
		['SkinDebug'] = false,
	}

	do
		for k, _ in pairs(AS.register) do
			if k:match('.+Skin') then
				if not V['addonskins'][k] then
					V['addonskins'][k] = true
				end
			end
		end
	end
end

function AS:SkinButton(frame, strip)
	S:HandleButton(frame, strip)
end

function AS:SkinScrollBar(frame)
	S:HandleScrollBar(frame)
end

function AS:SkinTab(tab, strip)
	if strip then tab:StripTextures(true) end
	S:HandleTab(tab)
end

function AS:SkinNextPrevButton(frame, horizonal)
	S:HandleNextPrevButton(frame)
end

function AS:SkinRotateButton(btn)
	S:HandleRotateButton(btn)
end

function AS:SkinEditBox(frame, width, height)
	S:HandleEditBox(frame)
	if width then frame:Width(width) end
	if height then frame:Height(height) end
end

function AS:SkinDropDownBox(frame, width)
	S:HandleDropDownBox(frame, width)
end

function AS:SkinCheckBox(frame)
	S:HandleCheckBox(frame)
end

function AS:SkinCloseButton(frame, point)
	S:HandleCloseButton(frame, point)
end

function AS:SkinSlideBar(frame, height, movetext)
	S:HandleSliderFrame(frame)
	if height then
		frame:GetThumbTexture():Size(height-2,height-2)
	end
end

function AS:SkinIconButton(frame, shrinkIcon)
	S:HandleItemButton(frame, shrinkIcon)
	local icon = frame.icon
	if frame:GetName() and _G[frame:GetName()..'IconTexture'] then
		icon = _G[frame:GetName()..'IconTexture']
	elseif frame:GetName() and _G[frame:GetName()..'Icon'] then
		icon = _G[frame:GetName()..'Icon']
	end

	if icon then
		AS:SkinTexture(icon)
	end
end

function AS:UpdateMedia()
	E, L, V, P, G = unpack(ElvUI)

	LSM, ES = AS.LSM, E:GetModule('EnhancedShadows', true)
	AS.SLE = AS:CheckAddOn('ElvUI_SLE')
	S = E:GetModule('Skins')
	AS.Blank = LSM:Fetch('background', 'ElvUI Blank')
	AS.Font = LSM:Fetch('font', E.db.general.font)
	AS.ActionBarFont = LSM:Fetch('font', 'Arial')
	AS.PixelFont = LSM:Fetch('font', 'ElvUI Pixel')
	AS.NormTex = LSM:Fetch('statusbar', E.private.general.normTex)
	AS.GlossTex = LSM:Fetch('statusbar', E.private.general.glossTex)
	AS.GlowTex = LSM:Fetch('border', "ElvUI GlowBorder")
	AS.BackdropColor = E['media'].backdropcolor
	AS.BorderColor = E['media'].bordercolor
	AS.UIScale = UIParent:GetScale()
	AS.PixelPerfect = E.PixelMode
	AS.HideShadows = false

	E:GetModule('DataTexts'):RegisterLDB()
	E:GetModule('DataTexts'):LoadDataTexts()
	E:UpdateMedia()
end

function AS:Delay(delay, func, ...)
	E:Delay(delay, func, ...)
end

function AS:CreateEmbedSystem()
	if not AS.EmbedSystemCreated then
		local EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
		local EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
		local EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)

		EmbedSystem_MainWindow:HookScript('OnShow', AS.Embed_Show)
		EmbedSystem_MainWindow:HookScript('OnHide', AS.Embed_Hide)

		hooksecurefunc(RightChatPanel, 'SetSize', function()
			if ChatHeight ~= E.db.chat.panelHeight or ChatWidth ~= E.db.chat.panelWidth then
				ChatHeight, ChatWidth = E.db.chat.panelHeight, E.db.chat.panelWidth
				AS:Embed_Check()
			end
		end)

		RightChatToggleButton:SetScript('OnClick', function(self, btn)
			if btn == 'RightButton' then
				if not AS:CheckOption('EmbedLeftChat') then
					if EmbedSystem_MainWindow:IsShown() then
						EmbedSystem_MainWindow:Hide()
						if AS:CheckOption('HideChatFrame') ~= 'NONE' then
							_G[AS:CheckOption('HideChatFrame')]:SetAlpha(1)
						end
					else
						EmbedSystem_MainWindow:Show()
						if AS:CheckOption('HideChatFrame') ~= 'NONE' then
							_G[AS:CheckOption('HideChatFrame')]:SetAlpha(0)
						end
					end
				end
			else
				if E.db[self.parent:GetName()..'Faded'] then
					E.db[self.parent:GetName()..'Faded'] = nil
					UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
					UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
				else
					E.db[self.parent:GetName()..'Faded'] = true
					UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
					UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
					self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)

		RightChatToggleButton:HookScript('OnEnter', function(self, ...)
			if not AS:CheckOption('EmbedLeftChat') then
				GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
				GameTooltip:Show()
			end
		end)

		LeftChatToggleButton:SetScript('OnClick', function(self, btn)
			if btn == 'RightButton' then
				if AS:CheckOption('EmbedLeftChat') then
					if EmbedSystem_MainWindow:IsShown() then
						EmbedSystem_MainWindow:Hide()
						if AS:CheckOption('HideChatFrame') ~= 'NONE' then
							_G[AS:CheckOption('HideChatFrame')]:SetAlpha(1)
						end
					else
						EmbedSystem_MainWindow:Show()
						if AS:CheckOption('HideChatFrame') ~= 'NONE' then
							_G[AS:CheckOption('HideChatFrame')]:SetAlpha(0)
						end
					end
				end
			else
				if E.db[self.parent:GetName()..'Faded'] then
					E.db[self.parent:GetName()..'Faded'] = nil
					UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
					UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
				else
					E.db[self.parent:GetName()..'Faded'] = true
					UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
					UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
					self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)

		LeftChatToggleButton:HookScript('OnEnter', function(self, ...)
			if AS:CheckOption('EmbedLeftChat') then
				GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
				GameTooltip:Show()
			end
		end)
		AS.EmbedSystemCreated = true

		AS:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
		AS:RegisterEvent('PLAYER_REGEN_ENABLED', 'EmbedExitCombat')
	end
end

function AS:EmbedSystem_WindowResize()
	if UnitAffectingCombat('player') or not AS.EmbedSystemCreated then return end
	local DataTextSize = AS:CheckOption('EmbedLeftChat') and E.db.datatexts.leftChatPanel and LeftChatDataPanel:GetHeight() or E.db.datatexts.rightChatPanel and RightChatDataPanel:GetHeight() or 0
	local ChatTabSize = AS:CheckOption('EmbedBelowTop') and RightChatTab:GetHeight() or 0
	local Width = E.PixelMode and 6 or 10
	local Height = E.PixelMode and 2 or 4
	local Spacing = E.PixelMode and 6 or 8
	local Total = AS.SLE and (Spacing + ChatTabSize + (E.PixelMode and 3 or 5)) or ((E.PixelMode and 11 or 16) + ChatTabSize + DataTextSize)

	local ChatPanel = AS:CheckOption('EmbedLeftChat') and LeftChatPanel or RightChatPanel

	EmbedSystem_MainWindow:SetParent(ChatPanel)

	EmbedSystem_MainWindow:SetSize(ChatPanel:GetWidth() - Width, ChatPanel:GetHeight() - Total)
	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth'), EmbedSystem_MainWindow:GetHeight())
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight())

	EmbedSystem_LeftWindow:SetPoint('LEFT', EmbedSystem_MainWindow, 'LEFT', 0, 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)
	EmbedSystem_MainWindow:SetPoint('BOTTOM', ChatPanel, 'BOTTOM', 0, (AS.SLE and (Spacing - 1) or (Spacing + DataTextSize)))

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

function AS:CreateDataText()
	DT = E:GetModule('DataTexts')

	local function OnClick(self, button)
		if EmbedSystem_MainWindow:IsShown() then
			EmbedSystem_MainWindow:Hide()
		else
			EmbedSystem_MainWindow:Show()
		end
	end

	local function OnEnter(self)
		DT:SetupTooltip(self)
		DT.tooltip:AddLine(ASL.DataText.LeftClick)
		DT.tooltip:AddLine(ASL.DataText.RightClick)
		DT.tooltip:Show()
	end

	local function OnEvent(self, event)
		self.text:SetText(ASL.DataText.ToggleEmbed)
	end

	DT:RegisterDatatext('AddOnSkins', { 'PLAYER_ENTERING_WORLD' }, OnEvent, nil, OnClick, OnEnter)
end