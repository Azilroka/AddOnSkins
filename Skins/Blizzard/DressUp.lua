local AS = unpack(AddOnSkins)

function AS:Blizzard_DressUpFrame()
	AS:SkinFrame(SideDressUpFrame, nil, nil, true)
	AS:SkinButton(SideDressUpModelResetButton)
	AS:SkinCloseButton(SideDressUpModelCloseButton)

	hooksecurefunc("SetUpSideDressUpFrame", function(parentFrame, closedWidth, openWidth, point, relativePoint, offsetX, offsetY)
		if parentFrame == AuctionFrame then
			SideDressUpFrame:SetPoint(point, parentFrame, relativePoint, 2, offsetY)
		end
	end)

	AS:SkinBackdropFrame(DressUpFrame)
	AS:SkinCloseButton(DressUpFrame.CloseButton)
	AS:SkinButton(DressUpFrame.ResetButton)

	DressUpFrame.portrait:SetAlpha(0)

	AS:SkinMaxMinFrame(MaximizeMinimizeFrame)

	AS:SkinButton(DressUpFrameCancelButton)
	DressUpFrame.ResetButton:SetPoint("RIGHT", DressUpFrameCancelButton, "LEFT", -2, 0)

	AS:SkinDropDownBox(DressUpFrame.OutfitDropDown)

	AS:SkinButton(DressUpFrame.OutfitDropDown.SaveButton)
	DressUpFrame.OutfitDropDown.SaveButton:SetHeight(20)
	DressUpFrame.OutfitDropDown.SaveButton:SetPoint("LEFT", DressUpFrame.OutfitDropDown, 'RIGHT', -10, -5)
end

AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)
