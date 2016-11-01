local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Factionizer') then return end

function AS:Factionizer()

	for i = 1, 15 do
		AS:Desaturate(_G['ReputationBar'..i..'ExpandOrCollapseButton'])
	end

	for i = 1, 13 do
		AS:Desaturate(_G['FIZ_UpdateEntry'..i])
	end

	local buttons = {
		FIZ_OptionsButton,
		FIZ_ShowAllButton,
		FIZ_ExpandButton,
		FIZ_ShowNoneButton,
		FIZ_CollapseButton,
		FIZ_SupressNoneFactionButton,
		FIZ_SupressNoneGlobalButton,
		FIZ_ClearSessionGainButton,
	}

	local checkboxes = {
		FIZ_OrderByStandingCheckBox,
		FIZ_EnableMissingBox,
		FIZ_ExtendDetailsBox,
		FIZ_GainToChatBox,
		FIZ_NoGuildGainBox,
		FIZ_SupressOriginalGainBox,
		FIZ_ShowPreviewRepBox,
		FIZ_SwitchFactionBarBox,
		FIZ_SilentSwitchBox,
		FIZ_NoGuildSwitchBox,
		FIZ_ReputationDetailInactiveCheckBox,
		FIZ_ReputationDetailMainScreenCheckBox,
		FIZ_ShowQuestButton,
		FIZ_ShowInstancesButton,
		FIZ_ShowMobsButton,
		FIZ_ShowItemsButton,
		FIZ_ShowGeneralButton,
	}

	AS:SkinFrame(FIZ_OptionsFrame)
	AS:SkinFrame(FIZ_ReputationDetailFrame)

	for _, button in pairs(buttons) do
		AS:SkinButton(button)
	end

	for _, checkbox in pairs(checkboxes) do
		AS:SkinCheckBox(checkbox)
	end

	AS:SkinCheckBox(FIZ_ReputationDetailAtWarCheckBox)
	FIZ_ReputationDetailAtWarCheckBox:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-SwordCheck')
	FIZ_ReputationDetailAtWarCheckBox:SetDisabledCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')

	FIZ_OptionsFrame:CreateShadow('Default')
	AS:SkinCloseButton(FIZ_OptionsFrameClose)
	AS:SkinCloseButton(FIZ_ReputationDetailCloseButton)
	AS:SkinScrollBar(FIZ_UpdateListScrollFrameScrollBar, 5)
	FIZ_OptionsFrameClose:SetPoint('TOPRIGHT', FIZ_OptionsFrame, 'TOPRIGHT', 4, 5)
	FIZ_OptionsFrame:SetWidth(360)
	FIZ_ReputationDetailCloseButton:SetPoint('TOPRIGHT', FIZ_ReputationDetailFrame, 'TOPRIGHT', 4, 5)
	FIZ_ShowNoneButton:SetPoint('TOPLEFT', FIZ_ReputationDetailDivider3, 'BOTTOMLEFT', 230, -5)
	FIZ_SupressNoneGlobalButton:SetPoint('TOPLEFT', FIZ_SupressNoneFactionButton, 'BOTTOMLEFT', 0, -5)
	FIZ_ReputationDetailFrame:SetPoint('TOPLEFT', ReputationFrame, 'TOPRIGHT', 5, 0)
	FIZ_OptionsFrame:SetPoint('TOPLEFT', ReputationFrame, 'TOPRIGHT', 5, 0)
end

AS:RegisterSkin('Factionizer', AS.Factionizer)