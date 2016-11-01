local AS = unpack(AddOnSkins)

function AS:Blizzard_DressUpFrame()
	AS:SkinBackdropFrame(DressUpFrame, nil, nil, true)
	DressUpFrame.Backdrop:SetPoint("TOPLEFT", 6, 0)
	DressUpFrame.Backdrop:SetPoint("BOTTOMRIGHT", -32, 70)

	AS:SkinButton(DressUpFrameResetButton)
	AS:SkinButton(DressUpFrameCancelButton)
	AS:SkinCloseButton(DressUpFrameCloseButton)
	DressUpFrameCloseButton:SetPoint("TOPRIGHT", DressUpFrame.Backdrop, "TOPRIGHT", -3, -3)
	DressUpFrameResetButton:SetPoint("RIGHT", DressUpFrameCancelButton, "LEFT", -2, 0)

	AS:SkinDropDownBox(DressUpFrameOutfitDropDown)
	DressUpFrameOutfitDropDown:SetSize(195, 34)

	AS:SkinButton(DressUpFrameOutfitDropDown.SaveButton)
	DressUpFrameOutfitDropDown.SaveButton:ClearAllPoints()
	DressUpFrameOutfitDropDown.SaveButton:SetPoint("RIGHT", DressUpFrameOutfitDropDown, 86, 4)
end

AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)