local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DressUp') then return end

function AS:DressUp()
	CustomDressUpFrame.portrait:SetAlpha(0)

	AS:SkinButton(CustomDressUpFrame.ResetButton)
	AS:SkinDropDOwnBox(CustomDressUpFrame.OutfitDropDown)

	AS:SkinButton(CustomDressUpFrameCancelButton)
end

AS:RegisterSkin('DressUp', AS.DressUp)