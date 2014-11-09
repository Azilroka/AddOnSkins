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
		['EmbedRightChat'] = true,
		['EmbedLeftWidth'] = 200,
		['EmbedBelowTop'] = false,
		['EmbedIsHidden'] = false,
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
		['WeakAuraAuraBar'] = false,
		['WeakAuraIconCooldown'] = true,
		['AuctionHouse'] = true,
		['SkinTemplate'] = 'Transparent',
		['HideChatFrame'] = 'NONE',
		['SkinDebug'] = false,
	}

	do
		for k, _ in pairs(AS.register) do
			if not V['addonskins'][k] then
				if strfind(k, 'Blizzard_') then
					V['addonskins'][k] = false
				else
					V['addonskins'][k] = true
				end
			end
		end
		V['addonskins']['ParchmentRemover'] = false
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

function AS:SkinNextPrevButton(Button)
	Button:SetTemplate()
	Button:Size(Button:GetWidth() - 7, Button:GetHeight() - 7)
	
	Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.81, 0.65, 0.29, 0.65, 0.81)

	if Button:GetPushedTexture() then
		Button:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.81, 0.65, 0.35, 0.65, 0.81)
	end

	if Button:GetDisabledTexture() then
		Button:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)
	end
	
	Button:GetNormalTexture():ClearAllPoints()
	Button:GetNormalTexture():SetInside()

	if Button:GetDisabledTexture() then
		Button:GetDisabledTexture():SetAllPoints(Button:GetNormalTexture())
	end
	
	if Button:GetPushedTexture() then
		Button:GetPushedTexture():SetAllPoints(Button:GetNormalTexture())
	end
	
	Button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
	Button:GetHighlightTexture():SetAllPoints(Button:GetNormalTexture())
end

function AS:SkinRotateButton(btn)
	S:HandleRotateButton(btn)
end

function AS:SkinEditBox(frame, width, height)
	S:HandleEditBox(frame)
	if width then frame:Width(width) end
	if height then frame:Height(height) end
	if frame.Left then
		frame.Left:Kill()
		frame.Middle:Kill()
		frame.Right:Kill()
	end
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
	AS.BackdropColor = E['media'].backdropcolor
	AS.BorderColor = E['media'].bordercolor
	AS.UIScale = UIParent:GetScale()
	AS.PixelPerfect = E.PixelMode
	AS.HideShadows = false

	E:GetModule('DataTexts'):RegisterLDB()
	E:GetModule('DataTexts'):LoadDataTexts()
	E:UpdateMedia()
end

function AS:CreateEmbedSystem()
	if not AS.EmbedSystemCreated then
		local EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
		local EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
		local EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)

		EmbedSystem_MainWindow:HookScript('OnShow', AS.Embed_Show)
		EmbedSystem_MainWindow:HookScript('OnHide', AS.Embed_Hide)

		hooksecurefunc(E:GetModule('Chat'), 'PositionChat', function(self, override)
			if override then
				AS:Embed_Check()
			end
		end)
		hooksecurefunc(E:GetModule('Layout'), 'ToggleChatPanels', function() AS:Embed_Check() end)

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

		AS:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
		AS:RegisterEvent('PLAYER_REGEN_ENABLED', 'EmbedExitCombat')

		UIParent:HookScript('OnShow', function()
			if EmbedHidden then
				AS:Embed_Hide();
			else
				AS:Embed_Show();
			end
		end)

		if not UnitAffectingCombat('player') then
			if AS:CheckOption('EmbedIsHidden') or AS:CheckOption('EmbedOoC') then
				AS:Embed_Hide();
			else
				AS:Embed_Show();
			end
		end

		AS.EmbedSystemCreated = true
	end
end

function AS:EmbedSystem_WindowResize()
	if UnitAffectingCombat('player') or not AS.EmbedSystemCreated then return end
	local ChatPanel = AS:CheckOption('EmbedRightChat') and RightChatPanel or LeftChatPanel
	local ChatTab = AS:CheckOption('EmbedRightChat') and RightChatTab or LeftChatTab
	local ChatData = AS:CheckOption('EmbedRightChat') and RightChatDataPanel or LeftChatDataPanel
	local TopRight = ChatData == RightChatDataPanel and (E.db.datatexts.rightChatPanel and 'TOPLEFT' or 'BOTTOMLEFT') or ChatData == LeftChatDataPanel and (E.db.datatexts.leftChatPanel and 'TOPLEFT' or 'BOTTOMLEFT')
	local yOffset = (ChatData == RightChatDataPanel and E.db.datatexts.rightChatPanel and (E.PixelMode and 1 or 0)) or (ChatData == LeftChatDataPanel and E.db.datatexts.leftChatPanel and (E.PixelMode and 1 or 0)) or (E.PixelMode and 0 or -1)

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