local AS = unpack(AddOnSkins)

function AS:Blizzard_AddonManager()
	AS:SkinFrame(AddonList)
	AS:StripTextures(AddonListInset)	

	AS:SkinButton(AddonListEnableAllButton, true)
	AS:SkinButton(AddonListDisableAllButton, true)
	AS:SkinButton(AddonListOkayButton, true)
	AS:SkinButton(AddonListCancelButton, true)
	
	AS:SkinScrollBar(AddonListScrollFrameScrollBar, 5)

	AS:SkinCheckBox(AddonListForceLoad)
	AddonListForceLoad:SetSize(26, 26)
	AS:SkinDropDownBox(AddonCharacterDropDown)

	AS:SkinCloseButton(AddonListCloseButton)

	for i = 1, MAX_ADDONS_DISPLAYED do
		AS:SkinCheckBox(_G["AddonListEntry"..i.."Enabled"])
		AS:SkinButton(_G["AddonListEntry"..i].LoadAddonButton)
	end
end

AS:RegisterSkin('Blizzard_AddonManager', AS.Blizzard_AddonManager)