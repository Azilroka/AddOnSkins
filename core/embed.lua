if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c
local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
	EmbeddingWindow:SetTemplate("Transparent")
	EmbeddingWindow:SetFrameStrata("HIGH")
	if IsAddOnLoaded("ElvUI") then UIFont = [[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]] end
	if IsAddOnLoaded("Tukui") then UIFont = [[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]] end
	EmbeddingWindow:Hide()
	EmbeddingWindow.text = EmbeddingWindow:CreateFontString(nil, "OVERLAY")
	EmbeddingWindow.text:SetFont(UIFont, 14, "OUTLINE")
	EmbeddingWindow.text:SetPoint("TOP", 0, -4)
	EmbeddingWindow.text:SetText("Embedding Window Options")
	EmbeddingWindow.text2 = EmbeddingWindow:CreateFontString(nil, "OVERLAY")
	EmbeddingWindow.text2:SetFont(UIFont, 10, "OUTLINE")
	EmbeddingWindow.text2:SetPoint("TOP", 0, -20)
	EmbeddingWindow:EnableMouse(true)
	EmbeddingWindow:RegisterEvent("PLAYER_ENTERING_WORLD")
	EmbeddingWindow:RegisterEvent("PLAYER_REGEN_DISABLED")
	EmbeddingWindow:RegisterEvent("PLAYER_REGEN_ENABLED")
	EmbeddingWindow:RegisterEvent("PLAYER_ENTER_COMBAT")
	EmbeddingWindow:RegisterEvent("PLAYER_LEAVE_COMBAT")
	EmbeddingWindow:SetScript("OnEvent", function(self, event)

if event == "PLAYER_ENTERING_WORLD" then
	
	if IsAddOnLoaded("ElvUI") then EmbeddingWindow:Point("BOTTOMRIGHT", RightChatDataPanel, "BOTTOMRIGHT", 16, 22) EmbeddingWindow:Size((RightChatPanel:GetWidth() - 10),(RightChatPanel:GetHeight() - 32)) end
	if IsAddOnLoaded("ElvUI_SLE") then EmbeddingWindow:Point("BOTTOMRIGHT", RightChatPanel, "BOTTOMRIGHT", -2, 0) EmbeddingWindow:Size((RightChatPanel:GetWidth() - 5),(RightChatPanel:GetHeight() - 24)) end
	if IsAddOnLoaded("Tukui") then EmbeddingWindow:Point("BOTTOMRIGHT", TukuiInfoRight, "BOTTOMRIGHT", 0, 24) EmbeddingWindow:Size(TukuiInfoRight:GetWidth(), (TukuiInfoRight:GetHeight() * 6) + 4) end
	if IsAddOnLoaded("Tukui") then
		EmbedToggleButton = CreateFrame("Button", "EmbedToggleButton", UIParent)
		EmbedToggleButton:SetTemplate("Transparent")
		EmbedToggleButton:Size(TukuiInfoRight:GetHeight()-4)
		EmbedToggleButton:FontString("text", c["media"].pixelfont, 14, "MONOCHROMEOUTLINE")
		EmbedToggleButton.text:SetText(">")
		EmbedToggleButton.text:SetPoint("CENTER", 2, 2)
		EmbedToggleButton:Point("RIGHT", TukuiInfoRight, "RIGHT", -2, 0)
		EmbedToggleButton:RegisterForClicks("LeftButtonDown", "RightButtonDown");
		EmbedToggleButton:SetScript("OnClick", function(self, btn)
			if btn == 'RightButton' then
				if SkinOptions:IsShown() or SkinOptions2:IsShown() or SkinOptions3:IsShown() then
					SkinOptions:Hide()
					SkinOptions2:Hide()
					SkinOptions3:Hide()
					SkinOptions1Button:SetParent(SkinOptions)
					SkinOptions2Button:SetParent(SkinOptions)
					EmbedWindowSettingsButton:SetParent(SkinOptions)
					ApplySkinSettingsButton:SetParent(SkinOptions)
					SkinOptionsCloseButton:SetParent(SkinOptions)
				else
					SkinOptions:Show()
				end
			else
				if IsAddOnLoaded("Recount") and ((U.CheckOption("EmbedRecount")) or (U.CheckOption("EmbedRO"))) then
					ToggleFrame(Recount_MainWindow)
				end
				if IsAddOnLoaded("Skada") and ((U.CheckOption("EmbedSkada"))) then
					Skada:ToggleWindow()
				end
				if IsAddOnLoaded("Omen") and ((U.CheckOption("EmbedOmen")) or (U.CheckOption("EmbedRO"))) then
					if OmenBarList:IsShown() then
						OmenBarList:Hide()
					else
						OmenBarList:Show()
					end
				end
				if IsAddOnLoaded("TinyDPS") and (U.CheckOption("EmbedTDPS")) then
					if tdpsFrame:IsShown() then
						tdpsFrame:Hide()
					else
						tdpsFrame:Show()
					end
				end
			end
		end)
		EmbedToggleButton:SetScript("OnEnter", function(self, ...)
			GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT', 0, 4)
			GameTooltip:ClearLines()
			GameTooltip:AddDoubleLine('Left Click:', 'Toggle Embedded Addon', 1, 1, 1)
			GameTooltip:AddDoubleLine('Right Click:', 'Toggle Skin Options', 1, 1, 1)
			GameTooltip:Show()
		end)
		EmbedToggleButton:SetScript("OnLeave", function(self, ...)
			GameTooltip:Hide()
		end)
	end
	if IsAddOnLoaded("ElvUI") then
		local E, L, V, P, G, DF = unpack(ElvUI)
		RightChatToggleButton:SetScript("OnClick", function(self, btn)
				if btn == 'RightButton' then
				if IsAddOnLoaded("Recount") and ((U.CheckOption("EmbedRecount")) or (U.CheckOption("EmbedRO"))) then
					ToggleFrame(Recount_MainWindow)
				end
				if IsAddOnLoaded("Skada") and ((U.CheckOption("EmbedSkada"))) then
					Skada:ToggleWindow()
				end
				if IsAddOnLoaded("Omen") and ((U.CheckOption("EmbedOmen")) or (U.CheckOption("EmbedRO"))) then
					if OmenBarList:IsShown() then
						OmenBarList:Hide()
					else
						OmenBarList:Show()
					end
				end
				if IsAddOnLoaded("TinyDPS") and (U.CheckOption("EmbedTDPS")) then
					if tdpsFrame:IsShown() then
						tdpsFrame:Hide()
					else
						tdpsFrame:Show()
					end
				end
			else
			if c.db[self.parent:GetName()..'Faded'] then
				c.db[self.parent:GetName()..'Faded'] = nil
				UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
				UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
			else
				c.db[self.parent:GetName()..'Faded'] = true
				UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
				UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
				self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
				end
			end
		end)
	
		RightChatToggleButton:SetScript("OnEnter", function(self, ...)
			GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT', 0, 4)
			GameTooltip:ClearLines()
			GameTooltip:AddDoubleLine(L['Left Click:'], L['Toggle Chat Frame'], 1, 1, 1)
			GameTooltip:AddDoubleLine(L['Right Click:'], 'Toggle Embedded Addon', 1, 1, 1)
			GameTooltip:Show()
		end)
	end

--Embed Check
	if not IsAddOnLoaded("Omen") then U.DisableOption("EmbedRO") U.DisableOption("EmbedOmen") end
	if not IsAddOnLoaded("Recount") then U.DisableOption("EmbedRO") end
	if U.CheckOption("EmbedRO") then EmbedRecountOmen() end
	if U.CheckOption("EmbedOmen") then EmbedOmen() end
--Embed Check Finished
if IsAddOnLoaded("Tukui") then
	SkadaEmbedButton = CreateFrame("Button", "SkadaEmbedButton", SkinOptions3)
	SkadaEmbedButton:SetPoint("TOPLEFT", 12, -30)
	SkadaEmbedButton:Size(16)
	SkadaEmbedButton:CreateBackdrop()
	SkadaEmbedButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	SkadaEmbedButton.text = SkadaEmbedButton:CreateFontString(nil, "OVERLAY")
	SkadaEmbedButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkadaEmbedButton.text:SetPoint("LEFT", SkadaEmbedButton, "RIGHT", 10, 0)
	SkadaEmbedButton.text:SetText("Skada")
	if (U.CheckOption("EmbedSkada")) then SkadaEmbedButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedSkada")) then SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	SkadaEmbedButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedSkada")) then
			U.DisableOption("EmbedSkada")
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedSkada()
			U.EnableOption("EmbedSkada")
			U.DisableOption("EmbedRecount")
			U.DisableOption("EmbedRO")
			U.DisableOption("EmbedOmen")
			U.DisableOption("EmbedTDPS")
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			SkadaEmbedButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
		if not IsAddOnLoaded("TinyDPS") then EmbedTDPSButton:Disable() EmbedTDPSButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) EmbedOmenButton:Disable() EmbedOmenButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) RecountEmbedButton:Disable() RecountEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	end)

	RecountEmbedButton = CreateFrame("Button", "RecountEmbedButton", SkinOptions3)
	RecountEmbedButton:SetPoint("TOPLEFT", 12, -55)
	RecountEmbedButton:Size(16)
	RecountEmbedButton:CreateBackdrop()
	RecountEmbedButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	RecountEmbedButton.text = RecountEmbedButton:CreateFontString(nil, "OVERLAY")
	RecountEmbedButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	RecountEmbedButton.text:SetPoint("LEFT", RecountEmbedButton, "RIGHT", 10, 0)
	RecountEmbedButton.text:SetText("Recount")
	if (U.CheckOption("EmbedRecount")) then RecountEmbedButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedRecount")) then RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("Recount") then RecountEmbedButton:Disable() RecountEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	RecountEmbedButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedRecount")) then
			U.DisableOption("EmbedRecount")
			Recount:LockWindows(false)
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedRecount()
			U.EnableOption("EmbedRecount")
			U.DisableOption("EmbedSkada")
			U.DisableOption("EmbedRO")
			U.DisableOption("EmbedOmen")
			U.DisableOption("EmbedTDPS")
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
			RecountEmbedButton:SetBackdropColor(0.11,0.66,0.11,1)
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
		end
		if not IsAddOnLoaded("TinyDPS") then EmbedTDPSButton:Disable() EmbedTDPSButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) EmbedOmenButton:Disable() EmbedOmenButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) RecountEmbedButton:Disable() RecountEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	end)
	EmbedROButton = CreateFrame("Button", "EmbedROButton", SkinOptions3)
	EmbedROButton:SetPoint("TOPLEFT", 12, -80)
	EmbedROButton:Size(16)
	EmbedROButton:CreateBackdrop()
	EmbedROButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	EmbedROButton.text = EmbedROButton:CreateFontString(nil, "OVERLAY")
	EmbedROButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	EmbedROButton.text:SetPoint("LEFT", EmbedROButton, "RIGHT", 10, 0)
	EmbedROButton.text:SetText("Recount & Omen")
	if (U.CheckOption("EmbedRO")) then EmbedROButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedRO")) then EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) end
	if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) end
	EmbedROButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedRO")) then
			U.DisableOption("EmbedRO")
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedRecountOmen()
			U.EnableOption("EmbedRO")
			U.DisableOption("EmbedSkada")
			U.DisableOption("EmbedRecount")
			U.DisableOption("EmbedOmen")
			U.DisableOption("EmbedTDPS")
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
		if not IsAddOnLoaded("TinyDPS") then EmbedTDPSButton:Disable() EmbedTDPSButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) EmbedOmenButton:Disable() EmbedOmenButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) RecountEmbedButton:Disable() RecountEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	end)

	EmbedOmenButton = CreateFrame("Button", "EmbedOmenButton", SkinOptions3)
	EmbedOmenButton:SetPoint("TOPLEFT", 12, -105)
	EmbedOmenButton:Size(16)
	EmbedOmenButton:CreateBackdrop()
	EmbedOmenButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	EmbedOmenButton.text = EmbedOmenButton:CreateFontString(nil, "OVERLAY")
	EmbedOmenButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedOmenButton.text:SetText("Omen")
	EmbedOmenButton.text:SetPoint("LEFT", EmbedOmenButton, "RIGHT", 10, 0)
	if (U.CheckOption("EmbedOmen")) then EmbedOmenButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedOmen")) then EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("Omen") then EmbedOmenButton:Disable() EmbedOmenButton:SetBackdropColor(0.77,0.7,0.34,1) end
	EmbedOmenButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedOmen")) then
			U.DisableOption("EmbedOmen")
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedOmen()
			U.EnableOption("EmbedOmen")
			U.DisableOption("EmbedRO")
			U.DisableOption("EmbedSkada")
			U.DisableOption("EmbedRecount")
			U.DisableOption("EmbedTDPS")
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
		if not IsAddOnLoaded("TinyDPS") then EmbedTDPSButton:Disable() EmbedTDPSButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) EmbedOmenButton:Disable() EmbedOmenButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) RecountEmbedButton:Disable() RecountEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	end)

	EmbedTDPSButton = CreateFrame("Button", "EmbedTDPSButton", SkinOptions3)
	EmbedTDPSButton:SetPoint("TOPLEFT", 12, -130)
	EmbedTDPSButton:Size(16)
	EmbedTDPSButton:CreateBackdrop()
	EmbedTDPSButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	EmbedTDPSButton.text = EmbedTDPSButton:CreateFontString(nil, "OVERLAY")
	EmbedTDPSButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedTDPSButton.text:SetText("TinyDPS")
	EmbedTDPSButton.text:SetPoint("LEFT", EmbedTDPSButton, "RIGHT", 10, 0)
	if (U.CheckOption("EmbedTDPS")) then EmbedTDPSButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedTDPS")) then EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("TinyDPS") then EmbedTDPSButton:Disable() EmbedTDPSButton:SetBackdropColor(0.77,0.7,0.34,1) end
	EmbedTDPSButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedTDPS")) then
			U.DisableOption("EmbedTDPS")
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedTDPS()
			U.DisableOption("EmbedRO")
			U.DisableOption("EmbedSkada")
			U.DisableOption("EmbedRecount")
			U.DisableOption("EmbedOmen")
			U.EnableOption("EmbedTDPS")
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedTDPSButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
		if not IsAddOnLoaded("TinyDPS") then EmbedTDPSButton:Disable() EmbedTDPSButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) EmbedOmenButton:Disable() EmbedOmenButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) RecountEmbedButton:Disable() RecountEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	end)

	SkadaEmbedBackdropButton = CreateFrame("Button", "SkadaEmbedBackdropButton", SkinOptions3)
	SkadaEmbedBackdropButton:SetPoint("TOP", -68, -30)
	SkadaEmbedBackdropButton:Size(16)
	SkadaEmbedBackdropButton:CreateBackdrop()
	SkadaEmbedBackdropButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	SkadaEmbedBackdropButton.text = SkadaEmbedBackdropButton:CreateFontString(nil, "OVERLAY")
	SkadaEmbedBackdropButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkadaEmbedBackdropButton.text:SetPoint("LEFT", SkadaEmbedBackdropButton, "RIGHT", 10, 0)
	SkadaEmbedBackdropButton.text:SetText("Skada Backdrop")
	if (U.CheckOption("SkadaBackdrop")) then SkadaEmbedBackdropButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("SkadaBackdrop")) then SkadaEmbedBackdropButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if (not U.CheckOption("SkadaSkin")) then SkadaEmbedBackdropButton:Disable() SkadaEmbedBackdropButton:SetBackdropColor(0.77,0.7,0.34,1) end
	SkadaEmbedBackdropButton:SetScript("OnClick", function()
		if (U.CheckOption("SkadaBackdrop")) then
			U.DisableOption("SkadaBackdrop")
			SkadaEmbedBackdropButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("SkadaBackdrop")
			SkadaEmbedBackdropButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)
	RecountEmbedBackdropButton = CreateFrame("Button", "RecountEmbedBackdropButton", SkinOptions3)
	RecountEmbedBackdropButton:SetPoint("TOP", -68, -55)
	RecountEmbedBackdropButton:Size(16)
	RecountEmbedBackdropButton:CreateBackdrop()
	RecountEmbedBackdropButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	RecountEmbedBackdropButton.text = RecountEmbedBackdropButton:CreateFontString(nil, "OVERLAY")
	RecountEmbedBackdropButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	RecountEmbedBackdropButton.text:SetPoint("LEFT", RecountEmbedBackdropButton, "RIGHT", 10, 0)
	RecountEmbedBackdropButton.text:SetText("Recount Backdrop")
	if (U.CheckOption("RecountBackdrop")) then RecountEmbedBackdropButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("RecountBackdrop")) then RecountEmbedBackdropButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if (not U.CheckOption("RecountSkin")) then RecountEmbedBackdropButton:Disable() RecountEmbedBackdropButton:SetBackdropColor(0.77,0.7,0.34,1) end
	RecountEmbedBackdropButton:SetScript("OnClick", function()
		if (U.CheckOption("RecountBackdrop")) then
			U.DisableOption("RecountBackdrop")
			RecountEmbedBackdropButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("RecountBackdrop")
			RecountEmbedBackdropButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)
	EmbedOoCButton = CreateFrame("Button", "EmbedOoCButton", SkinOptions3)
	EmbedOoCButton:SetPoint("TOP", -68, -105)
	EmbedOoCButton:Size(16)
	EmbedOoCButton:CreateBackdrop()
	EmbedOoCButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	EmbedOoCButton.text = EmbedOoCButton:CreateFontString(nil, "OVERLAY")
	EmbedOoCButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedOoCButton.text:SetPoint("LEFT", EmbedOoCButton, "RIGHT", 10, 0)
	EmbedOoCButton.text:SetText("OoC Hide")
	if (U.CheckOption("EmbedOoC")) then EmbedOoCButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedOoC")) then EmbedOoCButton:SetBackdropColor(0.68,0.14,0.14,1) end
	EmbedOoCButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedOoC")) then
			U.DisableOption("EmbedOoC")
			EmbedOoCButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("EmbedOoC")
			EmbedOoCButtonSetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	EmbedSexyCooldownButton = CreateFrame("Button", "EmbedSexyCooldownButton", SkinOptions3)
	EmbedSexyCooldownButton:SetPoint("TOPLEFT", 12, -155)
	EmbedSexyCooldownButton:Size(16)
	EmbedSexyCooldownButton:CreateBackdrop()
	EmbedSexyCooldownButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	EmbedSexyCooldownButton.text = EmbedSexyCooldownButton:CreateFontString(nil, "OVERLAY")
	EmbedSexyCooldownButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedSexyCooldownButton.text:SetPoint("LEFT", EmbedSexyCooldownButton, "RIGHT", 10, 0)
	EmbedSexyCooldownButton.text:SetText("SexyCooldown")
	if (U.CheckOption("EmbedSexyCooldown")) then EmbedSexyCooldownButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedSexyCooldown")) then EmbedSexyCooldownButton:SetBackdropColor(0.68,0.14,0.14,1) end
	EmbedSexyCooldownButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedSexyCooldown")) then
			U.DisableOption("EmbedSexyCooldown")
			EmbedSexyCooldownButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("EmbedSexyCooldown")
			EmbedSexyCooldownButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end
