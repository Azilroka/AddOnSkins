local AS, L, S, R = unpack(AddOnSkins)

function R:ColorPickerPlus()
	--Make sure the color picker is not click-through anymore
	ColorPickerFrame:EnableMouse(true)

	-- S:HandleFrame(ColorPickerFrame) --Using StripTextures causes a WoW crash for some reason
	for _, Region in pairs({ColorPickerFrame:GetRegions()}) do
		if Region and Region:GetObjectType() == "Texture" then
			Region:Hide() --Using :SetTexture(nil) is what causes the crash, so hide instead
			hooksecurefunc(Region, "Show", Region.Hide) --This is just a precaution, in case something tries to call :Show on them
		end
	end

	S:SetTemplate(ColorPickerFrame)

	if ColorPickerFrame.Border then
		S:StripTextures(ColorPickerFrame.Border)
	end

	S:HandleButton(ColorPPSwitcher)
	S:HandleButton(ColorPPCopy)
	S:HandleButton(ColorPPPaste)
	S:HandleButton(ColorPickerOkayButton)
	S:HandleButton(ColorPickerCancelButton)
	ColorPickerOkayButton:ClearAllPoints()
	ColorPickerOkayButton:SetPoint("RIGHT", ColorPickerCancelButton, "LEFT", -2, 0)
end

AS:RegisterSkin('ColorPickerPlus')
