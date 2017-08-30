local AS = unpack(AddOnSkins)

function AS:Blizzard_DressUpFrame()
	AS:StripTextures(DressUpFrame)
	AS:SetTemplate(DressUpFrame, 'Transparent')
	AS:StripTextures(DressUpFrameInset)
	AS:SetTemplate(DressUpFrameInset, 'Default')
	DressUpFramePortrait:Hide()
	DressUpFramePortraitFrame:Hide()

	AS:SkinButton(DressUpFrameResetButton)
	AS:SkinButton(DressUpFrameCancelButton)
	AS:SkinCloseButton(DressUpFrameCloseButton)
	AS:SkinMaxMinFrame(MaximizeMinimizeFrame)
	DressUpFrameResetButton:SetPoint("RIGHT", DressUpFrameCancelButton, "LEFT", -2, 0)

	AS:SkinDropDownBox(DressUpFrameOutfitDropDown)
	DressUpFrameOutfitDropDown:SetSize(195, 34)

	AS:SkinButton(DressUpFrameOutfitDropDown.SaveButton)
	DressUpFrameOutfitDropDown.SaveButton:ClearAllPoints()
	DressUpFrameOutfitDropDown.SaveButton:SetPoint("RIGHT", DressUpFrameOutfitDropDown, 86, 4)
end

AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)