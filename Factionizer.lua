if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Factionizer") then return end
local function desat(self, event, ...)
	for i = 1, 15 do
		cDesaturate(_G["ReputationBar"..i.."ExpandOrCollapseButton"])
	end

	for i = 1, 13 do
		cDesaturate(_G["FIZ_UpdateEntry"..i])
	end
end

local SkinFactionizer = CreateFrame("Frame")
	SkinFactionizer:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinFactionizer:SetScript("OnEvent", function(self, event, addon)
	if (UISkinOptions.FactionizerSkin ~= "Enabled") then return end

	local StripAllTextures = {
                "FIZ_ReputationDetailFrame",
                "FIZ_OptionsFrame",
		}

	local SetTemplateT = {
                "FIZ_OptionsFrame",
                "FIZ_ReputationDetailFrame",
		}	

	local buttons = {
                "FIZ_OptionsButton",
                "FIZ_ShowAllButton",
                "FIZ_ExpandButton",
                "FIZ_ShowNoneButton",
		"FIZ_CollapseButton",
		"FIZ_SupressNoneFactionButton",
		"FIZ_SupressNoneGlobalButton",
		"FIZ_ClearSessionGainButton",
		}

	local checkboxes = {
                "FIZ_OrderByStandingCheckBox",
                "FIZ_ShowQuestButton",
                "FIZ_ShowInstancesButton",
                "FIZ_ShowMobsButton",
		"FIZ_ShowItemsButton",
		"FIZ_ShowGeneralButton",
		"FIZ_ReputationDetailInactiveCheckBox",
		"FIZ_ReputationDetailMainScreenCheckBox",
		"FIZ_SupressOriginalGainBox",
		"FIZ_ShowPreviewRepBox",
		"FIZ_SwitchFactionBarBox",
		"FIZ_SilentSwitchBox",
		"FIZ_NoGuildSwitchBox",
		"FIZ_GuildCapBox",
		"FIZ_EnableMissingBox",
		"FIZ_ExtendDetailsBox",
		"FIZ_GainToChatBox",
		"FIZ_NoGuildGainBox",
		}

		for _, object in pairs(StripAllTextures) do
			_G[object]:StripTextures()
		end	

		for _, object in pairs(SetTemplateT) do
			_G[object]:SetTemplate("Transparent")
		end			

		for _, button in pairs(buttons) do
			cSkinButton(_G[button])
		end		

		for _, checkbox in pairs(checkboxes) do
			cSkinCheckBox(_G[checkbox])
		end	

		FIZ_ReputationDetailAtWarCheckBox:SetScript("OnUpdate", function(frame)
		frame:StripTextures()
		frame:CreateBackdrop("Default")
		frame.backdrop:Point("TOPLEFT", 4, -4)
		frame.backdrop:Point("BOTTOMRIGHT", -4, 4)

		if frame.SetCheckedTexture then
			frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-SwordCheck")
		end

		if frame.SetDisabledCheckedTexture then
			frame:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		end
	end)

	FIZ_OptionsFrame:CreateShadow("Default")

	cSkinCloseButton(FIZ_OptionsFrameClose)
	cSkinCloseButton(FIZ_ReputationDetailCloseButton)

	cSkinScrollBar(FIZ_UpdateListScrollFrameScrollBar, 5)

	repFrame = _G["ReputationFrame"]
	repFrame:SetScript("OnUpdate", desat)

	FIZ_OptionsFrameClose:Point("TOPRIGHT", FIZ_OptionsFrame, "TOPRIGHT", 4, 5)
	FIZ_OptionsFrame:SetWidth(360)
	FIZ_ReputationDetailCloseButton:Point("TOPRIGHT", FIZ_ReputationDetailFrame, "TOPRIGHT", 4, 5)
	FIZ_ShowNoneButton:Point("TOPLEFT", FIZ_ReputationDetailDivider3, "BOTTOMLEFT", 230, -5)
	FIZ_SupressNoneGlobalButton:Point("TOPLEFT",  FIZ_SupressNoneFactionButton, "BOTTOMLEFT", 0, -5)
	FIZ_ReputationDetailFrame:Point("TOPLEFT",   ReputationFrame, "TOPRIGHT", 5, 0)
	FIZ_OptionsFrame:Point("TOPLEFT",   ReputationFrame, "TOPRIGHT", 5, 0)
end)