end

if event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_ENTER_COMBAT" or InCombatLockdown() then
--	print("Entering Combat")
	if (U.CheckOption("EmbedOoC")) then
		if (IsAddOnLoaded("Recount") and (U.CheckOption("EmbedRecount"))) then
			Recount_MainWindow:Show()
		end
		if (IsAddOnLoaded("Skada") and (U.CheckOption("EmbedSkada"))) then
			if Skada.db.profile.hidesolo then return end
			if Skada.db.profile.hidecombat then return end
			for _, window in ipairs(Skada:GetWindows()) do
				window:Show()
			end
		end
		if (IsAddOnLoaded("Omen") and IsAddOnLoaded("Recount") and (U.CheckOption("EmbedRO"))) then
			Recount_MainWindow:Show()
			OmenBarList:Show()
		end
		if (IsAddOnLoaded("Omen") and (U.CheckOption("EmbedOmen"))) then
			OmenBarList:Show()
		end
		if (IsAddOnLoaded("TinyDPS") and (U.CheckOption("EmbedTDPS"))) then
			tdpsFrame:Show()
		end
	end
else
--	print("Exiting Combat")
	if (U.CheckOption("EmbedOoC")) then
		if (IsAddOnLoaded("Recount") and (U.CheckOption("EmbedRecount"))) then
			Recount_MainWindow:Hide()
		end
		if (IsAddOnLoaded("Skada") and (U.CheckOption("EmbedSkada"))) then
			for _, window in ipairs(Skada:GetWindows()) do
				window:Hide()
			end
		end
		if (IsAddOnLoaded("Omen") and IsAddOnLoaded("Recount") and (U.CheckOption("EmbedRO"))) then
			Recount_MainWindow:Hide()
			OmenBarList:Hide()
		end
		if (IsAddOnLoaded("Omen") and (U.CheckOption("EmbedOmen"))) then
			OmenBarList:Hide()
		end
		if (IsAddOnLoaded("TinyDPS") and (U.CheckOption("EmbedTDPS"))) then
			tdpsFrame:Hide()
		end
	end
