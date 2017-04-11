local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ColorPickerPlus') then return end

function AS:ColorPickerPlus()
	--Make sure the color picker is not click-through anymore
	ColorPickerFrame:EnableMouse(true)

	AS:SkinFrame(ColorPickerFrame)
	AS:SkinButton(ColorPPSwitcher)
	AS:SkinButton(ColorPickerOkayButton)
	AS:SkinButton(ColorPickerCancelButton)
	ColorPickerOkayButton:ClearAllPoints()
	ColorPickerOkayButton:SetPoint("RIGHT", ColorPickerCancelButton, "LEFT", -2, 0)
end

AS:RegisterSkin('ColorPickerPlus', AS.ColorPickerPlus, "PLAYER_ENTERING_WORLD")
