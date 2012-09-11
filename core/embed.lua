if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("SinarisUI") then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
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
	if IsAddOnLoaded("ElvUI") then
		local E, L, V, P, G, DF = unpack(ElvUI)
		RightChatToggleButton:SetScript("OnClick", function(self, btn)
				if btn == 'RightButton' then
				if IsAddOnLoaded("Recount") and ((cCheckOption("EmbedRecount")) or (cCheckOption("EmbedRO"))) then
					ToggleFrame(Recount_MainWindow)
				end
				if IsAddOnLoaded("Skada") and ((cCheckOption("EmbedSkada"))) then
					Skada:ToggleWindow()
				end
				if IsAddOnLoaded("Omen") and ((cCheckOption("EmbedOmen")) or (cCheckOption("EmbedRO"))) then
					if OmenBarList:IsShown() then
						OmenBarList:Hide()
					else
						OmenBarList:Show()
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
	if not IsAddOnLoaded("Omen") then cDisableOption("EmbedRO") cDisableOption("EmbedOmen") end
	if not IsAddOnLoaded("Recount") then cDisableOption("EmbedRO") end
	if cCheckOption("EmbedRO") then EmbedRecountOmen() end
	if cCheckOption("EmbedOmen") then EmbedOmen() end
--Embed Check Finished
if IsAddOnLoaded("Tukui") then
	RecountEmbedButton = CreateFrame("Button", "RecountEmbedButton", EmbeddingWindow, "UIPanelButtonTemplate")
	RecountEmbedButton:SetPoint("TOPLEFT", 10, -50)
	RecountEmbedButton:Size(170,24)
	cSkinButton(RecountEmbedButton)
	RecountEmbedButton.text = RecountEmbedButton:CreateFontString(nil, "OVERLAY")
	RecountEmbedButton.text:SetFont(UIFont, 12, "OUTLINE")
	RecountEmbedButton.text:SetPoint("CENTER", RecountEmbedButton, 0, 0)
	if (cCheckOption("EmbedRecount")) then RecountEmbedButton.text:SetText("Recount : |cff00ff00Enabled|r") end
	if (not cCheckOption("EmbedRecount")) then RecountEmbedButton.text:SetText("Recount : |cffff2020Disabled|r") end
	if not IsAddOnLoaded("Recount") then RecountEmbedButton:Disable() RecountEmbedButton.text:SetText("|cFF808080Recount Not Detected|r") end
	RecountEmbedButton:SetScript("OnClick", function()
		if (cCheckOption("EmbedRecount")) then
			cDisableOption("EmbedRecount")
			Recount:LockWindows(false)
			RecountEmbedButton.text:SetText("Recount : |cffff2020Disabled|r")
		else
			EmbedRecount()
			cEnableOption("EmbedRecount")
			cDisableOption("EmbedSkada")
			cDisableOption("EmbedRO")
			cDisableOption("EmbedOmen")
			EmbedROButton.text:SetText("Recount & Omen : |cffff2020Disabled|r")
			EmbedOmenButton.text:SetText("Omen : |cffff2020Disabled|r")
			RecountEmbedButton.text:SetText("Recount : |cff00ff00Enabled|r")
			SkadaEmbedButton.text:SetText("Skada : |cffff2020Disabled|r")
		end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") EmbedOmenButton:Disable() EmbedOmenButton.text:SetText("|cFF808080Omen Not Detected|r") end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton.text:SetText("|cFF808080Skada Not Detected|r") end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") RecountEmbedButton:Disable() RecountEmbedButton.text:SetText("|cFF808080Recount Not Detected|r") end
	end)
	SkadaEmbedButton = CreateFrame("Button", "SkadaEmbedButton", EmbeddingWindow, "UIPanelButtonTemplate")
	SkadaEmbedButton:SetPoint("TOPRIGHT", -10, -50)
	SkadaEmbedButton:Size(170,24)
	cSkinButton(SkadaEmbedButton)
	SkadaEmbedButton.text = SkadaEmbedButton:CreateFontString(nil, "OVERLAY")
	SkadaEmbedButton.text:SetFont(UIFont, 12, "OUTLINE")
	SkadaEmbedButton.text:SetPoint("CENTER", SkadaEmbedButton, 0, 0)
	if (cCheckOption("EmbedSkada")) then SkadaEmbedButton.text:SetText("Skada : |cff00ff00Enabled|r") end
	if (not cCheckOption("EmbedSkada")) then SkadaEmbedButton.text:SetText("Skada : |cffff2020Disabled|r") end
	if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton.text:SetText("|cFF808080Skada Not Detected|r") end
	SkadaEmbedButton:SetScript("OnClick", function()
		if (cCheckOption("EmbedSkada")) then
			cDisableOption("EmbedSkada")
			SkadaEmbedButton.text:SetText("Skada : |cffff2020Disabled|r")
		else
			EmbedSkada()
			cEnableOption("EmbedSkada")
			cDisableOption("EmbedRecount")
			cDisableOption("EmbedRO")
			cDisableOption("EmbedOmen")
			EmbedROButton.text:SetText("Recount & Omen : |cffff2020Disabled|r")
			EmbedOmenButton.text:SetText("Omen : |cffff2020Disabled|r")
			RecountEmbedButton.text:SetText("Recount : |cffff2020Disabled|r")
			SkadaEmbedButton.text:SetText("Skada : |cff00ff00Enabled|r")
		end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") EmbedOmenButton:Disable() EmbedOmenButton.text:SetText("|cFF808080Omen Not Detected|r") end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton.text:SetText("|cFF808080Skada Not Detected|r") end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") RecountEmbedButton:Disable() RecountEmbedButton.text:SetText("|cFF808080Recount Not Detected|r") end
	end)
	RecountEmbedBackdropButton = CreateFrame("Button", "RecountEmbedBackdropButton", EmbeddingWindow, "UIPanelButtonTemplate")
	RecountEmbedBackdropButton:SetPoint("TOPLEFT", 10, -80)
	RecountEmbedBackdropButton:Size(170,24)
	cSkinButton(RecountEmbedBackdropButton)
	RecountEmbedBackdropButton.text = RecountEmbedBackdropButton:CreateFontString(nil, "OVERLAY")
	RecountEmbedBackdropButton.text:SetFont(UIFont, 12, "OUTLINE")
	RecountEmbedBackdropButton.text:SetPoint("CENTER", RecountEmbedBackdropButton, 0, 0)
	if (cCheckOption("RecountBackdrop")) then RecountEmbedBackdropButton.text:SetText("Recount Backdrop : |cff00ff00Enabled|r") end
	if (not cCheckOption("RecountBackdrop")) then RecountEmbedBackdropButton.text:SetText("Recount Backdrop : |cffff2020Disabled|r") end
	if (not cCheckOption("RecountSkin")) then RecountEmbedBackdropButton:Disable() RecountEmbedBackdropButton.text:SetText("|cFF808080Recount Backdrop: Disabled|r") end
	RecountEmbedBackdropButton:SetScript("OnClick", function()
		if (cCheckOption("RecountBackdrop")) then
			cDisableOption("RecountBackdrop")
			RecountEmbedBackdropButton.text:SetText("Recount Backdrop : |cffff2020Disabled|r")
		else
			cEnableOption("RecountBackdrop")
			RecountEmbedBackdropButton.text:SetText("Recount Backdrop : |cff00ff00Enabled|r")
		end
	end)
	SkadaEmbedBackdropButton = CreateFrame("Button", "SkadaEmbedBackdropButton", EmbeddingWindow, "UIPanelButtonTemplate")
	SkadaEmbedBackdropButton:SetPoint("TOPRIGHT", -10, -80)
	SkadaEmbedBackdropButton:Size(170,24)
	cSkinButton(SkadaEmbedBackdropButton)
	SkadaEmbedBackdropButton.text = SkadaEmbedBackdropButton:CreateFontString(nil, "OVERLAY")
	SkadaEmbedBackdropButton.text:SetFont(UIFont, 12, "OUTLINE")
	SkadaEmbedBackdropButton.text:SetPoint("CENTER", SkadaEmbedBackdropButton, 0, 0)
	if (cCheckOption("SkadaBackdrop")) then SkadaEmbedBackdropButton.text:SetText("Skada Backdrop : |cff00ff00Enabled|r") end
	if (not cCheckOption("SkadaBackdrop")) then SkadaEmbedBackdropButton.text:SetText("Skada Backdrop : |cffff2020Disabled|r") end
	if (not cCheckOption("SkadaSkin")) then SkadaEmbedBackdropButton:Disable() SkadaEmbedBackdropButton.text:SetText("|cFF808080Skada Backdrop: Disabled|r") end
	SkadaEmbedBackdropButton:SetScript("OnClick", function()
		if (cCheckOption("SkadaBackdrop")) then
			cDisableOption("SkadaBackdrop")
			SkadaEmbedBackdropButton.text:SetText("Skada Backdrop : |cffff2020Disabled|r")
		else
			cEnableOption("SkadaBackdrop")
			SkadaEmbedBackdropButton.text:SetText("Skada Backdrop : |cff00ff00Enabled|r")
		end
	end)
	EmbedOoCButton = CreateFrame("Button", "EmbedOoCButton", EmbeddingWindow, "UIPanelButtonTemplate")
	EmbedOoCButton:SetPoint("TOPLEFT", 10, -110)
	EmbedOoCButton:Size(170,24)
	cSkinButton(EmbedOoCButton)
	EmbedOoCButton.text = EmbedOoCButton:CreateFontString(nil, "OVERLAY")
	EmbedOoCButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedOoCButton.text:SetPoint("CENTER", EmbedOoCButton, 0, 0)
	if (cCheckOption("EmbedOoC")) then EmbedOoCButton.text:SetText("OoC Hide : |cff00ff00Enabled|r") end
	if (not cCheckOption("EmbedOoC")) then EmbedOoCButton.text:SetText("OoC Hide : |cffff2020Disabled|r") end
	EmbedOoCButton:SetScript("OnClick", function()
		if (cCheckOption("EmbedOoC")) then
			cDisableOption("EmbedOoC")
			EmbedOoCButton.text:SetText("OoC Hide : |cffff2020Disabled|r")
		else
			cEnableOption("EmbedOoC")
			EmbedOoCButton.text:SetText("OoC Hide : |cff00ff00Enabled|r")
		end
	end)
	EmbedROButton = CreateFrame("Button", "EmbedROButton", EmbeddingWindow, "UIPanelButtonTemplate")
	EmbedROButton:SetPoint("TOPLEFT", 10, -20)
	EmbedROButton:Size(170,24)
	cSkinButton(EmbedROButton)
	EmbedROButton.text = EmbedROButton:CreateFontString(nil, "OVERLAY")
	EmbedROButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedROButton.text:SetPoint("CENTER", EmbedROButton, 0, 0)
	if (cCheckOption("EmbedRO")) then EmbedROButton.text:SetText("Recount & Omen : |cff00ff00Enabled|r") end
	if (not cCheckOption("EmbedRO")) then EmbedROButton.text:SetText("Recount & Omen : |cffff2020Disabled|r") end
	if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") end
	if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") end
	EmbedROButton:SetScript("OnClick", function()
		if (cCheckOption("EmbedRO")) then
			cDisableOption("EmbedRO")
			EmbedROButton.text:SetText("Recount & Omen : |cffff2020Disabled|r")
		else
			EmbedRecountOmen()
			cEnableOption("EmbedRO")
			cDisableOption("EmbedSkada")
			cDisableOption("EmbedRecount")
			cDisableOption("EmbedOmen")
			EmbedOmenButton.text:SetText("Omen : |cffff2020Disabled|r")
			RecountEmbedButton.text:SetText("Recount : |cffff2020Disabled|r")
			SkadaEmbedButton.text:SetText("Skada : |cffff2020Disabled|r")
			EmbedROButton.text:SetText("Recount & Omen : |cff00ff00Enabled|r")
		end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") EmbedOmenButton:Disable() EmbedOmenButton.text:SetText("|cFF808080Omen Not Detected|r") end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton.text:SetText("|cFF808080Skada Not Detected|r") end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") RecountEmbedButton:Disable() RecountEmbedButton.text:SetText("|cFF808080Recount Not Detected|r") end
	end)

	EmbedOmenButton = CreateFrame("Button", "EmbedOmenButton", EmbeddingWindow, "UIPanelButtonTemplate")
	EmbedOmenButton:SetPoint("TOPRIGHT", -10, -20)
	EmbedOmenButton:Size(170,24)
	cSkinButton(EmbedOmenButton)
	EmbedOmenButton.text = EmbedOmenButton:CreateFontString(nil, "OVERLAY")
	EmbedOmenButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedOmenButton.text:SetPoint("CENTER", EmbedOmenButton, 0, 0)
	if (cCheckOption("EmbedOmen")) then EmbedOmenButton.text:SetText("Omen : |cff00ff00Enabled|r") end
	if (not cCheckOption("EmbedOmen")) then EmbedOmenButton.text:SetText("Omen : |cffff2020Disabled|r") end
	if not IsAddOnLoaded("Omen") then EmbedOmenButton:Disable() EmbedOmenButton.text:SetText("|cFF808080Omen Not Detected|r") end
	EmbedOmenButton:SetScript("OnClick", function()
		if (cCheckOption("EmbedOmen")) then
			cDisableOption("EmbedOmen")
			EmbedOmenButton.text:SetText("Omen : |cffff2020Disabled|r")
		else
			EmbedOmen()
			cDisableOption("EmbedRO")
			cDisableOption("EmbedSkada")
			cDisableOption("EmbedRecount")
			cEnableOption("EmbedOmen")
			RecountEmbedButton.text:SetText("Recount : |cffff2020Disabled|r")
			SkadaEmbedButton.text:SetText("Skada : |cffff2020Disabled|r")
			EmbedROButton.text:SetText("Recount & Omen : |cffff2020Disabled|r")
			EmbedOmenButton.text:SetText("Omen : |cff00ff00Enabled|r")
		end
		if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") EmbedOmenButton:Disable() EmbedOmenButton.text:SetText("|cFF808080Omen Not Detected|r") end
		if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton.text:SetText("|cFF808080Skada Not Detected|r") end
		if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton.text:SetText("|cFF808080Recount & Omen Not Detected|r") RecountEmbedButton:Disable() RecountEmbedButton.text:SetText("|cFF808080Recount Not Detected|r") end
	end)
	CloseEmbedWindowButton = CreateFrame("Button", "CloseEmbedWindowButton", EmbeddingWindow, "UIPanelButtonTemplate")
	CloseEmbedWindowButton:SetPoint("TOPRIGHT", -10, -110)
	CloseEmbedWindowButton:Size(170,24)
	cSkinButton(CloseEmbedWindowButton)
	CloseEmbedWindowButton.text = CloseEmbedWindowButton:CreateFontString(nil, "OVERLAY")
	CloseEmbedWindowButton.text:SetFont(UIFont, 12, "OUTLINE")
	CloseEmbedWindowButton.text:SetPoint("CENTER", CloseEmbedWindowButton, 0, 0)
	CloseEmbedWindowButton.text:SetText("Close Window")
	CloseEmbedWindowButton:SetScript("OnClick", function()	EmbeddingWindow:Hide() StaticPopup_Show("RELOADUI") end)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