end
--if TukuiChatBackgroundLeft then
--	TukuiChatBackgroundLeft.bg = TukuiChatBackgroundLeft:CreateTexture(nil, 'LOW')
--	TukuiChatBackgroundLeft.bg:SetInside()
--	TukuiChatBackgroundLeft.bg:SetTexture([[Interface\AddOns\Tukui_ElvUI_Skins\media\horde.tga]])
--	TukuiChatBackgroundLeft.bg:SetAlpha(0.8)
--	TukuiInfoLeft:StripTextures()
--	TukuiTabsLeftBackground:Hide()
--end
end)

StaticPopupDialogs["RELOADUI"] = {
	text = "Reload your User Interface?",
        button1 = TEXT(ACCEPT),
        button2 = TEXT(CANCEL),
        OnAccept = function()
            ReloadUI()
        end,
        OnCancel = function(data, reason)
            if (reason == "timeout") then
                ReloadUI()
            else
                StaticPopupDialogs["RELOADUI"].reloadAccepted = false
            end
        end,
        OnHide = function()
            if (StaticPopupDialogs["RELOADUI"].reloadAccepted) then
                ReloadUI();
            end
        end,
        OnShow = function()
            StaticPopupDialogs["RELOADUI"].reloadAccepted = true;
        end,
        timeout = 5,
        hideOnEscape = 1,
        exclusive = 1,
        whileDead = 1
}

	SLASH_EMBEDDINGWINDOW1 = '/embed';
	function SlashCmdList.EMBEDDINGWINDOW(msg, editbox)
	if U.tuk then
		if EmbeddingWindow:IsVisible() then
			EmbeddingWindow:Hide()
			print("Embedding Window is now |cffff2020Hidden|r.");
		else
			EmbeddingWindow:Show()
			print("Embedding Window is now |cff00ff00Shown|r.");
		end
	end
		if U.elv then
			print("Embed window setting are in /ec")
		end
	end


