local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DressUp') then return end

function AS:DressUp()
	CustomDressUpFrame.portrait:SetAlpha(0)

	AS:SkinButton(CustomDressUpFrame.ResetButton)
	AS:SkinCloseButton(CustomDressUpFrame.CloseButton)

	AS:SkinButton(CustomDressUpFrameCancelButton)

	AS:SkinButton(DressUpHideArmorButton)
	AS:SkinDropDownBox(DressUpRaceDropdown)
	AS:SkinCheckBox(DressUpGenderButtonFemale)
	AS:SkinCheckBox(DressUpGenderButtonMale)

	CustomDressUpFrame.Inset:SetAlpha(0)
end

AS:RegisterSkin('DressUp', AS.DressUp)