else
	-- Add Options to ElvUI table
	local E, L, V, P, G = unpack(ElvUI)
	--[[type = 'toggle',
		name = text,
		desc = L['TOGGLESKIN_DESC'],
		order = order,
		disabled = function() if addon then return not IsAddOnLoaded(addon) else return false end end,]]
	E.Options.args.skins.args.addonSkins.args.embed = {
		order = 10,
		type = 'group',
		name = 'Embed Settings',
		get = function(info) return E.db.skins[ info[#info] ] end,
		set = function(info,value)  E.db.skins[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
		args = {
			desc = {
				type = 'description',
				name = 'Settings to control addons embedded in right chat panel',
				order = 1
			},
			EmbedRecount = {
				type = 'toggle',
				name = 'Recount',
				desc = L['TOGGLESKIN_DESC'],
				order = 2,
				disabled = function() return not IsAddOnLoaded("Recount") end,
			},
			RecountBackdrop = {
				type = 'toggle',
				name = 'Recount Backdrop',
				desc = L['TOGGLESKIN_DESC'],
				order = 3,
				disabled = function() return not IsAddOnLoaded("Recount") or not E.db.skins["EmbedRecount"] end,
			},
			EmbedSkada = {
				type = 'toggle',
				name = 'Skada',
				desc = L['TOGGLESKIN_DESC'],
				order = 4,
				disabled = function() return not IsAddOnLoaded("Skada") end,
			},
			SkadaBackdrop = {
				type = 'toggle',
				name = 'Skada Backdrop',
				desc = L['TOGGLESKIN_DESC'],
				order = 5,
				disabled = function() return not IsAddOnLoaded("Skada") or not E.db.skins["EmbedSkada"] end,
			},
			EmbedOmen = {
				type = 'toggle',
				name = 'Omen',
				desc = L['TOGGLESKIN_DESC'],
				order = 6,
				disabled = function() return not IsAddOnLoaded("Omen") end,
			},
			EmbedRO = {
				type = 'toggle',
				name = 'Recount & Omen',
				desc = L['TOGGLESKIN_DESC'],
				order = 7,
				disabled = function() return not IsAddOnLoaded("Omen") or not IsAddOnLoaded("Recount") end,
			},
			EmbedOoC = {
				type = 'toggle',
				name = 'Hide while out of combat',
				desc = L['TOGGLESKIN_DESC'],
				order = 8,
			},
		}
	}
end
end

if event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_ENTER_COMBAT" or InCombatLockdown() then
--	print("Entering Combat")
	if (cCheckOption("EmbedOoC")) then
		if (IsAddOnLoaded("Recount") and (cCheckOption("EmbedRecount"))) then
			Recount_MainWindow:Show()
		end
		if (IsAddOnLoaded("Skada") and (cCheckOption("EmbedSkada"))) then
			if Skada.db.profile.hidesolo then return end
			if Skada.db.profile.hidecombat then return end
			for _, window in ipairs(Skada:GetWindows()) do
				window:Show()
			end
		end
		if (IsAddOnLoaded("Omen") and IsAddOnLoaded("Recount") and (cCheckOption("EmbedRO"))) then
			Recount_MainWindow:Show()
			OmenBarList:Show()
		end
		if (IsAddOnLoaded("Omen") and (cCheckOption("EmbedOmen"))) then
			OmenBarList:Show()
		end
	end
else
--	print("Exiting Combat")
	if (cCheckOption("EmbedOoC")) then
		if (IsAddOnLoaded("Recount") and (cCheckOption("EmbedRecount"))) then
			Recount_MainWindow:Hide()
		end
		if (IsAddOnLoaded("Skada") and (cCheckOption("EmbedSkada"))) then
			for _, window in ipairs(Skada:GetWindows()) do
				window:Hide()
			end
		end
		if (IsAddOnLoaded("Omen") and IsAddOnLoaded("Recount") and (cCheckOption("EmbedRO"))) then
			Recount_MainWindow:Hide()
			OmenBarList:Hide()
		end
		if (IsAddOnLoaded("Omen") and (cCheckOption("EmbedOmen"))) then
			OmenBarList:Hide()
		end
	end
end

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
	if EmbeddingWindow:IsVisible() then
		EmbeddingWindow:Hide()
		print("Embedding Window is now |cffff2020Hidden|r.");
	else
		EmbeddingWindow:Show()
		print("Embedding Window is now |cff00ff00Shown|r.");
	end
end

function EmbedRecountOmen()
		if not IsAddOnLoaded("Omen") then cDisableOption("EmbedRO") return end
		if not IsAddOnLoaded("Recount") then cDisableOption("EmbedRO") return end
	if (cCheckOption("EmbedOoC")) then
		if (cCheckOption("EmbedRO")) then
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
	if IsAddOnLoaded("Tukui") then
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

	if (IsAddOnLoaded("ElvUI") and not IsAddOnLoaded("ElvUI_SLE")) then
		OmenAnchor:SetWidth((RightChatPanel:GetWidth() / 3) - ( 8 + c.mult))
		OmenAnchor:SetHeight(RightChatPanel:GetHeight() - 12)
		OmenAnchor:SetPoint("TOPLEFT", RightChatPanel, "TOPLEFT", 5, 16)
		Recount_MainWindow:SetWidth(((RightChatPanel:GetWidth() / 3) + (RightChatPanel:GetWidth() / 3)) - ( 1 + c.mult))
		Recount_MainWindow:SetHeight(RightChatPanel:GetHeight() - 26)
		Recount_MainWindow:SetPoint("TOPRIGHT", RightChatPanel,"TOPRIGHT", -5, 2)
	end
	if IsAddOnLoaded("ElvUI_SLE") then
		OmenAnchor:SetWidth((RightChatPanel:GetWidth() / 3) - ( 3 + c.mult))
		OmenAnchor:SetHeight(RightChatPanel:GetHeight() - 4)
		OmenAnchor:SetPoint("TOPLEFT", RightChatPanel, "TOPLEFT", 2, -2)
		Recount_MainWindow:SetWidth(((RightChatPanel:GetWidth() / 3) + (RightChatPanel:GetWidth() / 3)) - ( 0 + c.mult))
		Recount_MainWindow:SetHeight(RightChatPanel:GetHeight() - 18)
		Recount_MainWindow:SetPoint("TOPRIGHT", RightChatPanel,"TOPRIGHT", -2, -16)
	end
end