function EmbedRecountOmen()
		if not IsAddOnLoaded("Omen") then U.DisableOption("EmbedRO") return end
		if not IsAddOnLoaded("Recount") then U.DisableOption("EmbedRO") return end
	if (U.CheckOption("EmbedOoC")) then
		if (U.CheckOption("EmbedRO")) then
			Recount_MainWindow:Hide()
			OmenBarList:Hide()
		end
	end
		OmenTitle:Kill()
		Omen.db.profile.Locked = true
		Omen:UpdateGrips()
		Omen.UpdateGrips = function(...)
			local db = Omen.db.profile
				Omen.VGrip1:ClearAllPoints()
				Omen.VGrip1:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip1, 0)
				Omen.VGrip1:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip1, 0)
				Omen.VGrip2:ClearAllPoints()
				Omen.VGrip2:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip2, 0)
				Omen.VGrip2:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip2, 0)
				Omen.Grip:Hide()
				if db.Locked then
					Omen.VGrip1:Hide()
					Omen.VGrip2:Hide()
				else
					Omen.VGrip1:Show()
					if db.Bar.ShowTPS then
						Omen.VGrip2:Show()
					else
						Omen.VGrip2:Hide()
					end
				end
		end
		OmenBarList:StripTextures()
		OmenBarList:SetTemplate("Default")
		OmenAnchor:ClearAllPoints()
		OmenAnchor:SetFrameStrata("MEDIUM")
		Recount:LockWindows(true)
		Recount_MainWindow:ClearAllPoints()
		EmbedRecountOmenResize()
		if IsAddOnLoaded("ElvUI") then hooksecurefunc(RightChatPanel, "SetSize", function(self, width, height) EmbedRecountOmenResize() end) end
