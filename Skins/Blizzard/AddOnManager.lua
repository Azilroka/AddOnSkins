local AS = unpack(AddOnSkins)

function AS:Blizzard_AddonManager()
	AS:SkinFrame(AddonList)
	AS:CreateShadow(AddonList)

	AS:StripTextures(AddonListInset)

	AS:SkinBackdropFrame(AddonListScrollFrame)
	AS:SkinScrollBar(AddonListScrollFrameScrollBar)

	AddonListScrollFrame.Backdrop:SetPoint('TOPLEFT', -14, 0)
	AddonListScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', 0, -1)
	AS:SkinButton(AddonList.EnableAllButton, true)
	AS:SkinButton(AddonList.DisableAllButton, true)
	AS:SkinButton(AddonList.OkayButton, true)
	AS:SkinButton(AddonList.CancelButton, true)

	AS:SkinCheckBox(AddonListForceLoad)
	AddonListForceLoad:SetSize(26, 26)
	AS:SkinDropDownBox(AddonCharacterDropDown)

	AS:SkinCloseButton(AddonList.CloseButton)

	for i = 1, MAX_ADDONS_DISPLAYED do
		AS:SkinCheckBox(_G["AddonListEntry"..i.."Enabled"])
		AS:SkinButton(_G["AddonListEntry"..i].LoadAddonButton)
	end
end

AS:RegisterSkin('Blizzard_AddonManager', AS.Blizzard_AddonManager)