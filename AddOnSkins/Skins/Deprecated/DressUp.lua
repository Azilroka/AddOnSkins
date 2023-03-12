local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('DressUp') then return end

function R:DressUp()
	CustomDressUpFrame.portrait:SetAlpha(0)

	S:HandleButton(CustomDressUpFrame.ResetButton)
	S:HandleCloseButton(CustomDressUpFrame.CloseButton)

	S:HandleButton(CustomDressUpFrameCancelButton)

	S:HandleButton(DressUpHideArmorButton)
	S:HandleDropDownBox(DressUpRaceDropdown)
	S:HandleCheckBox(DressUpGenderButtonFemale)
	S:HandleCheckBox(DressUpGenderButtonMale)

	CustomDressUpFrame.Inset:SetAlpha(0)
end

AS:RegisterSkin('DressUp', R.DressUp)