end

function EmbedRecountOmenResize()
	if U.tuk then
		if TukuiChatBackgroundRight then
			OmenAnchor:SetWidth((TukuiChatBackgroundRight:GetWidth() / 3) - ( 10 + s.mult))
			OmenAnchor:SetHeight(TukuiChatBackgroundRight:GetHeight() - 20)
			OmenAnchor:SetPoint("TOPLEFT", TukuiChatBackgroundRight, "TOPLEFT", 6, 10)
			Recount_MainWindow:SetWidth(((TukuiChatBackgroundRight:GetWidth() / 3) + (TukuiChatBackgroundRight:GetWidth() / 3)) - ( 1 + s.mult))
			Recount_MainWindow:SetHeight(TukuiChatBackgroundRight:GetHeight() - 28)
			Recount_MainWindow:SetPoint("TOPRIGHT", TukuiChatBackgroundRight,"TOPRIGHT", -6, 2)
		else
			OmenAnchor:SetWidth((TukuiInfoRight:GetWidth() / 3) + 1)
			OmenAnchor:SetHeight((TukuiInfoRight:GetHeight() * 6) + 4)
			OmenAnchor:SetPoint("TOPLEFT", TukuiInfoRight, "TOPLEFT", 0, 144)
			Recount_MainWindow:SetWidth(((TukuiInfoRight:GetWidth() / 3) + (TukuiInfoRight:GetWidth() / 3)) - ( 1 + s.mult))
			Recount_MainWindow:SetHeight((TukuiInfoRight:GetHeight() * 6) - 4)
			Recount_MainWindow:SetPoint("TOPRIGHT", TukuiInfoRight,"TOPRIGHT", 0, 136)
		end
	end

	if U.elv and not U.sle then
		OmenAnchor:SetWidth((RightChatPanel:GetWidth() / 3) - ( 8 + c.mult))
		OmenAnchor:SetHeight(RightChatPanel:GetHeight() - 12)
		OmenAnchor:SetPoint("TOPLEFT", RightChatPanel, "TOPLEFT", 5, 16)
		Recount_MainWindow:SetWidth(((RightChatPanel:GetWidth() / 3) + (RightChatPanel:GetWidth() / 3)) - ( 1 + c.mult))
		Recount_MainWindow:SetHeight(RightChatPanel:GetHeight() - 26)
		Recount_MainWindow:SetPoint("TOPRIGHT", RightChatPanel,"TOPRIGHT", -5, 2)
	end
	if U.sle then
		OmenAnchor:SetWidth((RightChatPanel:GetWidth() / 3) - ( 3 + c.mult))
		OmenAnchor:SetHeight(RightChatPanel:GetHeight() - 4)
		OmenAnchor:SetPoint("TOPLEFT", RightChatPanel, "TOPLEFT", 2, -2)
		Recount_MainWindow:SetWidth(((RightChatPanel:GetWidth() / 3) + (RightChatPanel:GetWidth() / 3)) - ( 0 + c.mult))
		Recount_MainWindow:SetHeight(RightChatPanel:GetHeight() - 18)
		Recount_MainWindow:SetPoint("TOPRIGHT", RightChatPanel,"TOPRIGHT", -2, -16)
	end
end