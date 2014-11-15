local AS = unpack(AddOnSkins)

function AS:Blizzard_DressUpFrame()
	AS:SkinBackdropFrame(DressUpFrame, nil, nil, true)
	DressUpFrame.Backdrop:Point("TOPLEFT", 6, 0)
	DressUpFrame.Backdrop:Point("BOTTOMRIGHT", -32, 70)

	AS:SkinButton(DressUpFrameResetButton)
	AS:SkinButton(DressUpFrameCancelButton)
	AS:SkinCloseButton(DressUpFrameCloseButton, DressUpFrame.Backdrop)
	DressUpFrameResetButton:Point("RIGHT", DressUpFrameCancelButton, "LEFT", -2, 0)
end

AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)